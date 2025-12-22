//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_pinned_chat_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// メッセージピン留めステータス更新リクエスト
class UpdatePinnedChatMessageRequest extends $pb.GeneratedMessage {
  factory UpdatePinnedChatMessageRequest({
    $core.String? chatRoomId,
    $core.String? chatMessageId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (chatMessageId != null) {
      $result.chatMessageId = chatMessageId;
    }
    return $result;
  }
  UpdatePinnedChatMessageRequest._() : super();
  factory UpdatePinnedChatMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePinnedChatMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePinnedChatMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOS(2, _omitFieldNames ? '' : 'chatMessageId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePinnedChatMessageRequest clone() => UpdatePinnedChatMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePinnedChatMessageRequest copyWith(void Function(UpdatePinnedChatMessageRequest) updates) => super.copyWith((message) => updates(message as UpdatePinnedChatMessageRequest)) as UpdatePinnedChatMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePinnedChatMessageRequest create() => UpdatePinnedChatMessageRequest._();
  UpdatePinnedChatMessageRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePinnedChatMessageRequest> createRepeated() => $pb.PbList<UpdatePinnedChatMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePinnedChatMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePinnedChatMessageRequest>(create);
  static UpdatePinnedChatMessageRequest? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// チャットメッセージID
  @$pb.TagNumber(2)
  $core.String get chatMessageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chatMessageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatMessageId() => clearField(2);
}

/// メッセージピン留めステータス更新レスポンス
class UpdatePinnedChatMessageResponse extends $pb.GeneratedMessage {
  factory UpdatePinnedChatMessageResponse() => create();
  UpdatePinnedChatMessageResponse._() : super();
  factory UpdatePinnedChatMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePinnedChatMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePinnedChatMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePinnedChatMessageResponse clone() => UpdatePinnedChatMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePinnedChatMessageResponse copyWith(void Function(UpdatePinnedChatMessageResponse) updates) => super.copyWith((message) => updates(message as UpdatePinnedChatMessageResponse)) as UpdatePinnedChatMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePinnedChatMessageResponse create() => UpdatePinnedChatMessageResponse._();
  UpdatePinnedChatMessageResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePinnedChatMessageResponse> createRepeated() => $pb.PbList<UpdatePinnedChatMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePinnedChatMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePinnedChatMessageResponse>(create);
  static UpdatePinnedChatMessageResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
