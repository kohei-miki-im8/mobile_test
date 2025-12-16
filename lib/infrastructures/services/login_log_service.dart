import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

/// ログイン成否をFirestoreに記録する専用サービス
class LoginLogService {
  const LoginLogService._();

  // プロジェクト内の Firestore データベースID を 'app-login-log' として作成したため
  // ここでは databaseId を明示的に指定して接続する
  static final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'app-login-log',
  );

  /// ログイン成功を記録
  static Future<void> logLoginSuccess({
    required String method,
    String? content,
    String? detail,
  }) async {
    await _log(
      success: true,
      method: method,
      content: content,
      detail: detail,
    );
  }

  /// ログイン失敗を記録（必ず理由を付与）
  static Future<void> logLoginFailure({
    required String method,
    String? content,
    required String detail,
  }) async {
    await _log(
      success: false,
      method: method,
      detail: detail,
      content: content,
    );
  }

  static Future<void> _log({
    required bool success,
    required String method,
    String? content,
    String? detail,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final String platform;
      if (Platform.isAndroid) {
        platform = 'android';
      } else if (Platform.isIOS) {
        platform = 'ios';
      } else {
        platform = 'other';
      }
      await _firestore.collection('login_logs').add(<String, Object?>{
        'uid': user?.uid,
        'method': method,
        'content': content,
        'result': success ? 'success' : 'failure',
        'detail': detail,
        'platform': platform,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (_) {
      // ログ取得の失敗はアプリの挙動に影響させない
    }
  }
}


