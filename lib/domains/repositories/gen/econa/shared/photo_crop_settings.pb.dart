//
//  Generated code. Do not modify.
//  source: econa/shared/photo_crop_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 写真クロップ
class PhotoCropSettings extends $pb.GeneratedMessage {
  factory PhotoCropSettings({
    $core.int? centerX,
    $core.int? centerY,
    $core.double? scale,
  }) {
    final $result = create();
    if (centerX != null) {
      $result.centerX = centerX;
    }
    if (centerY != null) {
      $result.centerY = centerY;
    }
    if (scale != null) {
      $result.scale = scale;
    }
    return $result;
  }
  PhotoCropSettings._() : super();
  factory PhotoCropSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PhotoCropSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PhotoCropSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'centerX', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'centerY', $pb.PbFieldType.O3)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'scale', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PhotoCropSettings clone() => PhotoCropSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PhotoCropSettings copyWith(void Function(PhotoCropSettings) updates) => super.copyWith((message) => updates(message as PhotoCropSettings)) as PhotoCropSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PhotoCropSettings create() => PhotoCropSettings._();
  PhotoCropSettings createEmptyInstance() => create();
  static $pb.PbList<PhotoCropSettings> createRepeated() => $pb.PbList<PhotoCropSettings>();
  @$core.pragma('dart2js:noInline')
  static PhotoCropSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PhotoCropSettings>(create);
  static PhotoCropSettings? _defaultInstance;

  /// 中心X座標
  @$pb.TagNumber(1)
  $core.int get centerX => $_getIZ(0);
  @$pb.TagNumber(1)
  set centerX($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCenterX() => $_has(0);
  @$pb.TagNumber(1)
  void clearCenterX() => clearField(1);

  /// 中心Y座標
  @$pb.TagNumber(2)
  $core.int get centerY => $_getIZ(1);
  @$pb.TagNumber(2)
  set centerY($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCenterY() => $_has(1);
  @$pb.TagNumber(2)
  void clearCenterY() => clearField(2);

  /// 拡大率
  @$pb.TagNumber(3)
  $core.double get scale => $_getN(2);
  @$pb.TagNumber(3)
  set scale($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasScale() => $_has(2);
  @$pb.TagNumber(3)
  void clearScale() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
