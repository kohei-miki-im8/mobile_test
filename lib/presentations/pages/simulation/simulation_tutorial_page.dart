import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class SimulationTutorialPage extends HookWidget {
  const SimulationTutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final currentPage = useState(0);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: EconaAppBarText.simulationTitle,
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.close.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (int page) { currentPage.value = page; },
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 3) {
                  final texts = _tutorialText[index].split('\n');
                  final title = texts[0];
                  final listItems = texts.sublist(1);
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 64),
                        child: Image.asset(_tutorialImage[index]),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...listItems.map((item) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: CheckListItem(text: item.trim()),
                              );
                            }),
                            const SizedBox(height: 16),
                            Text(
                              title,
                              style: EconaTextStyle.simulationTutorial(
                                color: EconaColor.grayDarkActive,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
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
                      const SizedBox(height: 16),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 64),
                        child: Image.asset(_tutorialImage[index]),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          _tutorialText[index],
                          style: EconaTextStyle.simulationTutorial(
                            color: EconaColor.grayDarkActive,
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 24),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: currentPage.value == index
                      ? const LinearGradient(colors: [Color(0xFFD097DB), Color(0xFF8887EE)])
                      : null,
                  color: currentPage.value != index
                      ? const Color(0x667A95BA)
                      : null,
                  boxShadow: [
                    BoxShadow(
                      color: currentPage.value == index
                          ? const Color(0x8C936EF8)
                          : Colors.white.withValues(alpha: 0.9),
                      blurRadius: 4,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class CheckListItem extends StatelessWidget {
  const CheckListItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.icons.gradientCheck.svg(width: 12, height: 12),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: EconaTextStyle.simulationTutorial(
              color: EconaColor.grayDarkActive,
            ),
          ),
        ),
      ],
    );
  }
}

const List<String> _tutorialText = [
  'まずは、お相手の人格（※）を宿したAIから話し相手となるAIを選びます\n※AIカウンセリングの結果やチャットの口調データから得られたお相手の特徴',
  '選んだAIと実際にマッチングした感覚で会話をしてみましょう！',
  'お相手のAIはChatGPTのような生成AIと違い、実際にLaviを使っているお相手の人格を宿したAIです。リアルな会話をお楽しみください',
  'AIとの会話を通して楽しくコミュニケーション力をアップ！\n「話すのが苦手…」を卒業\n　 トーク力を磨く！\n　 自信をもって話せるようになる',
];

const List<String> _tutorialImage = [
  'assets/images/illusts/simulation_tutorial_1.webp',
  'assets/images/illusts/simulation_tutorial_2.webp',
  'assets/images/illusts/simulation_tutorial_3.webp',
  'assets/images/illusts/simulation_tutorial_4.webp',
];


