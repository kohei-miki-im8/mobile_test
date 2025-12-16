import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_checkbox.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/withdrawal/withdrawal_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/withdrawal/withdrawal_reason_page.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WithdrawalPage extends HookConsumerWidget {
  const WithdrawalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isUnSubscribed = useState(false);
    final notifier = ref.watch(withdrawalPageViewModelProvider.notifier);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '退会',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _AttentionPanel(),
            const _HowToUnSubscribe(),
            _UnSubscribeConfirmCheckBox(isUnSubscribed: isUnSubscribed),
            const SizedBox(height: 24),
            EconaGradientButton(
              text: '退会手続きを進める',
              enabled: isUnSubscribed.value,
              expandWidth: true,
              onPressed: () async {
                notifier.setConfirmedSubscriptionStopped(
                  confirmedSubscriptionStopped: isUnSubscribed.value,
                );
                await const WithdrawalReasonRouteData().push<void>(context);
              },
            ),
            const SizedBox(height: 18),
            EconaPlainButton(
              text: 'Laviを続ける',
              expandWidth: true,
              onPressed: () {
                const HomeRouteData().go(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AttentionPanel extends StatelessWidget {
  const _AttentionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).textScaler;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.zero,
        borderWidth: 0,
        gradients: const [],
        backgroundColor: Colors.white,
        innerShadows: const [],
        dropShadows: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.white.withValues(alpha: 0.5),
            offset: const Offset(-4, -4),
          ),
          BoxShadow(
            blurRadius: 12,
            color: const Color(0xFF587CA7).withValues(alpha: 0.14),
            offset: const Offset(6, 6),
          ),
        ],
        child: const _AttentionText(),
      ),
    );
  }
}

class _AttentionText extends StatelessWidget {
  const _AttentionText({super.key});

  @override
  Widget build(BuildContext context) {
    final textScaler = MediaQuery.of(context).textScaler;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        spacing: 16,
        children: [
          Text(
            '退会前に\n以下の注意事項をご確認ください。',
            style: EconaTextStyle.headlineEmptyState(
              color: EconaColor.grayDarkActive,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            spacing: 10,
            children: [
              Text(
                '・',
                style: EconaTextStyle.labelMedium1140(
                  color: const Color(0xFF5E4D93),
                ),
                textScaler: textScaler,
              ),
              Expanded(
                child: Text(
                  '退会するとデータが削除され、再登録後も復元できません。',
                  style: EconaTextStyle.labelMedium1140(
                    color: const Color(0xFF5E4D93),
                  ),
                  textScaler: textScaler,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Text(
                '・',
                style: EconaTextStyle.labelMedium1140(
                  color: const Color(0xFF5E4D93),
                ),
                textScaler: textScaler,
              ),
              Expanded(
                child: Text(
                  '退会後14日間は再登録できません。',
                  style: EconaTextStyle.labelMedium1140(
                    color: const Color(0xFF5E4D93),
                  ),
                  textScaler: textScaler,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Text(
                '・',
                style: EconaTextStyle.labelMedium1140(
                  color: const Color(0xFF5E4D93),
                ),
                textScaler: textScaler,
              ),
              Expanded(
                child: Text(
                  'データは一定期間保管された後、以下に該当するものがすべて削除されます。',
                  style: EconaTextStyle.labelMedium1140(
                    color: const Color(0xFF5E4D93),
                  ),
                  textScaler: textScaler,
                  maxLines: 2,
                  softWrap: true,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'プロフィール情報、所持いいね、所持ポイント、やりとり履歴、マッチング履歴',
              style: EconaTextStyle.regularSmall140(
                color: EconaColor.grayNormal,
              ),
              textScaler: textScaler,
            ),
          ),
        ],
      ),
    );
  }
}

class _HowToUnSubscribe extends StatelessWidget {
  const _HowToUnSubscribe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ConcavePanel(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Apple ID決済、Google Play決済をご利用の方は定期購読の解約を行ってください。',
                    style: EconaTextStyle.regularSmall160(
                      color: EconaColor.grayDarkActive,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      await const WebViewRouteData(
                        url: EconaWebUrl.unsubscribedIos,
                        title: '',  // 外部リンクのためタイトルなし
                      ).push<void>(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF06182B),
                      foregroundColor: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Assets.images.icons.appleLogo.svg(width: 24, height: 24),
                        const Expanded(
                          child: Center(
                            child: Text('Apple ID決済の解約方法'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      await const WebViewRouteData(
                        url: EconaWebUrl.unsubscribedAndroid,
                        title: '',  // 外部リンクのためタイトルなし
                      ).push<void>(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: EconaColor.grayDarkActive,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Assets.images.icons.googleLogo.svg(width: 24, height: 24),
                        const Expanded(
                          child: Center(
                            child: Text('Google Play決済の解約方法'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _UnSubscribeConfirmCheckBox extends HookConsumerWidget {
  const _UnSubscribeConfirmCheckBox({
    required this.isUnSubscribed,
  });

  final ValueNotifier<bool> isUnSubscribed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: EconaCheckbox(
        text: '有料プランの自動更新を停止しました。',
        textStyle: EconaTextStyle.labelMedium1140(
          color: EconaColor.feedbackRed400,
        ),
        value: isUnSubscribed.value,
        onChanged: (bool value) {
          isUnSubscribed.value = value;
        },
      ),
    );
  }
}
