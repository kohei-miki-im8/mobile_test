//
//  Generated code. Do not modify.
//  source: econa/shared/voice_data_origin.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../enums/voice_type.pbenum.dart' as $191;

/// 音声データ元
class VoiceDataOrigin extends $pb.GeneratedMessage {
  factory VoiceDataOrigin({
    $core.String? voiceDataOriginId,
    $191.VoiceType? voiceType,
    $core.String? fileName,
    $core.String? contentType,
    $core.int? fileSize,
    $core.Map<$core.String, $core.String>? metadata,
  }) {
    final $result = create();
    if (voiceDataOriginId != null) {
      $result.voiceDataOriginId = voiceDataOriginId;
    }
    if (voiceType != null) {
      $result.voiceType = voiceType;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (fileSize != null) {
      $result.fileSize = fileSize;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    return $result;
  }
  VoiceDataOrigin._() : super();
  factory VoiceDataOrigin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VoiceDataOrigin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VoiceDataOrigin', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'voiceDataOriginId')
    ..e<$191.VoiceType>(2, _omitFieldNames ? '' : 'voiceType', $pb.PbFieldType.OE, defaultOrMaker: $191.VoiceType.VOICE_TYPE_UNSPECIFIED, valueOf: $191.VoiceType.valueOf, enumValues: $191.VoiceType.values)
    ..aOS(3, _omitFieldNames ? '' : 'fileName')
    ..aOS(4, _omitFieldNames ? '' : 'contentType')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'fileSize', $pb.PbFieldType.O3)
    ..m<$core.String, $core.String>(6, _omitFieldNames ? '' : 'metadata', entryClassName: 'VoiceDataOrigin.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('econa.shared'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VoiceDataOrigin clone() => VoiceDataOrigin()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VoiceDataOrigin copyWith(void Function(VoiceDataOrigin) updates) => super.copyWith((message) => updates(message as VoiceDataOrigin)) as VoiceDataOrigin;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoiceDataOrigin create() => VoiceDataOrigin._();
  VoiceDataOrigin createEmptyInstance() => create();
  static $pb.PbList<VoiceDataOrigin> createRepeated() => $pb.PbList<VoiceDataOrigin>();
  @$core.pragma('dart2js:noInline')
  static VoiceDataOrigin getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VoiceDataOrigin>(create);
  static VoiceDataOrigin? _defaultInstance;

  /// 音声データ元ID
  @$pb.TagNumber(1)
  $core.String get voiceDataOriginId => $_getSZ(0);
  @$pb.TagNumber(1)
  set voiceDataOriginId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceDataOriginId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceDataOriginId() => clearField(1);

  /// 音声データ種別
  @$pb.TagNumber(2)
  $191.VoiceType get voiceType => $_getN(1);
  @$pb.TagNumber(2)
  set voiceType($191.VoiceType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoiceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoiceType() => clearField(2);

  /// ファイル名
  @$pb.TagNumber(3)
  $core.String get fileName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileName() => clearField(3);

  /// コンテンツタイプ
  @$pb.TagNumber(4)
  $core.String get contentType => $_getSZ(3);
  @$pb.TagNumber(4)
  set contentType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContentType() => $_has(3);
  @$pb.TagNumber(4)
  void clearContentType() => clearField(4);

  /// ファイルサイズ
  @$pb.TagNumber(5)
  $core.int get fileSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set fileSize($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileSize() => clearField(5);

  /// メタデータ
  @$pb.TagNumber(6)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
