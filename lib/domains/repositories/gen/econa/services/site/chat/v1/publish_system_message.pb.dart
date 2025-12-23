//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/publish_system_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/message_content_type.pbenum.dart' as $149;
import '../../../../shared/chat_message.pb.dart' as $151;

/// システムメッセージを送信するリクエスト
class PublishSystemMessageRequest extends $pb.GeneratedMessage {
  factory PublishSystemMessageRequest({
    $core.String? chatRoomId,
    $149.MessageContentType? contentType,
    $151.SystemMessageContent? content,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  PublishSystemMessageRequest._() : super();
  factory PublishSystemMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishSystemMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishSystemMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..e<$149.MessageContentType>(2, _omitFieldNames ? '' : 'contentType', $pb.PbFieldType.OE, defaultOrMaker: $149.MessageContentType.MESSAGE_CONTENT_TYPE_UNSPECIFIED, valueOf: $149.MessageContentType.valueOf, enumValues: $149.MessageContentType.values)
    ..aOM<$151.SystemMessageContent>(3, _omitFieldNames ? '' : 'content', subBuilder: $151.SystemMessageContent.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishSystemMessageRequest clone() => PublishSystemMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishSystemMessageRequest copyWith(void Function(PublishSystemMessageRequest) updates) => super.copyWith((message) => updates(message as PublishSystemMessageRequest)) as PublishSystemMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishSystemMessageRequest create() => PublishSystemMessageRequest._();
  PublishSystemMessageRequest createEmptyInstance() => create();
  static $pb.PbList<PublishSystemMessageRequest> createRepeated() => $pb.PbList<PublishSystemMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static PublishSystemMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishSystemMessageRequest>(create);
  static PublishSystemMessageRequest? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// メッセージ内容の型（only MESSAGE_CONTENT_TYPE_SYSTEM）
  @$pb.TagNumber(2)
  $149.MessageContentType get contentType => $_getN(1);
  @$pb.TagNumber(2)
  set contentType($149.MessageContentType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContentType() => $_has(1);
  @$pb.TagNumber(2)
  void clearContentType() => clearField(2);

  /// システムメッセージ
  @$pb.TagNumber(3)
  $151.SystemMessageContent get content => $_getN(2);
  @$pb.TagNumber(3)
  set content($151.SystemMessageContent v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);
  @$pb.TagNumber(3)
  $151.SystemMessageContent ensureContent() => $_ensure(2);
}

/// システムメッセージを送信するレスポンス
class PublishSystemMessageResponse extends $pb.GeneratedMessage {
  factory PublishSystemMessageResponse({
    $core.String? chatMessageId,
  }) {
    final $result = create();
    if (chatMessageId != null) {
      $result.chatMessageId = chatMessageId;
    }
    return $result;
  }
  PublishSystemMessageResponse._() : super();
  factory PublishSystemMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishSystemMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishSystemMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatMessageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishSystemMessageResponse clone() => PublishSystemMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishSystemMessageResponse copyWith(void Function(PublishSystemMessageResponse) updates) => super.copyWith((message) => updates(message as PublishSystemMessageResponse)) as PublishSystemMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishSystemMessageResponse create() => PublishSystemMessageResponse._();
  PublishSystemMessageResponse createEmptyInstance() => create();
  static $pb.PbList<PublishSystemMessageResponse> createRepeated() => $pb.PbList<PublishSystemMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static PublishSystemMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishSystemMessageResponse>(create);
  static PublishSystemMessageResponse? _defaultInstance;

  /// チャットメッセージID
  @$pb.TagNumber(1)
  $core.String get chatMessageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatMessageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatMessageId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
