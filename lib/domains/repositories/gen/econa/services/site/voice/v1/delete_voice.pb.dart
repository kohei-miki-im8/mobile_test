//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/delete_voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 音声を削除するリクエストです。
class DeleteVoiceRequest extends $pb.GeneratedMessage {
  factory DeleteVoiceRequest({
    $core.String? voiceId,
  }) {
    final $result = create();
    if (voiceId != null) {
      $result.voiceId = voiceId;
    }
    return $result;
  }
  DeleteVoiceRequest._() : super();
  factory DeleteVoiceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteVoiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteVoiceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.voice.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'voiceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteVoiceRequest clone() => DeleteVoiceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteVoiceRequest copyWith(void Function(DeleteVoiceRequest) updates) => super.copyWith((message) => updates(message as DeleteVoiceRequest)) as DeleteVoiceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteVoiceRequest create() => DeleteVoiceRequest._();
  DeleteVoiceRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteVoiceRequest> createRepeated() => $pb.PbList<DeleteVoiceRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteVoiceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteVoiceRequest>(create);
  static DeleteVoiceRequest? _defaultInstance;

  /// 音声ID
  @$pb.TagNumber(1)
  $core.String get voiceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set voiceId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceId() => clearField(1);
}

/// 音声を削除するレスポンスです。
class DeleteVoiceResponse extends $pb.GeneratedMessage {
  factory DeleteVoiceResponse() => create();
  DeleteVoiceResponse._() : super();
  factory DeleteVoiceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteVoiceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteVoiceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.voice.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteVoiceResponse clone() => DeleteVoiceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteVoiceResponse copyWith(void Function(DeleteVoiceResponse) updates) => super.copyWith((message) => updates(message as DeleteVoiceResponse)) as DeleteVoiceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteVoiceResponse create() => DeleteVoiceResponse._();
  DeleteVoiceResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteVoiceResponse> createRepeated() => $pb.PbList<DeleteVoiceResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteVoiceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteVoiceResponse>(create);
  static DeleteVoiceResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
