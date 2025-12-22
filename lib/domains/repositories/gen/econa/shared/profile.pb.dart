//
//  Generated code. Do not modify.
//  source: econa/shared/profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/blood_type_code.pbenum.dart' as $116;
import '../enums/body_type_code.pbenum.dart' as $111;
import '../enums/child_desire_code.pbenum.dart' as $131;
import '../enums/child_situation_code.pbenum.dart' as $125;
import '../enums/dating_preference_code.pbenum.dart' as $133;
import '../enums/drinking_alcohol_code.pbenum.dart' as $128;
import '../enums/educational_background_code.pbenum.dart' as $121;
import '../enums/first_date_cost_preference_code.pbenum.dart' as $134;
import '../enums/first_date_location_preference_code.pbenum.dart' as $135;
import '../enums/gender_code.pbenum.dart' as $115;
import '../enums/holiday_type_code.pbenum.dart' as $126;
import '../enums/house_work_code.pbenum.dart' as $132;
import '../enums/language_code.pbenum.dart' as $127;
import '../enums/marital_history_code.pbenum.dart' as $124;
import '../enums/marriage_aspiration_code.pbenum.dart' as $130;
import '../enums/occupation_code.pbenum.dart' as $120;
import '../enums/personality_trait_code.pbenum.dart' as $118;
import '../enums/roommate_code.pbenum.dart' as $123;
import '../enums/salary_range_code.pbenum.dart' as $112;
import '../enums/sibling_code.pbenum.dart' as $122;
import '../enums/sixteen_personality_code.pbenum.dart' as $119;
import '../enums/smoking_code.pbenum.dart' as $129;
import '../enums/sociability_code.pbenum.dart' as $117;
import '../master/regions.pb.dart' as $113;
import 'signed_url.pb.dart' as $114;

class Profile extends $pb.GeneratedMessage {
  factory Profile({
    $115.GenderCode? genderCode,
    UpdatableProfile? updatableProfile,
    OptionalProfile? optionalProfile,
    $core.Iterable<RequiringReviewProfilePhoto>? requiringReviewProfilePhotos,
    $core.int? profileInputRate,
  }) {
    final $result = create();
    if (genderCode != null) {
      $result.genderCode = genderCode;
    }
    if (updatableProfile != null) {
      $result.updatableProfile = updatableProfile;
    }
    if (optionalProfile != null) {
      $result.optionalProfile = optionalProfile;
    }
    if (requiringReviewProfilePhotos != null) {
      $result.requiringReviewProfilePhotos.addAll(requiringReviewProfilePhotos);
    }
    if (profileInputRate != null) {
      $result.profileInputRate = profileInputRate;
    }
    return $result;
  }
  Profile._() : super();
  factory Profile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Profile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Profile', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..e<$115.GenderCode>(1, _omitFieldNames ? '' : 'genderCode', $pb.PbFieldType.OE, defaultOrMaker: $115.GenderCode.GENDER_CODE_UNSPECIFIED, valueOf: $115.GenderCode.valueOf, enumValues: $115.GenderCode.values)
    ..aOM<UpdatableProfile>(2, _omitFieldNames ? '' : 'updatableProfile', subBuilder: UpdatableProfile.create)
    ..aOM<OptionalProfile>(3, _omitFieldNames ? '' : 'optionalProfile', subBuilder: OptionalProfile.create)
    ..pc<RequiringReviewProfilePhoto>(4, _omitFieldNames ? '' : 'requiringReviewProfilePhotos', $pb.PbFieldType.PM, subBuilder: RequiringReviewProfilePhoto.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'profileInputRate', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Profile clone() => Profile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Profile copyWith(void Function(Profile) updates) => super.copyWith((message) => updates(message as Profile)) as Profile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Profile create() => Profile._();
  Profile createEmptyInstance() => create();
  static $pb.PbList<Profile> createRepeated() => $pb.PbList<Profile>();
  @$core.pragma('dart2js:noInline')
  static Profile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Profile>(create);
  static Profile? _defaultInstance;

  /// 性別
  @$pb.TagNumber(1)
  $115.GenderCode get genderCode => $_getN(0);
  @$pb.TagNumber(1)
  set genderCode($115.GenderCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGenderCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGenderCode() => clearField(1);

  /// 更新可能なプロフィール
  @$pb.TagNumber(2)
  UpdatableProfile get updatableProfile => $_getN(1);
  @$pb.TagNumber(2)
  set updatableProfile(UpdatableProfile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatableProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatableProfile() => clearField(2);
  @$pb.TagNumber(2)
  UpdatableProfile ensureUpdatableProfile() => $_ensure(1);

  /// 任意のプロフィール
  @$pb.TagNumber(3)
  OptionalProfile get optionalProfile => $_getN(2);
  @$pb.TagNumber(3)
  set optionalProfile(OptionalProfile v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOptionalProfile() => $_has(2);
  @$pb.TagNumber(3)
  void clearOptionalProfile() => clearField(3);
  @$pb.TagNumber(3)
  OptionalProfile ensureOptionalProfile() => $_ensure(2);

  /// プロフィール写真（承認制）
  @$pb.TagNumber(4)
  $core.List<RequiringReviewProfilePhoto> get requiringReviewProfilePhotos => $_getList(3);

  /// プロフィール入力率（整数：四捨五入）
  @$pb.TagNumber(5)
  $core.int get profileInputRate => $_getIZ(4);
  @$pb.TagNumber(5)
  set profileInputRate($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProfileInputRate() => $_has(4);
  @$pb.TagNumber(5)
  void clearProfileInputRate() => clearField(5);
}

class UpdatableProfile extends $pb.GeneratedMessage {
  factory UpdatableProfile({
    RequiringReviewNickname? requiringReviewNickname,
    $109.Timestamp? birthday,
    $113.Region? residenceRegion,
  }) {
    final $result = create();
    if (requiringReviewNickname != null) {
      $result.requiringReviewNickname = requiringReviewNickname;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    if (residenceRegion != null) {
      $result.residenceRegion = residenceRegion;
    }
    return $result;
  }
  UpdatableProfile._() : super();
  factory UpdatableProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatableProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatableProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOM<RequiringReviewNickname>(1, _omitFieldNames ? '' : 'requiringReviewNickname', subBuilder: RequiringReviewNickname.create)
    ..aOM<$109.Timestamp>(2, _omitFieldNames ? '' : 'birthday', subBuilder: $109.Timestamp.create)
    ..aOM<$113.Region>(3, _omitFieldNames ? '' : 'residenceRegion', subBuilder: $113.Region.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatableProfile clone() => UpdatableProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatableProfile copyWith(void Function(UpdatableProfile) updates) => super.copyWith((message) => updates(message as UpdatableProfile)) as UpdatableProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatableProfile create() => UpdatableProfile._();
  UpdatableProfile createEmptyInstance() => create();
  static $pb.PbList<UpdatableProfile> createRepeated() => $pb.PbList<UpdatableProfile>();
  @$core.pragma('dart2js:noInline')
  static UpdatableProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatableProfile>(create);
  static UpdatableProfile? _defaultInstance;

  /// ニックネーム（承認制）
  @$pb.TagNumber(1)
  RequiringReviewNickname get requiringReviewNickname => $_getN(0);
  @$pb.TagNumber(1)
  set requiringReviewNickname(RequiringReviewNickname v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequiringReviewNickname() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequiringReviewNickname() => clearField(1);
  @$pb.TagNumber(1)
  RequiringReviewNickname ensureRequiringReviewNickname() => $_ensure(0);

  /// 生年月日
  @$pb.TagNumber(2)
  $109.Timestamp get birthday => $_getN(1);
  @$pb.TagNumber(2)
  set birthday($109.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBirthday() => $_has(1);
  @$pb.TagNumber(2)
  void clearBirthday() => clearField(2);
  @$pb.TagNumber(2)
  $109.Timestamp ensureBirthday() => $_ensure(1);

  /// 居住地(都道府県)
  @$pb.TagNumber(3)
  $113.Region get residenceRegion => $_getN(2);
  @$pb.TagNumber(3)
  set residenceRegion($113.Region v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResidenceRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearResidenceRegion() => clearField(3);
  @$pb.TagNumber(3)
  $113.Region ensureResidenceRegion() => $_ensure(2);
}

class OptionalProfile extends $pb.GeneratedMessage {
  factory OptionalProfile({
    RequiringReviewIntroductory? requiringReviewIntroductory,
    $116.BloodTypeCode? bloodTypeCode,
    $113.Region? birthplaceRegion,
    $core.int? height,
    $111.BodyTypeCode? bodyTypeCode,
    $117.SociabilityCode? sociabilityCode,
    $118.PersonalityTraitCode? personalityTraitCode,
    $119.SixteenPersonalityCode? sixteenPersonalityCode,
    $120.OccupationCode? occupationCode,
    $113.Region? workplaceRegion,
    $112.SalaryRangeCode? salaryRangeCode,
    $121.EducationalBackgroundCode? educationalBackgroundCode,
    $122.SiblingCode? siblingCode,
    $123.RoommateCode? roommateCode,
    $124.MaritalHistoryCode? maritalHistoryCode,
    $125.ChildSituationCode? childSituationCode,
    $126.HolidayTypeCode? holidayTypeCode,
    $core.Iterable<$127.LanguageCode>? userLanguageCodes,
    $128.DrinkingAlcoholCode? drinkingAlcoholCode,
    $129.SmokingCode? smokingCode,
    $130.MarriageAspirationCode? marriageAspirationCode,
    $131.ChildDesireCode? childDesireCode,
    $132.HouseWorkCode? houseWorkCode,
    $133.DatingPreferenceCode? datingPreferenceCode,
    $134.FirstDateCostPreferenceCode? firstDateCostPreferenceCode,
    $135.FirstDateLocationPreferenceCode? firstDateLocationPreferenceCode,
    $core.bool? photoBonusGranted,
    $core.bool? introBonusGranted,
    $core.String? bloodTypeLabel,
    $core.String? bodyTypeLabel,
    $core.String? sociabilityLabel,
    $core.String? groupBehaviorLabel,
    $core.String? personalityTraitLabel,
    $core.String? sixteenPersonalityLabel,
    $core.String? occupationLabel,
    $core.String? salaryRangeLabel,
    $core.String? educationalBackgroundLabel,
    $core.String? siblingLabel,
    $core.String? roommateLabel,
    $core.String? maritalHistoryLabel,
    $core.String? childSituationLabel,
    $core.String? holidayTypeLabel,
    $core.String? drinkingAlcoholLabel,
    $core.String? smokingLabel,
    $core.String? marriageAspirationLabel,
    $core.String? childDesireLabel,
    $core.String? houseWorkLabel,
    $core.String? datingPreferenceLabel,
    $core.String? firstDateCostPreferenceLabel,
    $core.String? firstDateLocationPreferenceLabel,
  }) {
    final $result = create();
    if (requiringReviewIntroductory != null) {
      $result.requiringReviewIntroductory = requiringReviewIntroductory;
    }
    if (bloodTypeCode != null) {
      $result.bloodTypeCode = bloodTypeCode;
    }
    if (birthplaceRegion != null) {
      $result.birthplaceRegion = birthplaceRegion;
    }
    if (height != null) {
      $result.height = height;
    }
    if (bodyTypeCode != null) {
      $result.bodyTypeCode = bodyTypeCode;
    }
    if (sociabilityCode != null) {
      $result.sociabilityCode = sociabilityCode;
    }
    if (personalityTraitCode != null) {
      $result.personalityTraitCode = personalityTraitCode;
    }
    if (sixteenPersonalityCode != null) {
      $result.sixteenPersonalityCode = sixteenPersonalityCode;
    }
    if (occupationCode != null) {
      $result.occupationCode = occupationCode;
    }
    if (workplaceRegion != null) {
      $result.workplaceRegion = workplaceRegion;
    }
    if (salaryRangeCode != null) {
      $result.salaryRangeCode = salaryRangeCode;
    }
    if (educationalBackgroundCode != null) {
      $result.educationalBackgroundCode = educationalBackgroundCode;
    }
    if (siblingCode != null) {
      $result.siblingCode = siblingCode;
    }
    if (roommateCode != null) {
      $result.roommateCode = roommateCode;
    }
    if (maritalHistoryCode != null) {
      $result.maritalHistoryCode = maritalHistoryCode;
    }
    if (childSituationCode != null) {
      $result.childSituationCode = childSituationCode;
    }
    if (holidayTypeCode != null) {
      $result.holidayTypeCode = holidayTypeCode;
    }
    if (userLanguageCodes != null) {
      $result.userLanguageCodes.addAll(userLanguageCodes);
    }
    if (drinkingAlcoholCode != null) {
      $result.drinkingAlcoholCode = drinkingAlcoholCode;
    }
    if (smokingCode != null) {
      $result.smokingCode = smokingCode;
    }
    if (marriageAspirationCode != null) {
      $result.marriageAspirationCode = marriageAspirationCode;
    }
    if (childDesireCode != null) {
      $result.childDesireCode = childDesireCode;
    }
    if (houseWorkCode != null) {
      $result.houseWorkCode = houseWorkCode;
    }
    if (datingPreferenceCode != null) {
      $result.datingPreferenceCode = datingPreferenceCode;
    }
    if (firstDateCostPreferenceCode != null) {
      $result.firstDateCostPreferenceCode = firstDateCostPreferenceCode;
    }
    if (firstDateLocationPreferenceCode != null) {
      $result.firstDateLocationPreferenceCode = firstDateLocationPreferenceCode;
    }
    if (photoBonusGranted != null) {
      $result.photoBonusGranted = photoBonusGranted;
    }
    if (introBonusGranted != null) {
      $result.introBonusGranted = introBonusGranted;
    }
    if (bloodTypeLabel != null) {
      $result.bloodTypeLabel = bloodTypeLabel;
    }
    if (bodyTypeLabel != null) {
      $result.bodyTypeLabel = bodyTypeLabel;
    }
    if (sociabilityLabel != null) {
      $result.sociabilityLabel = sociabilityLabel;
    }
    if (groupBehaviorLabel != null) {
      $result.groupBehaviorLabel = groupBehaviorLabel;
    }
    if (personalityTraitLabel != null) {
      $result.personalityTraitLabel = personalityTraitLabel;
    }
    if (sixteenPersonalityLabel != null) {
      $result.sixteenPersonalityLabel = sixteenPersonalityLabel;
    }
    if (occupationLabel != null) {
      $result.occupationLabel = occupationLabel;
    }
    if (salaryRangeLabel != null) {
      $result.salaryRangeLabel = salaryRangeLabel;
    }
    if (educationalBackgroundLabel != null) {
      $result.educationalBackgroundLabel = educationalBackgroundLabel;
    }
    if (siblingLabel != null) {
      $result.siblingLabel = siblingLabel;
    }
    if (roommateLabel != null) {
      $result.roommateLabel = roommateLabel;
    }
    if (maritalHistoryLabel != null) {
      $result.maritalHistoryLabel = maritalHistoryLabel;
    }
    if (childSituationLabel != null) {
      $result.childSituationLabel = childSituationLabel;
    }
    if (holidayTypeLabel != null) {
      $result.holidayTypeLabel = holidayTypeLabel;
    }
    if (drinkingAlcoholLabel != null) {
      $result.drinkingAlcoholLabel = drinkingAlcoholLabel;
    }
    if (smokingLabel != null) {
      $result.smokingLabel = smokingLabel;
    }
    if (marriageAspirationLabel != null) {
      $result.marriageAspirationLabel = marriageAspirationLabel;
    }
    if (childDesireLabel != null) {
      $result.childDesireLabel = childDesireLabel;
    }
    if (houseWorkLabel != null) {
      $result.houseWorkLabel = houseWorkLabel;
    }
    if (datingPreferenceLabel != null) {
      $result.datingPreferenceLabel = datingPreferenceLabel;
    }
    if (firstDateCostPreferenceLabel != null) {
      $result.firstDateCostPreferenceLabel = firstDateCostPreferenceLabel;
    }
    if (firstDateLocationPreferenceLabel != null) {
      $result.firstDateLocationPreferenceLabel = firstDateLocationPreferenceLabel;
    }
    return $result;
  }
  OptionalProfile._() : super();
  factory OptionalProfile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OptionalProfile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OptionalProfile', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOM<RequiringReviewIntroductory>(1, _omitFieldNames ? '' : 'requiringReviewIntroductory', subBuilder: RequiringReviewIntroductory.create)
    ..e<$116.BloodTypeCode>(2, _omitFieldNames ? '' : 'bloodTypeCode', $pb.PbFieldType.OE, defaultOrMaker: $116.BloodTypeCode.BLOOD_TYPE_CODE_UNSPECIFIED, valueOf: $116.BloodTypeCode.valueOf, enumValues: $116.BloodTypeCode.values)
    ..aOM<$113.Region>(3, _omitFieldNames ? '' : 'birthplaceRegion', subBuilder: $113.Region.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..e<$111.BodyTypeCode>(5, _omitFieldNames ? '' : 'bodyTypeCode', $pb.PbFieldType.OE, defaultOrMaker: $111.BodyTypeCode.BODY_TYPE_CODE_UNSPECIFIED, valueOf: $111.BodyTypeCode.valueOf, enumValues: $111.BodyTypeCode.values)
    ..e<$117.SociabilityCode>(6, _omitFieldNames ? '' : 'sociabilityCode', $pb.PbFieldType.OE, defaultOrMaker: $117.SociabilityCode.SOCIABILITY_CODE_UNSPECIFIED, valueOf: $117.SociabilityCode.valueOf, enumValues: $117.SociabilityCode.values)
    ..e<$118.PersonalityTraitCode>(8, _omitFieldNames ? '' : 'personalityTraitCode', $pb.PbFieldType.OE, defaultOrMaker: $118.PersonalityTraitCode.PERSONALITY_TRAIT_CODE_UNSPECIFIED, valueOf: $118.PersonalityTraitCode.valueOf, enumValues: $118.PersonalityTraitCode.values)
    ..e<$119.SixteenPersonalityCode>(9, _omitFieldNames ? '' : 'sixteenPersonalityCode', $pb.PbFieldType.OE, defaultOrMaker: $119.SixteenPersonalityCode.SIXTEEN_PERSONALITY_CODE_UNSPECIFIED, valueOf: $119.SixteenPersonalityCode.valueOf, enumValues: $119.SixteenPersonalityCode.values)
    ..e<$120.OccupationCode>(10, _omitFieldNames ? '' : 'occupationCode', $pb.PbFieldType.OE, defaultOrMaker: $120.OccupationCode.OCCUPATION_CODE_UNSPECIFIED, valueOf: $120.OccupationCode.valueOf, enumValues: $120.OccupationCode.values)
    ..aOM<$113.Region>(11, _omitFieldNames ? '' : 'workplaceRegion', subBuilder: $113.Region.create)
    ..e<$112.SalaryRangeCode>(12, _omitFieldNames ? '' : 'salaryRangeCode', $pb.PbFieldType.OE, defaultOrMaker: $112.SalaryRangeCode.SALARY_RANGE_CODE_UNSPECIFIED, valueOf: $112.SalaryRangeCode.valueOf, enumValues: $112.SalaryRangeCode.values)
    ..e<$121.EducationalBackgroundCode>(13, _omitFieldNames ? '' : 'educationalBackgroundCode', $pb.PbFieldType.OE, defaultOrMaker: $121.EducationalBackgroundCode.EDUCATIONAL_BACKGROUND_CODE_UNSPECIFIED, valueOf: $121.EducationalBackgroundCode.valueOf, enumValues: $121.EducationalBackgroundCode.values)
    ..e<$122.SiblingCode>(14, _omitFieldNames ? '' : 'siblingCode', $pb.PbFieldType.OE, defaultOrMaker: $122.SiblingCode.SIBLING_CODE_UNSPECIFIED, valueOf: $122.SiblingCode.valueOf, enumValues: $122.SiblingCode.values)
    ..e<$123.RoommateCode>(15, _omitFieldNames ? '' : 'roommateCode', $pb.PbFieldType.OE, defaultOrMaker: $123.RoommateCode.ROOMMATE_CODE_UNSPECIFIED, valueOf: $123.RoommateCode.valueOf, enumValues: $123.RoommateCode.values)
    ..e<$124.MaritalHistoryCode>(16, _omitFieldNames ? '' : 'maritalHistoryCode', $pb.PbFieldType.OE, defaultOrMaker: $124.MaritalHistoryCode.MARITAL_HISTORY_CODE_UNSPECIFIED, valueOf: $124.MaritalHistoryCode.valueOf, enumValues: $124.MaritalHistoryCode.values)
    ..e<$125.ChildSituationCode>(17, _omitFieldNames ? '' : 'childSituationCode', $pb.PbFieldType.OE, defaultOrMaker: $125.ChildSituationCode.CHILD_SITUATION_CODE_UNSPECIFIED, valueOf: $125.ChildSituationCode.valueOf, enumValues: $125.ChildSituationCode.values)
    ..e<$126.HolidayTypeCode>(18, _omitFieldNames ? '' : 'holidayTypeCode', $pb.PbFieldType.OE, defaultOrMaker: $126.HolidayTypeCode.HOLIDAY_TYPE_CODE_UNSPECIFIED, valueOf: $126.HolidayTypeCode.valueOf, enumValues: $126.HolidayTypeCode.values)
    ..pc<$127.LanguageCode>(19, _omitFieldNames ? '' : 'userLanguageCodes', $pb.PbFieldType.KE, valueOf: $127.LanguageCode.valueOf, enumValues: $127.LanguageCode.values, defaultEnumValue: $127.LanguageCode.LANGUAGE_CODE_UNSPECIFIED)
    ..e<$128.DrinkingAlcoholCode>(20, _omitFieldNames ? '' : 'drinkingAlcoholCode', $pb.PbFieldType.OE, defaultOrMaker: $128.DrinkingAlcoholCode.DRINKING_ALCOHOL_CODE_UNSPECIFIED, valueOf: $128.DrinkingAlcoholCode.valueOf, enumValues: $128.DrinkingAlcoholCode.values)
    ..e<$129.SmokingCode>(21, _omitFieldNames ? '' : 'smokingCode', $pb.PbFieldType.OE, defaultOrMaker: $129.SmokingCode.SMOKING_CODE_UNSPECIFIED, valueOf: $129.SmokingCode.valueOf, enumValues: $129.SmokingCode.values)
    ..e<$130.MarriageAspirationCode>(22, _omitFieldNames ? '' : 'marriageAspirationCode', $pb.PbFieldType.OE, defaultOrMaker: $130.MarriageAspirationCode.MARRIAGE_ASPIRATION_CODE_UNSPECIFIED, valueOf: $130.MarriageAspirationCode.valueOf, enumValues: $130.MarriageAspirationCode.values)
    ..e<$131.ChildDesireCode>(23, _omitFieldNames ? '' : 'childDesireCode', $pb.PbFieldType.OE, defaultOrMaker: $131.ChildDesireCode.CHILD_DESIRE_CODE_UNSPECIFIED, valueOf: $131.ChildDesireCode.valueOf, enumValues: $131.ChildDesireCode.values)
    ..e<$132.HouseWorkCode>(24, _omitFieldNames ? '' : 'houseWorkCode', $pb.PbFieldType.OE, defaultOrMaker: $132.HouseWorkCode.HOUSE_WORK_CODE_UNSPECIFIED, valueOf: $132.HouseWorkCode.valueOf, enumValues: $132.HouseWorkCode.values)
    ..e<$133.DatingPreferenceCode>(25, _omitFieldNames ? '' : 'datingPreferenceCode', $pb.PbFieldType.OE, defaultOrMaker: $133.DatingPreferenceCode.DATING_PREFERENCE_CODE_UNSPECIFIED, valueOf: $133.DatingPreferenceCode.valueOf, enumValues: $133.DatingPreferenceCode.values)
    ..e<$134.FirstDateCostPreferenceCode>(26, _omitFieldNames ? '' : 'firstDateCostPreferenceCode', $pb.PbFieldType.OE, defaultOrMaker: $134.FirstDateCostPreferenceCode.FIRST_DATE_COST_PREFERENCE_CODE_UNSPECIFIED, valueOf: $134.FirstDateCostPreferenceCode.valueOf, enumValues: $134.FirstDateCostPreferenceCode.values)
    ..e<$135.FirstDateLocationPreferenceCode>(27, _omitFieldNames ? '' : 'firstDateLocationPreferenceCode', $pb.PbFieldType.OE, defaultOrMaker: $135.FirstDateLocationPreferenceCode.FIRST_DATE_LOCATION_PREFERENCE_CODE_UNSPECIFIED, valueOf: $135.FirstDateLocationPreferenceCode.valueOf, enumValues: $135.FirstDateLocationPreferenceCode.values)
    ..aOB(28, _omitFieldNames ? '' : 'photoBonusGranted')
    ..aOB(29, _omitFieldNames ? '' : 'introBonusGranted')
    ..aOS(30, _omitFieldNames ? '' : 'bloodTypeLabel')
    ..aOS(31, _omitFieldNames ? '' : 'bodyTypeLabel')
    ..aOS(32, _omitFieldNames ? '' : 'sociabilityLabel')
    ..aOS(33, _omitFieldNames ? '' : 'groupBehaviorLabel')
    ..aOS(34, _omitFieldNames ? '' : 'personalityTraitLabel')
    ..aOS(35, _omitFieldNames ? '' : 'sixteenPersonalityLabel')
    ..aOS(36, _omitFieldNames ? '' : 'occupationLabel')
    ..aOS(37, _omitFieldNames ? '' : 'salaryRangeLabel')
    ..aOS(38, _omitFieldNames ? '' : 'educationalBackgroundLabel')
    ..aOS(39, _omitFieldNames ? '' : 'siblingLabel')
    ..aOS(40, _omitFieldNames ? '' : 'roommateLabel')
    ..aOS(41, _omitFieldNames ? '' : 'maritalHistoryLabel')
    ..aOS(42, _omitFieldNames ? '' : 'childSituationLabel')
    ..aOS(43, _omitFieldNames ? '' : 'holidayTypeLabel')
    ..aOS(44, _omitFieldNames ? '' : 'drinkingAlcoholLabel')
    ..aOS(45, _omitFieldNames ? '' : 'smokingLabel')
    ..aOS(46, _omitFieldNames ? '' : 'marriageAspirationLabel')
    ..aOS(47, _omitFieldNames ? '' : 'childDesireLabel')
    ..aOS(48, _omitFieldNames ? '' : 'houseWorkLabel')
    ..aOS(49, _omitFieldNames ? '' : 'datingPreferenceLabel')
    ..aOS(50, _omitFieldNames ? '' : 'firstDateCostPreferenceLabel')
    ..aOS(51, _omitFieldNames ? '' : 'firstDateLocationPreferenceLabel')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OptionalProfile clone() => OptionalProfile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OptionalProfile copyWith(void Function(OptionalProfile) updates) => super.copyWith((message) => updates(message as OptionalProfile)) as OptionalProfile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OptionalProfile create() => OptionalProfile._();
  OptionalProfile createEmptyInstance() => create();
  static $pb.PbList<OptionalProfile> createRepeated() => $pb.PbList<OptionalProfile>();
  @$core.pragma('dart2js:noInline')
  static OptionalProfile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OptionalProfile>(create);
  static OptionalProfile? _defaultInstance;

  /// 自己紹介（承認制）
  @$pb.TagNumber(1)
  RequiringReviewIntroductory get requiringReviewIntroductory => $_getN(0);
  @$pb.TagNumber(1)
  set requiringReviewIntroductory(RequiringReviewIntroductory v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequiringReviewIntroductory() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequiringReviewIntroductory() => clearField(1);
  @$pb.TagNumber(1)
  RequiringReviewIntroductory ensureRequiringReviewIntroductory() => $_ensure(0);

  /// 血液型
  @$pb.TagNumber(2)
  $116.BloodTypeCode get bloodTypeCode => $_getN(1);
  @$pb.TagNumber(2)
  set bloodTypeCode($116.BloodTypeCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBloodTypeCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearBloodTypeCode() => clearField(2);

  /// 出身地(都道府県)
  @$pb.TagNumber(3)
  $113.Region get birthplaceRegion => $_getN(2);
  @$pb.TagNumber(3)
  set birthplaceRegion($113.Region v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBirthplaceRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearBirthplaceRegion() => clearField(3);
  @$pb.TagNumber(3)
  $113.Region ensureBirthplaceRegion() => $_ensure(2);

  /// 身長
  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  /// 体型
  @$pb.TagNumber(5)
  $111.BodyTypeCode get bodyTypeCode => $_getN(4);
  @$pb.TagNumber(5)
  set bodyTypeCode($111.BodyTypeCode v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasBodyTypeCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearBodyTypeCode() => clearField(5);

  /// 社交性
  @$pb.TagNumber(6)
  $117.SociabilityCode get sociabilityCode => $_getN(5);
  @$pb.TagNumber(6)
  set sociabilityCode($117.SociabilityCode v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSociabilityCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearSociabilityCode() => clearField(6);

  /// 性格
  @$pb.TagNumber(8)
  $118.PersonalityTraitCode get personalityTraitCode => $_getN(6);
  @$pb.TagNumber(8)
  set personalityTraitCode($118.PersonalityTraitCode v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPersonalityTraitCode() => $_has(6);
  @$pb.TagNumber(8)
  void clearPersonalityTraitCode() => clearField(8);

  /// 16タイプ診断
  @$pb.TagNumber(9)
  $119.SixteenPersonalityCode get sixteenPersonalityCode => $_getN(7);
  @$pb.TagNumber(9)
  set sixteenPersonalityCode($119.SixteenPersonalityCode v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasSixteenPersonalityCode() => $_has(7);
  @$pb.TagNumber(9)
  void clearSixteenPersonalityCode() => clearField(9);

  /// 職業
  @$pb.TagNumber(10)
  $120.OccupationCode get occupationCode => $_getN(8);
  @$pb.TagNumber(10)
  set occupationCode($120.OccupationCode v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasOccupationCode() => $_has(8);
  @$pb.TagNumber(10)
  void clearOccupationCode() => clearField(10);

  /// 勤務地(都道府県)
  @$pb.TagNumber(11)
  $113.Region get workplaceRegion => $_getN(9);
  @$pb.TagNumber(11)
  set workplaceRegion($113.Region v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasWorkplaceRegion() => $_has(9);
  @$pb.TagNumber(11)
  void clearWorkplaceRegion() => clearField(11);
  @$pb.TagNumber(11)
  $113.Region ensureWorkplaceRegion() => $_ensure(9);

  /// 年収
  @$pb.TagNumber(12)
  $112.SalaryRangeCode get salaryRangeCode => $_getN(10);
  @$pb.TagNumber(12)
  set salaryRangeCode($112.SalaryRangeCode v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasSalaryRangeCode() => $_has(10);
  @$pb.TagNumber(12)
  void clearSalaryRangeCode() => clearField(12);

  /// 学歴
  @$pb.TagNumber(13)
  $121.EducationalBackgroundCode get educationalBackgroundCode => $_getN(11);
  @$pb.TagNumber(13)
  set educationalBackgroundCode($121.EducationalBackgroundCode v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasEducationalBackgroundCode() => $_has(11);
  @$pb.TagNumber(13)
  void clearEducationalBackgroundCode() => clearField(13);

  /// 兄弟姉妹
  @$pb.TagNumber(14)
  $122.SiblingCode get siblingCode => $_getN(12);
  @$pb.TagNumber(14)
  set siblingCode($122.SiblingCode v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasSiblingCode() => $_has(12);
  @$pb.TagNumber(14)
  void clearSiblingCode() => clearField(14);

  /// 同居人
  @$pb.TagNumber(15)
  $123.RoommateCode get roommateCode => $_getN(13);
  @$pb.TagNumber(15)
  set roommateCode($123.RoommateCode v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasRoommateCode() => $_has(13);
  @$pb.TagNumber(15)
  void clearRoommateCode() => clearField(15);

  /// 結婚歴
  @$pb.TagNumber(16)
  $124.MaritalHistoryCode get maritalHistoryCode => $_getN(14);
  @$pb.TagNumber(16)
  set maritalHistoryCode($124.MaritalHistoryCode v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasMaritalHistoryCode() => $_has(14);
  @$pb.TagNumber(16)
  void clearMaritalHistoryCode() => clearField(16);

  /// 子供の状況
  @$pb.TagNumber(17)
  $125.ChildSituationCode get childSituationCode => $_getN(15);
  @$pb.TagNumber(17)
  set childSituationCode($125.ChildSituationCode v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasChildSituationCode() => $_has(15);
  @$pb.TagNumber(17)
  void clearChildSituationCode() => clearField(17);

  /// 休日種別
  @$pb.TagNumber(18)
  $126.HolidayTypeCode get holidayTypeCode => $_getN(16);
  @$pb.TagNumber(18)
  set holidayTypeCode($126.HolidayTypeCode v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasHolidayTypeCode() => $_has(16);
  @$pb.TagNumber(18)
  void clearHolidayTypeCode() => clearField(18);

  /// 話せる言語
  @$pb.TagNumber(19)
  $core.List<$127.LanguageCode> get userLanguageCodes => $_getList(17);

  /// 飲酒状況
  @$pb.TagNumber(20)
  $128.DrinkingAlcoholCode get drinkingAlcoholCode => $_getN(18);
  @$pb.TagNumber(20)
  set drinkingAlcoholCode($128.DrinkingAlcoholCode v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasDrinkingAlcoholCode() => $_has(18);
  @$pb.TagNumber(20)
  void clearDrinkingAlcoholCode() => clearField(20);

  /// 喫煙状況
  @$pb.TagNumber(21)
  $129.SmokingCode get smokingCode => $_getN(19);
  @$pb.TagNumber(21)
  set smokingCode($129.SmokingCode v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasSmokingCode() => $_has(19);
  @$pb.TagNumber(21)
  void clearSmokingCode() => clearField(21);

  /// 結婚願望
  @$pb.TagNumber(22)
  $130.MarriageAspirationCode get marriageAspirationCode => $_getN(20);
  @$pb.TagNumber(22)
  set marriageAspirationCode($130.MarriageAspirationCode v) { setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasMarriageAspirationCode() => $_has(20);
  @$pb.TagNumber(22)
  void clearMarriageAspirationCode() => clearField(22);

  /// 子供を望むかどうか
  @$pb.TagNumber(23)
  $131.ChildDesireCode get childDesireCode => $_getN(21);
  @$pb.TagNumber(23)
  set childDesireCode($131.ChildDesireCode v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasChildDesireCode() => $_has(21);
  @$pb.TagNumber(23)
  void clearChildDesireCode() => clearField(23);

  /// 家事・育児
  @$pb.TagNumber(24)
  $132.HouseWorkCode get houseWorkCode => $_getN(22);
  @$pb.TagNumber(24)
  set houseWorkCode($132.HouseWorkCode v) { setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasHouseWorkCode() => $_has(22);
  @$pb.TagNumber(24)
  void clearHouseWorkCode() => clearField(24);

  /// 出会い方の希望
  @$pb.TagNumber(25)
  $133.DatingPreferenceCode get datingPreferenceCode => $_getN(23);
  @$pb.TagNumber(25)
  set datingPreferenceCode($133.DatingPreferenceCode v) { setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasDatingPreferenceCode() => $_has(23);
  @$pb.TagNumber(25)
  void clearDatingPreferenceCode() => clearField(25);

  /// 初デート費用負担
  @$pb.TagNumber(26)
  $134.FirstDateCostPreferenceCode get firstDateCostPreferenceCode => $_getN(24);
  @$pb.TagNumber(26)
  set firstDateCostPreferenceCode($134.FirstDateCostPreferenceCode v) { setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasFirstDateCostPreferenceCode() => $_has(24);
  @$pb.TagNumber(26)
  void clearFirstDateCostPreferenceCode() => clearField(26);

  /// 初デート場所
  @$pb.TagNumber(27)
  $135.FirstDateLocationPreferenceCode get firstDateLocationPreferenceCode => $_getN(25);
  @$pb.TagNumber(27)
  set firstDateLocationPreferenceCode($135.FirstDateLocationPreferenceCode v) { setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasFirstDateLocationPreferenceCode() => $_has(25);
  @$pb.TagNumber(27)
  void clearFirstDateLocationPreferenceCode() => clearField(27);

  /// プロフィール写真登録ボーナス付与済みフラグ
  @$pb.TagNumber(28)
  $core.bool get photoBonusGranted => $_getBF(26);
  @$pb.TagNumber(28)
  set photoBonusGranted($core.bool v) { $_setBool(26, v); }
  @$pb.TagNumber(28)
  $core.bool hasPhotoBonusGranted() => $_has(26);
  @$pb.TagNumber(28)
  void clearPhotoBonusGranted() => clearField(28);

  /// 自己紹介登録ボーナス付与済みフラグ
  @$pb.TagNumber(29)
  $core.bool get introBonusGranted => $_getBF(27);
  @$pb.TagNumber(29)
  set introBonusGranted($core.bool v) { $_setBool(27, v); }
  @$pb.TagNumber(29)
  $core.bool hasIntroBonusGranted() => $_has(27);
  @$pb.TagNumber(29)
  void clearIntroBonusGranted() => clearField(29);

  /// ========================================
  /// Task 7.3 (AI-718): Japanese labels for enum codes
  /// ========================================
  /// 血液型ラベル
  @$pb.TagNumber(30)
  $core.String get bloodTypeLabel => $_getSZ(28);
  @$pb.TagNumber(30)
  set bloodTypeLabel($core.String v) { $_setString(28, v); }
  @$pb.TagNumber(30)
  $core.bool hasBloodTypeLabel() => $_has(28);
  @$pb.TagNumber(30)
  void clearBloodTypeLabel() => clearField(30);

  /// 体型ラベル
  @$pb.TagNumber(31)
  $core.String get bodyTypeLabel => $_getSZ(29);
  @$pb.TagNumber(31)
  set bodyTypeLabel($core.String v) { $_setString(29, v); }
  @$pb.TagNumber(31)
  $core.bool hasBodyTypeLabel() => $_has(29);
  @$pb.TagNumber(31)
  void clearBodyTypeLabel() => clearField(31);

  /// 社交性ラベル
  @$pb.TagNumber(32)
  $core.String get sociabilityLabel => $_getSZ(30);
  @$pb.TagNumber(32)
  set sociabilityLabel($core.String v) { $_setString(30, v); }
  @$pb.TagNumber(32)
  $core.bool hasSociabilityLabel() => $_has(30);
  @$pb.TagNumber(32)
  void clearSociabilityLabel() => clearField(32);

  /// グループ行動ラベル
  @$pb.TagNumber(33)
  $core.String get groupBehaviorLabel => $_getSZ(31);
  @$pb.TagNumber(33)
  set groupBehaviorLabel($core.String v) { $_setString(31, v); }
  @$pb.TagNumber(33)
  $core.bool hasGroupBehaviorLabel() => $_has(31);
  @$pb.TagNumber(33)
  void clearGroupBehaviorLabel() => clearField(33);

  /// 性格ラベル
  @$pb.TagNumber(34)
  $core.String get personalityTraitLabel => $_getSZ(32);
  @$pb.TagNumber(34)
  set personalityTraitLabel($core.String v) { $_setString(32, v); }
  @$pb.TagNumber(34)
  $core.bool hasPersonalityTraitLabel() => $_has(32);
  @$pb.TagNumber(34)
  void clearPersonalityTraitLabel() => clearField(34);

  /// 16タイプ診断ラベル
  @$pb.TagNumber(35)
  $core.String get sixteenPersonalityLabel => $_getSZ(33);
  @$pb.TagNumber(35)
  set sixteenPersonalityLabel($core.String v) { $_setString(33, v); }
  @$pb.TagNumber(35)
  $core.bool hasSixteenPersonalityLabel() => $_has(33);
  @$pb.TagNumber(35)
  void clearSixteenPersonalityLabel() => clearField(35);

  /// 職業ラベル
  @$pb.TagNumber(36)
  $core.String get occupationLabel => $_getSZ(34);
  @$pb.TagNumber(36)
  set occupationLabel($core.String v) { $_setString(34, v); }
  @$pb.TagNumber(36)
  $core.bool hasOccupationLabel() => $_has(34);
  @$pb.TagNumber(36)
  void clearOccupationLabel() => clearField(36);

  /// 年収ラベル
  @$pb.TagNumber(37)
  $core.String get salaryRangeLabel => $_getSZ(35);
  @$pb.TagNumber(37)
  set salaryRangeLabel($core.String v) { $_setString(35, v); }
  @$pb.TagNumber(37)
  $core.bool hasSalaryRangeLabel() => $_has(35);
  @$pb.TagNumber(37)
  void clearSalaryRangeLabel() => clearField(37);

  /// 学歴ラベル
  @$pb.TagNumber(38)
  $core.String get educationalBackgroundLabel => $_getSZ(36);
  @$pb.TagNumber(38)
  set educationalBackgroundLabel($core.String v) { $_setString(36, v); }
  @$pb.TagNumber(38)
  $core.bool hasEducationalBackgroundLabel() => $_has(36);
  @$pb.TagNumber(38)
  void clearEducationalBackgroundLabel() => clearField(38);

  /// 兄弟姉妹ラベル
  @$pb.TagNumber(39)
  $core.String get siblingLabel => $_getSZ(37);
  @$pb.TagNumber(39)
  set siblingLabel($core.String v) { $_setString(37, v); }
  @$pb.TagNumber(39)
  $core.bool hasSiblingLabel() => $_has(37);
  @$pb.TagNumber(39)
  void clearSiblingLabel() => clearField(39);

  /// 同居人ラベル
  @$pb.TagNumber(40)
  $core.String get roommateLabel => $_getSZ(38);
  @$pb.TagNumber(40)
  set roommateLabel($core.String v) { $_setString(38, v); }
  @$pb.TagNumber(40)
  $core.bool hasRoommateLabel() => $_has(38);
  @$pb.TagNumber(40)
  void clearRoommateLabel() => clearField(40);

  /// 結婚歴ラベル
  @$pb.TagNumber(41)
  $core.String get maritalHistoryLabel => $_getSZ(39);
  @$pb.TagNumber(41)
  set maritalHistoryLabel($core.String v) { $_setString(39, v); }
  @$pb.TagNumber(41)
  $core.bool hasMaritalHistoryLabel() => $_has(39);
  @$pb.TagNumber(41)
  void clearMaritalHistoryLabel() => clearField(41);

  /// 子供の状況ラベル
  @$pb.TagNumber(42)
  $core.String get childSituationLabel => $_getSZ(40);
  @$pb.TagNumber(42)
  set childSituationLabel($core.String v) { $_setString(40, v); }
  @$pb.TagNumber(42)
  $core.bool hasChildSituationLabel() => $_has(40);
  @$pb.TagNumber(42)
  void clearChildSituationLabel() => clearField(42);

  /// 休日種別ラベル
  @$pb.TagNumber(43)
  $core.String get holidayTypeLabel => $_getSZ(41);
  @$pb.TagNumber(43)
  set holidayTypeLabel($core.String v) { $_setString(41, v); }
  @$pb.TagNumber(43)
  $core.bool hasHolidayTypeLabel() => $_has(41);
  @$pb.TagNumber(43)
  void clearHolidayTypeLabel() => clearField(43);

  /// 飲酒状況ラベル
  @$pb.TagNumber(44)
  $core.String get drinkingAlcoholLabel => $_getSZ(42);
  @$pb.TagNumber(44)
  set drinkingAlcoholLabel($core.String v) { $_setString(42, v); }
  @$pb.TagNumber(44)
  $core.bool hasDrinkingAlcoholLabel() => $_has(42);
  @$pb.TagNumber(44)
  void clearDrinkingAlcoholLabel() => clearField(44);

  /// 喫煙状況ラベル
  @$pb.TagNumber(45)
  $core.String get smokingLabel => $_getSZ(43);
  @$pb.TagNumber(45)
  set smokingLabel($core.String v) { $_setString(43, v); }
  @$pb.TagNumber(45)
  $core.bool hasSmokingLabel() => $_has(43);
  @$pb.TagNumber(45)
  void clearSmokingLabel() => clearField(45);

  /// 結婚願望ラベル
  @$pb.TagNumber(46)
  $core.String get marriageAspirationLabel => $_getSZ(44);
  @$pb.TagNumber(46)
  set marriageAspirationLabel($core.String v) { $_setString(44, v); }
  @$pb.TagNumber(46)
  $core.bool hasMarriageAspirationLabel() => $_has(44);
  @$pb.TagNumber(46)
  void clearMarriageAspirationLabel() => clearField(46);

  /// 子供を望むかどうかラベル
  @$pb.TagNumber(47)
  $core.String get childDesireLabel => $_getSZ(45);
  @$pb.TagNumber(47)
  set childDesireLabel($core.String v) { $_setString(45, v); }
  @$pb.TagNumber(47)
  $core.bool hasChildDesireLabel() => $_has(45);
  @$pb.TagNumber(47)
  void clearChildDesireLabel() => clearField(47);

  /// 家事・育児ラベル
  @$pb.TagNumber(48)
  $core.String get houseWorkLabel => $_getSZ(46);
  @$pb.TagNumber(48)
  set houseWorkLabel($core.String v) { $_setString(46, v); }
  @$pb.TagNumber(48)
  $core.bool hasHouseWorkLabel() => $_has(46);
  @$pb.TagNumber(48)
  void clearHouseWorkLabel() => clearField(48);

  /// 出会い方の希望ラベル
  @$pb.TagNumber(49)
  $core.String get datingPreferenceLabel => $_getSZ(47);
  @$pb.TagNumber(49)
  set datingPreferenceLabel($core.String v) { $_setString(47, v); }
  @$pb.TagNumber(49)
  $core.bool hasDatingPreferenceLabel() => $_has(47);
  @$pb.TagNumber(49)
  void clearDatingPreferenceLabel() => clearField(49);

  /// 初デート費用負担ラベル
  @$pb.TagNumber(50)
  $core.String get firstDateCostPreferenceLabel => $_getSZ(48);
  @$pb.TagNumber(50)
  set firstDateCostPreferenceLabel($core.String v) { $_setString(48, v); }
  @$pb.TagNumber(50)
  $core.bool hasFirstDateCostPreferenceLabel() => $_has(48);
  @$pb.TagNumber(50)
  void clearFirstDateCostPreferenceLabel() => clearField(50);

  /// 初デート場所ラベル
  @$pb.TagNumber(51)
  $core.String get firstDateLocationPreferenceLabel => $_getSZ(49);
  @$pb.TagNumber(51)
  set firstDateLocationPreferenceLabel($core.String v) { $_setString(49, v); }
  @$pb.TagNumber(51)
  $core.bool hasFirstDateLocationPreferenceLabel() => $_has(49);
  @$pb.TagNumber(51)
  void clearFirstDateLocationPreferenceLabel() => clearField(51);
}

/// 承認制ニックネーム
/// - 登録フロー中: 承認不要で即時反映される
/// - 自分のプロフィール更新: 承認制で審査待ち（pending_nicknameが設定される）
/// - 他者プロフィール: 表示用途となるので承認の概念が無い（pending_nicknameは設定されない）
class RequiringReviewNickname extends $pb.GeneratedMessage {
  factory RequiringReviewNickname({
    $core.String? currentNickname,
    $core.String? pendingNickname,
  }) {
    final $result = create();
    if (currentNickname != null) {
      $result.currentNickname = currentNickname;
    }
    if (pendingNickname != null) {
      $result.pendingNickname = pendingNickname;
    }
    return $result;
  }
  RequiringReviewNickname._() : super();
  factory RequiringReviewNickname.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequiringReviewNickname.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequiringReviewNickname', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentNickname')
    ..aOS(2, _omitFieldNames ? '' : 'pendingNickname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequiringReviewNickname clone() => RequiringReviewNickname()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequiringReviewNickname copyWith(void Function(RequiringReviewNickname) updates) => super.copyWith((message) => updates(message as RequiringReviewNickname)) as RequiringReviewNickname;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequiringReviewNickname create() => RequiringReviewNickname._();
  RequiringReviewNickname createEmptyInstance() => create();
  static $pb.PbList<RequiringReviewNickname> createRepeated() => $pb.PbList<RequiringReviewNickname>();
  @$core.pragma('dart2js:noInline')
  static RequiringReviewNickname getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequiringReviewNickname>(create);
  static RequiringReviewNickname? _defaultInstance;

  /// 現在のニックネーム
  @$pb.TagNumber(1)
  $core.String get currentNickname => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentNickname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentNickname() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentNickname() => clearField(1);

  /// 審査後変更予定のニックネーム（承認待ちの場合のみ設定）
  @$pb.TagNumber(2)
  $core.String get pendingNickname => $_getSZ(1);
  @$pb.TagNumber(2)
  set pendingNickname($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPendingNickname() => $_has(1);
  @$pb.TagNumber(2)
  void clearPendingNickname() => clearField(2);
}

/// 承認制自己紹介
/// - 登録フロー中: 承認不要で即時反映される
/// - 自分のプロフィール更新: 承認制で審査待ち（pending_introductoryが設定される）
/// - 他者プロフィール: 表示用途となるので承認の概念が無い（pending_introductoryは設定されない）
class RequiringReviewIntroductory extends $pb.GeneratedMessage {
  factory RequiringReviewIntroductory({
    $core.String? currentIntroductory,
    $core.String? pendingIntroductory,
  }) {
    final $result = create();
    if (currentIntroductory != null) {
      $result.currentIntroductory = currentIntroductory;
    }
    if (pendingIntroductory != null) {
      $result.pendingIntroductory = pendingIntroductory;
    }
    return $result;
  }
  RequiringReviewIntroductory._() : super();
  factory RequiringReviewIntroductory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequiringReviewIntroductory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequiringReviewIntroductory', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'currentIntroductory')
    ..aOS(2, _omitFieldNames ? '' : 'pendingIntroductory')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequiringReviewIntroductory clone() => RequiringReviewIntroductory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequiringReviewIntroductory copyWith(void Function(RequiringReviewIntroductory) updates) => super.copyWith((message) => updates(message as RequiringReviewIntroductory)) as RequiringReviewIntroductory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequiringReviewIntroductory create() => RequiringReviewIntroductory._();
  RequiringReviewIntroductory createEmptyInstance() => create();
  static $pb.PbList<RequiringReviewIntroductory> createRepeated() => $pb.PbList<RequiringReviewIntroductory>();
  @$core.pragma('dart2js:noInline')
  static RequiringReviewIntroductory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequiringReviewIntroductory>(create);
  static RequiringReviewIntroductory? _defaultInstance;

  /// 現在の自己紹介
  @$pb.TagNumber(1)
  $core.String get currentIntroductory => $_getSZ(0);
  @$pb.TagNumber(1)
  set currentIntroductory($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCurrentIntroductory() => $_has(0);
  @$pb.TagNumber(1)
  void clearCurrentIntroductory() => clearField(1);

  /// 審査後変更予定の自己紹介（承認待ちの場合のみ設定）
  @$pb.TagNumber(2)
  $core.String get pendingIntroductory => $_getSZ(1);
  @$pb.TagNumber(2)
  set pendingIntroductory($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPendingIntroductory() => $_has(1);
  @$pb.TagNumber(2)
  void clearPendingIntroductory() => clearField(2);
}

/// 承認制プロフィール写真
/// - 登録フロー中: 承認不要で即時反映される
/// - 自分のプロフィール更新: 承認制で審査待ち（審査中の写真が存在する）
/// - 他者プロフィール: 表示用途となるので承認の概念が無い
/// - 表示順変更: 承認制ではなく即時反映
/// EP-1208: nicknameと同様のcurrent/pending構造を導入
class RequiringReviewProfilePhoto extends $pb.GeneratedMessage {
  factory RequiringReviewProfilePhoto({
    $core.String? userProfilePhotoId,
  @$core.Deprecated('This field is deprecated.')
    $114.SignedImageUrls? signedImageUrls,
    $core.bool? isBestPhoto,
    $core.bool? alreadySkipped,
    $core.int? currentDisplayOrder,
  @$core.Deprecated('This field is deprecated.')
    $core.bool? isPending,
    $114.SignedImageUrls? currentSignedImageUrls,
    $114.SignedImageUrls? pendingSignedImageUrls,
  }) {
    final $result = create();
    if (userProfilePhotoId != null) {
      $result.userProfilePhotoId = userProfilePhotoId;
    }
    if (signedImageUrls != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.signedImageUrls = signedImageUrls;
    }
    if (isBestPhoto != null) {
      $result.isBestPhoto = isBestPhoto;
    }
    if (alreadySkipped != null) {
      $result.alreadySkipped = alreadySkipped;
    }
    if (currentDisplayOrder != null) {
      $result.currentDisplayOrder = currentDisplayOrder;
    }
    if (isPending != null) {
      // ignore: deprecated_member_use_from_same_package
      $result.isPending = isPending;
    }
    if (currentSignedImageUrls != null) {
      $result.currentSignedImageUrls = currentSignedImageUrls;
    }
    if (pendingSignedImageUrls != null) {
      $result.pendingSignedImageUrls = pendingSignedImageUrls;
    }
    return $result;
  }
  RequiringReviewProfilePhoto._() : super();
  factory RequiringReviewProfilePhoto.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RequiringReviewProfilePhoto.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RequiringReviewProfilePhoto', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userProfilePhotoId')
    ..aOM<$114.SignedImageUrls>(2, _omitFieldNames ? '' : 'signedImageUrls', subBuilder: $114.SignedImageUrls.create)
    ..aOB(3, _omitFieldNames ? '' : 'isBestPhoto')
    ..aOB(4, _omitFieldNames ? '' : 'alreadySkipped')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'currentDisplayOrder', $pb.PbFieldType.O3)
    ..aOB(6, _omitFieldNames ? '' : 'isPending')
    ..aOM<$114.SignedImageUrls>(7, _omitFieldNames ? '' : 'currentSignedImageUrls', subBuilder: $114.SignedImageUrls.create)
    ..aOM<$114.SignedImageUrls>(8, _omitFieldNames ? '' : 'pendingSignedImageUrls', subBuilder: $114.SignedImageUrls.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RequiringReviewProfilePhoto clone() => RequiringReviewProfilePhoto()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RequiringReviewProfilePhoto copyWith(void Function(RequiringReviewProfilePhoto) updates) => super.copyWith((message) => updates(message as RequiringReviewProfilePhoto)) as RequiringReviewProfilePhoto;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequiringReviewProfilePhoto create() => RequiringReviewProfilePhoto._();
  RequiringReviewProfilePhoto createEmptyInstance() => create();
  static $pb.PbList<RequiringReviewProfilePhoto> createRepeated() => $pb.PbList<RequiringReviewProfilePhoto>();
  @$core.pragma('dart2js:noInline')
  static RequiringReviewProfilePhoto getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RequiringReviewProfilePhoto>(create);
  static RequiringReviewProfilePhoto? _defaultInstance;

  /// プロフィール写真ID
  @$pb.TagNumber(1)
  $core.String get userProfilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userProfilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserProfilePhotoId() => clearField(1);

  /// [DEPRECATED] 署名付き画像URL - current_signed_image_urls/pending_signed_image_urlsを使用
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $114.SignedImageUrls get signedImageUrls => $_getN(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set signedImageUrls($114.SignedImageUrls v) { setField(2, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasSignedImageUrls() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearSignedImageUrls() => clearField(2);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $114.SignedImageUrls ensureSignedImageUrls() => $_ensure(1);

  /// ベスト写真フラグ
  @$pb.TagNumber(3)
  $core.bool get isBestPhoto => $_getBF(2);
  @$pb.TagNumber(3)
  set isBestPhoto($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsBestPhoto() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsBestPhoto() => clearField(3);

  /// 既にスキップされた事がある画像かどうか
  @$pb.TagNumber(4)
  $core.bool get alreadySkipped => $_getBF(3);
  @$pb.TagNumber(4)
  set alreadySkipped($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAlreadySkipped() => $_has(3);
  @$pb.TagNumber(4)
  void clearAlreadySkipped() => clearField(4);

  /// 現在の表示順序（表示順の変更は承認制ではなく、即時反映）
  @$pb.TagNumber(5)
  $core.int get currentDisplayOrder => $_getIZ(4);
  @$pb.TagNumber(5)
  set currentDisplayOrder($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCurrentDisplayOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrentDisplayOrder() => clearField(5);

  /// [DEPRECATED] 審査中フラグ - pending_signed_image_urlsの有無で判定
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool get isPending => $_getBF(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  set isPending($core.bool v) { $_setBool(5, v); }
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  $core.bool hasIsPending() => $_has(5);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(6)
  void clearIsPending() => clearField(6);

  /// 現在承認済みの画像URL（承認済み画像がない場合はnil）
  @$pb.TagNumber(7)
  $114.SignedImageUrls get currentSignedImageUrls => $_getN(6);
  @$pb.TagNumber(7)
  set currentSignedImageUrls($114.SignedImageUrls v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrentSignedImageUrls() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrentSignedImageUrls() => clearField(7);
  @$pb.TagNumber(7)
  $114.SignedImageUrls ensureCurrentSignedImageUrls() => $_ensure(6);

  /// 審査中の画像URL（審査中の画像がある場合のみ設定）
  @$pb.TagNumber(8)
  $114.SignedImageUrls get pendingSignedImageUrls => $_getN(7);
  @$pb.TagNumber(8)
  set pendingSignedImageUrls($114.SignedImageUrls v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasPendingSignedImageUrls() => $_has(7);
  @$pb.TagNumber(8)
  void clearPendingSignedImageUrls() => clearField(8);
  @$pb.TagNumber(8)
  $114.SignedImageUrls ensurePendingSignedImageUrls() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
