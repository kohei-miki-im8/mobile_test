// らしさマッチチュートリアルページです

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/dot_indicator_list.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rashisa_match_tutorial_page.g.dart';

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
      image: Assets.images.illusts.rashisaMatchTutorial1,
      text: 'AIカウンセリングの結果をもとに、AIがあなたの深層心理や価値観を分析します',
    ),
    TutorialData(
      image: Assets.images.illusts.rashisaMatchTutorial2,
      text: '外見やスペックなどの表面的な情報からは読み取れない、'
          '相性の良い最適なパートナーとなり得るお相手を紹介します',
    ),
    TutorialData(
      image: Assets.images.illusts.rashisaMatchTutorial3,
      text: 'しつもんと回答の文章は全てAIが整えてくれるので、気軽に送り合いましょう。'
          'また、しつもんに回答があった場合、'
          'いいねのポイントを消費せずにお相手にいいねを送ることができます',
    ),
  ];
}

class RashisaMatchTutorialPage extends HookConsumerWidget {
  const RashisaMatchTutorialPage({
    required this.onTutorialCompleted,
    super.key,
  });

  final VoidCallback onTutorialCompleted;

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
        titleText: EconaAppBarText.rashisaMatchTitle,
        leading: IconButton(
          icon: Assets.images.icons.close.image(
            height: 32,
            width: 32,
          ),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: onTutorialCompleted,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: PageView.builder(
          controller: tutorialState.pageController,
          onPageChanged: tutorialController.onPageChanged,
          itemCount: data.length,
          itemBuilder: (context, index) {
            final tutorialData = data[index];
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                  if (tutorialState.currentIndex == data.length - 1) ...[
                    const SizedBox(height: 45),
                    TextButton(
                      onPressed: onTutorialCompleted,
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
            );
          },
        ),
      ),
    );
  }
}
