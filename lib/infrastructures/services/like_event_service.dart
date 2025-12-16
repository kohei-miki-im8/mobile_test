import 'package:cloud_firestore/cloud_firestore.dart';

/// いいね発生イベントを Firestore に記録し、Push 通知用 Functions のトリガーとするサービス
class LikeEventService {
  const LikeEventService._();

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// いいねイベントを Firestore に記録する
  ///
  /// Cloud Functions(onLikeCreated) がこのコレクションをトリガーに Push を送信する。
  static Future<void> logLikeEvent({
    required String fromUserId,
    required String toUserId,
    String? fromUserDisplayName,
  }) async {
    try {
      await _firestore.collection('like_events').add(<String, Object?>{
        'fromUserId': fromUserId,
        'toUserId': toUserId,
        if (fromUserDisplayName != null && fromUserDisplayName.isNotEmpty)
          'fromUserDisplayName': fromUserDisplayName,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (_) {
      // ログ取得の失敗はアプリの挙動に影響させない
    }
  }
}


