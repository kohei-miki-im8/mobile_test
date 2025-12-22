//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/create_chat_topics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// チャット話題作成リクエスト
class CreateChatTopicsRequest extends $pb.GeneratedMessage {
  factory CreateChatTopicsRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  CreateChatTopicsRequest._() : super();
  factory CreateChatTopicsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatTopicsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatTopicsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatTopicsRequest clone() => CreateChatTopicsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatTopicsRequest copyWith(void Function(CreateChatTopicsRequest) updates) => super.copyWith((message) => updates(message as CreateChatTopicsRequest)) as CreateChatTopicsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatTopicsRequest create() => CreateChatTopicsRequest._();
  CreateChatTopicsRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChatTopicsRequest> createRepeated() => $pb.PbList<CreateChatTopicsRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChatTopicsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatTopicsRequest>(create);
  static CreateChatTopicsRequest? _defaultInstance;

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

/// チャット話題作成レスポンス
class CreateChatTopicsResponse extends $pb.GeneratedMessage {
  factory CreateChatTopicsResponse() => create();
  CreateChatTopicsResponse._() : super();
  factory CreateChatTopicsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatTopicsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatTopicsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatTopicsResponse clone() => CreateChatTopicsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatTopicsResponse copyWith(void Function(CreateChatTopicsResponse) updates) => super.copyWith((message) => updates(message as CreateChatTopicsResponse)) as CreateChatTopicsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatTopicsResponse create() => CreateChatTopicsResponse._();
  CreateChatTopicsResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChatTopicsResponse> createRepeated() => $pb.PbList<CreateChatTopicsResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChatTopicsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatTopicsResponse>(create);
  static CreateChatTopicsResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
