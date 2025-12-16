import 'package:econa_mobile_app/domains/entities/question.dart' as question_entity;
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/domains/entities/chat_input_config.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_state.dart';
import 'package:econa_mobile_app/presentations/components/econa_feature_action_sheet.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/home/question_page_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EconaQuestionModal extends ConsumerWidget {
  const EconaQuestionModal({
    required this.toUserId,
    required this.questions,
    this.isSubscription = true,
    super.key,
  });

  // サブスク加入状態（モザイク表示有無）
  final String toUserId;
  final bool isSubscription;
  final List<question_entity.Question> questions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: ShadowAndGradientBorderContainer(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        borderWidth: 1,
        gradients: const [
          LinearGradient(
            colors: [Color(0xFFD6E3F3), Color(0xFFFFFFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ],
        backgroundColor: const Color(0xFFF6FBFE),
        innerShadows: const [
          BoxShadow(
            color: Color(0x1A7273AB), // #7273AB 10%
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
        ],
        dropShadows: const [
          BoxShadow(
            color: Color(0x3D3E4AB5), // #3E4AB5 24%
            offset: Offset(-4, -4),
            blurRadius: 20,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 20,
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
          child: Column(
            spacing: 16,
            mainAxisSize: MainAxisSize.min,
            children: [
              // タイトル部
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'あなたの質問をAIがお相手に届けます',
                      style: EconaTextStyle.labelMedium2140(
                        color: EconaColor.grayNormal,
                      ),
                      softWrap: true,
                    ),
                  ),
                  IconButton(
                    icon: Assets.images.icons.close.image(
                      width: 24,
                      height: 24,
                    ),
                    iconSize: 40,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              // 本文
              Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'AIがあなたのしつもんをサポート！',
                    style: EconaTextStyle.labelMedium2160(
                      color: EconaColor.grayDarkActive,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  Text(
                    'お相手の気になることを聞いてみましょう',
                    style: EconaTextStyle.labelMedium2160(
                      color: EconaColor.grayDarkActive,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  Text(
                    '※しつもんはすべて匿名で行われます',
                    style: EconaTextStyle.labelMedium2160(
                      color: EconaColor.grayDarkActive,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ],
              ),
              // ボタン
              EconaGradientButton(
                text: '質問する',
                onPressed: () async {
                  final shouldOpenChatInput = await showModalBottomSheet<bool>(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (ctx) {
                      return EconaFeatureActionSheet(
                        title: 'しつもん',
                        leading: Assets.images.icons.hatena.image(width: 72, height: 72),
                        text:
                        'マッチングしていないお相手に匿名で質問を送ることができます。AIがサポートするので気軽に送ろう！',
                        pointType: PointType.lp,
                        pointsToUse: 1,
                        buttonText: '質問する',
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                      );
                    },
                  );

                  if (!context.mounted || shouldOpenChatInput != true) {
                    return;
                  }

                  if(context.mounted) context.pop();

                  await showModalBottomSheet<void>(
                    context: context,
                    useRootNavigator: true,
                    isScrollControlled: true,
                    backgroundColor: const Color(0xFFF6FBFE),
                    builder: (sheetContext) {
                      final bottomInset = MediaQuery.of(sheetContext).viewInsets.bottom;

                      return Padding(
                        padding: EdgeInsets.only(bottom: bottomInset),
                        child: EconaChatInput(
                          config: ChatInputConfig.question(
                            toUserId: toUserId,
                            initialPhase: QuestionPhase.idle,
                          ),
                        ),
                      );
                    },
                  );

                  // await showModalBottomSheet<void>(
                  //   context: context,
                  //   useRootNavigator: true,
                  //   isScrollControlled: true,
                  //   backgroundColor: const Color(0xFFF6FBFE),
                  //   builder: (sheetContext) {
                  //     final bottomInset = MediaQuery.of(sheetContext).viewInsets.bottom;
                  //     return Padding(
                  //       padding: EdgeInsets.only(bottom: bottomInset),
                  //       child: GestureDetector(
                  //         child: EconaChatInput(
                  //           key: UniqueKey(),
                  //           config: ChatInputConfig.question(
                  //             toUserId: toUserId,
                  //             initialPhase: QuestionPhase.idle,
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );

                  if (context.mounted) {
                    context.pop();
                  }
                },
              ),

              if(questions.isNotEmpty)...[
                _QuestionList(
                  isSubscription: isSubscription,
                  showAnswerOnPressed: () async {

                  },
                  questions: questions,
                ),
              ],
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuestionList extends StatelessWidget {
  const _QuestionList({
    required this.isSubscription,
    required this.showAnswerOnPressed,
    required this.questions,
  });

  final bool isSubscription;
  final void Function() showAnswerOnPressed;
  final List<question_entity.Question> questions;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 150,
        maxHeight: 370,
      ),
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(20),
        borderWidth: 0,
        gradients: const [],
        backgroundColor: Colors.white,
        innerShadows: const [],
        dropShadows: [
          BoxShadow(
            offset: const Offset(-4, -4),
            blurRadius: 12,
            color: Colors.white.withValues(alpha: 0.5),
          ),
          BoxShadow(
            offset: const Offset(6, 6),
            blurRadius: 12,
            color: const Color(0xFF587CA7).withValues(alpha: 0.5),
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '過去のしつもん回答',
                style: EconaTextStyle.headlineEmptyState(
                  color: EconaColor.grayDarkActive,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: Stack(
                  children: [
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                              leading: Assets.images.icons.question.svg(height: 24, width: 24),
                              title: Text(
                                questions[index].text,
                                style: EconaTextStyle.labelMedium1140(
                                  color: EconaColor.grayDarkActive,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Assets.images.icons.answer.svg(height: 24, width: 24),
                              title: Text(
                                questions[index].answer ?? '',
                                style: EconaTextStyle.labelMedium1140(
                                  color: EconaColor.grayDarkActive,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 1);
                      },
                    ),
                    if (!isSubscription)...[
                      const Positioned.fill(
                        child: _Mosaic(),
                      ),
                      Center(
                        child: EconaGradientButton(
                          text: 'しつもんを見る',
                          onPressed: showAnswerOnPressed,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Mosaic extends StatelessWidget {
  const _Mosaic();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFFFFFFF).withValues(alpha: 0.5),
                const Color(0xFFFFFFFF),
              ],
              stops: const [0, 0.3],
            ),
          ),
        ),
      ),
    );
  }
}