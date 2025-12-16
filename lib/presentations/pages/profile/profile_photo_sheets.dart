import 'dart:async';
import 'dart:io';

import 'package:econa_mobile_app/domains/entities/photo_editing.dart';
import 'package:econa_mobile_app/domains/entities/requiring_review_profile_photo.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/photo_crop_settings.pb.dart';
import 'package:econa_mobile_app/infrastructures/services/image_picker_service.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_photo_sheets_state.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_photo_sheets_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_crop_state.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'profile_photo_sheets_action.dart';
part 'profile_photo_sheets_crop.dart';
part 'profile_photo_sheets_caption.dart';

class ProfilePhotoSheets {
  const ProfilePhotoSheets._();

  /// アクションシートを開く
  static Future<void> showActionSheet(
      BuildContext context, {
        required bool isMain,
        required int? subIndex,
        required RequiringReviewProfilePhoto? existingPhoto,
      }) async {
    final container = ProviderScope.containerOf(context);
    container.read(profilePhotoSheetsViewModelProvider.notifier).initializeSlot(
      isMain: isMain,
      subIndex: subIndex,
      existingPhoto: existingPhoto,
    );

    final rootContext = context;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            // アクションシートを閉じた時は、次のステップに遷移していない場合のみクリーンアップ
            // 遷移する場合は状態を保持する必要があるため、ここでは何もしない
            final container = ProviderScope.containerOf(ctx);
            final state = container.read(profilePhotoSheetsViewModelProvider);
            // アクションシートから遷移していない場合（何もせず閉じた場合）のみリセット
            if (state.currentStep == PhotoEditStep.action) {
              container.read(profilePhotoSheetsViewModelProvider.notifier).cleanupOnSheetClose();
            }
          }
        },
        child: Consumer(
          builder: (context, ref, _) {
            final profileState = ref.watch(profilePageViewModelProvider);

            Future<void> onPickFromGallery(BuildContext context) async {
              final container = ProviderScope.containerOf(context);
              final picker = container.read(imagePickerServiceProvider);
              final file = await picker.pickImageFromGallery();
              if (file == null) return;

              container.read(profilePhotoSheetsViewModelProvider.notifier)
              .setSelectedPhoto(file);

              if (context.mounted) {
                context.pop();
                await showCropSheet(rootContext);
              }
            }

            Future<void> onPickFromCamera(BuildContext context) async {
              final container = ProviderScope.containerOf(context);
              final picker = container.read(imagePickerServiceProvider);
              final file = await picker.pickImageFromCamera();
              if (file == null) return;

              container.read(profilePhotoSheetsViewModelProvider.notifier)
              .setSelectedPhoto(file);

              if (context.mounted) {
                context.pop();
                await showCropSheet(rootContext);
              }
            }

            Future<void> onEditCaption(BuildContext context) async {
              final container = ProviderScope.containerOf(context);
              container.read(profilePhotoSheetsViewModelProvider.notifier)
              .setEditingPhoto(existingPhoto);

              if (context.mounted) {
                context.pop();
                await showCaptionSheet(rootContext, isEditingExisting: true);
              }
            }

            Future<void> onDeletePhoto(BuildContext context) async {
              if (existingPhoto == null) return;
              final container = ProviderScope.containerOf(context);
              final vm = container.read(profilePhotoSheetsViewModelProvider.notifier);

              await vm.deletePhoto(existingPhoto.userProfilePhotoId);
              await container.read(profilePageViewModelProvider.notifier).getProfileNoLoading();

              // 削除完了後、フローを終了
              vm.cleanupOnSheetClose();

              if (context.mounted) {
                context.pop();
              }
            }

            return _ActionSheetBody(
              isMain: isMain,
              subIndex: subIndex,
              existingPhoto: existingPhoto,
              profileState: profileState,
              onPickFromGallery: onPickFromGallery,
              onPickFromCamera: onPickFromCamera,
              onEditCaption: existingPhoto != null ? onEditCaption : null,
              // サブ写真のみ削除可能としているが、仕様によってはメイン写真も削除可能にする必要がある
              onDeletePhoto: (!isMain && existingPhoto != null) ? onDeletePhoto : null,
            );
          },
        ),
      ),
    );
  }

  /// クロップシートを開く
  static Future<void> showCropSheet(BuildContext context) async {
    final rootContext = context;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            final container = ProviderScope.containerOf(ctx);
            final vm = container.read(profilePhotoSheetsViewModelProvider.notifier);
            final state = container.read(profilePhotoSheetsViewModelProvider);
            final photoEditing = state.photoEditing;

            // キャプションシートに遷移していない場合（キャンセル）のみロールバック
            // currentStepがcaptionの場合は遷移したので、ここでは何もしない
            if (state.currentStep != PhotoEditStep.caption) {
              // アップロード済みの場合は削除（ロールバック）
              if (photoEditing?.hasUploadedPhoto ?? false) {
                await vm.deleteUploadedPhoto();
              } else {
                // ローカル状態のみクリア
                vm.clearLocalState();
              }
            }
          }
        },
        child: Consumer(
          builder: (context, ref, _) {
            final profileState = ref.watch(profilePageViewModelProvider);
            final sheetsState = ref.watch(profilePhotoSheetsViewModelProvider);
            final photoEditing = sheetsState.photoEditing;

            Future<void> onConfirmCrop(
                BuildContext context, {
                  required File file,
                  required PhotoCropSettings cropSettings,
                }) async {
              final container = ProviderScope.containerOf(context);
              final vm = container.read(profilePhotoSheetsViewModelProvider.notifier);
              final state = container.read(profilePhotoSheetsViewModelProvider);
              final photoEditing = state.photoEditing;
              if (photoEditing == null) return;

              String? originUrl;
              if (photoEditing.isMain) {
                originUrl = await vm.uploadMainPhoto(
                  file: file,
                  cropSettings: cropSettings,
                );
              } else {
                originUrl = await vm.uploadSubPhoto(
                  file: file,
                  cropSettings: cropSettings,
                );
              }

              if (originUrl == null) {
                if (context.mounted) {
                  await EconaNotification.showTopToast(
                    context,
                    message: 'アップロードされた画像を取得できませんでした',
                  );
                }
                return;
              }

              // プロフィール再取得して、originUrl一致で特定（フォールバックあり）
              await container.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
              final updatedProfile = container.read(profilePageViewModelProvider).profile;

              final uploadedPhoto = vm.findUploadedPhotoByOriginUrl(
                profile: updatedProfile,
                originUrl: originUrl,
              ) ??
                  vm.resolveUploadPhoto(
                    profile: updatedProfile,
                    isMain: photoEditing.isMain,
                    subIndex: photoEditing.subIndex,
                  );

              if (uploadedPhoto != null) {
                vm.setEditingPhoto(uploadedPhoto);
              }

              if (context.mounted) {
                context.pop();
                await showCaptionSheet(rootContext, isEditingExisting: false);
              }
            }

            void onRePick(BuildContext context) {
              final container = ProviderScope.containerOf(context);
              final vm = container.read(profilePhotoSheetsViewModelProvider.notifier)
              ..clearLocalState();

              context.pop();
              final state = container.read(profilePhotoSheetsViewModelProvider);
              final photoEditing = state.photoEditing;
              if (photoEditing != null) {
                unawaited(ProfilePhotoSheets.showActionSheet(
                  rootContext,
                  isMain: photoEditing.isMain,
                  subIndex: photoEditing.subIndex,
                  existingPhoto: photoEditing.existingPhoto,
                ));
              }
            }

            return _CropSheetBody(
              profileState: profileState,
              photoEditing: photoEditing,
              onConfirmCrop: onConfirmCrop,
              onRePick: onRePick,
            );
          },
        ),
      ),
    );
  }

  /// キャプションシートを開く
  static Future<void> showCaptionSheet(
      BuildContext context, {
        required bool isEditingExisting,
      }) async {
    final rootContext = context;

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            final container = ProviderScope.containerOf(ctx);
            final vm = container.read(profilePhotoSheetsViewModelProvider.notifier);
            final state = container.read(profilePhotoSheetsViewModelProvider);
            final photoEditing = state.photoEditing;

            // 既存写真を置き換えている場合、アップロード済み写真を削除（ロールバック）
            // 仕様: 既に登録されている画像を置き換えようとした際に、キャプションを保存する前にシートを閉じると
            // アップロードした画像をサーバーから削除して元の画像に戻す
            if (photoEditing?.hasUploadedPhoto ?? false) {
              await vm.deleteUploadedPhoto();
            }

            // ローカル状態をクリア
            vm.clearLocalState();
          }
        },
        child: Consumer(
          builder: (context, ref, _) {
            final sheetsState = ref.watch(profilePhotoSheetsViewModelProvider);
            final photoEditing = sheetsState.photoEditing;

            Future<void> onSaveCaption(
                BuildContext context, {
                  required String text,
                }) async {
              final container = ProviderScope.containerOf(context);
              final vm = container.read(profilePhotoSheetsViewModelProvider.notifier);

              try {
                await vm.saveCaption(text);
                await container.read(profilePageViewModelProvider.notifier).getProfileNoLoading();
              } finally {
                // 保存完了後、フローを終了（状態リセットのみ）
                vm.cleanupOnSheetClose();
              }

              if (context.mounted) {
                context.pop();
              }
            }

            Future<void> onRePick(BuildContext context) async {
              final container = ProviderScope.containerOf(context);
              final vm = container.read(profilePhotoSheetsViewModelProvider.notifier);
              final state = container.read(profilePhotoSheetsViewModelProvider);
              final photoEditing = state.photoEditing;
              if (photoEditing == null) return;

              // 既存写真を編集中の場合はローカル状態のみクリア
              if (isEditingExisting) {
                vm.clearLocalState();
              } else {
                // 新規アップロードの場合はサーバーから削除（仕様: 画像をサーバーから削除し、アクションシートに戻る）
                if (photoEditing.hasUploadedPhoto && photoEditing.uploadedPhotoId != null) {
                  await vm.deleteTemporaryUploadedPhotoById(photoEditing.uploadedPhotoId!);
                }
                vm.clearLocalState();
              }

              if (context.mounted) {
                context.pop();
                await ProfilePhotoSheets.showActionSheet(
                  rootContext,
                  isMain: photoEditing.isMain,
                  subIndex: photoEditing.subIndex,
                  existingPhoto: photoEditing.existingPhoto,
                );
              }
            }

            return _CaptionSheetBody(
              photoEditing: photoEditing,
              onSaveCaption: onSaveCaption,
              onRePick: onRePick,
            );
          },
        ),
      ),
    );
  }
}