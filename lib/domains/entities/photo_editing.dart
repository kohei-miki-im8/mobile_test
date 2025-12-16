import 'dart:io';

import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_crop_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_editing.freezed.dart';

/// プロフィール写真編集中の状態を表すエンティティ
@freezed
abstract class PhotoEditing with _$PhotoEditing {
  const factory PhotoEditing({
    /// メイン写真かどうか
    required bool isMain,

    /// サブ写真のインデックス（nullの場合はメイン）
    int? subIndex,

    /// 既存の写真（置き換え対象）
    RequiringReviewProfilePhoto? existingPhoto,

    /// 編集中の写真（キャプション編集用）
    RequiringReviewProfilePhoto? editingPhoto,

    /// 選択された写真ファイルのパス
    String? selectedPhotoPath,

    /// クロップ状態
    PhotoCropState? cropState,

    /// アップロード済みの写真ID（ロールバック用）
    String? uploadedPhotoId,

    /// アップロード済みの写真のoriginUrl（特定用）
    String? uploadedPhotoOriginUrl,
  }) = _PhotoEditing;

  const PhotoEditing._();

  /// 既存写真があるかどうか
  bool get hasExistingPhoto => existingPhoto != null;

  /// 写真がアップロード済みかどうか
  bool get hasUploadedPhoto => uploadedPhotoId != null;

  /// 既存写真を置き換えているかどうか
  bool get isReplacingExistingPhoto => hasExistingPhoto && hasUploadedPhoto;

  /// 選択された写真ファイルがあるかどうか
  bool get hasSelectedPhoto => selectedPhotoPath != null && selectedPhotoPath!.isNotEmpty;

  /// クロップ状態があるかどうか
  bool get hasCropState => cropState != null;

  /// ローカル状態のみがあるかどうか（アップロード前）
  bool get hasOnlyLocalState => hasSelectedPhoto && !hasUploadedPhoto;

  /// 写真ファイルを取得（パスから）
  File? get selectedPhotoFile {
    if (selectedPhotoPath == null || selectedPhotoPath!.isEmpty) {
      return null;
    }
    return File(selectedPhotoPath!);
  }
}