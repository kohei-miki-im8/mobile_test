//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/publish_disconnect_chat_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// チャットセッション切断イベントを送信するリクエスト
class PublishDisconnectChatSessionRequest extends $pb.GeneratedMessage {
  factory PublishDisconnectChatSessionRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  PublishDisconnectChatSessionRequest._() : super();
  factory PublishDisconnectChatSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishDisconnectChatSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishDisconnectChatSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishDisconnectChatSessionRequest clone() => PublishDisconnectChatSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishDisconnectChatSessionRequest copyWith(void Function(PublishDisconnectChatSessionRequest) updates) => super.copyWith((message) => updates(message as PublishDisconnectChatSessionRequest)) as PublishDisconnectChatSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishDisconnectChatSessionRequest create() => PublishDisconnectChatSessionRequest._();
  PublishDisconnectChatSessionRequest createEmptyInstance() => create();
  static $pb.PbList<PublishDisconnectChatSessionRequest> createRepeated() => $pb.PbList<PublishDisconnectChatSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static PublishDisconnectChatSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishDisconnectChatSessionRequest>(create);
  static PublishDisconnectChatSessionRequest? _defaultInstance;

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

/// チャットセッション切断イベントを送信するレスポンス
class PublishDisconnectChatSessionResponse extends $pb.GeneratedMessage {
  factory PublishDisconnectChatSessionResponse() => create();
  PublishDisconnectChatSessionResponse._() : super();
  factory PublishDisconnectChatSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublishDisconnectChatSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublishDisconnectChatSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublishDisconnectChatSessionResponse clone() => PublishDisconnectChatSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublishDisconnectChatSessionResponse copyWith(void Function(PublishDisconnectChatSessionResponse) updates) => super.copyWith((message) => updates(message as PublishDisconnectChatSessionResponse)) as PublishDisconnectChatSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublishDisconnectChatSessionResponse create() => PublishDisconnectChatSessionResponse._();
  PublishDisconnectChatSessionResponse createEmptyInstance() => create();
  static $pb.PbList<PublishDisconnectChatSessionResponse> createRepeated() => $pb.PbList<PublishDisconnectChatSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static PublishDisconnectChatSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublishDisconnectChatSessionResponse>(create);
  static PublishDisconnectChatSessionResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
