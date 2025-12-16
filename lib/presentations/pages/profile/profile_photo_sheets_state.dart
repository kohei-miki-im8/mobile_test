import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/photo_editing.dart';

/// 写真編集のステップ
enum PhotoEditStep {
  /// アクションシート（写真選択/編集/削除）
  action,

  /// クロップ画面
  crop,

  /// キャプション入力画面
  caption,
}

class ProfilePhotoSheetsState {
  const ProfilePhotoSheetsState({
    this.photoEditing,
    this.currentStep = PhotoEditStep.action,
    this.isSaving = false,
    this.isUploading = false,
    this.isLoading = false,
    this.error,
  });

  /// 写真編集中の状態
  final PhotoEditing? photoEditing;

  /// 現在の編集ステップ
  final PhotoEditStep currentStep;

  /// 保存中フラグ
  final bool isSaving;

  /// アップロード中フラグ
  final bool isUploading;

  /// ローディング中フラグ
  final bool isLoading;

  /// エラー
  final EconaError? error;

  static const _unset = Object();

  ProfilePhotoSheetsState copyWith({
    PhotoEditing? photoEditing,
    PhotoEditStep? currentStep,
    bool? isSaving,
    bool? isUploading,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset) ? this.error : error as EconaError?;

    return ProfilePhotoSheetsState(
      photoEditing: photoEditing ?? this.photoEditing,
      currentStep: currentStep ?? this.currentStep,
      isSaving: isSaving ?? this.isSaving,
      isUploading: isUploading ?? this.isUploading,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}