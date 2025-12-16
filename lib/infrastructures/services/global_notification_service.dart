import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/notification_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/publish_notification.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/subscribe_notification_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/notification.pb.dart' as proto;
import 'package:econa_mobile_app/domains/repositories/i_global_repository.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/global.dart';
import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 未読通知数を管理するStateNotifier
class GlobalNotificationUnreadCountNotifier extends StateNotifier<int> {
  GlobalNotificationUnreadCountNotifier() : super(0);

  void updateUnreadCount(int count) {
    state = count;
  }
}

/// 未読通知数のプロバイダー
final globalNotificationUnreadCountProvider =
StateNotifierProvider<GlobalNotificationUnreadCountNotifier, int>((ref) {
  return GlobalNotificationUnreadCountNotifier();
});

class GlobalNotificationService {
  GlobalNotificationService(this._repository, this._ref);

  final IGlobalRepository _repository;
  final Ref _ref;
  StreamSubscription<SubscribeNotificationSessionResponse>? _subscription;
  BuildContext? _context;
  String? _lastNotificationId;

  /// 通知購読を開始
  void start(BuildContext context) {
    _context = context;
    _subscribe();
  }

  /// 通知購読を停止
  void stop() {
    _subscription?.cancel();
    _subscription = null;
    _context = null;
  }

  Future<void> _subscribe() async {
    if (_context == null) {
      print('GlobalNotificationService: context is null, cannot subscribe');
      return;
    }

    // 🔑 認証トークンが無い（＝未ログイン。login_page など）のときは購読しない
    final authRepository = _ref.read(authRepositoryProvider);
    if (authRepository.authorizationToken == null) {
      print('GlobalNotificationService: no auth token, skip subscribe');
      return;
    }

    try {
      final request = SubscribeNotificationSessionRequest(
        lastNotificationId: _lastNotificationId,
      );

      print('GlobalNotificationService: Starting subscription...');
      await _subscription?.cancel();
      _subscription = _repository
          .subscribeNotificationSession(request)
          .listen(
        _handleResponse,
        onError: _handleError,
        onDone: () {
          print('GlobalNotificationService: Stream subscription done');
          // ← 正常終了時は再接続しない（必要ならここにだけ別ロジックを入れる）
        },
      );
      print('GlobalNotificationService: Subscription started successfully');
    } catch (e) {
      // エラーハンドリング（必要に応じて再試行ロジックを追加）
      print(
        'GlobalNotificationService: Failed to subscribe notification session: $e',
      );
    }
  }


  void _handleResponse(SubscribeNotificationSessionResponse response) {
    final event = response.whichEvent();
    print('GlobalNotificationService: Received event: $event');

    switch (event) {
      case SubscribeNotificationSessionResponse_Event.notificationReceived:
        final notification = response.notificationReceived.notification;
        print(
          'GlobalNotificationService: Notification received: ${notification.hasMessage() ? notification.message : "no message"}',
        );
        _showNotification(notification);
        // 最後に受信した通知IDを保存
        if (notification.hasNotificationId()) {
          _lastNotificationId = notification.notificationId;
        }
        break;
      case SubscribeNotificationSessionResponse_Event.initialized:
      // 初期化完了時に未読数を更新
        final initializedEvent = response.initialized;
        if (initializedEvent.hasUnreadCount()) {
          _updateUnreadCount(initializedEvent.unreadCount);
        }
        // セッションIDを保存（必要に応じて）
        if (initializedEvent.hasSessionId()) {
          // セッションIDの保存処理（必要に応じて実装）
        }
        break;
      case SubscribeNotificationSessionResponse_Event.unreadCountUpdated:
      // 未読数更新時に未読数を更新
        final unreadCountEvent = response.unreadCountUpdated;
        if (unreadCountEvent.hasUnreadCount()) {
          _updateUnreadCount(unreadCountEvent.unreadCount);
        }
        break;
      case SubscribeNotificationSessionResponse_Event.ping:
      // pingイベント（接続維持用）- 処理不要
        break;
      case SubscribeNotificationSessionResponse_Event.notificationSuppressed:
      // 通知抑止イベント - 通知が抑止されたことを記録（必要に応じて実装）
      // 通知抑止のログ出力など（必要に応じて実装）
      // final suppressedEvent = response.notificationSuppressed;
        break;
      case SubscribeNotificationSessionResponse_Event.notSet:
        break;
    }
  }

  void _updateUnreadCount(int count) {
    _ref
        .read(globalNotificationUnreadCountProvider.notifier)
        .updateUnreadCount(count);
  }

  void updateContext(BuildContext context) {
    _context = context;
  }

  void _handleError(Object error) {
    print('Notification stream error: $error');
    // エラー時の再接続処理（必要に応じて）
    Future.delayed(const Duration(seconds: 5), () {
      if (_context != null) {
        _subscribe();
      }
    });
  }

  void _showNotification(proto.Notification notification) {
    if (_context == null) {
      print(
        'GlobalNotificationService: Cannot show notification - context is null',
      );
      return;
    }

    if (!_context!.mounted) {
      print(
        'GlobalNotificationService: Cannot show notification - context is not mounted',
      );
      return;
    }

    // Notificationのmessageフィールドを取得
    final message =
    notification.hasMessage() ? notification.message : '通知が届きました';
    print('GlobalNotificationService: Showing notification: $message');

    // 通知タイプに応じた絵文字を設定
    final emoji = _getEmojiForNotificationType(notification);

    // フレーム描画後にバナーを表示
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_context == null || !_context!.mounted) {
        print(
          'GlobalNotificationService: Cannot show notification in postFrameCallback - context is null or not mounted',
        );
        return;
      }

      try {
        EconaBannerController.show(
          _context!,
          text: message,
          emoji: emoji,
          duration: const Duration(seconds: 3),
        );
        print('GlobalNotificationService: Banner shown successfully');
      } catch (e) {
        print('GlobalNotificationService: Error showing banner: $e');
      }
    });
  }

  /// eKYCのグローバルセッションイベント（EKYCVerificationCompleted）を受け取ったときに呼ぶ
  void showEkycVerificationCompletedBanner(EKYCVerificationData event) {
    _showEkycVerificationBanner(
      isVerified: event.isVerified,
      rejectionReason: event.rejectionReason,
    );
  }

  /// eKYCの通知詳細データ（EKYCVerificationData）を受け取ったときに呼ぶ
  void showEkycVerificationDataBanner(EKYCVerificationData data) {
    _showEkycVerificationBanner(
      isVerified: data.isVerified,
      rejectionReason: data.rejectionReason,
    );
  }

  /// 共通のバナー表示ロジック
  void _showEkycVerificationBanner({
    required bool isVerified,
    String? rejectionReason,
  }) {
    if (_context == null) {
      print(
        'GlobalNotificationService: Cannot show EKYC banner - context is null',
      );
      return;
    }

    if (!_context!.mounted) {
      print(
        'GlobalNotificationService: Cannot show EKYC banner - context is not mounted',
      );
      return;
    }

    final String message;
    if (isVerified) {
      message = '本人確認が完了しました';
    } else {
      // TODO: rejectionReason に応じた文言に差し替える
      message = rejectionReason ?? '';
    }

    print('GlobalNotificationService: Showing EKYC banner: "$message"');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_context == null || !_context!.mounted) {
        print(
          'GlobalNotificationService: Cannot show EKYC banner in postFrameCallback - context is null or not mounted',
        );
        return;
      }

      try {
        EconaBannerController.show(
          _context!,
          text: message,
          icon: Assets.images.icons.checkCircleOn.image(height: 36, width: 36),
          duration: const Duration(seconds: 5),
        );
      } catch (e) {
        print('GlobalNotificationService: Error showing EKYC banner: $e');
      }
    });
  }

  String? _getEmojiForNotificationType(proto.Notification notification) {
    if (!notification.hasNotificationType()) {
      return null;
    }

    final notificationType = notification.notificationType;

    // 通知タイプに応じた絵文字を返す
    // 必要に応じてカスタマイズ可能
    if (notificationType ==
        NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_LIKE ||
        notificationType ==
            NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_LIKE) {
      return '💕';
    } else if (notificationType ==
        NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_MATCH ||
        notificationType ==
            NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_MATCH) {
      return '✨';
    } else if (notificationType ==
        NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_MESSAGE ||
        notificationType ==
            NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_MESSAGE) {
      return '💬';
    } else if (notificationType ==
        NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_ANNOUNCEMENT ||
        notificationType ==
            NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_ANNOUNCEMENT) {
      return '📢';
    } else if (notificationType ==
        NotificationType.NOTIFICATION_TYPE_PROFILE_NICKNAME_APPROVAL ||
        notificationType ==
            NotificationType.NOTIFICATION_TYPE_PROFILE_PHOTO_APPROVAL ||
        notificationType ==
            NotificationType.NOTIFICATION_TYPE_PROFILE_INTRODUCTORY_APPROVAL) {
      return '✅';
    } else if (notificationType ==
        NotificationType.NOTIFICATION_TYPE_FIRST_MESSAGE_APPROVED) {
      return '🎉';
    } else if (notificationType ==
        NotificationType.NOTIFICATION_TYPE_FIRST_MESSAGE_REJECTED) {
      return '⚠️';
    } else {
      return '🔔';
    }
  }
}

// Riverpodプロバイダー
final globalNotificationServiceProvider =
Provider<GlobalNotificationService>((ref) {
  final repository = ref.watch(globalRepositoryProvider);
  return GlobalNotificationService(repository, ref);
});