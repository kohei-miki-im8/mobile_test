//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/get_voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/voice.pb.dart' as $193;

/// 音声を取得するリクエストです。
class GetVoiceRequest extends $pb.GeneratedMessage {
  factory GetVoiceRequest({
    $core.String? voiceId,
  }) {
    final $result = create();
    if (voiceId != null) {
      $result.voiceId = voiceId;
    }
    return $result;
  }
  GetVoiceRequest._() : super();
  factory GetVoiceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVoiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetVoiceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.voice.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'voiceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVoiceRequest clone() => GetVoiceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVoiceRequest copyWith(void Function(GetVoiceRequest) updates) => super.copyWith((message) => updates(message as GetVoiceRequest)) as GetVoiceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVoiceRequest create() => GetVoiceRequest._();
  GetVoiceRequest createEmptyInstance() => create();
  static $pb.PbList<GetVoiceRequest> createRepeated() => $pb.PbList<GetVoiceRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVoiceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVoiceRequest>(create);
  static GetVoiceRequest? _defaultInstance;

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

/// 音声を取得するレスポンスです。
class GetVoiceResponse extends $pb.GeneratedMessage {
  factory GetVoiceResponse({
    $193.Voice? voice,
  }) {
    final $result = create();
    if (voice != null) {
      $result.voice = voice;
    }
    return $result;
  }
  GetVoiceResponse._() : super();
  factory GetVoiceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetVoiceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetVoiceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.voice.v1'), createEmptyInstance: create)
    ..aOM<$193.Voice>(1, _omitFieldNames ? '' : 'voice', subBuilder: $193.Voice.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetVoiceResponse clone() => GetVoiceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetVoiceResponse copyWith(void Function(GetVoiceResponse) updates) => super.copyWith((message) => updates(message as GetVoiceResponse)) as GetVoiceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVoiceResponse create() => GetVoiceResponse._();
  GetVoiceResponse createEmptyInstance() => create();
  static $pb.PbList<GetVoiceResponse> createRepeated() => $pb.PbList<GetVoiceResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVoiceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetVoiceResponse>(create);
  static GetVoiceResponse? _defaultInstance;

  /// 音声
  @$pb.TagNumber(1)
  $193.Voice get voice => $_getN(0);
  @$pb.TagNumber(1)
  set voice($193.Voice v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoice() => clearField(1);
  @$pb.TagNumber(1)
  $193.Voice ensureVoice() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
