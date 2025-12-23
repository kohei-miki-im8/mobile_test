import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/message_content_type.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/messenger_status_badge.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/google/protobuf/timestamp.pb.dart';
import 'package:econa_mobile_app/presentations/util/age.dart' as age_util;

/// メッセージ表示用のヘルパー関数群
class ChatDisplayHelper {
  /// メッセージの内容を取得
  static String getMessageText(ChatMessage message) {
    return switch (message.contentType) {
      MessageContentType.MESSAGE_CONTENT_TYPE_SYSTEM => message.hasSystem()
          ? message.system.text
          : message.text.text,
      MessageContentType.MESSAGE_CONTENT_TYPE_TEXT => message.hasText()
          ? message.text.text
          : '',
      MessageContentType.MESSAGE_CONTENT_TYPE_AI_AGENT => message.hasAiAgent()
          ? message.aiAgent.text
          : '',
      MessageContentType.MESSAGE_CONTENT_TYPE_PHOTO => '',
      MessageContentType.MESSAGE_CONTENT_TYPE_DATE_INTENTION => '',
      MessageContentType.MESSAGE_CONTENT_TYPE_UNSPECIFIED => '',
      MessageContentType() => '',
    };
  }

  /// 時間を相対的な表示に変換
  static String formatTime(Timestamp timestamp) {
    final now = DateTime.now();
    final messageTime = timestamp.toDateTime().toLocal();
    final diff = now.difference(messageTime);

    if (diff.inSeconds < 60 && (diff.inSeconds > 0 || diff.inMilliseconds > 0)) {
      return 'たった今';
    } else if (diff.inMinutes > 0 && diff.inMinutes < 60) {
      return '${diff.inMinutes}分前';
    } else if (diff.inHours > 0 && diff.inHours < 24) {
      return '${diff.inHours}時間前';
    } else if (diff.inDays > 0 && diff.inDays < 30) {
      return '${diff.inDays}日前';
    } else if (diff.inDays > 30 && diff.inDays < 365) {
      final month = diff.inDays ~/ 30;
      return '$monthか月前';
    } else if (diff.inDays > 365) {
      final year = diff.inDays ~/ 365;
      return '$year年前';
    }
    return '';
  }

  /// バッジのテキストを取得
  static String getBadgeText(MessengerStatusBadge badge) {
    return switch (badge) {
      MessengerStatusBadge.MESSENGER_STATUS_BADGE_NEW => 'NEW',
      MessengerStatusBadge.MESSENGER_STATUS_BADGE_SHOOTING_STAR_MATCH => 'マッチ',
      MessengerStatusBadge.MESSENGER_STATUS_BADGE_UNSENT => '未送信',
      MessengerStatusBadge() => '',
    };
  }

  /// 年齢を計算
  static int calculateAge(Timestamp birthday) => age_util.calculateAge(birthday);

  /// ユーザー表示名を生成（ニックネーム・年齢）
  static String formatUserDisplayName(String nickname, Timestamp birthday) {
    final years = calculateAge(birthday);
    return '$nickname　$years歳';
  }

  /// 指定タイプのアバターURLを取得（存在しなければ空文字を返す）
  static String getAvatarUrl(ThumbnailUser user) {
    if (!user.hasProfile()) return '';
    return getAvatarUrlFromProfile(user.profile);
  }

  /// Profile から指定タイプのアバターURLを取得（存在しなければ空文字）
  static String getAvatarUrlFromProfile(Profile profile) {
    if (profile.requiringReviewProfilePhotos.isEmpty) return '';
    final bestPhoto = profile.requiringReviewProfilePhotos
        .cast<RequiringReviewProfilePhoto?>()
        .firstWhere(
          (p) => p?.isBestPhoto ?? false,
          orElse: () => profile.requiringReviewProfilePhotos.first,
        );
    if (bestPhoto == null || !bestPhoto.hasCurrentSignedImageUrls()) {
      return '';
    }

    final urls = bestPhoto.currentSignedImageUrls;

    return (urls.hasAvatarIconWebpUrl() && urls.avatarIconWebpUrl.isNotEmpty) ? urls.avatarIconWebpUrl : '';
  }

  /// サムネイル用アバターURL
  static String avatarIconUrlFromProfile(Profile profile) {
    if (profile.requiringReviewProfilePhotos.isEmpty) return '';

    final bestPhoto = profile.requiringReviewProfilePhotos
        .cast<RequiringReviewProfilePhoto?>()
        .firstWhere(
          (p) => p?.isBestPhoto == true,
          orElse: () => profile.requiringReviewProfilePhotos.first,
        );
    if (bestPhoto == null || !bestPhoto.hasCurrentSignedImageUrls()) {
      return '';
    }

    final urls = bestPhoto.currentSignedImageUrls;
    if (urls.hasAvatarIconWebpUrl() && urls.avatarIconWebpUrl.isNotEmpty) {
      return urls.avatarIconWebpUrl;
    }
    if (urls.hasSmallThumbnailWebpUrl() && urls.smallThumbnailWebpUrl.isNotEmpty) {
      return urls.smallThumbnailWebpUrl;
    }
    if (urls.hasMediumThumbnailWebpUrl() && urls.mediumThumbnailWebpUrl.isNotEmpty) {
      return urls.mediumThumbnailWebpUrl;
    }
    if (urls.hasLargeThumbnailWebpUrl() && urls.largeThumbnailWebpUrl.isNotEmpty) {
      return urls.largeThumbnailWebpUrl;
    }
    if (urls.hasNonResizedWebpUrl() && urls.nonResizedWebpUrl.isNotEmpty) {
      return urls.nonResizedWebpUrl;
    }
    if (urls.hasOriginUrl() && urls.originUrl.isNotEmpty) {
      return urls.originUrl;
    }
    return '';
  }
}

/// ChatMessageExtension
extension ChatMessageExtension on ChatMessage {
  String get content {
    return {
          MessageContentType.MESSAGE_CONTENT_TYPE_UNSPECIFIED:
              hasText() ? text.text : '',
          MessageContentType.MESSAGE_CONTENT_TYPE_SYSTEM:
              hasSystem() ? system.text : '',
          MessageContentType.MESSAGE_CONTENT_TYPE_TEXT:
              hasText() ? text.text : '',
          MessageContentType.MESSAGE_CONTENT_TYPE_AI_AGENT:
              hasAiAgent() ? aiAgent.text : '',
          MessageContentType.MESSAGE_CONTENT_TYPE_PHOTO:
              hasPhoto() ? '' : '', // 仕様未定
          MessageContentType.MESSAGE_CONTENT_TYPE_DATE_INTENTION: '',
        }[contentType] ??
        '未対応のメッセージタイプです';
  }
} 