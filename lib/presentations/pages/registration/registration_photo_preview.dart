import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_crop_state.dart';
import 'package:econa_mobile_app/presentations/shared/photos/selected_photo_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPhotoPreview extends HookConsumerWidget {
  const RegistrationPhotoPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPhoto = ref.watch(selectedPhotoViewModelProvider);
    final cropState = ref.watch(photoCropStateViewModelProvider);
    final transformController = useMemoized(() {
      final c = TransformationController();
      if (cropState != null) {
        final m = Matrix4.identity();
        m.storage[0] = cropState.scale;
        m.storage[5] = cropState.scale;
        m.storage[12] = cropState.transX;
        m.storage[13] = cropState.transY;
        c.value = m;
      }
      return c;
    }, [
      cropState?.scale,
      cropState?.transX,
      cropState?.transY,
      cropState?.viewportWidth,
      cropState?.viewportHeight,
    ]);

    final viewportSize = useRef<Size?>(null);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '写真',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            // クロップ情報を破棄
            ref.read(photoCropStateViewModelProvider.notifier).clear();
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
      body: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
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
                          ? LayoutBuilder(
                            builder: (context, constraints) {
                              viewportSize.value = Size(
                                constraints.maxWidth,
                                constraints.maxHeight,
                              );
                              return InteractiveViewer(
                                transformationController: transformController,
                                minScale: 1,
                                maxScale: 4,
                                panEnabled: true,
                                scaleEnabled: true,
                                boundaryMargin: const EdgeInsets.all(160),
                                clipBehavior: Clip.hardEdge,
                                onInteractionEnd: (_) {
                                  final m = transformController.value;
                                  final scale = m.storage[0];
                                  final transX = m.storage[12];
                                  final transY = m.storage[13];
                                  final vp = viewportSize.value;
                                  ref.read(photoCropStateViewModelProvider.notifier).set(
                                    PhotoCropState(
                                      scale: scale,
                                      transX: transX,
                                      transY: transY,
                                      viewportWidth: vp?.width ?? 0,
                                      viewportHeight: vp?.height ?? 0,
                                    ),
                                  );
                                },
                                child: Image.file(selectedPhoto),
                              );
                            },
                          )
                          : const Center(child: Text('画像が選択されていません')),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              spacing: 16,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  height: 52,
                  child: EconaPlainButton(
                    text: 'コメントを追加する・編集する',
                    onPressed: () async {
                      await context.push(EconaPath.registrationPhotoUpload);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  height: 52,
                  child: EconaPlainButton(
                    text: '写真を削除する',
                    onPressed: () async {
                      ref.read(photoCropStateViewModelProvider.notifier).clear();
                      ref.read(selectedPhotoViewModelProvider.notifier).clearSelectedPhoto();
                      context.pop();
                    },
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}