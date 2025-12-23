import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/photo_crop_settings.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_crop_state.dart';
import 'package:econa_mobile_app/presentations/shared/photos/selected_photo_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPhotoUpload extends HookConsumerWidget {
  const RegistrationPhotoUpload({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPhoto = ref.watch(selectedPhotoViewModelProvider);

    // TextEditingControllerをhookで管理
    final captionController = useTextEditingController();
    final isUploading = useState(false);
    final scrollController = useScrollController();
    final textFieldFocusNode = useFocusNode();
    final textFieldKey = useMemoized(() => GlobalKey());

    // フォーカス時にスクロールする
    useEffect(() {
      void onFocusChange() {
        if (textFieldFocusNode.hasFocus && textFieldKey.currentContext != null) {
          // キーボードが表示されるまで少し待つ
          Future.delayed(const Duration(milliseconds: 300), () {
            if (!textFieldKey.currentContext!.mounted) return;

            final renderBox = textFieldKey.currentContext!.findRenderObject() as RenderBox?;
            if (renderBox != null && scrollController.hasClients) {
              final position = renderBox.localToGlobal(Offset.zero);
              final screenHeight = MediaQuery.of(context).size.height;
              final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
              final visibleHeight = screenHeight - keyboardHeight;

              // テキストフィールドがキーボードに隠れている場合、スクロール
              if (position.dy + renderBox.size.height > visibleHeight) {
                final scrollOffset = position.dy + renderBox.size.height - visibleHeight + 20;
                scrollController.animateTo(
                  scrollController.offset + scrollOffset,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            }
          });
        }
      }

      textFieldFocusNode.addListener(onFocusChange);
      return () {
        textFieldFocusNode.removeListener(onFocusChange);
      };
    }, [textFieldFocusNode, scrollController]);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '写真',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await PhotoSkipModal.show(context);
            },
            child: InnerShadowText(
              text: 'スキップ',
              textStyle: EconaTextStyle.labelMedium1140(
                color: EconaColor.gray200,
                shadows: EconaShadow.headlineShadows,
              ),
              innerShadowTextStyles: [
                EconaTextStyle.labelMedium1140(
                  foreground: EconaShadow().headlineInnerShadow,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        controller: scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kToolbarHeight,
          ),
          child: Column(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 240,
                    height: 384,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: ShadowAndGradientBorderContainer(
                      borderRadius: BorderRadius.circular(24),
                      borderWidth: 1,
                      gradients: const[],
                      backgroundColor: EconaColor.grayLightActive,
                      innerShadows: [
                        BoxShadow(
                          offset: const Offset(2, 2),
                          blurRadius: 20,
                          color: const Color(0xFF353E72).withValues(alpha: 0.1),
                        ),
                        BoxShadow(
                          offset: const Offset(-1, -1),
                          blurRadius: 3,
                          color: const Color(0xFFFFFFFF).withValues(alpha: 0.8),
                        ),
                      ],
                      dropShadows: const [],
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: selectedPhoto != null
                              ? Image.file(
                            selectedPhoto,
                            fit: BoxFit.cover,
                          )
                              : const Center(
                            child: Text('画像が選択されていません'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    key: textFieldKey,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    height: 82,
                    child: ShadowAndGradientBorderContainer(
                      borderRadius: BorderRadius.circular(16),
                      borderWidth: 1,
                      gradients: const [
                        LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFFD6E3F3), // #D6E3F3
                            Color(0xFFFFFFFF), // #FFFFFF
                          ],
                        ),
                        LinearGradient(
                          begin: Alignment.topLeft, // グラデーションの開始位置は適宜調整
                          end: Alignment.bottomRight, // グラデーションの終了位置は適宜調整
                          colors: [
                            Color(0xFFFFFFFF), // #D6E3F3
                            Color(0xFFFFFFFF), // #FFFFFF
                          ],
                        ),
                      ],
                      backgroundColor: Colors.white,
                      innerShadows: [
                        BoxShadow(
                          offset: const Offset(4, 4),
                          blurRadius: 14,
                          color: const Color(0xFFC1C7EE).withValues(alpha: 0.5),
                        ),
                        BoxShadow(
                          offset: const Offset(-4, -4),
                          blurRadius: 9,
                          color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
                        ),
                        BoxShadow(
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                          color: const Color(0xFFC5C1EE).withValues(alpha: 0.25),
                        ),
                      ],
                      dropShadows: const [
                        BoxShadow(
                          offset: Offset(-6, -6),
                          blurRadius: 20,
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                      child: TextField(
                        controller: captionController,
                        focusNode: textFieldFocusNode,
                        maxLength: 24,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          hintText: '写真の説明やお相手にアピールしたい内容を一言',
                          hintStyle: EconaTextStyle.labelHintText(
                            color: EconaColor.chatInputHintText,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    alignment: Alignment.centerRight,
                    child: Text(
                      '24文字以内',
                      style: EconaTextStyle.labelXSmall(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                height: 52,
                width: double.infinity,
                child: EconaGradientButton(
                  onPressed: () async {
                    if (isUploading.value) return;
                    if (selectedPhoto == null) {
                      await EconaNotification.showTopToast(
                        context,
                        message: '画像が選択されていません',
                      );
                      return;
                    }

                    try {
                      isUploading.value = true;

                      final crop = ref.read(photoCropStateViewModelProvider);
                      PhotoCropSettings? cropSettings;

                      if(crop != null) {
                        // スケールとビューポートの寸法を検証
                        if (crop.scale <= 0 || crop.viewportWidth <= 0 || crop.viewportHeight <= 0) {
                          cropSettings = null;
                        } else {
                          final vpW = crop.viewportWidth;
                          final vpH = crop.viewportHeight;
                          final centerX = ((vpW / 2 - crop.transX) / crop.scale).round();
                          final centerY = ((vpH / 2 - crop.transY) / crop.scale).round();
                          cropSettings = PhotoCropSettings(
                            centerX: centerX,
                            centerY: centerY,
                            scale: crop.scale,
                          );
                        }
                      }

                      // 画像アップロードとキャプション保存を実行
                      await ref.read(registrationPageViewModelProvider.notifier).uploadPhotoAndSaveCaption(
                        selectedPhoto,
                        captionController.text,
                        cropSettings,
                      );

                      try {
                        await ref.read(registrationPageViewModelProvider.notifier).createRegistrationStepLog(
                          CreateRegistrationStepLogRequest(
                            registrationStep: RegistrationStep.REGISTRATION_STEP_2_01,
                          ),
                        );
                      } on Exception catch (_) {
                        // 登録ステップログ作成に失敗した場合は、処理は続行する
                      }

                      if (context.mounted) {
                        // 選択された写真をクリア
                        ref.read(selectedPhotoViewModelProvider.notifier).clearSelectedPhoto();

                        // 次へ
                        const SubProfileOnboardingRouteData().go(context);
                      }
                    } on Exception catch (_) {
                      if (context.mounted) {
                        await EconaNotification.showTopToast(
                          context,
                          message: '画像のアップロードに失敗しました。',
                        );
                      }
                    } finally {
                      isUploading.value = false;
                    }
                  },
                  text: '保存',
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 52),
            ],
          ),
        ),
      ),
    );
  }
}