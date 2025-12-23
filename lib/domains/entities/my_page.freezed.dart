// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyPageData {
  Profile get profile;
  SubscriptionTier get subscriptionTier;
  CertificateLevel get certificateLevel;
  int get matchingPoint;
  int get lavigationPoint;
  int? get hasLikePoint;

  /// Create a copy of MyPageData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MyPageDataCopyWith<MyPageData> get copyWith =>
      _$MyPageDataCopyWithImpl<MyPageData>(this as MyPageData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MyPageData &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.subscriptionTier, subscriptionTier) ||
                other.subscriptionTier == subscriptionTier) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.matchingPoint, matchingPoint) ||
                other.matchingPoint == matchingPoint) &&
            (identical(other.lavigationPoint, lavigationPoint) ||
                other.lavigationPoint == lavigationPoint) &&
            (identical(other.hasLikePoint, hasLikePoint) ||
                other.hasLikePoint == hasLikePoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, subscriptionTier,
      certificateLevel, matchingPoint, lavigationPoint, hasLikePoint);

  @override
  String toString() {
    return 'MyPageData(profile: $profile, subscriptionTier: $subscriptionTier, certificateLevel: $certificateLevel, matchingPoint: $matchingPoint, lavigationPoint: $lavigationPoint, hasLikePoint: $hasLikePoint)';
  }
}

/// @nodoc
abstract mixin class $MyPageDataCopyWith<$Res> {
  factory $MyPageDataCopyWith(
          MyPageData value, $Res Function(MyPageData) _then) =
      _$MyPageDataCopyWithImpl;
  @useResult
  $Res call(
      {Profile profile,
      SubscriptionTier subscriptionTier,
      CertificateLevel certificateLevel,
      int matchingPoint,
      int lavigationPoint,
      int? hasLikePoint});
}

/// @nodoc
class _$MyPageDataCopyWithImpl<$Res> implements $MyPageDataCopyWith<$Res> {
  _$MyPageDataCopyWithImpl(this._self, this._then);

  final MyPageData _self;
  final $Res Function(MyPageData) _then;

  /// Create a copy of MyPageData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? subscriptionTier = null,
    Object? certificateLevel = null,
    Object? matchingPoint = null,
    Object? lavigationPoint = null,
    Object? hasLikePoint = freezed,
  }) {
    return _then(_self.copyWith(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      subscriptionTier: null == subscriptionTier
          ? _self.subscriptionTier
          : subscriptionTier // ignore: cast_nullable_to_non_nullable
              as SubscriptionTier,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      matchingPoint: null == matchingPoint
          ? _self.matchingPoint
          : matchingPoint // ignore: cast_nullable_to_non_nullable
              as int,
      lavigationPoint: null == lavigationPoint
          ? _self.lavigationPoint
          : lavigationPoint // ignore: cast_nullable_to_non_nullable
              as int,
      hasLikePoint: freezed == hasLikePoint
          ? _self.hasLikePoint
          : hasLikePoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _MyPageData extends MyPageData {
  const _MyPageData(
      {required this.profile,
      required this.subscriptionTier,
      required this.certificateLevel,
      required this.matchingPoint,
      required this.lavigationPoint,
      this.hasLikePoint})
      : super._();

  @override
  final Profile profile;
  @override
  final SubscriptionTier subscriptionTier;
  @override
  final CertificateLevel certificateLevel;
  @override
  final int matchingPoint;
  @override
  final int lavigationPoint;
  @override
  final int? hasLikePoint;

  /// Create a copy of MyPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MyPageDataCopyWith<_MyPageData> get copyWith =>
      __$MyPageDataCopyWithImpl<_MyPageData>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MyPageData &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.subscriptionTier, subscriptionTier) ||
                other.subscriptionTier == subscriptionTier) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.matchingPoint, matchingPoint) ||
                other.matchingPoint == matchingPoint) &&
            (identical(other.lavigationPoint, lavigationPoint) ||
                other.lavigationPoint == lavigationPoint) &&
            (identical(other.hasLikePoint, hasLikePoint) ||
                other.hasLikePoint == hasLikePoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, subscriptionTier,
      certificateLevel, matchingPoint, lavigationPoint, hasLikePoint);

  @override
  String toString() {
    return 'MyPageData(profile: $profile, subscriptionTier: $subscriptionTier, certificateLevel: $certificateLevel, matchingPoint: $matchingPoint, lavigationPoint: $lavigationPoint, hasLikePoint: $hasLikePoint)';
  }
}

/// @nodoc
abstract mixin class _$MyPageDataCopyWith<$Res>
    implements $MyPageDataCopyWith<$Res> {
  factory _$MyPageDataCopyWith(
          _MyPageData value, $Res Function(_MyPageData) _then) =
      __$MyPageDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Profile profile,
      SubscriptionTier subscriptionTier,
      CertificateLevel certificateLevel,
      int matchingPoint,
      int lavigationPoint,
      int? hasLikePoint});
}

/// @nodoc
class __$MyPageDataCopyWithImpl<$Res> implements _$MyPageDataCopyWith<$Res> {
  __$MyPageDataCopyWithImpl(this._self, this._then);

  final _MyPageData _self;
  final $Res Function(_MyPageData) _then;

  /// Create a copy of MyPageData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
    Object? subscriptionTier = null,
    Object? certificateLevel = null,
    Object? matchingPoint = null,
    Object? lavigationPoint = null,
    Object? hasLikePoint = freezed,
  }) {
    return _then(_MyPageData(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      subscriptionTier: null == subscriptionTier
          ? _self.subscriptionTier
          : subscriptionTier // ignore: cast_nullable_to_non_nullable
              as SubscriptionTier,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      matchingPoint: null == matchingPoint
          ? _self.matchingPoint
          : matchingPoint // ignore: cast_nullable_to_non_nullable
              as int,
      lavigationPoint: null == lavigationPoint
          ? _self.lavigationPoint
          : lavigationPoint // ignore: cast_nullable_to_non_nullable
              as int,
      hasLikePoint: freezed == hasLikePoint
          ? _self.hasLikePoint
          : hasLikePoint // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
