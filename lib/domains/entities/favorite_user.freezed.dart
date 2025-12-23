// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FavoriteUser {
  /// ユーザーID
  String get id;

  /// ユーザー名
  String get name;

  /// 性別
  GenderCode get genderCode;

  /// 年齢
  int? get age;

  /// 市区町村
  String get city;

  /// プロフィール画像URLのリスト
  List<String> get images;

  /// ベスト画像のSignedImageUrlsエンティティ（サイズ指定でURLを取得可能）
  SignedImageUrls? get bestImageUrls;

  /// 最終ログインからの経過時間
  LoginStatus get loginStatus;

  /// 本人確認レベル
  CertificateLevel get certificateLevel;

  /// お気に入り状態
  bool get isFavorite;

  /// いいね状態
  bool get isLiked;

  /// Create a copy of FavoriteUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FavoriteUserCopyWith<FavoriteUser> get copyWith =>
      _$FavoriteUserCopyWithImpl<FavoriteUser>(
          this as FavoriteUser, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FavoriteUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      genderCode,
      age,
      city,
      const DeepCollectionEquality().hash(images),
      bestImageUrls,
      loginStatus,
      certificateLevel,
      isFavorite,
      isLiked);

  @override
  String toString() {
    return 'FavoriteUser(id: $id, name: $name, genderCode: $genderCode, age: $age, city: $city, images: $images, bestImageUrls: $bestImageUrls, loginStatus: $loginStatus, certificateLevel: $certificateLevel, isFavorite: $isFavorite, isLiked: $isLiked)';
  }
}

/// @nodoc
abstract mixin class $FavoriteUserCopyWith<$Res> {
  factory $FavoriteUserCopyWith(
          FavoriteUser value, $Res Function(FavoriteUser) _then) =
      _$FavoriteUserCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      GenderCode genderCode,
      int? age,
      String city,
      List<String> images,
      SignedImageUrls? bestImageUrls,
      LoginStatus loginStatus,
      CertificateLevel certificateLevel,
      bool isFavorite,
      bool isLiked});

  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class _$FavoriteUserCopyWithImpl<$Res> implements $FavoriteUserCopyWith<$Res> {
  _$FavoriteUserCopyWithImpl(this._self, this._then);

  final FavoriteUser _self;
  final $Res Function(FavoriteUser) _then;

  /// Create a copy of FavoriteUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genderCode = null,
    Object? age = freezed,
    Object? city = null,
    Object? images = null,
    Object? bestImageUrls = freezed,
    Object? loginStatus = null,
    Object? certificateLevel = null,
    Object? isFavorite = null,
    Object? isLiked = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of FavoriteUser
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

class _FavoriteUser extends FavoriteUser {
  const _FavoriteUser(
      {required this.id,
      required this.name,
      required this.genderCode,
      required this.age,
      required this.city,
      required final List<String> images,
      required this.bestImageUrls,
      required this.loginStatus,
      this.certificateLevel = CertificateLevel.unspecified,
      this.isFavorite = false,
      this.isLiked = false})
      : _images = images,
        super._();

  /// ユーザーID
  @override
  final String id;

  /// ユーザー名
  @override
  final String name;

  /// 性別
  @override
  final GenderCode genderCode;

  /// 年齢
  @override
  final int? age;

  /// 市区町村
  @override
  final String city;

  /// プロフィール画像URLのリスト
  final List<String> _images;

  /// プロフィール画像URLのリスト
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// ベスト画像のSignedImageUrlsエンティティ（サイズ指定でURLを取得可能）
  @override
  final SignedImageUrls? bestImageUrls;

  /// 最終ログインからの経過時間
  @override
  final LoginStatus loginStatus;

  /// 本人確認レベル
  @override
  @JsonKey()
  final CertificateLevel certificateLevel;

  /// お気に入り状態
  @override
  @JsonKey()
  final bool isFavorite;

  /// いいね状態
  @override
  @JsonKey()
  final bool isLiked;

  /// Create a copy of FavoriteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FavoriteUserCopyWith<_FavoriteUser> get copyWith =>
      __$FavoriteUserCopyWithImpl<_FavoriteUser>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FavoriteUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.genderCode, genderCode) ||
                other.genderCode == genderCode) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.bestImageUrls, bestImageUrls) ||
                other.bestImageUrls == bestImageUrls) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.certificateLevel, certificateLevel) ||
                other.certificateLevel == certificateLevel) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      genderCode,
      age,
      city,
      const DeepCollectionEquality().hash(_images),
      bestImageUrls,
      loginStatus,
      certificateLevel,
      isFavorite,
      isLiked);

  @override
  String toString() {
    return 'FavoriteUser(id: $id, name: $name, genderCode: $genderCode, age: $age, city: $city, images: $images, bestImageUrls: $bestImageUrls, loginStatus: $loginStatus, certificateLevel: $certificateLevel, isFavorite: $isFavorite, isLiked: $isLiked)';
  }
}

/// @nodoc
abstract mixin class _$FavoriteUserCopyWith<$Res>
    implements $FavoriteUserCopyWith<$Res> {
  factory _$FavoriteUserCopyWith(
          _FavoriteUser value, $Res Function(_FavoriteUser) _then) =
      __$FavoriteUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      GenderCode genderCode,
      int? age,
      String city,
      List<String> images,
      SignedImageUrls? bestImageUrls,
      LoginStatus loginStatus,
      CertificateLevel certificateLevel,
      bool isFavorite,
      bool isLiked});

  @override
  $SignedImageUrlsCopyWith<$Res>? get bestImageUrls;
}

/// @nodoc
class __$FavoriteUserCopyWithImpl<$Res>
    implements _$FavoriteUserCopyWith<$Res> {
  __$FavoriteUserCopyWithImpl(this._self, this._then);

  final _FavoriteUser _self;
  final $Res Function(_FavoriteUser) _then;

  /// Create a copy of FavoriteUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? genderCode = null,
    Object? age = freezed,
    Object? city = null,
    Object? images = null,
    Object? bestImageUrls = freezed,
    Object? loginStatus = null,
    Object? certificateLevel = null,
    Object? isFavorite = null,
    Object? isLiked = null,
  }) {
    return _then(_FavoriteUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      genderCode: null == genderCode
          ? _self.genderCode
          : genderCode // ignore: cast_nullable_to_non_nullable
              as GenderCode,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bestImageUrls: freezed == bestImageUrls
          ? _self.bestImageUrls
          : bestImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
      certificateLevel: null == certificateLevel
          ? _self.certificateLevel
          : certificateLevel // ignore: cast_nullable_to_non_nullable
              as CertificateLevel,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of FavoriteUser
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
