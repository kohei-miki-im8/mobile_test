import 'package:flutter/material.dart';

class AdjustDeferredDeepLinkHandler {
  AdjustDeferredDeepLinkHandler._();

  static final AdjustDeferredDeepLinkHandler instance = AdjustDeferredDeepLinkHandler._();

  String? _pendingDeeplink;

  // Adjustのコールバックから呼ぶ
  void onDeferredDeeplinkReceived(String uri) {
    _pendingDeeplink = uri;
  }

  // アプリ起動後、Navigatorが使えるタイミングで呼ぶ
  void consumeIfNeeded(BuildContext context) {
    final uriString = _pendingDeeplink;
    if (uriString == null) {
      return;
    }
    _pendingDeeplink = null;

    final Uri uri;
    try {
      uri = Uri.parse(uriString);
    } catch (e) {
      // 無効なURIの場合は何もしない
      return;
    }

    // ここから先はアプリの仕様に合わせて分岐する
    // 例: econa://user_detail?id=123 でユーザー詳細に飛ばす
    if (uri.host == 'user_detail') {
      final userId = uri.queryParameters['id'];
      if (userId != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserDetailPage(userId: userId),
          ),
        );
      }
    }

    // 他にも /like, /question などパスやクエリで振り分けてもOK
  }
}

// 例用のダミーWidget（実際のプロジェクトのUserDetailページに合わせて書き換えてください）
class UserDetailPage extends StatelessWidget {
  const UserDetailPage({
    required this.userId,
    super.key,
  });

  final String userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('User detail: $userId'),
      ),
    );
  }
}