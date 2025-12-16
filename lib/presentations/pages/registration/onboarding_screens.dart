import 'package:econa_mobile_app/domains/entities/registration_field.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/registration/next_button.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// メインプロフィールオンボーディング
class OnboardingMainProfile extends HookConsumerWidget {
  const OnboardingMainProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseOnboarding(
      titleText: 'メインプロフィール',
      text: 'はじめに、あなたについて教えてください',
      picture: Assets.images.illusts.onboardingMainProfile.image(),
      onTap: () async {
        await RegistrationProfileFieldRouteData(field: RegistrationField.gender.name).push<void>(context);
      },
    );
  }
}

// 写真オンボーディング
class OnboardingPhoto extends HookConsumerWidget {
  const OnboardingPhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseOnboarding(
      titleText: 'メイン写真',
      text: 'つぎは、あなたの写真を登録してみましょう',
      picture: Assets.images.illusts.onboardingPhoto.image(),
      onTap: () async {
        await context.push(EconaPath.registrationPhoto);
      },
    );
  }
}

// その他プロフィールオンボーディング
class OnboardingSubProfile extends HookConsumerWidget {
  const OnboardingSubProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseOnboarding(
      titleText: 'その他のプロフィール',
      text: 'あなたについて、もう少し教えてください',
      picture: Assets.images.illusts.onboardingSubProfile.image(),
      onTap: () async {
        await RegistrationProfileFieldRouteData(field: RegistrationField.height.name).push<void>(context);
      },
    );
  }
}

// LIKE/タグオンボーディング
class OnboardingTag extends HookConsumerWidget {
  const OnboardingTag({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseOnboarding(
      titleText: 'Likeタグの登録',
      text: 'あなたの"好き"について、教えてください',
      picture: Assets.images.illusts.onboardingProfileLikeTag.image(),
      onTap: () async {
        await context.push(EconaPath.registrationTagCategory);
      },
    );
  }
}

// AIカウンセリングオンボーディング
class OnboardingCounseling extends HookConsumerWidget {
  const OnboardingCounseling ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseOnboarding(
      titleText: 'AIカウンセリング',
      text: '入力お疲れ様でした\n\n最後に...',
      onTap: () async {
        await context.push(EconaPath.counselingOnboarding2);
      },
    );
  }
}

class OnboardingCounseling2 extends HookConsumerWidget {
  const OnboardingCounseling2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseOnboarding(
      titleText: 'AIカウンセリング',
      text: 'AIカウンセラーの質問に答えて、あなたの価値観や深層心理を一緒に見つけにいきましょう',
      picture: Assets.images.illusts.onboardingCounseling.image(),
      onTap: () async {
        await const CounselingRouteData(isRegistrationFlow: true).push(context);
      },
    );
  }
}

// オンボーディングのテンプレート
class _BaseOnboarding extends HookConsumerWidget {
  const _BaseOnboarding({
    required this.titleText,
    required this.text,
    required this.onTap,
    this.picture,
  });

  final String titleText;
  final String text;
  final Image? picture;
  final Future<void> Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CenterAppBar(
        titleText: titleText,
        backgroundColor: const Color(0xFFF0EFFD),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 420,
            padding: const EdgeInsets.only(left: 42, top: 52, right: 42, bottom: 24),
            child: InnerShadowText(
              text: text,
              maxLines: 2,
              softWrap: true,
              textStyle: EconaTextStyle.headlineLarge(
                color: EconaColor.grayGrayPurple400,
                shadows: EconaShadow.headlineShadows,
              ),
              innerShadowTextStyles: [
                EconaTextStyle.headlineLarge(
                  foreground: EconaShadow().headlineInnerShadow,
                ),
              ],
            ),
          ),
          if(picture != null)...[
            Container(
              margin: const EdgeInsets.only(left: 34, top: 24, right: 34),
              child: picture,
            ),
          ],
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(40),
              child: CircleNextButton(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}