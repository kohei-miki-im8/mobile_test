import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_tutorial_page.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/users/user_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimulationTopPage extends HookConsumerWidget {
  const SimulationTopPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() async {
        final prefs = await SharedPreferences.getInstance();
        final hasSeenTutorial = prefs.getBool('has_seen_simulation_tutorial') ?? false;

        if (!hasSeenTutorial && context.mounted) {
          await const SimulationTutorialRouteData().push<void>(context);

          // チュートリアル終了後にフラグを設定
          if (context.mounted) {
            await prefs.setBool('has_seen_simulation_tutorial', true);
          }
        }
      });
      return null;
    }, const []);

    const titleText = 'やりとりシミュレーションへ\nようこそ';
    const bodyText = '”お相手との会話、AIで練習しませんか？”\n実在のお相手を再現したAIと会話して、\n楽しみながらコミュニケーション力を磨ける\nAIトーク機能！';
    const cautionaryNoteText = '※10往復くらいメッセージのやりとりを行うと「なりきり挨拶・なりきり返信機能」を利用できるようになります';

    return Scaffold(
      appBar: CenterAppBar(
        leading: IconButton(
          icon: Assets.images.icons.close.image(
            height: 32,
            width: 32,
          ),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: context.pop,
        ),
        titleText: EconaAppBarText.simulationTitle,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _Title(text: titleText, textAlign: TextAlign.center),
            const _Content(text: bodyText, textAlign: TextAlign.center),
            EconaGradientButton(
              onPressed: () async {
                final userState = await ref.read(userViewModelProvider.future);
                final userStatus = userState.userStatus;
                final hasPersonalitySummary = userStatus?.hasPersonalitySummary ?? false;
                final hasToneSummary = userStatus?.hasToneSummary ?? false;

                await const SimulationChoosePartnerRouteData().push<void>(context);
                // if(hasPersonalitySummary && hasToneSummary) {
                //   await const SimulationChoosePartnerRouteData().push<void>(context);
                // } else {
                //   await showDialog<void>(
                //     context: context,
                //     builder: (dialogContext) => Dialog(
                //       backgroundColor: Colors.transparent,
                //       elevation: 0,
                //       insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                //       child: EconaModal(
                //         message: 'シミュレーションを利用するにはAIカウンセリングを行ってください。',
                //         buttonText: 'AIカウンセリングで\n価値観診断をする',
                //         onButtonPressed: () async {
                //           dialogContext.pop();
                //           if (!context.mounted) return;
                //           await const CounselingRouteData().push<void>(context);
                //         },
                //       ),
                //     ),
                //   );
                // }
              },
              text: 'はじめる',
            ),
            const SizedBox(height: 64),
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Center(
                child: Text(
                  cautionaryNoteText,
                  style: EconaTextStyle.regularSmall160(
                    color: EconaColor.grayDarkActive,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.text,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: EconaTextStyle.simulationTitle(
          color: EconaColor.grayDarkActive,
        ),
        textAlign: textAlign,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.text,
    this.textAlign = TextAlign.left,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: EconaTextStyle.simulationContent(
          color: EconaColor.grayDarkActive,
        ),
        textAlign: textAlign,
      ),
    );
  }
}