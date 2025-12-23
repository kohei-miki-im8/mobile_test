import 'dart:async';

import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/service_code.pb.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_overlay.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/private_mode_page_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivateModePage extends HookConsumerWidget {
  const PrivateModePage({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPlan = useState<int?>(null);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: 'プライベートモード',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.leftArrow.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  '料金表',
                  style: EconaTextStyle.labelMedium2140(
                    color: EconaColor.grayNormal,
                  ),
                ),
                _PlanList(selectedPlan: selectedPlan),
                const SizedBox(height: 24),
              ],
            ),
          ),
          // フローティングボタン
          if (selectedPlan.value != null)...[
            _PurchaseButton(
              plan: selectedPlan.value == null
                  ? null
                  : Plan.values[selectedPlan.value!],
            ),
          ],
        ],
      ),
    );
  }
}

class _TextTitle extends StatelessWidget {
  const _TextTitle({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 393,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: EconaTextStyle.labelMedium2140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}

class _TextBody extends StatelessWidget {
  const _TextBody({
    required this.body,
  });
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        body,
        style: EconaTextStyle.regularMedium2200(
          color: EconaColor.grayDarkActive,
        ),
      ),
    );
  }
}

class _PurchaseButton extends ConsumerWidget {
  const _PurchaseButton({
    required this.plan,
  });

  final Plan? plan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String buttonText;
    if (plan != null) {
      buttonText = '${plan!.planName}を購入/${plan!.actualPrice}MP';
    } else {
      buttonText = 'プランを選択してください';
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 339,
        margin: const EdgeInsets.only(left: 35, top: 25, right: 35, bottom: 60),
        child: EconaGradientButton(
          text: buttonText,
          enabled: plan != null,
          onPressed: () async {
            await showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (dialogContext) => Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                child: EconaModal(
                  message: '${plan!.actualPrice}ポイントを消費してプライベートモードを有効化します。よろしいですか？',
                  buttonText: 'プライベートモードを有効化する',
                  onButtonPressed: () async {
                    try {
                      final notifier = ref.read(privateModePageViewModelProvider.notifier);
                      await notifier.enablePrivateMode(plan!.code);
                      if (!dialogContext.mounted) {
                        return;
                      }
                      Navigator.of(dialogContext).pop();

                      try {
                        AdjustEventTracker.trackPrivateModePurchase(
                          months: plan!.term,
                        );
                      } catch (_) {
                        // トラッキングのエラーは握りつぶす
                      }

                      await EconaNotification.showTopToast(
                        context,
                        message: '${plan!.planName}を購入しました',
                      );
                    } catch (e) {
                      if (!dialogContext.mounted) {
                        return;
                      }
                      dialogContext.pop();

                      final String message;

                      if(e.toString().contains('Future already completed')) {
                        message = '既にプライベートモードが有効になっています。';
                      } else {
                        message = 'プライベートモードの有効化に失敗しました';
                      }

                      await EconaNotification.showTopToast(
                        context,
                        message: message,
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PlanList extends StatelessWidget {
  const _PlanList({
    required this.selectedPlan,
  });

  final ValueNotifier<int?> selectedPlan;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = selectedPlan.value;
    final plans = Plan.values.toList();
    const panelPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 8);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: plans.length,
      itemBuilder: (context, index) {
        Widget content = _PlanPanel(
          planTerm: plans[index].term,
          actualPrice: plans[index].actualPrice,
          regularPrice: plans[index].regularPrice,
          padding: panelPadding,
          onTap: () {
            selectedPlan.value = index;
          },
        );

        if (selectedIndex == index) {
          content = GradientBorderOverlay(
            padding: panelPadding,
            borderRadius: BorderRadius.circular(16),
            strokeWidth: 3,
            gradients: const [
              LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
              ),
              LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
              ),
            ],
            child: content,
          );
        }

        return content;
      },
    );
  }
}

class _PlanPanel extends StatelessWidget {
  const _PlanPanel({
    required this.onTap,
    required this.padding,
    required this.planTerm,
    required this.actualPrice,
    this.regularPrice,
  });

  final VoidCallback onTap;
  final EdgeInsets padding;
  final int planTerm;
  final int actualPrice;
  final int? regularPrice;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: ConvexPanel(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$planTerm',
                        style: EconaTextStyle.priceTitle(
                          color: EconaColor.grayDarkActive,
                        ),
                      ),
                      TextSpan(
                        text: 'ヵ月プラン',
                        style: EconaTextStyle.priceUnit(
                          color: EconaColor.grayDarkActive,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if(regularPrice != null)...[
                      Text(
                        '${regularPrice}MP',
                        style: EconaTextStyle.labelSmall140(
                          color: EconaColor.grayNormal,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                    Row(
                      spacing: 16,
                      children: [
                        Assets.images.icons.pointMp.image(height: 24, width: 24),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '$actualPrice',
                                style: EconaTextStyle.priceTitle(
                                  color: EconaColor.grayDarkActive,
                                ),
                              ),
                              TextSpan(
                                text: 'MP',
                                style: EconaTextStyle.labelMedium2140(
                                  color: EconaColor.grayDarkActive,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Plan {
  // 月, 実価格, 1か月の価格×月, プラン名, サービスコード
  sixMonths(6, 75, 120, '6ヵ月プラン', ServiceCode.SERVICE_CODE_MP_PRIVATE_MODE_6_MONTH),
  threeMonths(3, 46, 60, '3か月プラン', ServiceCode.SERVICE_CODE_MP_PRIVATE_MODE_3_MONTH),
  oneMonth(1, 20, null, '1ヵ月プラン', ServiceCode.SERVICE_CODE_MP_PRIVATE_MODE_1_MONTH);

  const Plan(
    this.term,
    this.actualPrice,
    this.regularPrice,
    this.planName,
    this.code,
  );

  final int term;
  final int actualPrice;
  final int? regularPrice;
  final String planName;
  final ServiceCode code;
}
