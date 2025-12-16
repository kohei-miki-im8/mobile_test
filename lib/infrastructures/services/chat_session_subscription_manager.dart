import 'dart:async';
import 'dart:math' as math;

/// ChatのStream購読を堅牢化する小さなマネージャ。
/// - サイレント再接続（指数バックオフ + ジッター, 上限回数）
/// - 401時の単回リフレッシュ→再購読
/// - 接続直後イベント未到来時のフォールバックrevalidate（一度だけ）
class ChatSessionSubscriptionManager<T> {
  ChatSessionSubscriptionManager({
    required this.subscribe,
    required this.onEvent,
    required this.revalidateOnce,
    required this.isOnline,
    required this.isNetworkUnreachable,
    required this.isAuthError,
    required this.attemptAuthRefresh,
    this.maxAttempts = 10,
    this.baseDelay = const Duration(seconds: 1),
    this.postConnectDelay = const Duration(milliseconds: 1200),
    this.onNetworkError,
  });

  final Stream<T> Function() subscribe;
  final void Function(T event) onEvent;
  final Future<void> Function() revalidateOnce;
  final Future<bool> Function() isOnline;
  final bool Function(Object? error) isNetworkUnreachable;
  final bool Function(Object? error) isAuthError;
  final Future<void> Function() attemptAuthRefresh;
  final int maxAttempts;
  final Duration baseDelay;
  final Duration postConnectDelay;
  final void Function(Object error)? onNetworkError;

  StreamSubscription<T>? _subscription;
  Timer? _reconnectTimer;
  Timer? _postConnectTimer;
  int _attempts = 0;
  bool _didPostConnectRevalidate = false;
  bool _authResubscribeAttempted = false;

  Future<void> start() async {
    await _subscription?.cancel();
    _cancelTimers();
    _didPostConnectRevalidate = false;
    _postConnectTimer = Timer(postConnectDelay, () {
      if (!_didPostConnectRevalidate) {
        _didPostConnectRevalidate = true;
        unawaited(revalidateOnce());
      }
      _postConnectTimer = null;
    });
    _subscription = subscribe().listen(
      (event) {
        if (!_didPostConnectRevalidate) {
          _postConnectTimer?.cancel();
          _postConnectTimer = null;
          _didPostConnectRevalidate = true;
          unawaited(revalidateOnce());
          _attempts = 0; // 成功扱い
        }
        onEvent(event);
      },
      onError: (Object e, StackTrace st) async {
        if (isAuthError(e) && !_authResubscribeAttempted) {
          _authResubscribeAttempted = true;
          unawaited(() async {
            await attemptAuthRefresh();
            await start();
            await revalidateOnce();
            _authResubscribeAttempted = false;
          }());
          return;
        }

        if (isNetworkUnreachable(e) || !(await isOnline())) {
          onNetworkError?.call(e);
          _attempts = 0;
          return;
        }

        _scheduleReconnect();
      },
      onDone: () async {
        if (await isOnline()) {
          _scheduleReconnect();
        } else {
          onNetworkError?.call('ネットワークに接続してください。');
          _attempts = 0;
        }
      },
      cancelOnError: false,
    );
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    _subscription = null;
    _cancelTimers();
  }

  Future<void> manualReconnect() async {
    await start();
  }

  void onResume() {
    // 背景復帰などでは即座に再購読
    unawaited(start());
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    if (_attempts >= maxAttempts) {
      return; // 何もしない（通知は呼び出し元ポリシーに委ねる）
    }
    final backoffSeconds =
        baseDelay.inSeconds * math.pow(2, _attempts).toInt();
    final delayMs = math.min(backoffSeconds, 30) * 1000;
    final jitter = math.Random().nextInt(300);
    _reconnectTimer = Timer(Duration(milliseconds: delayMs + jitter), () {
      _attempts++;
      unawaited(start());
    });
  }

  void _cancelTimers() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _postConnectTimer?.cancel();
    _postConnectTimer = null;
  }
}


