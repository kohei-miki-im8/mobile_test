// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_editing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoEditing {
  /// メイン写真かどうか
  bool get isMain;

  /// サブ写真のインデックス（nullの場合はメイン）
  int? get subIndex;

  /// 既存の写真（置き換え対象）
  RequiringReviewProfilePhoto? get existingPhoto;

  /// 編集中の写真（キャプション編集用）
  RequiringReviewProfilePhoto? get editingPhoto;

  /// 選択された写真ファイルのパス
  String? get selectedPhotoPath;

  /// クロップ状態
  PhotoCropState? get cropState;

  /// アップロード済みの写真ID（ロールバック用）
  String? get uploadedPhotoId;

  /// アップロード済みの写真のoriginUrl（特定用）
  String? get uploadedPhotoOriginUrl;

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PhotoEditingCopyWith<PhotoEditing> get copyWith =>
      _$PhotoEditingCopyWithImpl<PhotoEditing>(
          this as PhotoEditing, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PhotoEditing &&
            (identical(other.isMain, isMain) || other.isMain == isMain) &&
            (identical(other.subIndex, subIndex) ||
                other.subIndex == subIndex) &&
            (identical(other.existingPhoto, existingPhoto) ||
                other.existingPhoto == existingPhoto) &&
            (identical(other.editingPhoto, editingPhoto) ||
                other.editingPhoto == editingPhoto) &&
            (identical(other.selectedPhotoPath, selectedPhotoPath) ||
                other.selectedPhotoPath == selectedPhotoPath) &&
            (identical(other.cropState, cropState) ||
                other.cropState == cropState) &&
            (identical(other.uploadedPhotoId, uploadedPhotoId) ||
                other.uploadedPhotoId == uploadedPhotoId) &&
            (identical(other.uploadedPhotoOriginUrl, uploadedPhotoOriginUrl) ||
                other.uploadedPhotoOriginUrl == uploadedPhotoOriginUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isMain,
      subIndex,
      existingPhoto,
      editingPhoto,
      selectedPhotoPath,
      cropState,
      uploadedPhotoId,
      uploadedPhotoOriginUrl);

  @override
  String toString() {
    return 'PhotoEditing(isMain: $isMain, subIndex: $subIndex, existingPhoto: $existingPhoto, editingPhoto: $editingPhoto, selectedPhotoPath: $selectedPhotoPath, cropState: $cropState, uploadedPhotoId: $uploadedPhotoId, uploadedPhotoOriginUrl: $uploadedPhotoOriginUrl)';
  }
}

/// @nodoc
abstract mixin class $PhotoEditingCopyWith<$Res> {
  factory $PhotoEditingCopyWith(
          PhotoEditing value, $Res Function(PhotoEditing) _then) =
      _$PhotoEditingCopyWithImpl;
  @useResult
  $Res call(
      {bool isMain,
      int? subIndex,
      RequiringReviewProfilePhoto? existingPhoto,
      RequiringReviewProfilePhoto? editingPhoto,
      String? selectedPhotoPath,
      PhotoCropState? cropState,
      String? uploadedPhotoId,
      String? uploadedPhotoOriginUrl});

  $RequiringReviewProfilePhotoCopyWith<$Res>? get existingPhoto;
  $RequiringReviewProfilePhotoCopyWith<$Res>? get editingPhoto;
}

/// @nodoc
class _$PhotoEditingCopyWithImpl<$Res> implements $PhotoEditingCopyWith<$Res> {
  _$PhotoEditingCopyWithImpl(this._self, this._then);

  final PhotoEditing _self;
  final $Res Function(PhotoEditing) _then;

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMain = null,
    Object? subIndex = freezed,
    Object? existingPhoto = freezed,
    Object? editingPhoto = freezed,
    Object? selectedPhotoPath = freezed,
    Object? cropState = freezed,
    Object? uploadedPhotoId = freezed,
    Object? uploadedPhotoOriginUrl = freezed,
  }) {
    return _then(_self.copyWith(
      isMain: null == isMain
          ? _self.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool,
      subIndex: freezed == subIndex
          ? _self.subIndex
          : subIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      existingPhoto: freezed == existingPhoto
          ? _self.existingPhoto
          : existingPhoto // ignore: cast_nullable_to_non_nullable
              as RequiringReviewProfilePhoto?,
      editingPhoto: freezed == editingPhoto
          ? _self.editingPhoto
          : editingPhoto // ignore: cast_nullable_to_non_nullable
              as RequiringReviewProfilePhoto?,
      selectedPhotoPath: freezed == selectedPhotoPath
          ? _self.selectedPhotoPath
          : selectedPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cropState: freezed == cropState
          ? _self.cropState
          : cropState // ignore: cast_nullable_to_non_nullable
              as PhotoCropState?,
      uploadedPhotoId: freezed == uploadedPhotoId
          ? _self.uploadedPhotoId
          : uploadedPhotoId // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedPhotoOriginUrl: freezed == uploadedPhotoOriginUrl
          ? _self.uploadedPhotoOriginUrl
          : uploadedPhotoOriginUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequiringReviewProfilePhotoCopyWith<$Res>? get existingPhoto {
    if (_self.existingPhoto == null) {
      return null;
    }

    return $RequiringReviewProfilePhotoCopyWith<$Res>(_self.existingPhoto!,
        (value) {
      return _then(_self.copyWith(existingPhoto: value));
    });
  }

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequiringReviewProfilePhotoCopyWith<$Res>? get editingPhoto {
    if (_self.editingPhoto == null) {
      return null;
    }

    return $RequiringReviewProfilePhotoCopyWith<$Res>(_self.editingPhoto!,
        (value) {
      return _then(_self.copyWith(editingPhoto: value));
    });
  }
}

/// @nodoc

class _PhotoEditing extends PhotoEditing {
  const _PhotoEditing(
      {required this.isMain,
      this.subIndex,
      this.existingPhoto,
      this.editingPhoto,
      this.selectedPhotoPath,
      this.cropState,
      this.uploadedPhotoId,
      this.uploadedPhotoOriginUrl})
      : super._();

  /// メイン写真かどうか
  @override
  final bool isMain;

  /// サブ写真のインデックス（nullの場合はメイン）
  @override
  final int? subIndex;

  /// 既存の写真（置き換え対象）
  @override
  final RequiringReviewProfilePhoto? existingPhoto;

  /// 編集中の写真（キャプション編集用）
  @override
  final RequiringReviewProfilePhoto? editingPhoto;

  /// 選択された写真ファイルのパス
  @override
  final String? selectedPhotoPath;

  /// クロップ状態
  @override
  final PhotoCropState? cropState;

  /// アップロード済みの写真ID（ロールバック用）
  @override
  final String? uploadedPhotoId;

  /// アップロード済みの写真のoriginUrl（特定用）
  @override
  final String? uploadedPhotoOriginUrl;

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PhotoEditingCopyWith<_PhotoEditing> get copyWith =>
      __$PhotoEditingCopyWithImpl<_PhotoEditing>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoEditing &&
            (identical(other.isMain, isMain) || other.isMain == isMain) &&
            (identical(other.subIndex, subIndex) ||
                other.subIndex == subIndex) &&
            (identical(other.existingPhoto, existingPhoto) ||
                other.existingPhoto == existingPhoto) &&
            (identical(other.editingPhoto, editingPhoto) ||
                other.editingPhoto == editingPhoto) &&
            (identical(other.selectedPhotoPath, selectedPhotoPath) ||
                other.selectedPhotoPath == selectedPhotoPath) &&
            (identical(other.cropState, cropState) ||
                other.cropState == cropState) &&
            (identical(other.uploadedPhotoId, uploadedPhotoId) ||
                other.uploadedPhotoId == uploadedPhotoId) &&
            (identical(other.uploadedPhotoOriginUrl, uploadedPhotoOriginUrl) ||
                other.uploadedPhotoOriginUrl == uploadedPhotoOriginUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isMain,
      subIndex,
      existingPhoto,
      editingPhoto,
      selectedPhotoPath,
      cropState,
      uploadedPhotoId,
      uploadedPhotoOriginUrl);

  @override
  String toString() {
    return 'PhotoEditing(isMain: $isMain, subIndex: $subIndex, existingPhoto: $existingPhoto, editingPhoto: $editingPhoto, selectedPhotoPath: $selectedPhotoPath, cropState: $cropState, uploadedPhotoId: $uploadedPhotoId, uploadedPhotoOriginUrl: $uploadedPhotoOriginUrl)';
  }
}

/// @nodoc
abstract mixin class _$PhotoEditingCopyWith<$Res>
    implements $PhotoEditingCopyWith<$Res> {
  factory _$PhotoEditingCopyWith(
          _PhotoEditing value, $Res Function(_PhotoEditing) _then) =
      __$PhotoEditingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isMain,
      int? subIndex,
      RequiringReviewProfilePhoto? existingPhoto,
      RequiringReviewProfilePhoto? editingPhoto,
      String? selectedPhotoPath,
      PhotoCropState? cropState,
      String? uploadedPhotoId,
      String? uploadedPhotoOriginUrl});

  @override
  $RequiringReviewProfilePhotoCopyWith<$Res>? get existingPhoto;
  @override
  $RequiringReviewProfilePhotoCopyWith<$Res>? get editingPhoto;
}

/// @nodoc
class __$PhotoEditingCopyWithImpl<$Res>
    implements _$PhotoEditingCopyWith<$Res> {
  __$PhotoEditingCopyWithImpl(this._self, this._then);

  final _PhotoEditing _self;
  final $Res Function(_PhotoEditing) _then;

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isMain = null,
    Object? subIndex = freezed,
    Object? existingPhoto = freezed,
    Object? editingPhoto = freezed,
    Object? selectedPhotoPath = freezed,
    Object? cropState = freezed,
    Object? uploadedPhotoId = freezed,
    Object? uploadedPhotoOriginUrl = freezed,
  }) {
    return _then(_PhotoEditing(
      isMain: null == isMain
          ? _self.isMain
          : isMain // ignore: cast_nullable_to_non_nullable
              as bool,
      subIndex: freezed == subIndex
          ? _self.subIndex
          : subIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      existingPhoto: freezed == existingPhoto
          ? _self.existingPhoto
          : existingPhoto // ignore: cast_nullable_to_non_nullable
              as RequiringReviewProfilePhoto?,
      editingPhoto: freezed == editingPhoto
          ? _self.editingPhoto
          : editingPhoto // ignore: cast_nullable_to_non_nullable
              as RequiringReviewProfilePhoto?,
      selectedPhotoPath: freezed == selectedPhotoPath
          ? _self.selectedPhotoPath
          : selectedPhotoPath // ignore: cast_nullable_to_non_nullable
              as String?,
      cropState: freezed == cropState
          ? _self.cropState
          : cropState // ignore: cast_nullable_to_non_nullable
              as PhotoCropState?,
      uploadedPhotoId: freezed == uploadedPhotoId
          ? _self.uploadedPhotoId
          : uploadedPhotoId // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadedPhotoOriginUrl: freezed == uploadedPhotoOriginUrl
          ? _self.uploadedPhotoOriginUrl
          : uploadedPhotoOriginUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequiringReviewProfilePhotoCopyWith<$Res>? get existingPhoto {
    if (_self.existingPhoto == null) {
      return null;
    }

    return $RequiringReviewProfilePhotoCopyWith<$Res>(_self.existingPhoto!,
        (value) {
      return _then(_self.copyWith(existingPhoto: value));
    });
  }

  /// Create a copy of PhotoEditing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RequiringReviewProfilePhotoCopyWith<$Res>? get editingPhoto {
    if (_self.editingPhoto == null) {
      return null;
    }

    return $RequiringReviewProfilePhotoCopyWith<$Res>(_self.editingPhoto!,
        (value) {
      return _then(_self.copyWith(editingPhoto: value));
    });
  }
}

// dart format on
