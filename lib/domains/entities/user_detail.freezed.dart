// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDetail {
  /// プロフィール情報
  Profile get profile;

  /// プロフィール詳細
  ProfileDetail? get profileDetail;

  /// マッチング理由
  MatchingReason? get matchingReason;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDetailCopyWith<UserDetail> get copyWith =>
      _$UserDetailCopyWithImpl<UserDetail>(this as UserDetail, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDetail &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileDetail, profileDetail) ||
                other.profileDetail == profileDetail) &&
            (identical(other.matchingReason, matchingReason) ||
                other.matchingReason == matchingReason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profile, profileDetail, matchingReason);

  @override
  String toString() {
    return 'UserDetail(profile: $profile, profileDetail: $profileDetail, matchingReason: $matchingReason)';
  }
}

/// @nodoc
abstract mixin class $UserDetailCopyWith<$Res> {
  factory $UserDetailCopyWith(
          UserDetail value, $Res Function(UserDetail) _then) =
      _$UserDetailCopyWithImpl;
  @useResult
  $Res call(
      {Profile profile,
      ProfileDetail? profileDetail,
      MatchingReason? matchingReason});

  $ProfileCopyWith<$Res> get profile;
  $ProfileDetailCopyWith<$Res>? get profileDetail;
  $MatchingReasonCopyWith<$Res>? get matchingReason;
}

/// @nodoc
class _$UserDetailCopyWithImpl<$Res> implements $UserDetailCopyWith<$Res> {
  _$UserDetailCopyWithImpl(this._self, this._then);

  final UserDetail _self;
  final $Res Function(UserDetail) _then;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? profileDetail = freezed,
    Object? matchingReason = freezed,
  }) {
    return _then(_self.copyWith(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      profileDetail: freezed == profileDetail
          ? _self.profileDetail
          : profileDetail // ignore: cast_nullable_to_non_nullable
              as ProfileDetail?,
      matchingReason: freezed == matchingReason
          ? _self.matchingReason
          : matchingReason // ignore: cast_nullable_to_non_nullable
              as MatchingReason?,
    ));
  }

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDetailCopyWith<$Res>? get profileDetail {
    if (_self.profileDetail == null) {
      return null;
    }

    return $ProfileDetailCopyWith<$Res>(_self.profileDetail!, (value) {
      return _then(_self.copyWith(profileDetail: value));
    });
  }

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchingReasonCopyWith<$Res>? get matchingReason {
    if (_self.matchingReason == null) {
      return null;
    }

    return $MatchingReasonCopyWith<$Res>(_self.matchingReason!, (value) {
      return _then(_self.copyWith(matchingReason: value));
    });
  }
}

/// @nodoc

class _UserDetail extends UserDetail {
  const _UserDetail(
      {required this.profile, required this.profileDetail, this.matchingReason})
      : super._();

  /// プロフィール情報
  @override
  final Profile profile;

  /// プロフィール詳細
  @override
  final ProfileDetail? profileDetail;

  /// マッチング理由
  @override
  final MatchingReason? matchingReason;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDetailCopyWith<_UserDetail> get copyWith =>
      __$UserDetailCopyWithImpl<_UserDetail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDetail &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileDetail, profileDetail) ||
                other.profileDetail == profileDetail) &&
            (identical(other.matchingReason, matchingReason) ||
                other.matchingReason == matchingReason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profile, profileDetail, matchingReason);

  @override
  String toString() {
    return 'UserDetail(profile: $profile, profileDetail: $profileDetail, matchingReason: $matchingReason)';
  }
}

/// @nodoc
abstract mixin class _$UserDetailCopyWith<$Res>
    implements $UserDetailCopyWith<$Res> {
  factory _$UserDetailCopyWith(
          _UserDetail value, $Res Function(_UserDetail) _then) =
      __$UserDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Profile profile,
      ProfileDetail? profileDetail,
      MatchingReason? matchingReason});

  @override
  $ProfileCopyWith<$Res> get profile;
  @override
  $ProfileDetailCopyWith<$Res>? get profileDetail;
  @override
  $MatchingReasonCopyWith<$Res>? get matchingReason;
}

/// @nodoc
class __$UserDetailCopyWithImpl<$Res> implements _$UserDetailCopyWith<$Res> {
  __$UserDetailCopyWithImpl(this._self, this._then);

  final _UserDetail _self;
  final $Res Function(_UserDetail) _then;

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
    Object? profileDetail = freezed,
    Object? matchingReason = freezed,
  }) {
    return _then(_UserDetail(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      profileDetail: freezed == profileDetail
          ? _self.profileDetail
          : profileDetail // ignore: cast_nullable_to_non_nullable
              as ProfileDetail?,
      matchingReason: freezed == matchingReason
          ? _self.matchingReason
          : matchingReason // ignore: cast_nullable_to_non_nullable
              as MatchingReason?,
    ));
  }

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileDetailCopyWith<$Res>? get profileDetail {
    if (_self.profileDetail == null) {
      return null;
    }

    return $ProfileDetailCopyWith<$Res>(_self.profileDetail!, (value) {
      return _then(_self.copyWith(profileDetail: value));
    });
  }

  /// Create a copy of UserDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchingReasonCopyWith<$Res>? get matchingReason {
    if (_self.matchingReason == null) {
      return null;
    }

    return $MatchingReasonCopyWith<$Res>(_self.matchingReason!, (value) {
      return _then(_self.copyWith(matchingReason: value));
    });
  }
}

// dart format on
