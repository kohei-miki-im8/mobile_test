//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/publish_chat_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/chat_message.pb.dart' as $151;

/// チャットメッセージを送信するリクエスト
class PublishChatMessageRequest extends $pb.GeneratedMessage {
  factory PublishChatMessageRequest({
    $core.String? chatRoomId,
    $151.ChatMessage? chatMessage,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (chatMessage != null) {
      $result.chatMessage = chatMessage;
    }
    return $result;
  }
  PublishChatMessageRequest._() : super();
  factory PublishChatMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishChatMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishChatMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOM<$151.ChatMessage>(2, _omitFieldNames ? '' : 'chatMessage', subBuilder: $151.ChatMessage.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishChatMessageRequest clone() => PublishChatMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishChatMessageRequest copyWith(void Function(PublishChatMessageRequest) updates) => super.copyWith((message) => updates(message as PublishChatMessageRequest)) as PublishChatMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishChatMessageRequest create() => PublishChatMessageRequest._();
  PublishChatMessageRequest createEmptyInstance() => create();
  static $pb.PbList<PublishChatMessageRequest> createRepeated() => $pb.PbList<PublishChatMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static PublishChatMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishChatMessageRequest>(create);
  static PublishChatMessageRequest? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// チャットメッセージ
  @$pb.TagNumber(2)
  $151.ChatMessage get chatMessage => $_getN(1);
  @$pb.TagNumber(2)
  set chatMessage($151.ChatMessage v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatMessage() => clearField(2);
  @$pb.TagNumber(2)
  $151.ChatMessage ensureChatMessage() => $_ensure(1);
}

/// チャットメッセージを送信するレスポンス
class PublishChatMessageResponse extends $pb.GeneratedMessage {
  factory PublishChatMessageResponse({
    $core.String? chatMessageId,
    $core.bool? isBlocked,
  }) {
    final $result = create();
    if (chatMessageId != null) {
      $result.chatMessageId = chatMessageId;
    }
    if (isBlocked != null) {
      $result.isBlocked = isBlocked;
    }
    return $result;
  }
  PublishChatMessageResponse._() : super();
  factory PublishChatMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishChatMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishChatMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatMessageId')
    ..aOB(2, _omitFieldNames ? '' : 'isBlocked')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishChatMessageResponse clone() => PublishChatMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishChatMessageResponse copyWith(void Function(PublishChatMessageResponse) updates) => super.copyWith((message) => updates(message as PublishChatMessageResponse)) as PublishChatMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishChatMessageResponse create() => PublishChatMessageResponse._();
  PublishChatMessageResponse createEmptyInstance() => create();
  static $pb.PbList<PublishChatMessageResponse> createRepeated() => $pb.PbList<PublishChatMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static PublishChatMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishChatMessageResponse>(create);
  static PublishChatMessageResponse? _defaultInstance;

  /// チャットメッセージID
  @$pb.TagNumber(1)
  $core.String get chatMessageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatMessageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatMessageId() => clearField(1);

  /// お相手からブロックされているかどうか（された場合は未配信）
  @$pb.TagNumber(2)
  $core.bool get isBlocked => $_getBF(1);
  @$pb.TagNumber(2)
  set isBlocked($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsBlocked() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsBlocked() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
