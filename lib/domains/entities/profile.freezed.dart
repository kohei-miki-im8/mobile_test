// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {
  List<Image> get images;
  String get name;
  int? get age;
  String get location;
  String get userId;
  SignedImageUrls? get bestImageUrls;
  GenderCode get genderCode;
  bool get isFavorite;
  CertificateLevel get certificateLevel;
  LoginStatus get loginStatus;
  BadgeType? get badgeType;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(images),
      name,
      age,
      location,
      userId,
      bestImageUrls,
      genderCode,
      isFavorite,
      certificateLevel,
      loginStatus,
      badgeType);

  @override
  String toString() {
    return 'Profile(images: $images, name: $name, age: $age, location: $location, userId: $userId, bestImageUrls: $bestImageUrls, genderCode: $genderCode, isFavorite: $isFavorite, certificateLevel: $certificateLevel, loginStatus: $loginStatus, badgeType: $badgeType)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
  @useResult
  $Res call(
      {List<Image> images,
      String name,
      int? age,
      String location,
      String userId,
      SignedImageUrls? bestImageUrls,
      GenderCode genderCode,
      bool isFavorite,
      CertificateLevel certificateLevel,
      LoginStatus loginStatus,
      BadgeType? badgeType});

  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? images = null,
    Object? name = null,
    Object? age = freezed,
    Object? location = null,
    Object? userId = null,
    Object? bestImageUrls = freezed,
    Object? genderCode = null,
    Object? isFavorite = null,
    Object? certificateLevel = null,
    Object? loginStatus = null,
    Object? badgeType = freezed,
  }) {
    return _then(_self.copyWith(
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as BadgeType?,
    ));
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls {
    if (_self.bestImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.bestImageUrls!, (value) {
      return _then(_self.copyWith(bestImageUrls: value));
    });
  }
}

/// @nodoc

class _Profile implements Profile {
  const _Profile(
      {required final List<Image> images,
      required this.name,
      required this.age,
      required this.location,
      required this.userId,
      required this.bestImageUrls,
      this.genderCode = GenderCode.GENDER_CODE_UNSPECIFIED,
      this.isFavorite = false,
      this.certificateLevel = CertificateLevel.unspecified,
      this.loginStatus = LoginStatus.unspecified,
      this.badgeType})
      : _images = images;

  final List<Image> _images;
  @override
  List<Image> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String name;
  @override
  final int? age;
  @override
  final String location;
  @override
  final String userId;
  @override
  final SignedImageUrls? bestImageUrls;
  @override
  @JsonKey()
  final GenderCode genderCode;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final CertificateLevel certificateLevel;
  @override
  @JsonKey()
  final LoginStatus loginStatus;
  @override
  final BadgeType? badgeType;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.badgeType, badgeType) ||
                other.badgeType == badgeType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_images),
      name,
      age,
      location,
      userId,
      bestImageUrls,
      genderCode,
      isFavorite,
      certificateLevel,
      loginStatus,
      badgeType);

  @override
  String toString() {
    return 'Profile(images: $images, name: $name, age: $age, location: $location, userId: $userId, bestImageUrls: $bestImageUrls, genderCode: $genderCode, isFavorite: $isFavorite, certificateLevel: $certificateLevel, loginStatus: $loginStatus, badgeType: $badgeType)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) =
      __$ProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<Image> images,
      String name,
      int? age,
      String location,
      String userId,
      SignedImageUrls? bestImageUrls,
      GenderCode genderCode,
      bool isFavorite,
      CertificateLevel certificateLevel,
      LoginStatus loginStatus,
      BadgeType? badgeType});

  @override
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? images = null,
    Object? name = null,
    Object? age = freezed,
    Object? location = null,
    Object? userId = null,
    Object? bestImageUrls = freezed,
    Object? genderCode = null,
    Object? isFavorite = null,
    Object? certificateLevel = null,
    Object? loginStatus = null,
    Object? badgeType = freezed,
  }) {
    return _then(_Profile(
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
      badgeType: freezed == badgeType
          ? _self.badgeType
          : badgeType // ignore: cast_nullable_to_non_nullable
              as BadgeType?,
    ));
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls {
    if (_self.bestImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.bestImageUrls!, (value) {
      return _then(_self.copyWith(bestImageUrls: value));
    });
  }
}

// dart format on
