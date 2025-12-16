// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ideal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdealUserPersonality {
  int get medianAge;
  int get medianHeight;
  BodyTypeCode? get bodyTypeCode;
  SalaryRangeCode? get salaryRangeCode;

  /// Create a copy of IdealUserPersonality
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IdealUserPersonalityCopyWith<IdealUserPersonality> get copyWith =>
      _$IdealUserPersonalityCopyWithImpl<IdealUserPersonality>(
          this as IdealUserPersonality, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IdealUserPersonality &&
            (identical(other.medianAge, medianAge) ||
                other.medianAge == medianAge) &&
            (identical(other.medianHeight, medianHeight) ||
                other.medianHeight == medianHeight) &&
            (identical(other.bodyTypeCode, bodyTypeCode) ||
                other.bodyTypeCode == bodyTypeCode) &&
            (identical(other.salaryRangeCode, salaryRangeCode) ||
                other.salaryRangeCode == salaryRangeCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, medianAge, medianHeight, bodyTypeCode, salaryRangeCode);

  @override
  String toString() {
    return 'IdealUserPersonality(medianAge: $medianAge, medianHeight: $medianHeight, bodyTypeCode: $bodyTypeCode, salaryRangeCode: $salaryRangeCode)';
  }
}

/// @nodoc
abstract mixin class $IdealUserPersonalityCopyWith<$Res> {
  factory $IdealUserPersonalityCopyWith(IdealUserPersonality value,
          $Res Function(IdealUserPersonality) _then) =
      _$IdealUserPersonalityCopyWithImpl;
  @useResult
  $Res call(
      {int medianAge,
      int medianHeight,
      BodyTypeCode? bodyTypeCode,
      SalaryRangeCode? salaryRangeCode});
}

/// @nodoc
class _$IdealUserPersonalityCopyWithImpl<$Res>
    implements $IdealUserPersonalityCopyWith<$Res> {
  _$IdealUserPersonalityCopyWithImpl(this._self, this._then);

  final IdealUserPersonality _self;
  final $Res Function(IdealUserPersonality) _then;

  /// Create a copy of IdealUserPersonality
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? medianAge = null,
    Object? medianHeight = null,
    Object? bodyTypeCode = freezed,
    Object? salaryRangeCode = freezed,
  }) {
    return _then(_self.copyWith(
      medianAge: null == medianAge
          ? _self.medianAge
          : medianAge // ignore: cast_nullable_to_non_nullable
              as int,
      medianHeight: null == medianHeight
          ? _self.medianHeight
          : medianHeight // ignore: cast_nullable_to_non_nullable
              as int,
      bodyTypeCode: freezed == bodyTypeCode
          ? _self.bodyTypeCode
          : bodyTypeCode // ignore: cast_nullable_to_non_nullable
              as BodyTypeCode?,
      salaryRangeCode: freezed == salaryRangeCode
          ? _self.salaryRangeCode
          : salaryRangeCode // ignore: cast_nullable_to_non_nullable
              as SalaryRangeCode?,
    ));
  }
}

/// @nodoc

class _IdealUserPersonality implements IdealUserPersonality {
  const _IdealUserPersonality(
      {required this.medianAge,
      required this.medianHeight,
      required this.bodyTypeCode,
      required this.salaryRangeCode});

  @override
  final int medianAge;
  @override
  final int medianHeight;
  @override
  final BodyTypeCode? bodyTypeCode;
  @override
  final SalaryRangeCode? salaryRangeCode;

  /// Create a copy of IdealUserPersonality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IdealUserPersonalityCopyWith<_IdealUserPersonality> get copyWith =>
      __$IdealUserPersonalityCopyWithImpl<_IdealUserPersonality>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdealUserPersonality &&
            (identical(other.medianAge, medianAge) ||
                other.medianAge == medianAge) &&
            (identical(other.medianHeight, medianHeight) ||
                other.medianHeight == medianHeight) &&
            (identical(other.bodyTypeCode, bodyTypeCode) ||
                other.bodyTypeCode == bodyTypeCode) &&
            (identical(other.salaryRangeCode, salaryRangeCode) ||
                other.salaryRangeCode == salaryRangeCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, medianAge, medianHeight, bodyTypeCode, salaryRangeCode);

  @override
  String toString() {
    return 'IdealUserPersonality(medianAge: $medianAge, medianHeight: $medianHeight, bodyTypeCode: $bodyTypeCode, salaryRangeCode: $salaryRangeCode)';
  }
}

/// @nodoc
abstract mixin class _$IdealUserPersonalityCopyWith<$Res>
    implements $IdealUserPersonalityCopyWith<$Res> {
  factory _$IdealUserPersonalityCopyWith(_IdealUserPersonality value,
          $Res Function(_IdealUserPersonality) _then) =
      __$IdealUserPersonalityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int medianAge,
      int medianHeight,
      BodyTypeCode? bodyTypeCode,
      SalaryRangeCode? salaryRangeCode});
}

/// @nodoc
class __$IdealUserPersonalityCopyWithImpl<$Res>
    implements _$IdealUserPersonalityCopyWith<$Res> {
  __$IdealUserPersonalityCopyWithImpl(this._self, this._then);

  final _IdealUserPersonality _self;
  final $Res Function(_IdealUserPersonality) _then;

  /// Create a copy of IdealUserPersonality
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? medianAge = null,
    Object? medianHeight = null,
    Object? bodyTypeCode = freezed,
    Object? salaryRangeCode = freezed,
  }) {
    return _then(_IdealUserPersonality(
      medianAge: null == medianAge
          ? _self.medianAge
          : medianAge // ignore: cast_nullable_to_non_nullable
              as int,
      medianHeight: null == medianHeight
          ? _self.medianHeight
          : medianHeight // ignore: cast_nullable_to_non_nullable
              as int,
      bodyTypeCode: freezed == bodyTypeCode
          ? _self.bodyTypeCode
          : bodyTypeCode // ignore: cast_nullable_to_non_nullable
              as BodyTypeCode?,
      salaryRangeCode: freezed == salaryRangeCode
          ? _self.salaryRangeCode
          : salaryRangeCode // ignore: cast_nullable_to_non_nullable
              as SalaryRangeCode?,
    ));
  }
}

/// @nodoc
mixin _$IdealAdvice {
  String get adviceMessage;
  IdealUserPersonality? get userSimplifiedPersonality;
  IdealUserPersonality? get toUserSimplifiedPersonality;
  IdealUserPersonality? get sameGenderSameGenerationIdealPersonality;

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IdealAdviceCopyWith<IdealAdvice> get copyWith =>
      _$IdealAdviceCopyWithImpl<IdealAdvice>(this as IdealAdvice, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IdealAdvice &&
            (identical(other.adviceMessage, adviceMessage) ||
                other.adviceMessage == adviceMessage) &&
            (identical(other.userSimplifiedPersonality,
                    userSimplifiedPersonality) ||
                other.userSimplifiedPersonality == userSimplifiedPersonality) &&
            (identical(other.toUserSimplifiedPersonality,
                    toUserSimplifiedPersonality) ||
                other.toUserSimplifiedPersonality ==
                    toUserSimplifiedPersonality) &&
            (identical(other.sameGenderSameGenerationIdealPersonality,
                    sameGenderSameGenerationIdealPersonality) ||
                other.sameGenderSameGenerationIdealPersonality ==
                    sameGenderSameGenerationIdealPersonality));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      adviceMessage,
      userSimplifiedPersonality,
      toUserSimplifiedPersonality,
      sameGenderSameGenerationIdealPersonality);

  @override
  String toString() {
    return 'IdealAdvice(adviceMessage: $adviceMessage, userSimplifiedPersonality: $userSimplifiedPersonality, toUserSimplifiedPersonality: $toUserSimplifiedPersonality, sameGenderSameGenerationIdealPersonality: $sameGenderSameGenerationIdealPersonality)';
  }
}

/// @nodoc
abstract mixin class $IdealAdviceCopyWith<$Res> {
  factory $IdealAdviceCopyWith(
          IdealAdvice value, $Res Function(IdealAdvice) _then) =
      _$IdealAdviceCopyWithImpl;
  @useResult
  $Res call(
      {String adviceMessage,
      IdealUserPersonality? userSimplifiedPersonality,
      IdealUserPersonality? toUserSimplifiedPersonality,
      IdealUserPersonality? sameGenderSameGenerationIdealPersonality});

  $IdealUserPersonalityCopyWith<$Res>? get userSimplifiedPersonality;
  $IdealUserPersonalityCopyWith<$Res>? get toUserSimplifiedPersonality;
  $IdealUserPersonalityCopyWith<$Res>?
      get sameGenderSameGenerationIdealPersonality;
}

/// @nodoc
class _$IdealAdviceCopyWithImpl<$Res> implements $IdealAdviceCopyWith<$Res> {
  _$IdealAdviceCopyWithImpl(this._self, this._then);

  final IdealAdvice _self;
  final $Res Function(IdealAdvice) _then;

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adviceMessage = null,
    Object? userSimplifiedPersonality = freezed,
    Object? toUserSimplifiedPersonality = freezed,
    Object? sameGenderSameGenerationIdealPersonality = freezed,
  }) {
    return _then(_self.copyWith(
      adviceMessage: null == adviceMessage
          ? _self.adviceMessage
          : adviceMessage // ignore: cast_nullable_to_non_nullable
              as String,
      userSimplifiedPersonality: freezed == userSimplifiedPersonality
          ? _self.userSimplifiedPersonality
          : userSimplifiedPersonality // ignore: cast_nullable_to_non_nullable
              as IdealUserPersonality?,
      toUserSimplifiedPersonality: freezed == toUserSimplifiedPersonality
          ? _self.toUserSimplifiedPersonality
          : toUserSimplifiedPersonality // ignore: cast_nullable_to_non_nullable
              as IdealUserPersonality?,
      sameGenderSameGenerationIdealPersonality: freezed ==
              sameGenderSameGenerationIdealPersonality
          ? _self.sameGenderSameGenerationIdealPersonality
          : sameGenderSameGenerationIdealPersonality // ignore: cast_nullable_to_non_nullable
              as IdealUserPersonality?,
    ));
  }

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdealUserPersonalityCopyWith<$Res>? get userSimplifiedPersonality {
    if (_self.userSimplifiedPersonality == null) {
      return null;
    }

    return $IdealUserPersonalityCopyWith<$Res>(_self.userSimplifiedPersonality!,
        (value) {
      return _then(_self.copyWith(userSimplifiedPersonality: value));
    });
  }

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdealUserPersonalityCopyWith<$Res>? get toUserSimplifiedPersonality {
    if (_self.toUserSimplifiedPersonality == null) {
      return null;
    }

    return $IdealUserPersonalityCopyWith<$Res>(
        _self.toUserSimplifiedPersonality!, (value) {
      return _then(_self.copyWith(toUserSimplifiedPersonality: value));
    });
  }

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdealUserPersonalityCopyWith<$Res>?
      get sameGenderSameGenerationIdealPersonality {
    if (_self.sameGenderSameGenerationIdealPersonality == null) {
      return null;
    }

    return $IdealUserPersonalityCopyWith<$Res>(
        _self.sameGenderSameGenerationIdealPersonality!, (value) {
      return _then(
          _self.copyWith(sameGenderSameGenerationIdealPersonality: value));
    });
  }
}

/// @nodoc

class _IdealAdvice implements IdealAdvice {
  const _IdealAdvice(
      {required this.adviceMessage,
      required this.userSimplifiedPersonality,
      required this.toUserSimplifiedPersonality,
      required this.sameGenderSameGenerationIdealPersonality});

  @override
  final String adviceMessage;
  @override
  final IdealUserPersonality? userSimplifiedPersonality;
  @override
  final IdealUserPersonality? toUserSimplifiedPersonality;
  @override
  final IdealUserPersonality? sameGenderSameGenerationIdealPersonality;

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IdealAdviceCopyWith<_IdealAdvice> get copyWith =>
      __$IdealAdviceCopyWithImpl<_IdealAdvice>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IdealAdvice &&
            (identical(other.adviceMessage, adviceMessage) ||
                other.adviceMessage == adviceMessage) &&
            (identical(other.userSimplifiedPersonality,
                    userSimplifiedPersonality) ||
                other.userSimplifiedPersonality == userSimplifiedPersonality) &&
            (identical(other.toUserSimplifiedPersonality,
                    toUserSimplifiedPersonality) ||
                other.toUserSimplifiedPersonality ==
                    toUserSimplifiedPersonality) &&
            (identical(other.sameGenderSameGenerationIdealPersonality,
                    sameGenderSameGenerationIdealPersonality) ||
                other.sameGenderSameGenerationIdealPersonality ==
                    sameGenderSameGenerationIdealPersonality));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      adviceMessage,
      userSimplifiedPersonality,
      toUserSimplifiedPersonality,
      sameGenderSameGenerationIdealPersonality);

  @override
  String toString() {
    return 'IdealAdvice(adviceMessage: $adviceMessage, userSimplifiedPersonality: $userSimplifiedPersonality, toUserSimplifiedPersonality: $toUserSimplifiedPersonality, sameGenderSameGenerationIdealPersonality: $sameGenderSameGenerationIdealPersonality)';
  }
}

/// @nodoc
abstract mixin class _$IdealAdviceCopyWith<$Res>
    implements $IdealAdviceCopyWith<$Res> {
  factory _$IdealAdviceCopyWith(
          _IdealAdvice value, $Res Function(_IdealAdvice) _then) =
      __$IdealAdviceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String adviceMessage,
      IdealUserPersonality? userSimplifiedPersonality,
      IdealUserPersonality? toUserSimplifiedPersonality,
      IdealUserPersonality? sameGenderSameGenerationIdealPersonality});

  @override
  $IdealUserPersonalityCopyWith<$Res>? get userSimplifiedPersonality;
  @override
  $IdealUserPersonalityCopyWith<$Res>? get toUserSimplifiedPersonality;
  @override
  $IdealUserPersonalityCopyWith<$Res>?
      get sameGenderSameGenerationIdealPersonality;
}

/// @nodoc
class __$IdealAdviceCopyWithImpl<$Res> implements _$IdealAdviceCopyWith<$Res> {
  __$IdealAdviceCopyWithImpl(this._self, this._then);

  final _IdealAdvice _self;
  final $Res Function(_IdealAdvice) _then;

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? adviceMessage = null,
    Object? userSimplifiedPersonality = freezed,
    Object? toUserSimplifiedPersonality = freezed,
    Object? sameGenderSameGenerationIdealPersonality = freezed,
  }) {
    return _then(_IdealAdvice(
      adviceMessage: null == adviceMessage
          ? _self.adviceMessage
          : adviceMessage // ignore: cast_nullable_to_non_nullable
              as String,
      userSimplifiedPersonality: freezed == userSimplifiedPersonality
          ? _self.userSimplifiedPersonality
          : userSimplifiedPersonality // ignore: cast_nullable_to_non_nullable
              as IdealUserPersonality?,
      toUserSimplifiedPersonality: freezed == toUserSimplifiedPersonality
          ? _self.toUserSimplifiedPersonality
          : toUserSimplifiedPersonality // ignore: cast_nullable_to_non_nullable
              as IdealUserPersonality?,
      sameGenderSameGenerationIdealPersonality: freezed ==
              sameGenderSameGenerationIdealPersonality
          ? _self.sameGenderSameGenerationIdealPersonality
          : sameGenderSameGenerationIdealPersonality // ignore: cast_nullable_to_non_nullable
              as IdealUserPersonality?,
    ));
  }

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdealUserPersonalityCopyWith<$Res>? get userSimplifiedPersonality {
    if (_self.userSimplifiedPersonality == null) {
      return null;
    }

    return $IdealUserPersonalityCopyWith<$Res>(_self.userSimplifiedPersonality!,
        (value) {
      return _then(_self.copyWith(userSimplifiedPersonality: value));
    });
  }

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdealUserPersonalityCopyWith<$Res>? get toUserSimplifiedPersonality {
    if (_self.toUserSimplifiedPersonality == null) {
      return null;
    }

    return $IdealUserPersonalityCopyWith<$Res>(
        _self.toUserSimplifiedPersonality!, (value) {
      return _then(_self.copyWith(toUserSimplifiedPersonality: value));
    });
  }

  /// Create a copy of IdealAdvice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IdealUserPersonalityCopyWith<$Res>?
      get sameGenderSameGenerationIdealPersonality {
    if (_self.sameGenderSameGenerationIdealPersonality == null) {
      return null;
    }

    return $IdealUserPersonalityCopyWith<$Res>(
        _self.sameGenderSameGenerationIdealPersonality!, (value) {
      return _then(
          _self.copyWith(sameGenderSameGenerationIdealPersonality: value));
    });
  }
}

// dart format on
