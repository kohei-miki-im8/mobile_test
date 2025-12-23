import 'package:flutter/foundation.dart';

/// アプリケーション設定を管理するクラス
class AppConfig {

  /// LINE SDKのチャンネルID
  static String get lineChannelId {
    return const String.fromEnvironment('LINE_CHANNEL_ID');
  }

  /// LINE OAuthプロバイダーID
  static String get lineOAuthProviderId {
    return const String.fromEnvironment('LINE_OAUTH_PROVIDER_ID');
  }

  /// デバッグ用：設定値を出力
  static void printConfig() {
    if (kDebugMode) {
    }
  }
}
