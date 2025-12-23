//
//  Generated code. Do not modify.
//  source: econa/shared/user_photo_skip_statistics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// UserPhotoSkipStatistics - ユーザー写真スキップ統計
class UserPhotoSkipStatistics extends $pb.GeneratedMessage {
  factory UserPhotoSkipStatistics({
    $core.String? userId,
    $core.int? totalPhotos,
    $core.int? totalSkips,
    $core.int? uniqueSkippers,
    $core.double? averageSkipsPerPhoto,
    $core.double? skipRatePercentage,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (totalPhotos != null) {
      $result.totalPhotos = totalPhotos;
    }
    if (totalSkips != null) {
      $result.totalSkips = totalSkips;
    }
    if (uniqueSkippers != null) {
      $result.uniqueSkippers = uniqueSkippers;
    }
    if (averageSkipsPerPhoto != null) {
      $result.averageSkipsPerPhoto = averageSkipsPerPhoto;
    }
    if (skipRatePercentage != null) {
      $result.skipRatePercentage = skipRatePercentage;
    }
    return $result;
  }
  UserPhotoSkipStatistics._() : super();
  factory UserPhotoSkipStatistics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPhotoSkipStatistics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPhotoSkipStatistics', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalPhotos', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'totalSkips', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'uniqueSkippers', $pb.PbFieldType.O3)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'averageSkipsPerPhoto', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'skipRatePercentage', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPhotoSkipStatistics clone() => UserPhotoSkipStatistics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPhotoSkipStatistics copyWith(void Function(UserPhotoSkipStatistics) updates) => super.copyWith((message) => updates(message as UserPhotoSkipStatistics)) as UserPhotoSkipStatistics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPhotoSkipStatistics create() => UserPhotoSkipStatistics._();
  UserPhotoSkipStatistics createEmptyInstance() => create();
  static $pb.PbList<UserPhotoSkipStatistics> createRepeated() => $pb.PbList<UserPhotoSkipStatistics>();
  @$core.pragma('dart2js:noInline')
  static UserPhotoSkipStatistics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPhotoSkipStatistics>(create);
  static UserPhotoSkipStatistics? _defaultInstance;

  /// user_id - 統計対象ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// total_photos - 総写真数
  @$pb.TagNumber(2)
  $core.int get totalPhotos => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalPhotos($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalPhotos() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalPhotos() => clearField(2);

  /// total_skips - 総スキップ数
  @$pb.TagNumber(3)
  $core.int get totalSkips => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalSkips($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalSkips() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalSkips() => clearField(3);

  /// unique_skippers - ユニークスキップユーザー数
  @$pb.TagNumber(4)
  $core.int get uniqueSkippers => $_getIZ(3);
  @$pb.TagNumber(4)
  set uniqueSkippers($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUniqueSkippers() => $_has(3);
  @$pb.TagNumber(4)
  void clearUniqueSkippers() => clearField(4);

  /// average_skips_per_photo - 写真あたり平均スキップ数
  @$pb.TagNumber(5)
  $core.double get averageSkipsPerPhoto => $_getN(4);
  @$pb.TagNumber(5)
  set averageSkipsPerPhoto($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAverageSkipsPerPhoto() => $_has(4);
  @$pb.TagNumber(5)
  void clearAverageSkipsPerPhoto() => clearField(5);

  /// skip_rate_percentage - スキップ率パーセンテージ
  @$pb.TagNumber(6)
  $core.double get skipRatePercentage => $_getN(5);
  @$pb.TagNumber(6)
  set skipRatePercentage($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSkipRatePercentage() => $_has(5);
  @$pb.TagNumber(6)
  void clearSkipRatePercentage() => clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
