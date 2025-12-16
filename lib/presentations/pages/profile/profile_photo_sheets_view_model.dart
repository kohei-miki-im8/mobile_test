import 'dart:async';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/photo_editing.dart';
import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/media_category.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/delete_profile_photo.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_caption.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/photo_crop_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart' as proto;
import 'package:econa_mobile_app/infrastructures/repositories/media.dart';
import 'package:econa_mobile_app/infrastructures/repositories/photo.dart';
import 'package:econa_mobile_app/infrastructures/services/media_upload_service.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_photo_sheets_state.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_crop_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePhotoSheetsViewModel extends StateNotifier<ProfilePhotoSheetsState> {
  ProfilePhotoSheetsViewModel(this.ref) : super(const ProfilePhotoSheetsState());

  final Ref ref;

  /// 写真スロットの状態を初期化する
  void initializeSlot({
    required bool isMain,
    required int? subIndex,
    required RequiringReviewProfilePhoto? existingPhoto,
  }) {
    state = ProfilePhotoSheetsState(
      photoEditing: PhotoEditing(
        isMain: isMain,
        subIndex: subIndex,
        existingPhoto: existingPhoto,
      ),
      currentStep: PhotoEditStep.action,
    );
  }

  /// 写真ファイルを選択
  void setSelectedPhoto(File file) {
    final current = state.photoEditing;
    if (current == null) return;

    state = state.copyWith(
      photoEditing: current.copyWith(
        selectedPhotoPath: file.path,
        cropState: null,
      ),
      currentStep: PhotoEditStep.crop,
    );
  }

  /// クロップ状態を設定
  void setCropState(PhotoCropState cropState) {
    final current = state.photoEditing;
    if (current == null) return;

    state = state.copyWith(
      photoEditing: current.copyWith(cropState: cropState),
    );
  }

  /// ローカル状態をクリア（選びなおす用）
  void clearLocalState() {
    final current = state.photoEditing;
    if (current == null) return;

    state = state.copyWith(
      photoEditing: current.copyWith(
        selectedPhotoPath: null,
        cropState: null,
      ),
      currentStep: PhotoEditStep.action,
    );
  }

  /// メイン写真アップロード
  Future<String?> uploadMainPhoto({
    required File file,
    required PhotoCropSettings cropSettings,
  }) async {
    final current = state.photoEditing;
    if (current == null) return null;

    state = state.copyWith(isUploading: true);

    try {
      final uploadService = ref.read(mediaUploadServiceProvider);
      final stream = uploadService.buildStreamFromFile(
        filePath: file.path,
        fileName: file.uri.pathSegments.isNotEmpty
            ? file.uri.pathSegments.last
            : 'photo.jpg',
        category: MediaCategory.MEDIA_CATEGORY_PROFILE_PHOTO,
        profilePhotoPriority: 1,
        photoCropSettings: cropSettings,
      );
      final response = await ref.read(mediaRepositoryProvider).chunkedMediaUpload(stream);

      if (response.hasSignedImageUrls()) {
        final url = response.signedImageUrls.originUrl;
        final originUrl = url.isNotEmpty ? url : null;

        // アップロード後の写真を特定
        await ref.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
        final profile = ref.read(profilePageViewModelProvider).profile;
        final uploadedPhoto = findUploadedPhotoByOriginUrl(
          profile: profile,
          originUrl: originUrl,
        );

        if (uploadedPhoto != null) {
          state = state.copyWith(
            photoEditing: current.copyWith(
              uploadedPhotoId: uploadedPhoto.userProfilePhotoId,
              uploadedPhotoOriginUrl: originUrl,
            ),
            currentStep: PhotoEditStep.caption,
            isUploading: false,
          );
        } else {
          state = state.copyWith(isUploading: false);
        }

        return originUrl;
      }

      state = state.copyWith(isUploading: false);
      return null;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.mediaUpload,
      );
      state = state.copyWith(
        isUploading: false,
        error: econaError,
      );
      return null;
    }
  }

  /// サブ写真アップロード
  Future<String?> uploadSubPhoto({
    required File file,
    required PhotoCropSettings cropSettings,
  }) async {
    final current = state.photoEditing;
    if (current == null) return null;

    state = state.copyWith(isUploading: true);

    try {
      final uploadService = ref.read(mediaUploadServiceProvider);
      final subIndex = current.subIndex ?? 0;
      final stream = uploadService.buildStreamFromFile(
        filePath: file.path,
        fileName: file.uri.pathSegments.isNotEmpty
            ? file.uri.pathSegments.last
            : 'photo.jpg',
        category: MediaCategory.MEDIA_CATEGORY_PROFILE_PHOTO,
        profilePhotoPriority: subIndex + 2,
        photoCropSettings: cropSettings,
      );
      final response = await ref.read(mediaRepositoryProvider).chunkedMediaUpload(stream);

      if (response.hasSignedImageUrls()) {
        final url = response.signedImageUrls.originUrl;
        final originUrl = url.isNotEmpty ? url : null;

        // アップロード後の写真を特定（DB登録の遅延を懸念してポーリングを行う）
        RequiringReviewProfilePhoto? uploadedPhoto;
        const retryLimit = 3;
        for (int i = 0; i < retryLimit; i++) {
          await ref.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
          final profile = ref.read(profilePageViewModelProvider).profile;
          uploadedPhoto = findUploadedPhotoByOriginUrl(
            profile: profile,
            originUrl: originUrl,
          );
          if (uploadedPhoto != null) break;
          if (i < retryLimit - 1) await Future<void>.delayed(const Duration(milliseconds: 500));
        }

        if (uploadedPhoto != null) {
          state = state.copyWith(
            photoEditing: current.copyWith(
              uploadedPhotoId: uploadedPhoto.userProfilePhotoId,
              uploadedPhotoOriginUrl: originUrl,
            ),
            currentStep: PhotoEditStep.caption,
            isUploading: false,
          );
        } else {
          // 写真が見つからない場合はエラー状態にする
          const econaError = EconaError(
            cause: EconaErrorCause.unknown,
            message: '写真の確認に失敗しました。もう一度お試しください。',
            operation: EconaErrorOperation.mediaUpload,
            statusCode: null,
          );
          state = state.copyWith(
            isUploading: false,
            error: econaError,
          );
          return null;
        }

        return originUrl;
      }

      state = state.copyWith(isUploading: false);
      return null;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.mediaUpload,
      );
      state = state.copyWith(
        isUploading: false,
        error: econaError,
      );
      return null;
    }
  }

  /// キャプションを保存
  Future<void> saveCaption(String caption) async {
    final current = state.photoEditing;
    if (current == null || state.isSaving) return;

    // 新規アップロード時はuploadedPhotoId、既存写真編集時はeditingPhotoのIDを使用
    final photoId = current.uploadedPhotoId ?? current.editingPhoto?.userProfilePhotoId;
    if (photoId == null) return;

    state = state.copyWith(isSaving: true);

    try {
      await ref.read(photoRepositoryProvider).updateCaption(
        UpdateProfilePhotoCaptionRequest(
          userProfilePhotoId: photoId,
          caption: caption,
        ),
      );

      // 既存写真を置き換えている場合は、古い写真を削除
      final existingPhoto = current.existingPhoto;
      if (existingPhoto != null &&
          existingPhoto.userProfilePhotoId != photoId) {
        try {
          await ref.read(photoRepositoryProvider).deleteProfilePhoto(
            DeleteProfilePhotoRequest(
              userProfilePhotoId: existingPhoto.userProfilePhotoId,
            ),
          );
        } on Exception catch (e) {
          // 古い写真削除失敗はキャプション保存を巻き戻さず、エラーだけ記録する
          final econaError = EconaError.fromException(
            e,
            operation: EconaErrorOperation.profilePhotoDelete,
          );
          state = state.copyWith(error: econaError);
        }
      }

      // プロフィールを再取得
      await ref.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.captionUpdate,
      );
      state = state.copyWith(
        isSaving: false,
        error: econaError,
      );
      rethrow;
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  /// 写真を削除
  Future<void> deletePhoto(String? photoId) async {
    if (photoId == null) return;

    state = state.copyWith(isSaving: true);

    try {
      await ref.read(photoRepositoryProvider).deleteProfilePhoto(
        DeleteProfilePhotoRequest(userProfilePhotoId: photoId),
      );
      await ref.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.profilePhotoDelete,
      );
      state = state.copyWith(
        isSaving: false,
        error: econaError,
      );
      rethrow;
    } finally {
      state = state.copyWith(isSaving: false);
    }
  }

  /// 一時アップロードされた（保存されていない）写真をIDで削除
  Future<void> deleteTemporaryUploadedPhotoById(String photoId) async {
    try {
      await ref.read(photoRepositoryProvider).deleteProfilePhoto(
        DeleteProfilePhotoRequest(userProfilePhotoId: photoId),
      );
      await ref.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
    } on Exception catch (_) {
      // シートクローズ時の後片付け用途：失敗は握りつぶす
    }
  }

  /// アップロード済み写真を削除（ロールバック用）
  Future<void> deleteUploadedPhoto() async {
    final current = state.photoEditing;
    if (current == null) return;

    final uploadedPhotoId = current.uploadedPhotoId;
    if (uploadedPhotoId == null) return;

    try {
      await ref.read(photoRepositoryProvider).deleteProfilePhoto(
        DeleteProfilePhotoRequest(userProfilePhotoId: uploadedPhotoId),
      );
      await ref.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
    } on Exception catch (_) {
      // ロールバック失敗は握りつぶす
    }
  }

  /// 編集中の写真を設定（キャプション編集用）
  void setEditingPhoto(RequiringReviewProfilePhoto? photo) {
    final current = state.photoEditing;
    if (current == null) return;

    state = state.copyWith(
      photoEditing: current.copyWith(editingPhoto: photo),
      currentStep: PhotoEditStep.caption,
    );
  }

  /// アップロード応答のoriginUrlと一致する写真をプロフィールから特定する
  RequiringReviewProfilePhoto? findUploadedPhotoByOriginUrl({
    required proto.Profile? profile,
    required String? originUrl,
  }) {
    if (profile == null || originUrl == null || originUrl.isEmpty) return null;
    for (final p in profile.requiringReviewProfilePhotos) {
      if (p.hasPendingSignedImageUrls() && p.pendingSignedImageUrls.hasOriginUrl()) {
        final url = p.pendingSignedImageUrls.originUrl;
        if (url.isNotEmpty && url == originUrl) {
          return RequiringReviewProfilePhoto.fromProtobuf(p);
        }
      }
    }
    return null;
  }

  /// アップロードされた写真を特定する（フォールバック）
  RequiringReviewProfilePhoto? resolveUploadPhoto({
    required proto.Profile? profile,
    required bool isMain,
    required int? subIndex,
  }) {
    if (profile == null) return null;
    final photos = profile.requiringReviewProfilePhotos
        .map(RequiringReviewProfilePhoto.fromProtobuf)
        .toList();
    if (photos.isEmpty) return null;

    if (isMain) {
      // メイン: 承認待ちを優先、なければベスト写真
      return photos.firstWhereOrNull(
            (p) => p.isBestPhoto && p.pendingSignedImageUrls != null,
          ) ??
          photos.firstWhereOrNull(
            (p) => p.isBestPhoto,
          );
    }

    // サブ: 表示順（2..9）で一致、承認待ちを優先
    final order = (subIndex ?? 0) + 2;
    return photos.firstWhereOrNull(
          (p) =>
              p.currentDisplayOrder == order &&
              p.pendingSignedImageUrls != null,
        ) ??
        photos.firstWhereOrNull(
          (p) => p.currentDisplayOrder == order,
        );
  }

  /// シートを閉じる時のクリーンアップ処理
  /// 状態をリセットするのみ（ロールバックは各PopScope/onRePickで完結）
  void cleanupOnSheetClose() {
    state = const ProfilePhotoSheetsState();
  }

  /// 状態をリセット
  void reset() {
    state = const ProfilePhotoSheetsState();
  }
}

final profilePhotoSheetsViewModelProvider =
StateNotifierProvider<ProfilePhotoSheetsViewModel, ProfilePhotoSheetsState>(
  ProfilePhotoSheetsViewModel.new,
);