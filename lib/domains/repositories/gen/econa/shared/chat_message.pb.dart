//
//  Generated code. Do not modify.
//  source: econa/shared/chat_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/ai_agent_code.pbenum.dart' as $148;
import '../enums/chat_message_delivery_status.pbenum.dart' as $150;
import '../enums/message_content_type.pbenum.dart' as $149;
import '../enums/service_review_status.pbenum.dart' as $139;
import 'signed_url.pb.dart' as $114;

enum ChatMessage_Contents {
  system, 
  text, 
  aiAgent, 
  photo, 
  readLastChatMessageId, 
  isToUserTyping, 
  notSet
}

/// チャットメッセージ
class ChatMessage extends $pb.GeneratedMessage {
  factory ChatMessage({
    $core.String? chatMessageId,
    $core.String? publishedUserId,
    $109.Timestamp? sentAt,
    $109.Timestamp? readAt,
    $148.AiAgentCode? aiAgentCode,
    $149.MessageContentType? contentType,
    SystemMessageContent? system,
    TextMessageContent? text,
    AiAgentMessageContent? aiAgent,
    PhotoMessageContent? photo,
    $core.String? readLastChatMessageId,
    $core.bool? isToUserTyping,
    $150.ChatMessageDeliveryStatus? deliveryStatus,
  }) {
    final $result = create();
    if (chatMessageId != null) {
      $result.chatMessageId = chatMessageId;
    }
    if (publishedUserId != null) {
      $result.publishedUserId = publishedUserId;
    }
    if (sentAt != null) {
      $result.sentAt = sentAt;
    }
    if (readAt != null) {
      $result.readAt = readAt;
    }
    if (aiAgentCode != null) {
      $result.aiAgentCode = aiAgentCode;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (system != null) {
      $result.system = system;
    }
    if (text != null) {
      $result.text = text;
    }
    if (aiAgent != null) {
      $result.aiAgent = aiAgent;
    }
    if (photo != null) {
      $result.photo = photo;
    }
    if (readLastChatMessageId != null) {
      $result.readLastChatMessageId = readLastChatMessageId;
    }
    if (isToUserTyping != null) {
      $result.isToUserTyping = isToUserTyping;
    }
    if (deliveryStatus != null) {
      $result.deliveryStatus = deliveryStatus;
    }
    return $result;
  }
  ChatMessage._() : super();
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ChatMessage_Contents> _ChatMessage_ContentsByTag = {
    7 : ChatMessage_Contents.system,
    8 : ChatMessage_Contents.text,
    9 : ChatMessage_Contents.aiAgent,
    10 : ChatMessage_Contents.photo,
    11 : ChatMessage_Contents.readLastChatMessageId,
    12 : ChatMessage_Contents.isToUserTyping,
    0 : ChatMessage_Contents.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..oo(0, [7, 8, 9, 10, 11, 12])
    ..aOS(1, _omitFieldNames ? '' : 'chatMessageId')
    ..aOS(2, _omitFieldNames ? '' : 'publishedUserId')
    ..aOM<$109.Timestamp>(3, _omitFieldNames ? '' : 'sentAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'readAt', subBuilder: $109.Timestamp.create)
    ..e<$148.AiAgentCode>(5, _omitFieldNames ? '' : 'aiAgentCode', $pb.PbFieldType.OE, defaultOrMaker: $148.AiAgentCode.AI_AGENT_CODE_UNSPECIFIED, valueOf: $148.AiAgentCode.valueOf, enumValues: $148.AiAgentCode.values)
    ..e<$149.MessageContentType>(6, _omitFieldNames ? '' : 'contentType', $pb.PbFieldType.OE, defaultOrMaker: $149.MessageContentType.MESSAGE_CONTENT_TYPE_UNSPECIFIED, valueOf: $149.MessageContentType.valueOf, enumValues: $149.MessageContentType.values)
    ..aOM<SystemMessageContent>(7, _omitFieldNames ? '' : 'system', subBuilder: SystemMessageContent.create)
    ..aOM<TextMessageContent>(8, _omitFieldNames ? '' : 'text', subBuilder: TextMessageContent.create)
    ..aOM<AiAgentMessageContent>(9, _omitFieldNames ? '' : 'aiAgent', subBuilder: AiAgentMessageContent.create)
    ..aOM<PhotoMessageContent>(10, _omitFieldNames ? '' : 'photo', subBuilder: PhotoMessageContent.create)
    ..aOS(11, _omitFieldNames ? '' : 'readLastChatMessageId')
    ..aOB(12, _omitFieldNames ? '' : 'isToUserTyping')
    ..e<$150.ChatMessageDeliveryStatus>(13, _omitFieldNames ? '' : 'deliveryStatus', $pb.PbFieldType.OE, defaultOrMaker: $150.ChatMessageDeliveryStatus.CHAT_MESSAGE_DELIVERY_STATUS_UNSPECIFIED, valueOf: $150.ChatMessageDeliveryStatus.valueOf, enumValues: $150.ChatMessageDeliveryStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage)) as ChatMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage? _defaultInstance;

  ChatMessage_Contents whichContents() => _ChatMessage_ContentsByTag[$_whichOneof(0)]!;
  void clearContents() => clearField($_whichOneof(0));

  /// チャットメッセージID
  @$pb.TagNumber(1)
  $core.String get chatMessageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatMessageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatMessageId() => clearField(1);

  /// 発行ユーザーID
  @$pb.TagNumber(2)
  $core.String get publishedUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set publishedUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublishedUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublishedUserId() => clearField(2);

  /// 送信日時
  @$pb.TagNumber(3)
  $109.Timestamp get sentAt => $_getN(2);
  @$pb.TagNumber(3)
  set sentAt($109.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSentAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearSentAt() => clearField(3);
  @$pb.TagNumber(3)
  $109.Timestamp ensureSentAt() => $_ensure(2);

  /// 既読日時
  @$pb.TagNumber(4)
  $109.Timestamp get readAt => $_getN(3);
  @$pb.TagNumber(4)
  set readAt($109.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReadAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearReadAt() => clearField(4);
  @$pb.TagNumber(4)
  $109.Timestamp ensureReadAt() => $_ensure(3);

  /// AIエージェントコード
  @$pb.TagNumber(5)
  $148.AiAgentCode get aiAgentCode => $_getN(4);
  @$pb.TagNumber(5)
  set aiAgentCode($148.AiAgentCode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAiAgentCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearAiAgentCode() => clearField(5);

  /// メッセージ内容の型
  @$pb.TagNumber(6)
  $149.MessageContentType get contentType => $_getN(5);
  @$pb.TagNumber(6)
  set contentType($149.MessageContentType v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasContentType() => $_has(5);
  @$pb.TagNumber(6)
  void clearContentType() => clearField(6);

  /// システムメッセージ内容
  @$pb.TagNumber(7)
  SystemMessageContent get system => $_getN(6);
  @$pb.TagNumber(7)
  set system(SystemMessageContent v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSystem() => $_has(6);
  @$pb.TagNumber(7)
  void clearSystem() => clearField(7);
  @$pb.TagNumber(7)
  SystemMessageContent ensureSystem() => $_ensure(6);

  /// テキストメッセージ内容
  @$pb.TagNumber(8)
  TextMessageContent get text => $_getN(7);
  @$pb.TagNumber(8)
  set text(TextMessageContent v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasText() => $_has(7);
  @$pb.TagNumber(8)
  void clearText() => clearField(8);
  @$pb.TagNumber(8)
  TextMessageContent ensureText() => $_ensure(7);

  /// AIエージェントメッセージ内容
  @$pb.TagNumber(9)
  AiAgentMessageContent get aiAgent => $_getN(8);
  @$pb.TagNumber(9)
  set aiAgent(AiAgentMessageContent v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasAiAgent() => $_has(8);
  @$pb.TagNumber(9)
  void clearAiAgent() => clearField(9);
  @$pb.TagNumber(9)
  AiAgentMessageContent ensureAiAgent() => $_ensure(8);

  /// 写真メッセージ内容
  @$pb.TagNumber(10)
  PhotoMessageContent get photo => $_getN(9);
  @$pb.TagNumber(10)
  set photo(PhotoMessageContent v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasPhoto() => $_has(9);
  @$pb.TagNumber(10)
  void clearPhoto() => clearField(10);
  @$pb.TagNumber(10)
  PhotoMessageContent ensurePhoto() => $_ensure(9);

  /// 既読が付いた最後のチャットメッセージID
  @$pb.TagNumber(11)
  $core.String get readLastChatMessageId => $_getSZ(10);
  @$pb.TagNumber(11)
  set readLastChatMessageId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasReadLastChatMessageId() => $_has(10);
  @$pb.TagNumber(11)
  void clearReadLastChatMessageId() => clearField(11);

  /// お相手のユーザーがメッセージ入力状態にあるかどうか
  @$pb.TagNumber(12)
  $core.bool get isToUserTyping => $_getBF(11);
  @$pb.TagNumber(12)
  set isToUserTyping($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIsToUserTyping() => $_has(11);
  @$pb.TagNumber(12)
  void clearIsToUserTyping() => clearField(12);

  /// 配信状態
  @$pb.TagNumber(13)
  $150.ChatMessageDeliveryStatus get deliveryStatus => $_getN(12);
  @$pb.TagNumber(13)
  set deliveryStatus($150.ChatMessageDeliveryStatus v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasDeliveryStatus() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeliveryStatus() => clearField(13);
}

/// システムメッセージ内容
class SystemMessageContent extends $pb.GeneratedMessage {
  factory SystemMessageContent({
    $core.String? text,
  }) {
    final $result = create();
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  SystemMessageContent._() : super();
  factory SystemMessageContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SystemMessageContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SystemMessageContent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SystemMessageContent clone() => SystemMessageContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SystemMessageContent copyWith(void Function(SystemMessageContent) updates) => super.copyWith((message) => updates(message as SystemMessageContent)) as SystemMessageContent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemMessageContent create() => SystemMessageContent._();
  SystemMessageContent createEmptyInstance() => create();
  static $pb.PbList<SystemMessageContent> createRepeated() => $pb.PbList<SystemMessageContent>();
  @$core.pragma('dart2js:noInline')
  static SystemMessageContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SystemMessageContent>(create);
  static SystemMessageContent? _defaultInstance;

  /// テキスト
  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);
}

/// テキストメッセージ内容
class TextMessageContent extends $pb.GeneratedMessage {
  factory TextMessageContent({
    $core.String? text,
  }) {
    final $result = create();
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  TextMessageContent._() : super();
  factory TextMessageContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextMessageContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextMessageContent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextMessageContent clone() => TextMessageContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextMessageContent copyWith(void Function(TextMessageContent) updates) => super.copyWith((message) => updates(message as TextMessageContent)) as TextMessageContent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextMessageContent create() => TextMessageContent._();
  TextMessageContent createEmptyInstance() => create();
  static $pb.PbList<TextMessageContent> createRepeated() => $pb.PbList<TextMessageContent>();
  @$core.pragma('dart2js:noInline')
  static TextMessageContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextMessageContent>(create);
  static TextMessageContent? _defaultInstance;

  /// テキスト
  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);
}

/// AIエージェントメッセージ内容
class AiAgentMessageContent extends $pb.GeneratedMessage {
  factory AiAgentMessageContent({
    $core.String? text,
    $core.bool? isFinished,
  }) {
    final $result = create();
    if (text != null) {
      $result.text = text;
    }
    if (isFinished != null) {
      $result.isFinished = isFinished;
    }
    return $result;
  }
  AiAgentMessageContent._() : super();
  factory AiAgentMessageContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AiAgentMessageContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AiAgentMessageContent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOB(2, _omitFieldNames ? '' : 'isFinished')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AiAgentMessageContent clone() => AiAgentMessageContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AiAgentMessageContent copyWith(void Function(AiAgentMessageContent) updates) => super.copyWith((message) => updates(message as AiAgentMessageContent)) as AiAgentMessageContent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AiAgentMessageContent create() => AiAgentMessageContent._();
  AiAgentMessageContent createEmptyInstance() => create();
  static $pb.PbList<AiAgentMessageContent> createRepeated() => $pb.PbList<AiAgentMessageContent>();
  @$core.pragma('dart2js:noInline')
  static AiAgentMessageContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AiAgentMessageContent>(create);
  static AiAgentMessageContent? _defaultInstance;

  /// テキスト
  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  /// 終了フラグ
  @$pb.TagNumber(2)
  $core.bool get isFinished => $_getBF(1);
  @$pb.TagNumber(2)
  set isFinished($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsFinished() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsFinished() => clearField(2);
}

/// 写真メッセージ内容
/// 画像添付送信時のみ、メディアアップロード時点でchat_messageが生成される仕様となる
class PhotoMessageContent extends $pb.GeneratedMessage {
  factory PhotoMessageContent({
    $114.SignedImageUrls? signedImageUrls,
    $139.ServiceReviewStatus? serviceReviewStatus,
  }) {
    final $result = create();
    if (signedImageUrls != null) {
      $result.signedImageUrls = signedImageUrls;
    }
    if (serviceReviewStatus != null) {
      $result.serviceReviewStatus = serviceReviewStatus;
    }
    return $result;
  }
  PhotoMessageContent._() : super();
  factory PhotoMessageContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhotoMessageContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhotoMessageContent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOM<$114.SignedImageUrls>(1, _omitFieldNames ? '' : 'signedImageUrls', subBuilder: $114.SignedImageUrls.create)
    ..e<$139.ServiceReviewStatus>(2, _omitFieldNames ? '' : 'serviceReviewStatus', $pb.PbFieldType.OE, defaultOrMaker: $139.ServiceReviewStatus.SERVICE_REVIEW_STATUS_UNSPECIFIED, valueOf: $139.ServiceReviewStatus.valueOf, enumValues: $139.ServiceReviewStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhotoMessageContent clone() => PhotoMessageContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhotoMessageContent copyWith(void Function(PhotoMessageContent) updates) => super.copyWith((message) => updates(message as PhotoMessageContent)) as PhotoMessageContent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotoMessageContent create() => PhotoMessageContent._();
  PhotoMessageContent createEmptyInstance() => create();
  static $pb.PbList<PhotoMessageContent> createRepeated() => $pb.PbList<PhotoMessageContent>();
  @$core.pragma('dart2js:noInline')
  static PhotoMessageContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhotoMessageContent>(create);
  static PhotoMessageContent? _defaultInstance;

  /// 署名付き画像URL
  @$pb.TagNumber(1)
  $114.SignedImageUrls get signedImageUrls => $_getN(0);
  @$pb.TagNumber(1)
  set signedImageUrls($114.SignedImageUrls v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSignedImageUrls() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedImageUrls() => clearField(1);
  @$pb.TagNumber(1)
  $114.SignedImageUrls ensureSignedImageUrls() => $_ensure(0);

  /// 画像審査ステータス
  /// フロントエンドはこのステータスに基づいてモザイク表示などのUI制御を行う
  @$pb.TagNumber(2)
  $139.ServiceReviewStatus get serviceReviewStatus => $_getN(1);
  @$pb.TagNumber(2)
  set serviceReviewStatus($139.ServiceReviewStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasServiceReviewStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearServiceReviewStatus() => clearField(2);
}

/// 編集中のチャットメッセージ
class EditingChatMessage extends $pb.GeneratedMessage {
  factory EditingChatMessage({
    $core.String? editingText,
    $148.AiAgentCode? processedAiAgentCode,
  }) {
    final $result = create();
    if (editingText != null) {
      $result.editingText = editingText;
    }
    if (processedAiAgentCode != null) {
      $result.processedAiAgentCode = processedAiAgentCode;
    }
    return $result;
  }
  EditingChatMessage._() : super();
  factory EditingChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditingChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditingChatMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'editingText')
    ..e<$148.AiAgentCode>(2, _omitFieldNames ? '' : 'processedAiAgentCode', $pb.PbFieldType.OE, defaultOrMaker: $148.AiAgentCode.AI_AGENT_CODE_UNSPECIFIED, valueOf: $148.AiAgentCode.valueOf, enumValues: $148.AiAgentCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditingChatMessage clone() => EditingChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditingChatMessage copyWith(void Function(EditingChatMessage) updates) => super.copyWith((message) => updates(message as EditingChatMessage)) as EditingChatMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditingChatMessage create() => EditingChatMessage._();
  EditingChatMessage createEmptyInstance() => create();
  static $pb.PbList<EditingChatMessage> createRepeated() => $pb.PbList<EditingChatMessage>();
  @$core.pragma('dart2js:noInline')
  static EditingChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditingChatMessage>(create);
  static EditingChatMessage? _defaultInstance;

  /// 編集中のメッセージ内容
  @$pb.TagNumber(1)
  $core.String get editingText => $_getSZ(0);
  @$pb.TagNumber(1)
  set editingText($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEditingText() => $_has(0);
  @$pb.TagNumber(1)
  void clearEditingText() => clearField(1);

  /// 生成処理を行ったAIエージェントコード
  @$pb.TagNumber(2)
  $148.AiAgentCode get processedAiAgentCode => $_getN(1);
  @$pb.TagNumber(2)
  set processedAiAgentCode($148.AiAgentCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProcessedAiAgentCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearProcessedAiAgentCode() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
