//
//  Generated code. Do not modify.
//  source: econa/shared/ideal_advise.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../enums/body_type_code.pbenum.dart' as $111;
import '../enums/house_work_code.pbenum.dart' as $132;
import '../enums/salary_range_code.pbenum.dart' as $112;

/// 恋愛アドバイス「理想について」
class IdealAdvise extends $pb.GeneratedMessage {
  factory IdealAdvise({
    $core.String? advise,
    UserFeature? interestedInPartnerUserFeature,
    UserFeature? interestedInYouUserFeature,
    UserFeature? sameGenerationUserFeature,
  }) {
    final $result = create();
    if (advise != null) {
      $result.advise = advise;
    }
    if (interestedInPartnerUserFeature != null) {
      $result.interestedInPartnerUserFeature = interestedInPartnerUserFeature;
    }
    if (interestedInYouUserFeature != null) {
      $result.interestedInYouUserFeature = interestedInYouUserFeature;
    }
    if (sameGenerationUserFeature != null) {
      $result.sameGenerationUserFeature = sameGenerationUserFeature;
    }
    return $result;
  }
  IdealAdvise._() : super();
  factory IdealAdvise.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IdealAdvise.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IdealAdvise', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'advise')
    ..aOM<UserFeature>(2, _omitFieldNames ? '' : 'interestedInPartnerUserFeature', subBuilder: UserFeature.create)
    ..aOM<UserFeature>(3, _omitFieldNames ? '' : 'interestedInYouUserFeature', subBuilder: UserFeature.create)
    ..aOM<UserFeature>(4, _omitFieldNames ? '' : 'sameGenerationUserFeature', subBuilder: UserFeature.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IdealAdvise clone() => IdealAdvise()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IdealAdvise copyWith(void Function(IdealAdvise) updates) => super.copyWith((message) => updates(message as IdealAdvise)) as IdealAdvise;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IdealAdvise create() => IdealAdvise._();
  IdealAdvise createEmptyInstance() => create();
  static $pb.PbList<IdealAdvise> createRepeated() => $pb.PbList<IdealAdvise>();
  @$core.pragma('dart2js:noInline')
  static IdealAdvise getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IdealAdvise>(create);
  static IdealAdvise? _defaultInstance;

  /// アドバイス
  @$pb.TagNumber(1)
  $core.String get advise => $_getSZ(0);
  @$pb.TagNumber(1)
  set advise($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdvise() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdvise() => clearField(1);

  /// あなたが興味を持ったお相手の特徴
  @$pb.TagNumber(2)
  UserFeature get interestedInPartnerUserFeature => $_getN(1);
  @$pb.TagNumber(2)
  set interestedInPartnerUserFeature(UserFeature v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasInterestedInPartnerUserFeature() => $_has(1);
  @$pb.TagNumber(2)
  void clearInterestedInPartnerUserFeature() => clearField(2);
  @$pb.TagNumber(2)
  UserFeature ensureInterestedInPartnerUserFeature() => $_ensure(1);

  /// あなたに興味を持ったお相手の特徴
  @$pb.TagNumber(3)
  UserFeature get interestedInYouUserFeature => $_getN(2);
  @$pb.TagNumber(3)
  set interestedInYouUserFeature(UserFeature v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasInterestedInYouUserFeature() => $_has(2);
  @$pb.TagNumber(3)
  void clearInterestedInYouUserFeature() => clearField(3);
  @$pb.TagNumber(3)
  UserFeature ensureInterestedInYouUserFeature() => $_ensure(2);

  /// あなたと同世代の理想のタイプ
  @$pb.TagNumber(4)
  UserFeature get sameGenerationUserFeature => $_getN(3);
  @$pb.TagNumber(4)
  set sameGenerationUserFeature(UserFeature v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSameGenerationUserFeature() => $_has(3);
  @$pb.TagNumber(4)
  void clearSameGenerationUserFeature() => clearField(4);
  @$pb.TagNumber(4)
  UserFeature ensureSameGenerationUserFeature() => $_ensure(3);
}

/// ユーザー特徴
class UserFeature extends $pb.GeneratedMessage {
  factory UserFeature({
    $core.int? minAge,
    $core.int? maxAge,
    $112.SalaryRangeCode? salaryRange,
    $core.int? minHeight,
    $core.int? maxHeight,
    $111.BodyTypeCode? bodyType,
    $132.HouseWorkCode? houseWork,
  }) {
    final $result = create();
    if (minAge != null) {
      $result.minAge = minAge;
    }
    if (maxAge != null) {
      $result.maxAge = maxAge;
    }
    if (salaryRange != null) {
      $result.salaryRange = salaryRange;
    }
    if (minHeight != null) {
      $result.minHeight = minHeight;
    }
    if (maxHeight != null) {
      $result.maxHeight = maxHeight;
    }
    if (bodyType != null) {
      $result.bodyType = bodyType;
    }
    if (houseWork != null) {
      $result.houseWork = houseWork;
    }
    return $result;
  }
  UserFeature._() : super();
  factory UserFeature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserFeature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserFeature', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'minAge', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'maxAge', $pb.PbFieldType.O3)
    ..e<$112.SalaryRangeCode>(3, _omitFieldNames ? '' : 'salaryRange', $pb.PbFieldType.OE, defaultOrMaker: $112.SalaryRangeCode.SALARY_RANGE_CODE_UNSPECIFIED, valueOf: $112.SalaryRangeCode.valueOf, enumValues: $112.SalaryRangeCode.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'minHeight', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxHeight', $pb.PbFieldType.O3)
    ..e<$111.BodyTypeCode>(6, _omitFieldNames ? '' : 'bodyType', $pb.PbFieldType.OE, defaultOrMaker: $111.BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED, valueOf: $111.BodyTypeCode.valueOf, enumValues: $111.BodyTypeCode.values)
    ..e<$132.HouseWorkCode>(7, _omitFieldNames ? '' : 'houseWork', $pb.PbFieldType.OE, defaultOrMaker: $132.HouseWorkCode.HOUSE_WORK_CODE_UNSPECIFIED, valueOf: $132.HouseWorkCode.valueOf, enumValues: $132.HouseWorkCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserFeature clone() => UserFeature()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserFeature copyWith(void Function(UserFeature) updates) => super.copyWith((message) => updates(message as UserFeature)) as UserFeature;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserFeature create() => UserFeature._();
  UserFeature createEmptyInstance() => create();
  static $pb.PbList<UserFeature> createRepeated() => $pb.PbList<UserFeature>();
  @$core.pragma('dart2js:noInline')
  static UserFeature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserFeature>(create);
  static UserFeature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get minAge => $_getIZ(0);
  @$pb.TagNumber(1)
  set minAge($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinAge() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinAge() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get maxAge => $_getIZ(1);
  @$pb.TagNumber(2)
  set maxAge($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMaxAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxAge() => clearField(2);

  @$pb.TagNumber(3)
  $112.SalaryRangeCode get salaryRange => $_getN(2);
  @$pb.TagNumber(3)
  set salaryRange($112.SalaryRangeCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSalaryRange() => $_has(2);
  @$pb.TagNumber(3)
  void clearSalaryRange() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get minHeight => $_getIZ(3);
  @$pb.TagNumber(4)
  set minHeight($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinHeight() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxHeight => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxHeight($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMaxHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxHeight() => clearField(5);

  @$pb.TagNumber(6)
  $111.BodyTypeCode get bodyType => $_getN(5);
  @$pb.TagNumber(6)
  set bodyType($111.BodyTypeCode v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBodyType() => $_has(5);
  @$pb.TagNumber(6)
  void clearBodyType() => clearField(6);

  @$pb.TagNumber(7)
  $132.HouseWorkCode get houseWork => $_getN(6);
  @$pb.TagNumber(7)
  set houseWork($132.HouseWorkCode v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasHouseWork() => $_has(6);
  @$pb.TagNumber(7)
  void clearHouseWork() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
