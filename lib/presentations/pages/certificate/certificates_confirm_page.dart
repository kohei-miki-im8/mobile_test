import 'dart:io';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_checkbox.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/embed_camera.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/enums/certificate_type.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/certificates_confirm_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class ConfirmSinglePage extends HookConsumerWidget {
  const ConfirmSinglePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final File certificateImage = (extra?['imageFile'] as File?) ?? File('');

    return _BaseConfirmPage(
      certificateImage: certificateImage,
      certificateType: CertificateType.single,
    );
  }
}

class ConfirmFamilyRegisterPage extends HookConsumerWidget {
  const ConfirmFamilyRegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final File certificateImage = (extra?['imageFile'] as File?) ?? File('');

    return _BaseConfirmPage(
      certificateImage: certificateImage,
      certificateType: CertificateType.familyRegister,
    );
  }
}

class ConfirmFamilyRegisterExtract extends HookConsumerWidget {
  const ConfirmFamilyRegisterExtract({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final File certificateImage = (extra?['imageFile'] as File?) ?? File('');

    return _BaseConfirmPage(
      certificateImage: certificateImage,
      certificateType: CertificateType.familyRegisterExtract,
    );
  }
}

class _BaseConfirmPage extends HookConsumerWidget {
  const _BaseConfirmPage({
    required this.certificateImage,
    required this.certificateType,
  });

  final File certificateImage;
  final CertificateType certificateType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(certificateConfirmViewModelProvider);

    final upperRowText = ref.watch(confirmText1ForCertificateTypeProvider(certificateType));
    final lowerRowText = ref.watch(confirmText2ForCertificateTypeProvider(certificateType));
    final guideText = ref.watch(confirmGuideTextForCertificateTypeProvider(certificateType));
    final transitionDestination = ref.watch(confirmTransitionDestinationForCertificateTypeProvider(certificateType));

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: state.when(
        data: (confirmState) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (confirmState.error != null)...[
                    Builder(
                      builder: (context) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          await EconaNotification.showTopToast(
                            context,
                            message: '証明書の提出に失敗しました',
                          );
                        });
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                  InnerShadowText(
                    text: '撮影画像の確認',
                    textStyle: EconaTextStyle.labelMedium2140(
                      color: EconaColor.grayNormal,
                      shadows: EconaShadow.headlineShadows,
                    ),
                    innerShadowTextStyles: [
                      EconaTextStyle.labelMedium2140(
                        foreground: EconaShadow().headlineInnerShadow,
                      ),
                    ],
                  ),
                  AspectRatio(
                    aspectRatio: 294/467,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
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
                            child: Image.file(
                              certificateImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InnerShadowText(
                    text: '下記項目を確認しチェックをいれてください',
                    textStyle: EconaTextStyle.labelMedium1140(
                      color: EconaColor.grayNormal,
                      shadows: EconaShadow.headlineShadows,
                    ),
                    innerShadowTextStyles: [
                      EconaTextStyle.labelMedium1140(
                        foreground: EconaShadow().headlineInnerShadow,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: EconaCheckbox(
                      height: 20,
                      width: 20,
                      value: confirmState.upperCheckBoxValue,
                      onChanged: (bool? value) {
                        ref.read(certificateConfirmViewModelProvider.notifier).updateUpperCheckBox(value ?? false);
                      },
                      text: upperRowText,
                      textStyle: EconaTextStyle.labelMedium1140(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: EconaCheckbox(
                      height: 20,
                      width: 20,
                      value: confirmState.lowerCheckBoxValue,
                      onChanged: (bool? value) {
                        ref.read(certificateConfirmViewModelProvider.notifier).updateLowerCheckBox(value ?? false);
                      },
                      text: lowerRowText,
                      textStyle: EconaTextStyle.labelMedium1140(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ),
                  EconaGradientButton(
                    text: '提出する',
                    onPressed: () async {
                      final isSuccess = await ref.read(certificateConfirmViewModelProvider.notifier)
                          .submitCertificate(certificateImage, certificateType);
                      if(isSuccess && context.mounted) {
                        await EconaNotification.showTopToast(
                          context,
                          message: '証明書をアップロードしました',
                        );
                        // 2階層戻る
                        if (context.mounted) {
                          GoRouter.of(context)
                          ..pop()
                          ..pop();
                        }
                      } else if (context.mounted) {
                        await EconaNotification.showTopToast(
                          context,
                          message: '証明書の提出に失敗しました',
                        );
                      }
                    },
                  ),
                  InkWell(
                    onTap: () async {
                      await showGeneralDialog(
                        context: context,
                        barrierDismissible: false,
                        pageBuilder: (dialogContext, animation, secondaryAnimation) {
                          return EmbedCamera(
                            guideText: guideText,
                            instructionText: '書類を真上から枠に収まるよう\n撮影してください',
                            onImageCaptured: (File imageFile) async {
                              dialogContext.pop();
                              switch (certificateType) {
                                case CertificateType.single:
                                  await context.push(
                                    const ConfirmSingleRouteData().location,
                                    extra: {
                                      'imageFile': imageFile,
                                      'certificateType': certificateType,
                                    },
                                  );
                                case CertificateType.familyRegister:
                                  await context.push(
                                    const ConfirmFamilyRegisterRouteData().location,
                                    extra: {
                                      'imageFile': imageFile,
                                      'certificateType': certificateType,
                                    },
                                  );
                                case CertificateType.familyRegisterExtract:
                                  await context.push(
                                    const ConfirmFamilyRegisterExtractRouteData().location,
                                    extra: {
                                      'imageFile': imageFile,
                                      'certificateType': certificateType,
                                    },
                                  );
                              }
                            },
                          );
                        },
                      );
                    },
                    child: Text(
                      '再撮影',
                      style: EconaTextStyle.labelMedium1140(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
        loading: () => const Center(child: EconaLoadingIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('エラーが発生しました: $error'),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(certificateConfirmViewModelProvider);
                },
                child: const Text('再試行'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}