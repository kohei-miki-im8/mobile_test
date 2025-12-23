// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileDetail {
// 自己紹介
  String get introductory; // 基本情報
  String get nickname;
  String get ageText;
  String get residence;
  LabelKey get bloodType;
  String get birthplace; // 容姿
  String get heightText;
  LabelKey get bodyType; // 性格
  LabelKey get sociability;
  LabelKey get commonlySaidPersonality;
  LabelKey get sixteenPersonality; // 仕事・学歴
  LabelKey get occupation;
  String get workplace;
  LabelKey get salaryRange;
  LabelKey get educationalBackground; // 生活・その他
  LabelKey get sibling;
  LabelKey get roommate;
  LabelKey get maritalHistory;
  LabelKey get childSituation;
  LabelKey get holidayType;
  String get languages;
  LabelKey get drinkingAlcohol;
  LabelKey get smoking; // 将来
  LabelKey get marriageAspiration;
  LabelKey get childDesire;
  LabelKey get houseWork; // 初回デート
  LabelKey get datingPreference;
  LabelKey get firstDateCostPreference;
  LabelKey get firstDateLocationPreference; // タグ
  List<UserTag>? get tags;

  /// Create a copy of ProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileDetailCopyWith<ProfileDetail> get copyWith =>
      _$ProfileDetailCopyWithImpl<ProfileDetail>(
          this as ProfileDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileDetail &&
            (identical(other.introductory, introductory) ||
                other.introductory == introductory) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.ageText, ageText) || other.ageText == ageText) &&
            (identical(other.residence, residence) ||
                other.residence == residence) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.birthplace, birthplace) ||
                other.birthplace == birthplace) &&
            (identical(other.heightText, heightText) ||
                other.heightText == heightText) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.sociability, sociability) ||
                other.sociability == sociability) &&
            (identical(
                    other.commonlySaidPersonality, commonlySaidPersonality) ||
                other.commonlySaidPersonality == commonlySaidPersonality) &&
            (identical(other.sixteenPersonality, sixteenPersonality) ||
                other.sixteenPersonality == sixteenPersonality) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.workplace, workplace) ||
                other.workplace == workplace) &&
            (identical(other.salaryRange, salaryRange) ||
                other.salaryRange == salaryRange) &&
            (identical(other.educationalBackground, educationalBackground) ||
                other.educationalBackground == educationalBackground) &&
            (identical(other.sibling, sibling) || other.sibling == sibling) &&
            (identical(other.roommate, roommate) ||
                other.roommate == roommate) &&
            (identical(other.maritalHistory, maritalHistory) ||
                other.maritalHistory == maritalHistory) &&
            (identical(other.childSituation, childSituation) ||
                other.childSituation == childSituation) &&
            (identical(other.holidayType, holidayType) ||
                other.holidayType == holidayType) &&
            (identical(other.languages, languages) ||
                other.languages == languages) &&
            (identical(other.drinkingAlcohol, drinkingAlcohol) ||
                other.drinkingAlcohol == drinkingAlcohol) &&
            (identical(other.smoking, smoking) || other.smoking == smoking) &&
            (identical(other.marriageAspiration, marriageAspiration) ||
                other.marriageAspiration == marriageAspiration) &&
            (identical(other.childDesire, childDesire) ||
                other.childDesire == childDesire) &&
            (identical(other.houseWork, houseWork) ||
                other.houseWork == houseWork) &&
            (identical(other.datingPreference, datingPreference) ||
                other.datingPreference == datingPreference) &&
            (identical(
                    other.firstDateCostPreference, firstDateCostPreference) ||
                other.firstDateCostPreference == firstDateCostPreference) &&
            (identical(other.firstDateLocationPreference,
                    firstDateLocationPreference) ||
                other.firstDateLocationPreference ==
                    firstDateLocationPreference) &&
            const DeepCollectionEquality().equals(other.tags, tags));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        introductory,
        nickname,
        ageText,
        residence,
        bloodType,
        birthplace,
        heightText,
        bodyType,
        sociability,
        commonlySaidPersonality,
        sixteenPersonality,
        occupation,
        workplace,
        salaryRange,
        educationalBackground,
        sibling,
        roommate,
        maritalHistory,
        childSituation,
        holidayType,
        languages,
        drinkingAlcohol,
        smoking,
        marriageAspiration,
        childDesire,
        houseWork,
        datingPreference,
        firstDateCostPreference,
        firstDateLocationPreference,
        const DeepCollectionEquality().hash(tags)
      ]);

  @override
  String toString() {
    return 'ProfileDetail(introductory: $introductory, nickname: $nickname, ageText: $ageText, residence: $residence, bloodType: $bloodType, birthplace: $birthplace, heightText: $heightText, bodyType: $bodyType, sociability: $sociability, commonlySaidPersonality: $commonlySaidPersonality, sixteenPersonality: $sixteenPersonality, occupation: $occupation, workplace: $workplace, salaryRange: $salaryRange, educationalBackground: $educationalBackground, sibling: $sibling, roommate: $roommate, maritalHistory: $maritalHistory, childSituation: $childSituation, holidayType: $holidayType, languages: $languages, drinkingAlcohol: $drinkingAlcohol, smoking: $smoking, marriageAspiration: $marriageAspiration, childDesire: $childDesire, houseWork: $houseWork, datingPreference: $datingPreference, firstDateCostPreference: $firstDateCostPreference, firstDateLocationPreference: $firstDateLocationPreference, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class $ProfileDetailCopyWith<$Res> {
  factory $ProfileDetailCopyWith(
          ProfileDetail value, $Res Function(ProfileDetail) _then) =
      _$ProfileDetailCopyWithImpl;
  @useResult
  $Res call(
      {String introductory,
      String nickname,
      String ageText,
      String residence,
      LabelKey bloodType,
      String birthplace,
      String heightText,
      LabelKey bodyType,
      LabelKey sociability,
      LabelKey commonlySaidPersonality,
      LabelKey sixteenPersonality,
      LabelKey occupation,
      String workplace,
      LabelKey salaryRange,
      LabelKey educationalBackground,
      LabelKey sibling,
      LabelKey roommate,
      LabelKey maritalHistory,
      LabelKey childSituation,
      LabelKey holidayType,
      String languages,
      LabelKey drinkingAlcohol,
      LabelKey smoking,
      LabelKey marriageAspiration,
      LabelKey childDesire,
      LabelKey houseWork,
      LabelKey datingPreference,
      LabelKey firstDateCostPreference,
      LabelKey firstDateLocationPreference,
      List<UserTag>? tags});
}

/// @nodoc
class _$ProfileDetailCopyWithImpl<$Res>
    implements $ProfileDetailCopyWith<$Res> {
  _$ProfileDetailCopyWithImpl(this._self, this._then);

  final ProfileDetail _self;
  final $Res Function(ProfileDetail) _then;

  /// Create a copy of ProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? introductory = null,
    Object? nickname = null,
    Object? ageText = null,
    Object? residence = null,
    Object? bloodType = null,
    Object? birthplace = null,
    Object? heightText = null,
    Object? bodyType = null,
    Object? sociability = null,
    Object? commonlySaidPersonality = null,
    Object? sixteenPersonality = null,
    Object? occupation = null,
    Object? workplace = null,
    Object? salaryRange = null,
    Object? educationalBackground = null,
    Object? sibling = null,
    Object? roommate = null,
    Object? maritalHistory = null,
    Object? childSituation = null,
    Object? holidayType = null,
    Object? languages = null,
    Object? drinkingAlcohol = null,
    Object? smoking = null,
    Object? marriageAspiration = null,
    Object? childDesire = null,
    Object? houseWork = null,
    Object? datingPreference = null,
    Object? firstDateCostPreference = null,
    Object? firstDateLocationPreference = null,
    Object? tags = freezed,
  }) {
    return _then(_self.copyWith(
      introductory: null == introductory
          ? _self.introductory
          : introductory // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      ageText: null == ageText
          ? _self.ageText
          : ageText // ignore: cast_nullable_to_non_nullable
              as String,
      residence: null == residence
          ? _self.residence
          : residence // ignore: cast_nullable_to_non_nullable
              as String,
      bloodType: null == bloodType
          ? _self.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      birthplace: null == birthplace
          ? _self.birthplace
          : birthplace // ignore: cast_nullable_to_non_nullable
              as String,
      heightText: null == heightText
          ? _self.heightText
          : heightText // ignore: cast_nullable_to_non_nullable
              as String,
      bodyType: null == bodyType
          ? _self.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      sociability: null == sociability
          ? _self.sociability
          : sociability // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      commonlySaidPersonality: null == commonlySaidPersonality
          ? _self.commonlySaidPersonality
          : commonlySaidPersonality // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      sixteenPersonality: null == sixteenPersonality
          ? _self.sixteenPersonality
          : sixteenPersonality // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      occupation: null == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      workplace: null == workplace
          ? _self.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as String,
      salaryRange: null == salaryRange
          ? _self.salaryRange
          : salaryRange // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      educationalBackground: null == educationalBackground
          ? _self.educationalBackground
          : educationalBackground // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      sibling: null == sibling
          ? _self.sibling
          : sibling // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      roommate: null == roommate
          ? _self.roommate
          : roommate // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      maritalHistory: null == maritalHistory
          ? _self.maritalHistory
          : maritalHistory // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      childSituation: null == childSituation
          ? _self.childSituation
          : childSituation // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      holidayType: null == holidayType
          ? _self.holidayType
          : holidayType // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      languages: null == languages
          ? _self.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      drinkingAlcohol: null == drinkingAlcohol
          ? _self.drinkingAlcohol
          : drinkingAlcohol // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      smoking: null == smoking
          ? _self.smoking
          : smoking // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      marriageAspiration: null == marriageAspiration
          ? _self.marriageAspiration
          : marriageAspiration // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      childDesire: null == childDesire
          ? _self.childDesire
          : childDesire // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      houseWork: null == houseWork
          ? _self.houseWork
          : houseWork // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      datingPreference: null == datingPreference
          ? _self.datingPreference
          : datingPreference // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      firstDateCostPreference: null == firstDateCostPreference
          ? _self.firstDateCostPreference
          : firstDateCostPreference // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      firstDateLocationPreference: null == firstDateLocationPreference
          ? _self.firstDateLocationPreference
          : firstDateLocationPreference // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      tags: freezed == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UserTag>?,
    ));
  }
}

/// @nodoc

class _ProfileDetail extends ProfileDetail {
  const _ProfileDetail(
      {required this.introductory,
      required this.nickname,
      required this.ageText,
      required this.residence,
      required this.bloodType,
      required this.birthplace,
      required this.heightText,
      required this.bodyType,
      required this.sociability,
      required this.commonlySaidPersonality,
      required this.sixteenPersonality,
      required this.occupation,
      required this.workplace,
      required this.salaryRange,
      required this.educationalBackground,
      required this.sibling,
      required this.roommate,
      required this.maritalHistory,
      required this.childSituation,
      required this.holidayType,
      required this.languages,
      required this.drinkingAlcohol,
      required this.smoking,
      required this.marriageAspiration,
      required this.childDesire,
      required this.houseWork,
      required this.datingPreference,
      required this.firstDateCostPreference,
      required this.firstDateLocationPreference,
      required final List<UserTag>? tags})
      : _tags = tags,
        super._();

// 自己紹介
  @override
  final String introductory;
// 基本情報
  @override
  final String nickname;
  @override
  final String ageText;
  @override
  final String residence;
  @override
  final LabelKey bloodType;
  @override
  final String birthplace;
// 容姿
  @override
  final String heightText;
  @override
  final LabelKey bodyType;
// 性格
  @override
  final LabelKey sociability;
  @override
  final LabelKey commonlySaidPersonality;
  @override
  final LabelKey sixteenPersonality;
// 仕事・学歴
  @override
  final LabelKey occupation;
  @override
  final String workplace;
  @override
  final LabelKey salaryRange;
  @override
  final LabelKey educationalBackground;
// 生活・その他
  @override
  final LabelKey sibling;
  @override
  final LabelKey roommate;
  @override
  final LabelKey maritalHistory;
  @override
  final LabelKey childSituation;
  @override
  final LabelKey holidayType;
  @override
  final String languages;
  @override
  final LabelKey drinkingAlcohol;
  @override
  final LabelKey smoking;
// 将来
  @override
  final LabelKey marriageAspiration;
  @override
  final LabelKey childDesire;
  @override
  final LabelKey houseWork;
// 初回デート
  @override
  final LabelKey datingPreference;
  @override
  final LabelKey firstDateCostPreference;
  @override
  final LabelKey firstDateLocationPreference;
// タグ
  final List<UserTag>? _tags;
// タグ
  @override
  List<UserTag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileDetailCopyWith<_ProfileDetail> get copyWith =>
      __$ProfileDetailCopyWithImpl<_ProfileDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileDetail &&
            (identical(other.introductory, introductory) ||
                other.introductory == introductory) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.ageText, ageText) || other.ageText == ageText) &&
            (identical(other.residence, residence) ||
                other.residence == residence) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.birthplace, birthplace) ||
                other.birthplace == birthplace) &&
            (identical(other.heightText, heightText) ||
                other.heightText == heightText) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.sociability, sociability) ||
                other.sociability == sociability) &&
            (identical(
                    other.commonlySaidPersonality, commonlySaidPersonality) ||
                other.commonlySaidPersonality == commonlySaidPersonality) &&
            (identical(other.sixteenPersonality, sixteenPersonality) ||
                other.sixteenPersonality == sixteenPersonality) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.workplace, workplace) ||
                other.workplace == workplace) &&
            (identical(other.salaryRange, salaryRange) ||
                other.salaryRange == salaryRange) &&
            (identical(other.educationalBackground, educationalBackground) ||
                other.educationalBackground == educationalBackground) &&
            (identical(other.sibling, sibling) || other.sibling == sibling) &&
            (identical(other.roommate, roommate) ||
                other.roommate == roommate) &&
            (identical(other.maritalHistory, maritalHistory) ||
                other.maritalHistory == maritalHistory) &&
            (identical(other.childSituation, childSituation) ||
                other.childSituation == childSituation) &&
            (identical(other.holidayType, holidayType) ||
                other.holidayType == holidayType) &&
            (identical(other.languages, languages) ||
                other.languages == languages) &&
            (identical(other.drinkingAlcohol, drinkingAlcohol) ||
                other.drinkingAlcohol == drinkingAlcohol) &&
            (identical(other.smoking, smoking) || other.smoking == smoking) &&
            (identical(other.marriageAspiration, marriageAspiration) ||
                other.marriageAspiration == marriageAspiration) &&
            (identical(other.childDesire, childDesire) ||
                other.childDesire == childDesire) &&
            (identical(other.houseWork, houseWork) ||
                other.houseWork == houseWork) &&
            (identical(other.datingPreference, datingPreference) ||
                other.datingPreference == datingPreference) &&
            (identical(
                    other.firstDateCostPreference, firstDateCostPreference) ||
                other.firstDateCostPreference == firstDateCostPreference) &&
            (identical(other.firstDateLocationPreference,
                    firstDateLocationPreference) ||
                other.firstDateLocationPreference ==
                    firstDateLocationPreference) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        introductory,
        nickname,
        ageText,
        residence,
        bloodType,
        birthplace,
        heightText,
        bodyType,
        sociability,
        commonlySaidPersonality,
        sixteenPersonality,
        occupation,
        workplace,
        salaryRange,
        educationalBackground,
        sibling,
        roommate,
        maritalHistory,
        childSituation,
        holidayType,
        languages,
        drinkingAlcohol,
        smoking,
        marriageAspiration,
        childDesire,
        houseWork,
        datingPreference,
        firstDateCostPreference,
        firstDateLocationPreference,
        const DeepCollectionEquality().hash(_tags)
      ]);

  @override
  String toString() {
    return 'ProfileDetail(introductory: $introductory, nickname: $nickname, ageText: $ageText, residence: $residence, bloodType: $bloodType, birthplace: $birthplace, heightText: $heightText, bodyType: $bodyType, sociability: $sociability, commonlySaidPersonality: $commonlySaidPersonality, sixteenPersonality: $sixteenPersonality, occupation: $occupation, workplace: $workplace, salaryRange: $salaryRange, educationalBackground: $educationalBackground, sibling: $sibling, roommate: $roommate, maritalHistory: $maritalHistory, childSituation: $childSituation, holidayType: $holidayType, languages: $languages, drinkingAlcohol: $drinkingAlcohol, smoking: $smoking, marriageAspiration: $marriageAspiration, childDesire: $childDesire, houseWork: $houseWork, datingPreference: $datingPreference, firstDateCostPreference: $firstDateCostPreference, firstDateLocationPreference: $firstDateLocationPreference, tags: $tags)';
  }
}

/// @nodoc
abstract mixin class _$ProfileDetailCopyWith<$Res>
    implements $ProfileDetailCopyWith<$Res> {
  factory _$ProfileDetailCopyWith(
          _ProfileDetail value, $Res Function(_ProfileDetail) _then) =
      __$ProfileDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String introductory,
      String nickname,
      String ageText,
      String residence,
      LabelKey bloodType,
      String birthplace,
      String heightText,
      LabelKey bodyType,
      LabelKey sociability,
      LabelKey commonlySaidPersonality,
      LabelKey sixteenPersonality,
      LabelKey occupation,
      String workplace,
      LabelKey salaryRange,
      LabelKey educationalBackground,
      LabelKey sibling,
      LabelKey roommate,
      LabelKey maritalHistory,
      LabelKey childSituation,
      LabelKey holidayType,
      String languages,
      LabelKey drinkingAlcohol,
      LabelKey smoking,
      LabelKey marriageAspiration,
      LabelKey childDesire,
      LabelKey houseWork,
      LabelKey datingPreference,
      LabelKey firstDateCostPreference,
      LabelKey firstDateLocationPreference,
      List<UserTag>? tags});
}

/// @nodoc
class __$ProfileDetailCopyWithImpl<$Res>
    implements _$ProfileDetailCopyWith<$Res> {
  __$ProfileDetailCopyWithImpl(this._self, this._then);

  final _ProfileDetail _self;
  final $Res Function(_ProfileDetail) _then;

  /// Create a copy of ProfileDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? introductory = null,
    Object? nickname = null,
    Object? ageText = null,
    Object? residence = null,
    Object? bloodType = null,
    Object? birthplace = null,
    Object? heightText = null,
    Object? bodyType = null,
    Object? sociability = null,
    Object? commonlySaidPersonality = null,
    Object? sixteenPersonality = null,
    Object? occupation = null,
    Object? workplace = null,
    Object? salaryRange = null,
    Object? educationalBackground = null,
    Object? sibling = null,
    Object? roommate = null,
    Object? maritalHistory = null,
    Object? childSituation = null,
    Object? holidayType = null,
    Object? languages = null,
    Object? drinkingAlcohol = null,
    Object? smoking = null,
    Object? marriageAspiration = null,
    Object? childDesire = null,
    Object? houseWork = null,
    Object? datingPreference = null,
    Object? firstDateCostPreference = null,
    Object? firstDateLocationPreference = null,
    Object? tags = freezed,
  }) {
    return _then(_ProfileDetail(
      introductory: null == introductory
          ? _self.introductory
          : introductory // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      ageText: null == ageText
          ? _self.ageText
          : ageText // ignore: cast_nullable_to_non_nullable
              as String,
      residence: null == residence
          ? _self.residence
          : residence // ignore: cast_nullable_to_non_nullable
              as String,
      bloodType: null == bloodType
          ? _self.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      birthplace: null == birthplace
          ? _self.birthplace
          : birthplace // ignore: cast_nullable_to_non_nullable
              as String,
      heightText: null == heightText
          ? _self.heightText
          : heightText // ignore: cast_nullable_to_non_nullable
              as String,
      bodyType: null == bodyType
          ? _self.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      sociability: null == sociability
          ? _self.sociability
          : sociability // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      commonlySaidPersonality: null == commonlySaidPersonality
          ? _self.commonlySaidPersonality
          : commonlySaidPersonality // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      sixteenPersonality: null == sixteenPersonality
          ? _self.sixteenPersonality
          : sixteenPersonality // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      occupation: null == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      workplace: null == workplace
          ? _self.workplace
          : workplace // ignore: cast_nullable_to_non_nullable
              as String,
      salaryRange: null == salaryRange
          ? _self.salaryRange
          : salaryRange // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      educationalBackground: null == educationalBackground
          ? _self.educationalBackground
          : educationalBackground // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      sibling: null == sibling
          ? _self.sibling
          : sibling // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      roommate: null == roommate
          ? _self.roommate
          : roommate // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      maritalHistory: null == maritalHistory
          ? _self.maritalHistory
          : maritalHistory // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      childSituation: null == childSituation
          ? _self.childSituation
          : childSituation // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      holidayType: null == holidayType
          ? _self.holidayType
          : holidayType // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      languages: null == languages
          ? _self.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      drinkingAlcohol: null == drinkingAlcohol
          ? _self.drinkingAlcohol
          : drinkingAlcohol // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      smoking: null == smoking
          ? _self.smoking
          : smoking // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      marriageAspiration: null == marriageAspiration
          ? _self.marriageAspiration
          : marriageAspiration // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      childDesire: null == childDesire
          ? _self.childDesire
          : childDesire // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      houseWork: null == houseWork
          ? _self.houseWork
          : houseWork // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      datingPreference: null == datingPreference
          ? _self.datingPreference
          : datingPreference // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      firstDateCostPreference: null == firstDateCostPreference
          ? _self.firstDateCostPreference
          : firstDateCostPreference // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      firstDateLocationPreference: null == firstDateLocationPreference
          ? _self.firstDateLocationPreference
          : firstDateLocationPreference // ignore: cast_nullable_to_non_nullable
              as LabelKey,
      tags: freezed == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<UserTag>?,
    ));
  }
}

// dart format on
