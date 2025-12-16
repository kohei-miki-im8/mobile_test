import 'dart:async';
import 'dart:io';

/// 例外をユーザーフレンドリーなメッセージに変換するユーティリティクラス
class ErrorMessageFormatter {
  /// 例外をユーザーフレンドリーなメッセージにフォーマット
  static String formatUserMessage(Object e) {
    if (e is TimeoutException) {
      return '通信がタイムアウトしました。時間をおいて再試行してください。';
    }
    if (e is SocketException) {
      return 'ネットワークに接続できません。通信環境をご確認ください。';
    }
    final es = e.toString().toLowerCase();
    if (es.contains('timeout') || es.contains('deadline')) {
      return '通信がタイムアウトしました。時間をおいて再試行してください。';
    }
    if (es.contains('unauth') ||
        es.contains('permission') ||
        es.contains('401')) {
      return '認証に問題が発生しました。再ログインをお試しください。';
    }
    if (es.contains('host lookup') ||
        es.contains('connect') ||
        es.contains('socket')) {
      return 'ネットワークに接続できません。通信環境をご確認ください。';
    }
    return 'エラーが発生しました。しばらくしてから再試行してください。';
  }
}
