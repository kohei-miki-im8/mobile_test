//
//  Generated code. Do not modify.
//  source: econa/shared/user_search_conditions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../enums/area_search_type.pbenum.dart' as $175;
import '../enums/body_type_code.pbenum.dart' as $111;
import '../enums/child_situation_code.pbenum.dart' as $125;
import '../enums/distance_location_code.pbenum.dart' as $176;
import '../enums/smoking_code.pbenum.dart' as $129;
import '../master/regions.pb.dart' as $113;

/// リージョン(都道府県)群
class UserSearchConditionsResidenceRegions extends $pb.GeneratedMessage {
  factory UserSearchConditionsResidenceRegions({
    $core.Iterable<$113.Region>? regions,
  }) {
    final $result = create();
    if (regions != null) {
      $result.regions.addAll(regions);
    }
    return $result;
  }
  UserSearchConditionsResidenceRegions._() : super();
  factory UserSearchConditionsResidenceRegions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSearchConditionsResidenceRegions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserSearchConditionsResidenceRegions', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..pc<$113.Region>(1, _omitFieldNames ? '' : 'regions', $pb.PbFieldType.PM, subBuilder: $113.Region.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserSearchConditionsResidenceRegions clone() => UserSearchConditionsResidenceRegions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserSearchConditionsResidenceRegions copyWith(void Function(UserSearchConditionsResidenceRegions) updates) => super.copyWith((message) => updates(message as UserSearchConditionsResidenceRegions)) as UserSearchConditionsResidenceRegions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSearchConditionsResidenceRegions create() => UserSearchConditionsResidenceRegions._();
  UserSearchConditionsResidenceRegions createEmptyInstance() => create();
  static $pb.PbList<UserSearchConditionsResidenceRegions> createRepeated() => $pb.PbList<UserSearchConditionsResidenceRegions>();
  @$core.pragma('dart2js:noInline')
  static UserSearchConditionsResidenceRegions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserSearchConditionsResidenceRegions>(create);
  static UserSearchConditionsResidenceRegions? _defaultInstance;

  /// リージョン(都道府県)群
  @$pb.TagNumber(1)
  $core.List<$113.Region> get regions => $_getList(0);
}

enum UserSearchConditions_Area {
  residenceRegions, 
  distanceLocationCode, 
  notSet
}

/// ユーザー検索設定
class UserSearchConditions extends $pb.GeneratedMessage {
  factory UserSearchConditions({
    $175.AreaSearchType? areaSearchType,
    UserSearchConditionsResidenceRegions? residenceRegions,
    $176.DistanceLocationCode? distanceLocationCode,
    $core.int? minAge,
    $core.int? maxAge,
    $core.int? minHeight,
    $core.int? maxHeight,
    $core.Iterable<$111.BodyTypeCode>? bodyTypeCodes,
    $core.Iterable<$129.SmokingCode>? smokingCodes,
    $core.Iterable<$125.ChildSituationCode>? childSituationCodes,
  }) {
    final $result = create();
    if (areaSearchType != null) {
      $result.areaSearchType = areaSearchType;
    }
    if (residenceRegions != null) {
      $result.residenceRegions = residenceRegions;
    }
    if (distanceLocationCode != null) {
      $result.distanceLocationCode = distanceLocationCode;
    }
    if (minAge != null) {
      $result.minAge = minAge;
    }
    if (maxAge != null) {
      $result.maxAge = maxAge;
    }
    if (minHeight != null) {
      $result.minHeight = minHeight;
    }
    if (maxHeight != null) {
      $result.maxHeight = maxHeight;
    }
    if (bodyTypeCodes != null) {
      $result.bodyTypeCodes.addAll(bodyTypeCodes);
    }
    if (smokingCodes != null) {
      $result.smokingCodes.addAll(smokingCodes);
    }
    if (childSituationCodes != null) {
      $result.childSituationCodes.addAll(childSituationCodes);
    }
    return $result;
  }
  UserSearchConditions._() : super();
  factory UserSearchConditions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSearchConditions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UserSearchConditions_Area> _UserSearchConditions_AreaByTag = {
    2 : UserSearchConditions_Area.residenceRegions,
    3 : UserSearchConditions_Area.distanceLocationCode,
    0 : UserSearchConditions_Area.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserSearchConditions', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<$175.AreaSearchType>(1, _omitFieldNames ? '' : 'areaSearchType', $pb.PbFieldType.OE, defaultOrMaker: $175.AreaSearchType.AREA_SEARCH_TYPE_UNSPECIFIED, valueOf: $175.AreaSearchType.valueOf, enumValues: $175.AreaSearchType.values)
    ..aOM<UserSearchConditionsResidenceRegions>(2, _omitFieldNames ? '' : 'residenceRegions', subBuilder: UserSearchConditionsResidenceRegions.create)
    ..e<$176.DistanceLocationCode>(3, _omitFieldNames ? '' : 'distanceLocationCode', $pb.PbFieldType.OE, defaultOrMaker: $176.DistanceLocationCode.DISTANCE_LOCATION_CODE_UNSPECIFIED, valueOf: $176.DistanceLocationCode.valueOf, enumValues: $176.DistanceLocationCode.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'minAge', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxAge', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'minHeight', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'maxHeight', $pb.PbFieldType.O3)
    ..pc<$111.BodyTypeCode>(8, _omitFieldNames ? '' : 'bodyTypeCodes', $pb.PbFieldType.KE, valueOf: $111.BodyTypeCode.valueOf, enumValues: $111.BodyTypeCode.values, defaultEnumValue: $111.BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED)
    ..pc<$129.SmokingCode>(9, _omitFieldNames ? '' : 'smokingCodes', $pb.PbFieldType.KE, valueOf: $129.SmokingCode.valueOf, enumValues: $129.SmokingCode.values, defaultEnumValue: $129.SmokingCode.SMOKING_CODE_UNSPECIFIED)
    ..pc<$125.ChildSituationCode>(10, _omitFieldNames ? '' : 'childSituationCodes', $pb.PbFieldType.KE, valueOf: $125.ChildSituationCode.valueOf, enumValues: $125.ChildSituationCode.values, defaultEnumValue: $125.ChildSituationCode.CHILD_SITUATION_CODE_UNSPECIFIED)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserSearchConditions clone() => UserSearchConditions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserSearchConditions copyWith(void Function(UserSearchConditions) updates) => super.copyWith((message) => updates(message as UserSearchConditions)) as UserSearchConditions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserSearchConditions create() => UserSearchConditions._();
  UserSearchConditions createEmptyInstance() => create();
  static $pb.PbList<UserSearchConditions> createRepeated() => $pb.PbList<UserSearchConditions>();
  @$core.pragma('dart2js:noInline')
  static UserSearchConditions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserSearchConditions>(create);
  static UserSearchConditions? _defaultInstance;

  UserSearchConditions_Area whichArea() => _UserSearchConditions_AreaByTag[$_whichOneof(0)]!;
  void clearArea() => clearField($_whichOneof(0));

  /// エリア検索タイプ
  @$pb.TagNumber(1)
  $175.AreaSearchType get areaSearchType => $_getN(0);
  @$pb.TagNumber(1)
  set areaSearchType($175.AreaSearchType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAreaSearchType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAreaSearchType() => clearField(1);

  /// 居住地
  @$pb.TagNumber(2)
  UserSearchConditionsResidenceRegions get residenceRegions => $_getN(1);
  @$pb.TagNumber(2)
  set residenceRegions(UserSearchConditionsResidenceRegions v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResidenceRegions() => $_has(1);
  @$pb.TagNumber(2)
  void clearResidenceRegions() => clearField(2);
  @$pb.TagNumber(2)
  UserSearchConditionsResidenceRegions ensureResidenceRegions() => $_ensure(1);

  /// 現在地からの距離
  @$pb.TagNumber(3)
  $176.DistanceLocationCode get distanceLocationCode => $_getN(2);
  @$pb.TagNumber(3)
  set distanceLocationCode($176.DistanceLocationCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDistanceLocationCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearDistanceLocationCode() => clearField(3);

  /// 年齢最小値
  @$pb.TagNumber(4)
  $core.int get minAge => $_getIZ(3);
  @$pb.TagNumber(4)
  set minAge($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinAge() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinAge() => clearField(4);

  /// 年齢最大値
  @$pb.TagNumber(5)
  $core.int get maxAge => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxAge($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxAge() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxAge() => clearField(5);

  /// 身長最小値
  @$pb.TagNumber(6)
  $core.int get minHeight => $_getIZ(5);
  @$pb.TagNumber(6)
  set minHeight($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinHeight() => clearField(6);

  /// 身長最大値
  @$pb.TagNumber(7)
  $core.int get maxHeight => $_getIZ(6);
  @$pb.TagNumber(7)
  set maxHeight($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMaxHeight() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxHeight() => clearField(7);

  /// 体型（複数選択可）
  @$pb.TagNumber(8)
  $core.List<$111.BodyTypeCode> get bodyTypeCodes => $_getList(7);

  /// 喫煙条件（複数選択可）
  @$pb.TagNumber(9)
  $core.List<$129.SmokingCode> get smokingCodes => $_getList(8);

  /// 子供の有無条件（複数選択可）
  @$pb.TagNumber(10)
  $core.List<$125.ChildSituationCode> get childSituationCodes => $_getList(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
