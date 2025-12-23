//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/chunked_voice_upload.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/voice_type.pbenum.dart' as $191;
import '../../../../shared/chunked_data.pb.dart' as $164;
import '../../../../shared/voice.pb.dart' as $193;

/// 音声チャンクをアップロードするリクエストです。
class ChunkedVoiceUploadRequest extends $pb.GeneratedMessage {
  factory ChunkedVoiceUploadRequest({
    $191.VoiceType? voiceType,
    $164.ChunkedData? chunkedVoiceData,
  }) {
    final $result = create();
    if (voiceType != null) {
      $result.voiceType = voiceType;
    }
    if (chunkedVoiceData != null) {
      $result.chunkedVoiceData = chunkedVoiceData;
    }
    return $result;
  }
  ChunkedVoiceUploadRequest._() : super();
  factory ChunkedVoiceUploadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChunkedVoiceUploadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChunkedVoiceUploadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.voice.v1'), createEmptyInstance: create)
    ..e<$191.VoiceType>(1, _omitFieldNames ? '' : 'voiceType', $pb.PbFieldType.OE, defaultOrMaker: $191.VoiceType.VOICE_TYPE_UNSPECIFIED, valueOf: $191.VoiceType.valueOf, enumValues: $191.VoiceType.values)
    ..aOM<$164.ChunkedData>(2, _omitFieldNames ? '' : 'chunkedVoiceData', subBuilder: $164.ChunkedData.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChunkedVoiceUploadRequest clone() => ChunkedVoiceUploadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChunkedVoiceUploadRequest copyWith(void Function(ChunkedVoiceUploadRequest) updates) => super.copyWith((message) => updates(message as ChunkedVoiceUploadRequest)) as ChunkedVoiceUploadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkedVoiceUploadRequest create() => ChunkedVoiceUploadRequest._();
  ChunkedVoiceUploadRequest createEmptyInstance() => create();
  static $pb.PbList<ChunkedVoiceUploadRequest> createRepeated() => $pb.PbList<ChunkedVoiceUploadRequest>();
  @$core.pragma('dart2js:noInline')
  static ChunkedVoiceUploadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkedVoiceUploadRequest>(create);
  static ChunkedVoiceUploadRequest? _defaultInstance;

  /// 音声種別
  @$pb.TagNumber(1)
  $191.VoiceType get voiceType => $_getN(0);
  @$pb.TagNumber(1)
  set voiceType($191.VoiceType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceType() => clearField(1);

  /// 音声チャンクデータ
  @$pb.TagNumber(2)
  $164.ChunkedData get chunkedVoiceData => $_getN(1);
  @$pb.TagNumber(2)
  set chunkedVoiceData($164.ChunkedData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunkedVoiceData() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkedVoiceData() => clearField(2);
  @$pb.TagNumber(2)
  $164.ChunkedData ensureChunkedVoiceData() => $_ensure(1);
}

/// 音声チャンクをアップロードするレスポンスです。
class ChunkedVoiceUploadResponse extends $pb.GeneratedMessage {
  factory ChunkedVoiceUploadResponse({
    $193.Voice? voice,
  }) {
    final $result = create();
    if (voice != null) {
      $result.voice = voice;
    }
    return $result;
  }
  ChunkedVoiceUploadResponse._() : super();
  factory ChunkedVoiceUploadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChunkedVoiceUploadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChunkedVoiceUploadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.voice.v1'), createEmptyInstance: create)
    ..aOM<$193.Voice>(1, _omitFieldNames ? '' : 'voice', subBuilder: $193.Voice.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChunkedVoiceUploadResponse clone() => ChunkedVoiceUploadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChunkedVoiceUploadResponse copyWith(void Function(ChunkedVoiceUploadResponse) updates) => super.copyWith((message) => updates(message as ChunkedVoiceUploadResponse)) as ChunkedVoiceUploadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkedVoiceUploadResponse create() => ChunkedVoiceUploadResponse._();
  ChunkedVoiceUploadResponse createEmptyInstance() => create();
  static $pb.PbList<ChunkedVoiceUploadResponse> createRepeated() => $pb.PbList<ChunkedVoiceUploadResponse>();
  @$core.pragma('dart2js:noInline')
  static ChunkedVoiceUploadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkedVoiceUploadResponse>(create);
  static ChunkedVoiceUploadResponse? _defaultInstance;

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
