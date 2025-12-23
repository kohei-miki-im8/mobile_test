import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// ユーザーごとの FCM トークンを Firestore に保存・同期するサービス
class PushTokenService {
  const PushTokenService._();

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 現在のデバイスの FCM トークンを取得し、指定したユーザーIDに紐付けて保存する
  ///
  /// - 通知許可が拒否されている場合は何もしない
  /// - トークン取得や保存に失敗しても、アプリの挙動には影響させない
  static Future<void> syncUserFcmToken(String userId) async {
    try {
      // 通知許可をリクエスト（iOS / Android 13+）
      final settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.denied ||
          settings.authorizationStatus == AuthorizationStatus.notDetermined) {
        // 許可が得られていない場合は何もしない
        return;
      }

      final token = await _messaging.getToken();
      if (token == null || token.isEmpty) {
        return;
      }

      // 同じトークンであれば上書き更新されるよう、ドキュメントIDにトークン文字列を使う
      final tokenDocRef = _firestore
          .collection('user_fcm_tokens')
          .doc(userId)
          .collection('tokens')
          .doc(token);

      await tokenDocRef.set(
        <String, Object?>{
          'token': token,
          'platform': defaultTargetPlatform.name,
          'updatedAt': FieldValue.serverTimestamp(),
        },
        SetOptions(merge: true),
      );
    } catch (_) {
      // 失敗してもアプリの挙動には影響させない
    }
  }
}


