//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/create_persona_reply.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// なりきり返信作成リクエスト
class CreatePersonaReplyRequest extends $pb.GeneratedMessage {
  factory CreatePersonaReplyRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  CreatePersonaReplyRequest._() : super();
  factory CreatePersonaReplyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersonaReplyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersonaReplyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersonaReplyRequest clone() => CreatePersonaReplyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersonaReplyRequest copyWith(void Function(CreatePersonaReplyRequest) updates) => super.copyWith((message) => updates(message as CreatePersonaReplyRequest)) as CreatePersonaReplyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersonaReplyRequest create() => CreatePersonaReplyRequest._();
  CreatePersonaReplyRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePersonaReplyRequest> createRepeated() => $pb.PbList<CreatePersonaReplyRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePersonaReplyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersonaReplyRequest>(create);
  static CreatePersonaReplyRequest? _defaultInstance;

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

/// なりきり返信作成レスポンス
class CreatePersonaReplyResponse extends $pb.GeneratedMessage {
  factory CreatePersonaReplyResponse() => create();
  CreatePersonaReplyResponse._() : super();
  factory CreatePersonaReplyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersonaReplyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersonaReplyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersonaReplyResponse clone() => CreatePersonaReplyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersonaReplyResponse copyWith(void Function(CreatePersonaReplyResponse) updates) => super.copyWith((message) => updates(message as CreatePersonaReplyResponse)) as CreatePersonaReplyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersonaReplyResponse create() => CreatePersonaReplyResponse._();
  CreatePersonaReplyResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePersonaReplyResponse> createRepeated() => $pb.PbList<CreatePersonaReplyResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePersonaReplyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersonaReplyResponse>(create);
  static CreatePersonaReplyResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
