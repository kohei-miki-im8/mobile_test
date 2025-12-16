import 'dart:io';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/embed_camera.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/loading_overlay.dart';
import 'package:econa_mobile_app/presentations/enums/certificate_type.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/single_certificate_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleCertificatePage extends HookConsumerWidget {
  const SingleCertificatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(singleCertificatePageViewModelProvider);

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
      body: LoadingOverlay(
        isLoading: state.isProcessing,
        message: state.loadingMessage,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (state.error != null)...[
                Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          state.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ref.read(singleCertificatePageViewModelProvider.notifier).clearError();
                        },
                        child: const Text('閉じる'),
                      ),
                    ],
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: InnerShadowText(
                  text: '独身証明',
                  textStyle: EconaTextStyle.headlineLarge(
                    color: EconaColor.grayNormal,
                    shadows: EconaShadow.headlineShadows,
                  ),
                  innerShadowTextStyles: [
                    EconaTextStyle.headlineLarge(
                      foreground: EconaShadow().headlineInnerShadow,
                    ),
                  ],
                ),
              ),
              const Guidance(),
              const BachelorCertificateScanButton(),
              const FamilyRegisterScanButton(),
              const FamilyRegisterExtractScanButton(),
              const ExplanationText(),
              const CautionaryText(),
            ],
          ),
        ),
      )
    );
  }
}

class Guidance extends HookConsumerWidget {
  const Guidance ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InnerShadowText(
          text: '提出する書類を選んでください',
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
        Text(
          '書類は3か月以内に発行したものにかぎり有効です',
          style: EconaTextStyle.labelSmall140(
            color: EconaColor.grayNormal,
          ),
        ),
      ],
    );
  }
}

class BachelorCertificateScanButton extends HookConsumerWidget {
  const BachelorCertificateScanButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final instructionText = ref.watch(instructionTextForCertificateTypeProvider(CertificateType.single));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: EconaGradientButton(
        text: '独身証明書',
        expandWidth: true,
        onPressed: () async {
          await showGeneralDialog(
            context: context,
            barrierDismissible: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return EmbedCamera(
                instructionText: instructionText,
                onImageCaptured: (File imageFile) async {
                  context.pop();
                  // 撮影された画像を処理
                  ref.read(singleCertificatePageViewModelProvider.notifier)
                      .handleCapturedImage(context, imageFile, CertificateType.single);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class FamilyRegisterScanButton extends HookConsumerWidget {
  const FamilyRegisterScanButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guideText = ref.watch(guideTextForCertificateTypeProvider(CertificateType.familyRegister));
    final instructionText = ref.watch(instructionTextForCertificateTypeProvider(CertificateType.familyRegister));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: EconaGradientButton(
        text: '戸籍謄本※',
        expandWidth: true,
        onPressed: () async {
          await showGeneralDialog(
            context: context,
            barrierDismissible: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return EmbedCamera(
                guideText: guideText,
                instructionText: instructionText,
                onImageCaptured: (File imageFile) async {
                  context.pop();
                  // 撮影された画像を処理
                  ref.read(singleCertificatePageViewModelProvider.notifier)
                      .handleCapturedImage(context, imageFile, CertificateType.familyRegister);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class FamilyRegisterExtractScanButton extends HookConsumerWidget {
  const FamilyRegisterExtractScanButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guideText = ref.watch(guideTextForCertificateTypeProvider(CertificateType.familyRegisterExtract));
    final instructionText = ref.watch(instructionTextForCertificateTypeProvider(CertificateType.familyRegisterExtract));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: EconaGradientButton(
        text: '戸籍抄本※',
        expandWidth: true,
        onPressed: () async {
          await showGeneralDialog(
            context: context,
            barrierDismissible: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return EmbedCamera(
                guideText: guideText,
                instructionText: instructionText,
                onImageCaptured: (File imageFile) async {
                  context.pop();
                  // 撮影された画像を処理
                  ref.read(singleCertificatePageViewModelProvider.notifier)
                      .handleCapturedImage(context, imageFile, CertificateType.familyRegisterExtract);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ExplanationText extends HookConsumerWidget {
  const ExplanationText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(
          style: EconaTextStyle.labelSmall140( // デフォルトのテキストスタイル
            color: EconaColor.grayNormal,
          ),
          children: <TextSpan>[
            const TextSpan(
              text: '※マイナンバーカードをお持ちの方はコンビニエンスストアでも戸籍謄本・戸籍抄本を取得できます。\n',
            ),
            TextSpan(
              text: 'こちら',
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.feedbackBlueNormal,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(Uri.parse('https://www.lg-waps.go.jp/01-04.html'));
                },
            ),
            const TextSpan(
              text: 'から、お住まいの市区町村または本籍地がコンビニ交付サービスを提供しているかを確認できます。',
            ),
          ],
        ),
      ),
    );
  }
}

class CautionaryText extends HookConsumerWidget {
  const CautionaryText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '※戸籍抄本・戸籍謄本は「本籍地」「従前戸籍情報」を黒く塗りつぶすか、紙や付箋、テープなどで必ず隠してご提出ください。',
        style: EconaTextStyle.labelSmall140(
          color: EconaColor.feedbackRedNormalHover,
        ),
      ),
    );
  }
}
