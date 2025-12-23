// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requiring_review_profile_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequiringReviewProfilePhoto {
  String? get userProfilePhotoId;
  SignedImageUrls? get currentSignedImageUrls;
  SignedImageUrls? get pendingSignedImageUrls;
  int? get currentDisplayOrder;
  bool get isBestPhoto;
  bool get alreadySkipped;
  String get caption;

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RequiringReviewProfilePhotoCopyWith<RequiringReviewProfilePhoto>
      get copyWith => _$RequiringReviewProfilePhotoCopyWithImpl<
              RequiringReviewProfilePhoto>(
          this as RequiringReviewProfilePhoto, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RequiringReviewProfilePhoto &&
            (identical(other.userProfilePhotoId, userProfilePhotoId) ||
                other.userProfilePhotoId == userProfilePhotoId) &&
            (identical(other.currentSignedImageUrls, currentSignedImageUrls) ||
                other.currentSignedImageUrls == currentSignedImageUrls) &&
            (identical(other.pendingSignedImageUrls, pendingSignedImageUrls) ||
                other.pendingSignedImageUrls == pendingSignedImageUrls) &&
            (identical(other.currentDisplayOrder, currentDisplayOrder) ||
                other.currentDisplayOrder == currentDisplayOrder) &&
            (identical(other.isBestPhoto, isBestPhoto) ||
                other.isBestPhoto == isBestPhoto) &&
            (identical(other.alreadySkipped, alreadySkipped) ||
                other.alreadySkipped == alreadySkipped) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProfilePhotoId,
      currentSignedImageUrls,
      pendingSignedImageUrls,
      currentDisplayOrder,
      isBestPhoto,
      alreadySkipped,
      caption);

  @override
  String toString() {
    return 'RequiringReviewProfilePhoto(userProfilePhotoId: $userProfilePhotoId, currentSignedImageUrls: $currentSignedImageUrls, pendingSignedImageUrls: $pendingSignedImageUrls, currentDisplayOrder: $currentDisplayOrder, isBestPhoto: $isBestPhoto, alreadySkipped: $alreadySkipped, caption: $caption)';
  }
}

/// @nodoc
abstract mixin class $RequiringReviewProfilePhotoCopyWith<$Res> {
  factory $RequiringReviewProfilePhotoCopyWith(
          RequiringReviewProfilePhoto value,
          $Res Function(RequiringReviewProfilePhoto) _then) =
      _$RequiringReviewProfilePhotoCopyWithImpl;
  @useResult
  $Res call(
      {String? userProfilePhotoId,
      SignedImageUrls? currentSignedImageUrls,
      SignedImageUrls? pendingSignedImageUrls,
      int? currentDisplayOrder,
      bool isBestPhoto,
      bool alreadySkipped,
      String caption});

  $SignedImageUrlsCopyWith<$Res>? get currentSignedImageUrls;
  $SignedImageUrlsCopyWith<$Res>? get pendingSignedImageUrls;
}

/// @nodoc
class _$RequiringReviewProfilePhotoCopyWithImpl<$Res>
    implements $RequiringReviewProfilePhotoCopyWith<$Res> {
  _$RequiringReviewProfilePhotoCopyWithImpl(this._self, this._then);

  final RequiringReviewProfilePhoto _self;
  final $Res Function(RequiringReviewProfilePhoto) _then;

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfilePhotoId = freezed,
    Object? currentSignedImageUrls = freezed,
    Object? pendingSignedImageUrls = freezed,
    Object? currentDisplayOrder = freezed,
    Object? isBestPhoto = null,
    Object? alreadySkipped = null,
    Object? caption = null,
  }) {
    return _then(_self.copyWith(
      userProfilePhotoId: freezed == userProfilePhotoId
          ? _self.userProfilePhotoId
          : userProfilePhotoId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentSignedImageUrls: freezed == currentSignedImageUrls
          ? _self.currentSignedImageUrls
          : currentSignedImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      pendingSignedImageUrls: freezed == pendingSignedImageUrls
          ? _self.pendingSignedImageUrls
          : pendingSignedImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      currentDisplayOrder: freezed == currentDisplayOrder
          ? _self.currentDisplayOrder
          : currentDisplayOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      isBestPhoto: null == isBestPhoto
          ? _self.isBestPhoto
          : isBestPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      alreadySkipped: null == alreadySkipped
          ? _self.alreadySkipped
          : alreadySkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      caption: null == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get currentSignedImageUrls {
    if (_self.currentSignedImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.currentSignedImageUrls!,
        (value) {
      return _then(_self.copyWith(currentSignedImageUrls: value));
    });
  }

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get pendingSignedImageUrls {
    if (_self.pendingSignedImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.pendingSignedImageUrls!,
        (value) {
      return _then(_self.copyWith(pendingSignedImageUrls: value));
    });
  }
}

/// @nodoc

class _RequiringReviewProfilePhoto implements RequiringReviewProfilePhoto {
  const _RequiringReviewProfilePhoto(
      {required this.userProfilePhotoId,
      required this.currentSignedImageUrls,
      required this.pendingSignedImageUrls,
      required this.currentDisplayOrder,
      this.isBestPhoto = false,
      this.alreadySkipped = false,
      this.caption = ''});

  @override
  final String? userProfilePhotoId;
  @override
  final SignedImageUrls? currentSignedImageUrls;
  @override
  final SignedImageUrls? pendingSignedImageUrls;
  @override
  final int? currentDisplayOrder;
  @override
  @JsonKey()
  final bool isBestPhoto;
  @override
  @JsonKey()
  final bool alreadySkipped;
  @override
  @JsonKey()
  final String caption;

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RequiringReviewProfilePhotoCopyWith<_RequiringReviewProfilePhoto>
      get copyWith => __$RequiringReviewProfilePhotoCopyWithImpl<
          _RequiringReviewProfilePhoto>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RequiringReviewProfilePhoto &&
            (identical(other.userProfilePhotoId, userProfilePhotoId) ||
                other.userProfilePhotoId == userProfilePhotoId) &&
            (identical(other.currentSignedImageUrls, currentSignedImageUrls) ||
                other.currentSignedImageUrls == currentSignedImageUrls) &&
            (identical(other.pendingSignedImageUrls, pendingSignedImageUrls) ||
                other.pendingSignedImageUrls == pendingSignedImageUrls) &&
            (identical(other.currentDisplayOrder, currentDisplayOrder) ||
                other.currentDisplayOrder == currentDisplayOrder) &&
            (identical(other.isBestPhoto, isBestPhoto) ||
                other.isBestPhoto == isBestPhoto) &&
            (identical(other.alreadySkipped, alreadySkipped) ||
                other.alreadySkipped == alreadySkipped) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProfilePhotoId,
      currentSignedImageUrls,
      pendingSignedImageUrls,
      currentDisplayOrder,
      isBestPhoto,
      alreadySkipped,
      caption);

  @override
  String toString() {
    return 'RequiringReviewProfilePhoto(userProfilePhotoId: $userProfilePhotoId, currentSignedImageUrls: $currentSignedImageUrls, pendingSignedImageUrls: $pendingSignedImageUrls, currentDisplayOrder: $currentDisplayOrder, isBestPhoto: $isBestPhoto, alreadySkipped: $alreadySkipped, caption: $caption)';
  }
}

/// @nodoc
abstract mixin class _$RequiringReviewProfilePhotoCopyWith<$Res>
    implements $RequiringReviewProfilePhotoCopyWith<$Res> {
  factory _$RequiringReviewProfilePhotoCopyWith(
          _RequiringReviewProfilePhoto value,
          $Res Function(_RequiringReviewProfilePhoto) _then) =
      __$RequiringReviewProfilePhotoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? userProfilePhotoId,
      SignedImageUrls? currentSignedImageUrls,
      SignedImageUrls? pendingSignedImageUrls,
      int? currentDisplayOrder,
      bool isBestPhoto,
      bool alreadySkipped,
      String caption});

  @override
  $SignedImageUrlsCopyWith<$Res>? get currentSignedImageUrls;
  @override
  $SignedImageUrlsCopyWith<$Res>? get pendingSignedImageUrls;
}

/// @nodoc
class __$RequiringReviewProfilePhotoCopyWithImpl<$Res>
    implements _$RequiringReviewProfilePhotoCopyWith<$Res> {
  __$RequiringReviewProfilePhotoCopyWithImpl(this._self, this._then);

  final _RequiringReviewProfilePhoto _self;
  final $Res Function(_RequiringReviewProfilePhoto) _then;

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userProfilePhotoId = freezed,
    Object? currentSignedImageUrls = freezed,
    Object? pendingSignedImageUrls = freezed,
    Object? currentDisplayOrder = freezed,
    Object? isBestPhoto = null,
    Object? alreadySkipped = null,
    Object? caption = null,
  }) {
    return _then(_RequiringReviewProfilePhoto(
      userProfilePhotoId: freezed == userProfilePhotoId
          ? _self.userProfilePhotoId
          : userProfilePhotoId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentSignedImageUrls: freezed == currentSignedImageUrls
          ? _self.currentSignedImageUrls
          : currentSignedImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      pendingSignedImageUrls: freezed == pendingSignedImageUrls
          ? _self.pendingSignedImageUrls
          : pendingSignedImageUrls // ignore: cast_nullable_to_non_nullable
              as SignedImageUrls?,
      currentDisplayOrder: freezed == currentDisplayOrder
          ? _self.currentDisplayOrder
          : currentDisplayOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      isBestPhoto: null == isBestPhoto
          ? _self.isBestPhoto
          : isBestPhoto // ignore: cast_nullable_to_non_nullable
              as bool,
      alreadySkipped: null == alreadySkipped
          ? _self.alreadySkipped
          : alreadySkipped // ignore: cast_nullable_to_non_nullable
              as bool,
      caption: null == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get currentSignedImageUrls {
    if (_self.currentSignedImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.currentSignedImageUrls!,
        (value) {
      return _then(_self.copyWith(currentSignedImageUrls: value));
    });
  }

  /// Create a copy of RequiringReviewProfilePhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SignedImageUrlsCopyWith<$Res>? get pendingSignedImageUrls {
    if (_self.pendingSignedImageUrls == null) {
      return null;
    }

    return $SignedImageUrlsCopyWith<$Res>(_self.pendingSignedImageUrls!,
        (value) {
      return _then(_self.copyWith(pendingSignedImageUrls: value));
    });
  }
}

// dart format on
