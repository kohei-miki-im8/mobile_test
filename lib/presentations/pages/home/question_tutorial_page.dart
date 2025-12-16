// しつもんのチュートリアルページです

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/dot_indicator_list.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_tutorial_page.g.dart';

class TutorialData {
  const TutorialData({
    required this.image,
    required this.text,
  });
  final AssetGenImage image;
  final String text;
}

@riverpod
class TutorialController extends _$TutorialController {
  @override
  ({PageController pageController, int currentIndex}) build() {
    final pageController = PageController();
    ref.onDispose(pageController.dispose);
    return (pageController: pageController, currentIndex: 0);
  }

  void onPageChanged(int index) {
    state = (pageController: state.pageController, currentIndex: index);
  }
}

@riverpod
List<TutorialData> tutorialData(Ref ref) {
  return [
    TutorialData(
      image: Assets.images.illusts.homeTutorial1,
      text: 'お相手について知りたいこと、聞いてみたいことがあって「いいね」をするか迷う…\n'
          'そんなときは「しつもん」の出番です',
    ),
    TutorialData(
      image: Assets.images.illusts.homeTutorial2,
      text: 'しつもんすると、マッチングしていないお相手に質問を送ることができます。'
          'しつもんは匿名で送れるので、お相手はあなたからのしつもんだとわかりません。'
          '気になることを気軽に聞いてみましょう',
    ),
    TutorialData(
      image: Assets.images.illusts.homeTutorial3,
      text: 'しつもんと回答の文章は全てAIが整えてくれるので、気軽に送り合いましょう。'
          'また、しつもんに回答があった場合、いいねのポイントを消費せずに'
          'お相手にいいねを送ることができます',
    ),
    TutorialData(
      image: Assets.images.illusts.homeTutorial4,
      text: 'お相手に寄せられたすべてのしつもんとそれに対する回答を'
          'LPを消費することで閲覧することができます',
    ),
  ];
}

class QuestionTutorialPage extends HookConsumerWidget {
  const QuestionTutorialPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tutorialController = ref.watch(tutorialControllerProvider.notifier);
    final tutorialState = ref.watch(tutorialControllerProvider);
    final data = ref.watch(tutorialDataProvider);

    void handleDotTapped(int index) {
      tutorialState.pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      tutorialController.onPageChanged(index);
    }

    return Scaffold(
      appBar: CenterAppBar(
        titleText: EconaAppBarText.questionTitle,
        leading: IconButton(
          icon: Assets.images.icons.close.image(
            height: 32,
            width: 32,
          ),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: tutorialState.pageController,
                onPageChanged: tutorialController.onPageChanged,
                allowImplicitScrolling: false,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final tutorialData = data[index];
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 71),
                        tutorialData.image.image(),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            tutorialData.text,
                            style: const TextStyle(
                              fontFamily: 'NotoSansJP',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 2, // 200% line height
                              letterSpacing: 0.04, // 0.25% of 16px = 0.04
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (tutorialState.currentIndex == data.length - 1) ...[
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  '閉じる',
                  style: EconaTextStyle.labelMedium1140(
                    color: EconaColor.grayNormal,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 45),
            DotIndicatorList(
              count: data.length,
              currentIndex: tutorialState.currentIndex,
              onDotTapped: handleDotTapped,
            ),
            const SizedBox(height: 41),
          ],
        ),
      ),
    );
  }
}
