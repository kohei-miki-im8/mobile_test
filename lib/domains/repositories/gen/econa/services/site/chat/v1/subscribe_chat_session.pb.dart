//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/subscribe_chat_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/chat_session_publish_type.pbenum.dart' as $157;
import '../../../../enums/service_review_status.pbenum.dart' as $139;
import '../../../../shared/chat_message.pb.dart' as $151;
import '../../../../shared/chat_topic.pb.dart' as $154;

/// チャットセッション購読リクエスト
class SubscribeChatSessionRequest extends $pb.GeneratedMessage {
  factory SubscribeChatSessionRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  SubscribeChatSessionRequest._() : super();
  factory SubscribeChatSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeChatSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeChatSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeChatSessionRequest clone() => SubscribeChatSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeChatSessionRequest copyWith(void Function(SubscribeChatSessionRequest) updates) => super.copyWith((message) => updates(message as SubscribeChatSessionRequest)) as SubscribeChatSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeChatSessionRequest create() => SubscribeChatSessionRequest._();
  SubscribeChatSessionRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeChatSessionRequest> createRepeated() => $pb.PbList<SubscribeChatSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeChatSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeChatSessionRequest>(create);
  static SubscribeChatSessionRequest? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);
}

enum SubscribeChatSessionResponse_Response {
  chatMessage, 
  editingChatMessage, 
  editableChatTopics, 
  readLastChatMessageId, 
  isToUserTyping, 
  notSet
}

/// チャットセッション購読レスポンス
class SubscribeChatSessionResponse extends $pb.GeneratedMessage {
  factory SubscribeChatSessionResponse({
    $core.String? publishedUserId,
    $157.ChatSessionPublishType? publishType,
    $151.ChatMessage? chatMessage,
    $151.EditingChatMessage? editingChatMessage,
    $154.ChatTopics? editableChatTopics,
    $core.String? readLastChatMessageId,
    $core.bool? isToUserTyping,
    $core.bool? isDelivered,
    $core.bool? isSuccessful,
    $139.ServiceReviewStatus? senderFirstMessageServiceReviewStatus,
  }) {
    final $result = create();
    if (publishedUserId != null) {
      $result.publishedUserId = publishedUserId;
    }
    if (publishType != null) {
      $result.publishType = publishType;
    }
    if (chatMessage != null) {
      $result.chatMessage = chatMessage;
    }
    if (editingChatMessage != null) {
      $result.editingChatMessage = editingChatMessage;
    }
    if (editableChatTopics != null) {
      $result.editableChatTopics = editableChatTopics;
    }
    if (readLastChatMessageId != null) {
      $result.readLastChatMessageId = readLastChatMessageId;
    }
    if (isToUserTyping != null) {
      $result.isToUserTyping = isToUserTyping;
    }
    if (isDelivered != null) {
      $result.isDelivered = isDelivered;
    }
    if (isSuccessful != null) {
      $result.isSuccessful = isSuccessful;
    }
    if (senderFirstMessageServiceReviewStatus != null) {
      $result.senderFirstMessageServiceReviewStatus = senderFirstMessageServiceReviewStatus;
    }
    return $result;
  }
  SubscribeChatSessionResponse._() : super();
  factory SubscribeChatSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeChatSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SubscribeChatSessionResponse_Response> _SubscribeChatSessionResponse_ResponseByTag = {
    3 : SubscribeChatSessionResponse_Response.chatMessage,
    4 : SubscribeChatSessionResponse_Response.editingChatMessage,
    5 : SubscribeChatSessionResponse_Response.editableChatTopics,
    6 : SubscribeChatSessionResponse_Response.readLastChatMessageId,
    7 : SubscribeChatSessionResponse_Response.isToUserTyping,
    0 : SubscribeChatSessionResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeChatSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6, 7])
    ..aOS(1, _omitFieldNames ? '' : 'publishedUserId')
    ..e<$157.ChatSessionPublishType>(2, _omitFieldNames ? '' : 'publishType', $pb.PbFieldType.OE, defaultOrMaker: $157.ChatSessionPublishType.CHAT_SESSION_PUBLISH_TYPE_UNSPECIFIED, valueOf: $157.ChatSessionPublishType.valueOf, enumValues: $157.ChatSessionPublishType.values)
    ..aOM<$151.ChatMessage>(3, _omitFieldNames ? '' : 'chatMessage', subBuilder: $151.ChatMessage.create)
    ..aOM<$151.EditingChatMessage>(4, _omitFieldNames ? '' : 'editingChatMessage', subBuilder: $151.EditingChatMessage.create)
    ..aOM<$154.ChatTopics>(5, _omitFieldNames ? '' : 'editableChatTopics', subBuilder: $154.ChatTopics.create)
    ..aOS(6, _omitFieldNames ? '' : 'readLastChatMessageId')
    ..aOB(7, _omitFieldNames ? '' : 'isToUserTyping')
    ..aOB(14, _omitFieldNames ? '' : 'isDelivered')
    ..aOB(15, _omitFieldNames ? '' : 'isSuccessful')
    ..e<$139.ServiceReviewStatus>(16, _omitFieldNames ? '' : 'senderFirstMessageServiceReviewStatus', $pb.PbFieldType.OE, defaultOrMaker: $139.ServiceReviewStatus.SERVICE_REVIEW_STATUS_UNSPECIFIED, valueOf: $139.ServiceReviewStatus.valueOf, enumValues: $139.ServiceReviewStatus.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeChatSessionResponse clone() => SubscribeChatSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeChatSessionResponse copyWith(void Function(SubscribeChatSessionResponse) updates) => super.copyWith((message) => updates(message as SubscribeChatSessionResponse)) as SubscribeChatSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeChatSessionResponse create() => SubscribeChatSessionResponse._();
  SubscribeChatSessionResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeChatSessionResponse> createRepeated() => $pb.PbList<SubscribeChatSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeChatSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeChatSessionResponse>(create);
  static SubscribeChatSessionResponse? _defaultInstance;

  SubscribeChatSessionResponse_Response whichResponse() => _SubscribeChatSessionResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  /// 発行ユーザーID
  @$pb.TagNumber(1)
  $core.String get publishedUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set publishedUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublishedUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublishedUserId() => clearField(1);

  /// 発行タイプ
  @$pb.TagNumber(2)
  $157.ChatSessionPublishType get publishType => $_getN(1);
  @$pb.TagNumber(2)
  set publishType($157.ChatSessionPublishType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublishType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublishType() => clearField(2);

  /// チャットメッセージ
  @$pb.TagNumber(3)
  $151.ChatMessage get chatMessage => $_getN(2);
  @$pb.TagNumber(3)
  set chatMessage($151.ChatMessage v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatMessage() => clearField(3);
  @$pb.TagNumber(3)
  $151.ChatMessage ensureChatMessage() => $_ensure(2);

  /// 編集途中のチャットメッセージ
  @$pb.TagNumber(4)
  $151.EditingChatMessage get editingChatMessage => $_getN(3);
  @$pb.TagNumber(4)
  set editingChatMessage($151.EditingChatMessage v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEditingChatMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearEditingChatMessage() => clearField(4);
  @$pb.TagNumber(4)
  $151.EditingChatMessage ensureEditingChatMessage() => $_ensure(3);

  /// 編集可能な話題群
  @$pb.TagNumber(5)
  $154.ChatTopics get editableChatTopics => $_getN(4);
  @$pb.TagNumber(5)
  set editableChatTopics($154.ChatTopics v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEditableChatTopics() => $_has(4);
  @$pb.TagNumber(5)
  void clearEditableChatTopics() => clearField(5);
  @$pb.TagNumber(5)
  $154.ChatTopics ensureEditableChatTopics() => $_ensure(4);

  /// 既読が付いた最後のチャットメッセージID
  @$pb.TagNumber(6)
  $core.String get readLastChatMessageId => $_getSZ(5);
  @$pb.TagNumber(6)
  set readLastChatMessageId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReadLastChatMessageId() => $_has(5);
  @$pb.TagNumber(6)
  void clearReadLastChatMessageId() => clearField(6);

  /// お相手のユーザーがメッセージ入力状態にあるかどうか
  @$pb.TagNumber(7)
  $core.bool get isToUserTyping => $_getBF(6);
  @$pb.TagNumber(7)
  set isToUserTyping($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIsToUserTyping() => $_has(6);
  @$pb.TagNumber(7)
  void clearIsToUserTyping() => clearField(7);

  /// メッセージが配信済みかどうか
  @$pb.TagNumber(14)
  $core.bool get isDelivered => $_getBF(7);
  @$pb.TagNumber(14)
  set isDelivered($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsDelivered() => $_has(7);
  @$pb.TagNumber(14)
  void clearIsDelivered() => clearField(14);

  /// 成功フラグ
  @$pb.TagNumber(15)
  $core.bool get isSuccessful => $_getBF(8);
  @$pb.TagNumber(15)
  set isSuccessful($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsSuccessful() => $_has(8);
  @$pb.TagNumber(15)
  void clearIsSuccessful() => clearField(15);

  /// 送信者の初回メッセージ審査ステータス
  @$pb.TagNumber(16)
  $139.ServiceReviewStatus get senderFirstMessageServiceReviewStatus => $_getN(9);
  @$pb.TagNumber(16)
  set senderFirstMessageServiceReviewStatus($139.ServiceReviewStatus v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasSenderFirstMessageServiceReviewStatus() => $_has(9);
  @$pb.TagNumber(16)
  void clearSenderFirstMessageServiceReviewStatus() => clearField(16);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
