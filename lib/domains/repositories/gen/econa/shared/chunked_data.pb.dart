//
//  Generated code. Do not modify.
//  source: econa/shared/chunked_data.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// アップロードするデータのチャンク
class ChunkedData extends $pb.GeneratedMessage {
  factory ChunkedData({
    $core.String? uploadManageKey,
    $core.int? chunkNumber,
    $core.bool? isLastChunk,
    $core.List<$core.int>? chunkData,
    $core.String? fileName,
    $core.String? contentType,
    $core.Map<$core.String, $core.String>? metadata,
  }) {
    final $result = create();
    if (uploadManageKey != null) {
      $result.uploadManageKey = uploadManageKey;
    }
    if (chunkNumber != null) {
      $result.chunkNumber = chunkNumber;
    }
    if (isLastChunk != null) {
      $result.isLastChunk = isLastChunk;
    }
    if (chunkData != null) {
      $result.chunkData = chunkData;
    }
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (contentType != null) {
      $result.contentType = contentType;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    return $result;
  }
  ChunkedData._() : super();
  factory ChunkedData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChunkedData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChunkedData', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uploadManageKey')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'chunkNumber', $pb.PbFieldType.O3)
    ..aOB(3, _omitFieldNames ? '' : 'isLastChunk')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'chunkData', $pb.PbFieldType.OY)
    ..aOS(5, _omitFieldNames ? '' : 'fileName')
    ..aOS(6, _omitFieldNames ? '' : 'contentType')
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'metadata', entryClassName: 'ChunkedData.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('econa.shared'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChunkedData clone() => ChunkedData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChunkedData copyWith(void Function(ChunkedData) updates) => super.copyWith((message) => updates(message as ChunkedData)) as ChunkedData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChunkedData create() => ChunkedData._();
  ChunkedData createEmptyInstance() => create();
  static $pb.PbList<ChunkedData> createRepeated() => $pb.PbList<ChunkedData>();
  @$core.pragma('dart2js:noInline')
  static ChunkedData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChunkedData>(create);
  static ChunkedData? _defaultInstance;

  /// アップロード管理キー (最初のチャンクで設定、以降は同じキーを使用)
  @$pb.TagNumber(1)
  $core.String get uploadManageKey => $_getSZ(0);
  @$pb.TagNumber(1)
  set uploadManageKey($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUploadManageKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearUploadManageKey() => clearField(1);

  /// チャンク番号 (0から始まる連番)
  @$pb.TagNumber(2)
  $core.int get chunkNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunkNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunkNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkNumber() => clearField(2);

  /// 最後のチャンクかどうか
  @$pb.TagNumber(3)
  $core.bool get isLastChunk => $_getBF(2);
  @$pb.TagNumber(3)
  set isLastChunk($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsLastChunk() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsLastChunk() => clearField(3);

  /// 画像データのチャンク
  @$pb.TagNumber(4)
  $core.List<$core.int> get chunkData => $_getN(3);
  @$pb.TagNumber(4)
  set chunkData($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChunkData() => $_has(3);
  @$pb.TagNumber(4)
  void clearChunkData() => clearField(4);

  /// ファイル名 (最初のチャンクでのみ必要)
  @$pb.TagNumber(5)
  $core.String get fileName => $_getSZ(4);
  @$pb.TagNumber(5)
  set fileName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFileName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFileName() => clearField(5);

  /// コンテンツタイプ (最初のチャンクでのみ必要)
  @$pb.TagNumber(6)
  $core.String get contentType => $_getSZ(5);
  @$pb.TagNumber(6)
  set contentType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContentType() => $_has(5);
  @$pb.TagNumber(6)
  void clearContentType() => clearField(6);

  /// メタデータ (最初のチャンクでのみ必要)
  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
