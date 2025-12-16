// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegistrationRequiredFields {
  int? get genderIndex;
  int? get birthYear;
  int? get birthMonth;
  int? get birthDay;
  String? get nickname;
  Region? get residenceRegion;

  /// Create a copy of RegistrationRequiredFields
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegistrationRequiredFieldsCopyWith<RegistrationRequiredFields>
      get copyWith =>
          _$RegistrationRequiredFieldsCopyWithImpl<RegistrationRequiredFields>(
              this as RegistrationRequiredFields, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegistrationRequiredFields &&
            (identical(other.genderIndex, genderIndex) ||
                other.genderIndex == genderIndex) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.birthMonth, birthMonth) ||
                other.birthMonth == birthMonth) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.residenceRegion, residenceRegion) ||
                other.residenceRegion == residenceRegion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genderIndex, birthYear,
      birthMonth, birthDay, nickname, residenceRegion);

  @override
  String toString() {
    return 'RegistrationRequiredFields(genderIndex: $genderIndex, birthYear: $birthYear, birthMonth: $birthMonth, birthDay: $birthDay, nickname: $nickname, residenceRegion: $residenceRegion)';
  }
}

/// @nodoc
abstract mixin class $RegistrationRequiredFieldsCopyWith<$Res> {
  factory $RegistrationRequiredFieldsCopyWith(RegistrationRequiredFields value,
          $Res Function(RegistrationRequiredFields) _then) =
      _$RegistrationRequiredFieldsCopyWithImpl;
  @useResult
  $Res call(
      {int? genderIndex,
      int? birthYear,
      int? birthMonth,
      int? birthDay,
      String? nickname,
      Region? residenceRegion});
}

/// @nodoc
class _$RegistrationRequiredFieldsCopyWithImpl<$Res>
    implements $RegistrationRequiredFieldsCopyWith<$Res> {
  _$RegistrationRequiredFieldsCopyWithImpl(this._self, this._then);

  final RegistrationRequiredFields _self;
  final $Res Function(RegistrationRequiredFields) _then;

  /// Create a copy of RegistrationRequiredFields
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderIndex = freezed,
    Object? birthYear = freezed,
    Object? birthMonth = freezed,
    Object? birthDay = freezed,
    Object? nickname = freezed,
    Object? residenceRegion = freezed,
  }) {
    return _then(_self.copyWith(
      genderIndex: freezed == genderIndex
          ? _self.genderIndex
          : genderIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      birthYear: freezed == birthYear
          ? _self.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: freezed == birthMonth
          ? _self.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDay: freezed == birthDay
          ? _self.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      residenceRegion: freezed == residenceRegion
          ? _self.residenceRegion
          : residenceRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
    ));
  }
}

/// @nodoc

class _RegistrationRequiredFields extends RegistrationRequiredFields {
  const _RegistrationRequiredFields(
      {this.genderIndex,
      this.birthYear,
      this.birthMonth,
      this.birthDay,
      this.nickname,
      this.residenceRegion})
      : super._();

  @override
  final int? genderIndex;
  @override
  final int? birthYear;
  @override
  final int? birthMonth;
  @override
  final int? birthDay;
  @override
  final String? nickname;
  @override
  final Region? residenceRegion;

  /// Create a copy of RegistrationRequiredFields
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegistrationRequiredFieldsCopyWith<_RegistrationRequiredFields>
      get copyWith => __$RegistrationRequiredFieldsCopyWithImpl<
          _RegistrationRequiredFields>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegistrationRequiredFields &&
            (identical(other.genderIndex, genderIndex) ||
                other.genderIndex == genderIndex) &&
            (identical(other.birthYear, birthYear) ||
                other.birthYear == birthYear) &&
            (identical(other.birthMonth, birthMonth) ||
                other.birthMonth == birthMonth) &&
            (identical(other.birthDay, birthDay) ||
                other.birthDay == birthDay) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.residenceRegion, residenceRegion) ||
                other.residenceRegion == residenceRegion));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genderIndex, birthYear,
      birthMonth, birthDay, nickname, residenceRegion);

  @override
  String toString() {
    return 'RegistrationRequiredFields(genderIndex: $genderIndex, birthYear: $birthYear, birthMonth: $birthMonth, birthDay: $birthDay, nickname: $nickname, residenceRegion: $residenceRegion)';
  }
}

/// @nodoc
abstract mixin class _$RegistrationRequiredFieldsCopyWith<$Res>
    implements $RegistrationRequiredFieldsCopyWith<$Res> {
  factory _$RegistrationRequiredFieldsCopyWith(
          _RegistrationRequiredFields value,
          $Res Function(_RegistrationRequiredFields) _then) =
      __$RegistrationRequiredFieldsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? genderIndex,
      int? birthYear,
      int? birthMonth,
      int? birthDay,
      String? nickname,
      Region? residenceRegion});
}

/// @nodoc
class __$RegistrationRequiredFieldsCopyWithImpl<$Res>
    implements _$RegistrationRequiredFieldsCopyWith<$Res> {
  __$RegistrationRequiredFieldsCopyWithImpl(this._self, this._then);

  final _RegistrationRequiredFields _self;
  final $Res Function(_RegistrationRequiredFields) _then;

  /// Create a copy of RegistrationRequiredFields
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? genderIndex = freezed,
    Object? birthYear = freezed,
    Object? birthMonth = freezed,
    Object? birthDay = freezed,
    Object? nickname = freezed,
    Object? residenceRegion = freezed,
  }) {
    return _then(_RegistrationRequiredFields(
      genderIndex: freezed == genderIndex
          ? _self.genderIndex
          : genderIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      birthYear: freezed == birthYear
          ? _self.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: freezed == birthMonth
          ? _self.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDay: freezed == birthDay
          ? _self.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      nickname: freezed == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      residenceRegion: freezed == residenceRegion
          ? _self.residenceRegion
          : residenceRegion // ignore: cast_nullable_to_non_nullable
              as Region?,
    ));
  }
}

/// @nodoc
mixin _$RegistrationOptionalCodes {
  int? get height;
  BodyTypeCode? get bodyTypeCode;
  OccupationCode? get occupationCode;
  SalaryRangeCode? get salaryRangeCode;
  MaritalHistoryCode? get maritalHistoryCode;
  ChildSituationCode? get childSituationCode;
  HolidayTypeCode? get holidayTypeCode;
  SmokingCode? get smokingCode;
  MarriageAspirationCode? get marriageAspirationCode;
  ChildDesireCode? get childDesireCode;

  /// Create a copy of RegistrationOptionalCodes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegistrationOptionalCodesCopyWith<RegistrationOptionalCodes> get copyWith =>
      _$RegistrationOptionalCodesCopyWithImpl<RegistrationOptionalCodes>(
          this as RegistrationOptionalCodes, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegistrationOptionalCodes &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.bodyTypeCode, bodyTypeCode) ||
                other.bodyTypeCode == bodyTypeCode) &&
            (identical(other.occupationCode, occupationCode) ||
                other.occupationCode == occupationCode) &&
            (identical(other.salaryRangeCode, salaryRangeCode) ||
                other.salaryRangeCode == salaryRangeCode) &&
            (identical(other.maritalHistoryCode, maritalHistoryCode) ||
                other.maritalHistoryCode == maritalHistoryCode) &&
            (identical(other.childSituationCode, childSituationCode) ||
                other.childSituationCode == childSituationCode) &&
            (identical(other.holidayTypeCode, holidayTypeCode) ||
                other.holidayTypeCode == holidayTypeCode) &&
            (identical(other.smokingCode, smokingCode) ||
                other.smokingCode == smokingCode) &&
            (identical(other.marriageAspirationCode, marriageAspirationCode) ||
                other.marriageAspirationCode == marriageAspirationCode) &&
            (identical(other.childDesireCode, childDesireCode) ||
                other.childDesireCode == childDesireCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      height,
      bodyTypeCode,
      occupationCode,
      salaryRangeCode,
      maritalHistoryCode,
      childSituationCode,
      holidayTypeCode,
      smokingCode,
      marriageAspirationCode,
      childDesireCode);

  @override
  String toString() {
    return 'RegistrationOptionalCodes(height: $height, bodyTypeCode: $bodyTypeCode, occupationCode: $occupationCode, salaryRangeCode: $salaryRangeCode, maritalHistoryCode: $maritalHistoryCode, childSituationCode: $childSituationCode, holidayTypeCode: $holidayTypeCode, smokingCode: $smokingCode, marriageAspirationCode: $marriageAspirationCode, childDesireCode: $childDesireCode)';
  }
}

/// @nodoc
abstract mixin class $RegistrationOptionalCodesCopyWith<$Res> {
  factory $RegistrationOptionalCodesCopyWith(RegistrationOptionalCodes value,
          $Res Function(RegistrationOptionalCodes) _then) =
      _$RegistrationOptionalCodesCopyWithImpl;
  @useResult
  $Res call(
      {int? height,
      BodyTypeCode? bodyTypeCode,
      OccupationCode? occupationCode,
      SalaryRangeCode? salaryRangeCode,
      MaritalHistoryCode? maritalHistoryCode,
      ChildSituationCode? childSituationCode,
      HolidayTypeCode? holidayTypeCode,
      SmokingCode? smokingCode,
      MarriageAspirationCode? marriageAspirationCode,
      ChildDesireCode? childDesireCode});
}

/// @nodoc
class _$RegistrationOptionalCodesCopyWithImpl<$Res>
    implements $RegistrationOptionalCodesCopyWith<$Res> {
  _$RegistrationOptionalCodesCopyWithImpl(this._self, this._then);

  final RegistrationOptionalCodes _self;
  final $Res Function(RegistrationOptionalCodes) _then;

  /// Create a copy of RegistrationOptionalCodes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = freezed,
    Object? bodyTypeCode = freezed,
    Object? occupationCode = freezed,
    Object? salaryRangeCode = freezed,
    Object? maritalHistoryCode = freezed,
    Object? childSituationCode = freezed,
    Object? holidayTypeCode = freezed,
    Object? smokingCode = freezed,
    Object? marriageAspirationCode = freezed,
    Object? childDesireCode = freezed,
  }) {
    return _then(_self.copyWith(
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      bodyTypeCode: freezed == bodyTypeCode
          ? _self.bodyTypeCode
          : bodyTypeCode // ignore: cast_nullable_to_non_nullable
              as BodyTypeCode?,
      occupationCode: freezed == occupationCode
          ? _self.occupationCode
          : occupationCode // ignore: cast_nullable_to_non_nullable
              as OccupationCode?,
      salaryRangeCode: freezed == salaryRangeCode
          ? _self.salaryRangeCode
          : salaryRangeCode // ignore: cast_nullable_to_non_nullable
              as SalaryRangeCode?,
      maritalHistoryCode: freezed == maritalHistoryCode
          ? _self.maritalHistoryCode
          : maritalHistoryCode // ignore: cast_nullable_to_non_nullable
              as MaritalHistoryCode?,
      childSituationCode: freezed == childSituationCode
          ? _self.childSituationCode
          : childSituationCode // ignore: cast_nullable_to_non_nullable
              as ChildSituationCode?,
      holidayTypeCode: freezed == holidayTypeCode
          ? _self.holidayTypeCode
          : holidayTypeCode // ignore: cast_nullable_to_non_nullable
              as HolidayTypeCode?,
      smokingCode: freezed == smokingCode
          ? _self.smokingCode
          : smokingCode // ignore: cast_nullable_to_non_nullable
              as SmokingCode?,
      marriageAspirationCode: freezed == marriageAspirationCode
          ? _self.marriageAspirationCode
          : marriageAspirationCode // ignore: cast_nullable_to_non_nullable
              as MarriageAspirationCode?,
      childDesireCode: freezed == childDesireCode
          ? _self.childDesireCode
          : childDesireCode // ignore: cast_nullable_to_non_nullable
              as ChildDesireCode?,
    ));
  }
}

/// @nodoc

class _RegistrationOptionalCodes implements RegistrationOptionalCodes {
  const _RegistrationOptionalCodes(
      {this.height,
      this.bodyTypeCode,
      this.occupationCode,
      this.salaryRangeCode,
      this.maritalHistoryCode,
      this.childSituationCode,
      this.holidayTypeCode,
      this.smokingCode,
      this.marriageAspirationCode,
      this.childDesireCode});

  @override
  final int? height;
  @override
  final BodyTypeCode? bodyTypeCode;
  @override
  final OccupationCode? occupationCode;
  @override
  final SalaryRangeCode? salaryRangeCode;
  @override
  final MaritalHistoryCode? maritalHistoryCode;
  @override
  final ChildSituationCode? childSituationCode;
  @override
  final HolidayTypeCode? holidayTypeCode;
  @override
  final SmokingCode? smokingCode;
  @override
  final MarriageAspirationCode? marriageAspirationCode;
  @override
  final ChildDesireCode? childDesireCode;

  /// Create a copy of RegistrationOptionalCodes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegistrationOptionalCodesCopyWith<_RegistrationOptionalCodes>
      get copyWith =>
          __$RegistrationOptionalCodesCopyWithImpl<_RegistrationOptionalCodes>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegistrationOptionalCodes &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.bodyTypeCode, bodyTypeCode) ||
                other.bodyTypeCode == bodyTypeCode) &&
            (identical(other.occupationCode, occupationCode) ||
                other.occupationCode == occupationCode) &&
            (identical(other.salaryRangeCode, salaryRangeCode) ||
                other.salaryRangeCode == salaryRangeCode) &&
            (identical(other.maritalHistoryCode, maritalHistoryCode) ||
                other.maritalHistoryCode == maritalHistoryCode) &&
            (identical(other.childSituationCode, childSituationCode) ||
                other.childSituationCode == childSituationCode) &&
            (identical(other.holidayTypeCode, holidayTypeCode) ||
                other.holidayTypeCode == holidayTypeCode) &&
            (identical(other.smokingCode, smokingCode) ||
                other.smokingCode == smokingCode) &&
            (identical(other.marriageAspirationCode, marriageAspirationCode) ||
                other.marriageAspirationCode == marriageAspirationCode) &&
            (identical(other.childDesireCode, childDesireCode) ||
                other.childDesireCode == childDesireCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      height,
      bodyTypeCode,
      occupationCode,
      salaryRangeCode,
      maritalHistoryCode,
      childSituationCode,
      holidayTypeCode,
      smokingCode,
      marriageAspirationCode,
      childDesireCode);

  @override
  String toString() {
    return 'RegistrationOptionalCodes(height: $height, bodyTypeCode: $bodyTypeCode, occupationCode: $occupationCode, salaryRangeCode: $salaryRangeCode, maritalHistoryCode: $maritalHistoryCode, childSituationCode: $childSituationCode, holidayTypeCode: $holidayTypeCode, smokingCode: $smokingCode, marriageAspirationCode: $marriageAspirationCode, childDesireCode: $childDesireCode)';
  }
}

/// @nodoc
abstract mixin class _$RegistrationOptionalCodesCopyWith<$Res>
    implements $RegistrationOptionalCodesCopyWith<$Res> {
  factory _$RegistrationOptionalCodesCopyWith(_RegistrationOptionalCodes value,
          $Res Function(_RegistrationOptionalCodes) _then) =
      __$RegistrationOptionalCodesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? height,
      BodyTypeCode? bodyTypeCode,
      OccupationCode? occupationCode,
      SalaryRangeCode? salaryRangeCode,
      MaritalHistoryCode? maritalHistoryCode,
      ChildSituationCode? childSituationCode,
      HolidayTypeCode? holidayTypeCode,
      SmokingCode? smokingCode,
      MarriageAspirationCode? marriageAspirationCode,
      ChildDesireCode? childDesireCode});
}

/// @nodoc
class __$RegistrationOptionalCodesCopyWithImpl<$Res>
    implements _$RegistrationOptionalCodesCopyWith<$Res> {
  __$RegistrationOptionalCodesCopyWithImpl(this._self, this._then);

  final _RegistrationOptionalCodes _self;
  final $Res Function(_RegistrationOptionalCodes) _then;

  /// Create a copy of RegistrationOptionalCodes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? height = freezed,
    Object? bodyTypeCode = freezed,
    Object? occupationCode = freezed,
    Object? salaryRangeCode = freezed,
    Object? maritalHistoryCode = freezed,
    Object? childSituationCode = freezed,
    Object? holidayTypeCode = freezed,
    Object? smokingCode = freezed,
    Object? marriageAspirationCode = freezed,
    Object? childDesireCode = freezed,
  }) {
    return _then(_RegistrationOptionalCodes(
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      bodyTypeCode: freezed == bodyTypeCode
          ? _self.bodyTypeCode
          : bodyTypeCode // ignore: cast_nullable_to_non_nullable
              as BodyTypeCode?,
      occupationCode: freezed == occupationCode
          ? _self.occupationCode
          : occupationCode // ignore: cast_nullable_to_non_nullable
              as OccupationCode?,
      salaryRangeCode: freezed == salaryRangeCode
          ? _self.salaryRangeCode
          : salaryRangeCode // ignore: cast_nullable_to_non_nullable
              as SalaryRangeCode?,
      maritalHistoryCode: freezed == maritalHistoryCode
          ? _self.maritalHistoryCode
          : maritalHistoryCode // ignore: cast_nullable_to_non_nullable
              as MaritalHistoryCode?,
      childSituationCode: freezed == childSituationCode
          ? _self.childSituationCode
          : childSituationCode // ignore: cast_nullable_to_non_nullable
              as ChildSituationCode?,
      holidayTypeCode: freezed == holidayTypeCode
          ? _self.holidayTypeCode
          : holidayTypeCode // ignore: cast_nullable_to_non_nullable
              as HolidayTypeCode?,
      smokingCode: freezed == smokingCode
          ? _self.smokingCode
          : smokingCode // ignore: cast_nullable_to_non_nullable
              as SmokingCode?,
      marriageAspirationCode: freezed == marriageAspirationCode
          ? _self.marriageAspirationCode
          : marriageAspirationCode // ignore: cast_nullable_to_non_nullable
              as MarriageAspirationCode?,
      childDesireCode: freezed == childDesireCode
          ? _self.childDesireCode
          : childDesireCode // ignore: cast_nullable_to_non_nullable
              as ChildDesireCode?,
    ));
  }
}

// dart format on
