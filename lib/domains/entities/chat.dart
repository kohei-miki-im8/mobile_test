import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/message_content_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_topic.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/date_intention.pb.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';

@freezed
abstract class ChatMessageEntity with _$ChatMessageEntity {
  const factory ChatMessageEntity({
    required String chatMessageId,
    required String publishedUserId,
    required DateTime sentAt,
    required ChatMessageContentEntity content,
    required AiAgentCode aiAgentCode,
  }) = _ChatMessageEntity;

  factory ChatMessageEntity.fromProto(ChatMessage m) {
    return ChatMessageEntity(
      chatMessageId: m.chatMessageId,
      publishedUserId: m.publishedUserId,
      sentAt: m.hasSentAt() ? m.sentAt.toDateTime() : DateTime.now(),
      content: ChatMessageContentEntity.fromProto(m),
      aiAgentCode: m.aiAgentCode,
    );
  }
}

@freezed
abstract class ChatMessageContentEntity with _$ChatMessageContentEntity {
  const factory ChatMessageContentEntity.text({required String text}) = _TextContent;
  const factory ChatMessageContentEntity.photo({required String photoUrl}) = _PhotoContent;
  const factory ChatMessageContentEntity.system({required String text}) = _SystemContent;
  const factory ChatMessageContentEntity.aiAgent({required String text}) = _AiAgentContent;
  const factory ChatMessageContentEntity.dateIntention() = _DateIntentionContent;

  factory ChatMessageContentEntity.fromProto(ChatMessage m) {
    switch (m.contentType) {
      case MessageContentType.MESSAGE_CONTENT_TYPE_TEXT:
        return ChatMessageContentEntity.text(text: m.text.text);
      case MessageContentType.MESSAGE_CONTENT_TYPE_PHOTO:
        final photoUrl = resolveImageSize(
          kind: PhotoUrlKind.mediumThumbnailWebpUrl,
          urls: m.photo.signedImageUrls,
        );
        return ChatMessageContentEntity.photo(photoUrl: photoUrl);
      case MessageContentType.MESSAGE_CONTENT_TYPE_SYSTEM:
        return ChatMessageContentEntity.system(text: m.system.text);
      case MessageContentType.MESSAGE_CONTENT_TYPE_AI_AGENT:
        return ChatMessageContentEntity.aiAgent(text: m.aiAgent.text);
      case MessageContentType.MESSAGE_CONTENT_TYPE_DATE_INTENTION:
        return const ChatMessageContentEntity.dateIntention();
      case MessageContentType.MESSAGE_CONTENT_TYPE_READ:
      case MessageContentType.MESSAGE_CONTENT_TYPE_IS_TO_USER_TYPING:
      case MessageContentType.MESSAGE_CONTENT_TYPE_UNSPECIFIED:
        return const ChatMessageContentEntity.system(text: '');
    }
    return const ChatMessageContentEntity.system(text: '');
  }
}

extension ChatMessageContentEntityExt on ChatMessageContentEntity {
  bool get isText => this is _TextContent;
  bool get isPhoto => this is _PhotoContent;
  bool get isSystem => this is _SystemContent;
  bool get isAiAgent => this is _AiAgentContent;
  bool get isDateIntention => this is _DateIntentionContent;

  String? get textOrNull {
    if (this is _TextContent) return (this as _TextContent).text;
    if (this is _SystemContent) return (this as _SystemContent).text;
    if (this is _AiAgentContent) return (this as _AiAgentContent).text;
    return null;
  }

  String? get photoUrlOrNull {
    if (this is _PhotoContent) return (this as _PhotoContent).photoUrl;
    return null;
  }
}

@freezed
abstract class ChatTopicsEntity with _$ChatTopicsEntity {
  const factory ChatTopicsEntity({
    @Default(<ChatTopicEntity>[]) List<ChatTopicEntity> items,
  }) = _ChatTopicsEntity;

  factory ChatTopicsEntity.fromProto(List<ChatTopic> topics) {
    return ChatTopicsEntity(
      items: topics.map(ChatTopicEntity.fromProto).toList(),
    );
  }
}

@freezed
abstract class ChatTopicEntity with _$ChatTopicEntity {
  const factory ChatTopicEntity({
    required String message,
    String? photoId,
    String? tagId,
  }) = _ChatTopicEntity;

  factory ChatTopicEntity.fromProto(ChatTopic t) {
    return ChatTopicEntity(
      message: t.message,
      photoId: t.hasPhotoId() ? t.photoId : null,
      tagId: t.hasTagId() ? t.tagId : null,
    );
  }
}

@freezed
abstract class DateIntentionEntity with _$DateIntentionEntity {
  const factory DateIntentionEntity({
    required String userId,
    required String chatMessageId,
    required bool hasDateIntention,
  }) = _DateIntentionEntity;

  factory DateIntentionEntity.fromProto(DateIntention d) {
    return DateIntentionEntity(
      userId: d.userId,
      chatMessageId: d.chatMessageId,
      hasDateIntention: d.hasDateIntention,
    );
  }
}

@freezed
abstract class ChatSessionEventEntity with _$ChatSessionEventEntity {
  const factory ChatSessionEventEntity.message(ChatMessageEntity message) = _EventMessage;
  const factory ChatSessionEventEntity.readLastChatMessageId(String id) = _EventReadLastId;
  const factory ChatSessionEventEntity.typing(bool isToUserTyping) = _EventTyping;
  const factory ChatSessionEventEntity.editingText(String text) = _EventEditingText;
  const factory ChatSessionEventEntity.editableChatTopics(ChatTopics topics) = _EventEditableChatTopics;
  const factory ChatSessionEventEntity.unknown() = _EventUnknown;

  factory ChatSessionEventEntity.fromProto(SubscribeChatSessionResponse r) {
    switch (r.whichResponse()) {
      case SubscribeChatSessionResponse_Response.chatMessage:
        return ChatSessionEventEntity.message(ChatMessageEntity.fromProto(r.chatMessage));
      case SubscribeChatSessionResponse_Response.readLastChatMessageId:
        return ChatSessionEventEntity.readLastChatMessageId(r.readLastChatMessageId);
      case SubscribeChatSessionResponse_Response.isToUserTyping:
        return ChatSessionEventEntity.typing(r.isToUserTyping);
      case SubscribeChatSessionResponse_Response.editingChatMessage:
        return ChatSessionEventEntity.editingText(r.editingChatMessage.editingText);
      case SubscribeChatSessionResponse_Response.editableChatTopics:
        return ChatSessionEventEntity.editableChatTopics(r.editableChatTopics);
      case SubscribeChatSessionResponse_Response.notSet:
        return const ChatSessionEventEntity.unknown();
    }
  }
}

extension ChatSessionEventEntityExt on ChatSessionEventEntity {
  T fold<T>({
    required T Function(ChatMessageEntity message) message,
    required T Function(String id) readLastChatMessageId,
    required T Function(bool isToUserTyping) typing,
    required T Function(String text) editingText,
    required T Function(ChatTopics topics) editableChatTopics,
    required T Function() unknown,
  }) {
    if (this is _EventMessage) return message((this as _EventMessage).message);
    if (this is _EventReadLastId) return readLastChatMessageId((this as _EventReadLastId).id);
    if (this is _EventTyping) return typing((this as _EventTyping).isToUserTyping);
    if (this is _EventEditingText) return editingText((this as _EventEditingText).text);
    if (this is _EventEditableChatTopics) return editableChatTopics((this as _EventEditableChatTopics).topics);
    return unknown();
  }
}