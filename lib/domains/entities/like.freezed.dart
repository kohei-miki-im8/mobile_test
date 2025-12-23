// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Like {
  String get userId;
  String get nickname;
  int get age;
  String get city;
  List<String> get imageUrls;
  UserActivityTag get userActivityTag;
  CertificateLevelCode get certificateLevelCode;
  GenderCode get genderCode;
  SignedImageUrls? get bestImageUrls;
  String? get userLikeId;
  bool get hasSuperLikeMessage;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LikeCopyWith<Like> get copyWith =>
      _$LikeCopyWithImpl<Like>(this as Like, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Like &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other.imageUrls, imageUrls) &&
            (identical(other.userActivityTag, userActivityTag) ||
                other.userActivityTag == userActivityTag) &&
            (identical(other.certificateLevelCode, certificateLevelCode) ||
                other.certificateLevelCode == certificateLevelCode) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.userLikeId, userLikeId) ||
                other.userLikeId == userLikeId) &&
            (identical(other.hasSuperLikeMessage, hasSuperLikeMessage) ||
                other.hasSuperLikeMessage == hasSuperLikeMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      nickname,
      age,
      city,
      const DeepCollectionEquality().hash(imageUrls),
      userActivityTag,
      certificateLevelCode,
      genderCode,
      bestImageUrls,
      userLikeId,
      hasSuperLikeMessage);

  @override
  String toString() {
    return 'Like(userId: $userId, nickname: $nickname, age: $age, city: $city, imageUrls: $imageUrls, userActivityTag: $userActivityTag, certificateLevelCode: $certificateLevelCode, genderCode: $genderCode, bestImageUrls: $bestImageUrls, userLikeId: $userLikeId, hasSuperLikeMessage: $hasSuperLikeMessage)';
  }
}

/// @nodoc
abstract mixin class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) _then) =
      _$LikeCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String nickname,
      int age,
      String city,
      List<String> imageUrls,
      UserActivityTag userActivityTag,
      CertificateLevelCode certificateLevelCode,
      GenderCode genderCode,
      SignedImageUrls? bestImageUrls,
      String? userLikeId,
      bool hasSuperLikeMessage});

  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class _$LikeCopyWithImpl<$Res> implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._self, this._then);

  final Like _self;
  final $Res Function(Like) _then;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? age = null,
    Object? city = null,
    Object? imageUrls = null,
    Object? userActivityTag = null,
    Object? certificateLevelCode = null,
    Object? genderCode = null,
    Object? bestImageUrls = freezed,
    Object? userLikeId = freezed,
    Object? hasSuperLikeMessage = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _self.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userActivityTag: null == userActivityTag
          ? _self.userActivityTag
          : userActivityTag // ignore: cast_nullable_to_non_nullable
              as UserActivityTag,
      certificateLevelCode: null == certificateLevelCode
          ? _self.certificateLevelCode
          : certificateLevelCode // ignore: cast_nullable_to_non_nullable
              as CertificateLevelCode,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      userLikeId: freezed == userLikeId
          ? _self.userLikeId
          : userLikeId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSuperLikeMessage: null == hasSuperLikeMessage
          ? _self.hasSuperLikeMessage
          : hasSuperLikeMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Like
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

class _Like extends Like {
  const _Like(
      {required this.userId,
      required this.nickname,
      required this.age,
      required this.city,
      required final List<String> imageUrls,
      required this.userActivityTag,
      required this.certificateLevelCode,
      required this.genderCode,
      required this.bestImageUrls,
      this.userLikeId,
      this.hasSuperLikeMessage = false})
      : _imageUrls = imageUrls,
        super._();

  @override
  final String userId;
  @override
  final String nickname;
  @override
  final int age;
  @override
  final String city;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final UserActivityTag userActivityTag;
  @override
  final CertificateLevelCode certificateLevelCode;
  @override
  final GenderCode genderCode;
  @override
  final SignedImageUrls? bestImageUrls;
  @override
  final String? userLikeId;
  @override
  @JsonKey()
  final bool hasSuperLikeMessage;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LikeCopyWith<_Like> get copyWith =>
      __$LikeCopyWithImpl<_Like>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Like &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.userActivityTag, userActivityTag) ||
                other.userActivityTag == userActivityTag) &&
            (identical(other.certificateLevelCode, certificateLevelCode) ||
                other.certificateLevelCode == certificateLevelCode) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.userLikeId, userLikeId) ||
                other.userLikeId == userLikeId) &&
            (identical(other.hasSuperLikeMessage, hasSuperLikeMessage) ||
                other.hasSuperLikeMessage == hasSuperLikeMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      nickname,
      age,
      city,
      const DeepCollectionEquality().hash(_imageUrls),
      userActivityTag,
      certificateLevelCode,
      genderCode,
      bestImageUrls,
      userLikeId,
      hasSuperLikeMessage);

  @override
  String toString() {
    return 'Like(userId: $userId, nickname: $nickname, age: $age, city: $city, imageUrls: $imageUrls, userActivityTag: $userActivityTag, certificateLevelCode: $certificateLevelCode, genderCode: $genderCode, bestImageUrls: $bestImageUrls, userLikeId: $userLikeId, hasSuperLikeMessage: $hasSuperLikeMessage)';
  }
}

/// @nodoc
abstract mixin class _$LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$LikeCopyWith(_Like value, $Res Function(_Like) _then) =
      __$LikeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String nickname,
      int age,
      String city,
      List<String> imageUrls,
      UserActivityTag userActivityTag,
      CertificateLevelCode certificateLevelCode,
      GenderCode genderCode,
      SignedImageUrls? bestImageUrls,
      String? userLikeId,
      bool hasSuperLikeMessage});

  @override
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class __$LikeCopyWithImpl<$Res> implements _$LikeCopyWith<$Res> {
  __$LikeCopyWithImpl(this._self, this._then);

  final _Like _self;
  final $Res Function(_Like) _then;

  /// Create a copy of Like
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? nickname = null,
    Object? age = null,
    Object? city = null,
    Object? imageUrls = null,
    Object? userActivityTag = null,
    Object? certificateLevelCode = null,
    Object? genderCode = null,
    Object? bestImageUrls = freezed,
    Object? userLikeId = freezed,
    Object? hasSuperLikeMessage = null,
  }) {
    return _then(_Like(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _self._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userActivityTag: null == userActivityTag
          ? _self.userActivityTag
          : userActivityTag // ignore: cast_nullable_to_non_nullable
              as UserActivityTag,
      certificateLevelCode: null == certificateLevelCode
          ? _self.certificateLevelCode
          : certificateLevelCode // ignore: cast_nullable_to_non_nullable
              as CertificateLevelCode,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      userLikeId: freezed == userLikeId
          ? _self.userLikeId
          : userLikeId // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSuperLikeMessage: null == hasSuperLikeMessage
          ? _self.hasSuperLikeMessage
          : hasSuperLikeMessage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Like
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
