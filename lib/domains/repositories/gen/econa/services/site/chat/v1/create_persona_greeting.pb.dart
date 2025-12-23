//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/create_persona_greeting.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// なりきり挨拶作成リクエスト
class CreatePersonaGreetingRequest extends $pb.GeneratedMessage {
  factory CreatePersonaGreetingRequest({
    $core.String? chatRoomId,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    return $result;
  }
  CreatePersonaGreetingRequest._() : super();
  factory CreatePersonaGreetingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersonaGreetingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersonaGreetingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersonaGreetingRequest clone() => CreatePersonaGreetingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersonaGreetingRequest copyWith(void Function(CreatePersonaGreetingRequest) updates) => super.copyWith((message) => updates(message as CreatePersonaGreetingRequest)) as CreatePersonaGreetingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersonaGreetingRequest create() => CreatePersonaGreetingRequest._();
  CreatePersonaGreetingRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePersonaGreetingRequest> createRepeated() => $pb.PbList<CreatePersonaGreetingRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePersonaGreetingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersonaGreetingRequest>(create);
  static CreatePersonaGreetingRequest? _defaultInstance;

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

/// なりきり挨拶作成レスポンス
class CreatePersonaGreetingResponse extends $pb.GeneratedMessage {
  factory CreatePersonaGreetingResponse() => create();
  CreatePersonaGreetingResponse._() : super();
  factory CreatePersonaGreetingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePersonaGreetingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePersonaGreetingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePersonaGreetingResponse clone() => CreatePersonaGreetingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePersonaGreetingResponse copyWith(void Function(CreatePersonaGreetingResponse) updates) => super.copyWith((message) => updates(message as CreatePersonaGreetingResponse)) as CreatePersonaGreetingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePersonaGreetingResponse create() => CreatePersonaGreetingResponse._();
  CreatePersonaGreetingResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePersonaGreetingResponse> createRepeated() => $pb.PbList<CreatePersonaGreetingResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePersonaGreetingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePersonaGreetingResponse>(create);
  static CreatePersonaGreetingResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
