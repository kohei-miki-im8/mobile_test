//
//  Generated code. Do not modify.
//  source: econa/shared/point.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// ポイント残高
class PointBalance extends $pb.GeneratedMessage {
  factory PointBalance({
    $core.int? freeLikePoints,
    $core.int? freeMatchingPoints,
    $core.int? freeLavigationPoints,
    $core.int? likePoints,
    $core.int? matchingPoints,
    $core.int? lavigationPoints,
  }) {
    final $result = create();
    if (freeLikePoints != null) {
      $result.freeLikePoints = freeLikePoints;
    }
    if (freeMatchingPoints != null) {
      $result.freeMatchingPoints = freeMatchingPoints;
    }
    if (freeLavigationPoints != null) {
      $result.freeLavigationPoints = freeLavigationPoints;
    }
    if (likePoints != null) {
      $result.likePoints = likePoints;
    }
    if (matchingPoints != null) {
      $result.matchingPoints = matchingPoints;
    }
    if (lavigationPoints != null) {
      $result.lavigationPoints = lavigationPoints;
    }
    return $result;
  }
  PointBalance._() : super();
  factory PointBalance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointBalance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PointBalance', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'freeLikePoints', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'freeMatchingPoints', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'freeLavigationPoints', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'likePoints', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'matchingPoints', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'lavigationPoints', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PointBalance clone() => PointBalance()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PointBalance copyWith(void Function(PointBalance) updates) => super.copyWith((message) => updates(message as PointBalance)) as PointBalance;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PointBalance create() => PointBalance._();
  PointBalance createEmptyInstance() => create();
  static $pb.PbList<PointBalance> createRepeated() => $pb.PbList<PointBalance>();
  @$core.pragma('dart2js:noInline')
  static PointBalance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointBalance>(create);
  static PointBalance? _defaultInstance;

  /// いいねポイント（厳密にはいいね数だが、ポイントとして管理）：無償分
  @$pb.TagNumber(1)
  $core.int get freeLikePoints => $_getIZ(0);
  @$pb.TagNumber(1)
  set freeLikePoints($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFreeLikePoints() => $_has(0);
  @$pb.TagNumber(1)
  void clearFreeLikePoints() => clearField(1);

  /// マッチングポイント（MP）：無償分
  @$pb.TagNumber(2)
  $core.int get freeMatchingPoints => $_getIZ(1);
  @$pb.TagNumber(2)
  set freeMatchingPoints($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFreeMatchingPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearFreeMatchingPoints() => clearField(2);

  /// ラヴィゲーションポイント（LP）：無償分
  @$pb.TagNumber(3)
  $core.int get freeLavigationPoints => $_getIZ(2);
  @$pb.TagNumber(3)
  set freeLavigationPoints($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFreeLavigationPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearFreeLavigationPoints() => clearField(3);

  /// いいねポイント（厳密にはいいね数だが、ポイントとして管理）：有償分
  @$pb.TagNumber(4)
  $core.int get likePoints => $_getIZ(3);
  @$pb.TagNumber(4)
  set likePoints($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLikePoints() => $_has(3);
  @$pb.TagNumber(4)
  void clearLikePoints() => clearField(4);

  /// マッチングポイント（MP）：有償分
  @$pb.TagNumber(5)
  $core.int get matchingPoints => $_getIZ(4);
  @$pb.TagNumber(5)
  set matchingPoints($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMatchingPoints() => $_has(4);
  @$pb.TagNumber(5)
  void clearMatchingPoints() => clearField(5);

  /// ラヴィゲーションポイント（LP）：有償分
  @$pb.TagNumber(6)
  $core.int get lavigationPoints => $_getIZ(5);
  @$pb.TagNumber(6)
  set lavigationPoints($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLavigationPoints() => $_has(5);
  @$pb.TagNumber(6)
  void clearLavigationPoints() => clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
