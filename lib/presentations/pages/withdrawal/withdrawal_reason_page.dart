import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/withdrawal_reason_code.pbenum.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/input_field.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/withdrawal/withdrawal_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

final validWithdrawalReasons = WithdrawalReasonCode.values
    .where((code) => code != WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_UNSPECIFIED)
    .toList();

class WithdrawalReasonPage extends HookConsumerWidget {
  const WithdrawalReasonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedReasonIndex = useState(1);
    final otherReasonController = useTextEditingController();
    final improvementPointsController = useTextEditingController();
    final buttonEnabled = useState(false);

    final selectedReasonCode = validWithdrawalReasons[selectedReasonIndex.value-1];
    final isOtherReason = selectedReasonCode == WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_OTHER;

    final notifier = ref.read(withdrawalPageViewModelProvider.notifier);

    // 念のため有料プランのチェックが入っていない場合は退会フローに遷移させない
    if(!ref.read(withdrawalPageViewModelProvider).confirmedSubscriptionStopped) {
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
        body: Center(
          child: Column(
            children: [
              Text(
                '有料プランの自動更新を停止してください。',
                style: EconaTextStyle.headlineEmptyState(
                  color: EconaColor.grayDarkActive,
                ),
                textAlign: TextAlign.center,
              ),
              EconaGradientButton(
                text: '戻る',
                onPressed: context.pop,
              ),
            ],
          ),
        ),
      );
    }

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
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(36, 8, 0, 8),
              alignment: Alignment.centerLeft,
              child: InnerShadowText(
                text: '退会理由の選択',
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
            ),
            WithdrawalReasonList(selectedReasonIndex: selectedReasonIndex),
            if(isOtherReason)...[
              OtherReasonTextField(
                controller: otherReasonController,
                buttonEnabled: buttonEnabled,
              ),
            ],
            /// 使い方がよくわからない
            if(selectedReasonCode == WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_NO_GOOD_USAGE)...[
              const GuideToUse(),
            ],
            const SizedBox(height: 12),
            Text(
              'Laviに改善してほしい点があれば、教えてください。',
              style: EconaTextStyle.regularMedium1160(
                color: EconaColor.grayNormal,
              ),
            ),
            const SizedBox(height: 12),
            ImprovementPointsTextField(controller: improvementPointsController),
            const SizedBox(height: 24),
            EconaGradientButton(
              text: '退会する',
              expandWidth: true,
              enabled: !isOtherReason || (isOtherReason && buttonEnabled.value),
              onPressed: () async {
                final isSuccess = await notifier.withdrawUser(
                  reasonCode: selectedReasonCode,
                  reasonDetail: otherReasonController.text.trim().isEmpty
                      ? null
                      : otherReasonController.text.trim(),
                );

                if(!context.mounted) return;
                if(isSuccess != null) {
                  if(isSuccess) {
                    const WithdrawalCompleteRouteData().go(context);
                  } else {
                    await EconaNotification.showTopToast(context, message: '退会処理に失敗しました');
                  }
                } else {
                  // null の場合は既にローディング中のため何もしない（重複実行防止）
                 return;
                }
              },
            ),
            const SizedBox(height: 18),
            EconaPlainButton(
              text: 'Laviを続ける',
              expandWidth: true,
              onPressed: () async {
                const HomeRouteData().go(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WithdrawalReasonList extends HookConsumerWidget {
  const WithdrawalReasonList({
    required this.selectedReasonIndex,
    super.key,
  });

  final ValueNotifier<int> selectedReasonIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = selectedReasonIndex.value;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: WithdrawalReasonCode.values.length,
      itemBuilder: (context, index) {
        final reasonCode = WithdrawalReasonCode.values[index];

        if(reasonCode == WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_UNSPECIFIED) {
          return const SizedBox.shrink();
        }

        bool isSelected = false;
        if(selectedIndex == index) {
          isSelected = true;
        }
        return ListTile(
          dense: true,
          visualDensity: VisualDensity.compact,
          leading: GestureDetector(
            onTap: () {
              selectedReasonIndex.value = index;
            },
            child: isSelected
                ? Assets.images.icons.radioSelected.image(width: 18, height: 18)
                : Assets.images.icons.radioNoSelected.image(width: 18, height: 18),
          ),
          title: Text(
            getWithdrawalReasonText(WithdrawalReasonCode.values[index]),
            style: EconaTextStyle.labelMedium1140(
              color: const Color(0xFF5E4D93),
            ),
          ),
          onTap: () {
            selectedReasonIndex.value = index;
          },
        );
      },
    );
  }
}

class OtherReasonTextField extends StatelessWidget {
  const OtherReasonTextField({
    required this.controller,
    required this.buttonEnabled,
    super.key,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> buttonEnabled;

  @override
  Widget build(BuildContext context) {
    return MultiLineInputFieldContainer(
      borderRadius: BorderRadius.circular(16),
      borderWidth: 0,
      hintText: '内容を入力してください',
      hintTextStyle: EconaTextStyle.labelHintTextBold(
        color: EconaColor.grayNormal,
      ),
      minLines: 6,
      controller: controller,
      onChanged: (value) {
        buttonEnabled.value = value.isNotEmpty;
      },
    );
  }
}

class ImprovementPointsTextField extends StatelessWidget {
  const ImprovementPointsTextField({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return MultiLineInputFieldContainer(
      borderRadius: BorderRadius.circular(16),
      borderWidth: 0,
      hintText: '内容を入力してください',
      hintTextStyle: EconaTextStyle.labelHintTextBold(
        color: EconaColor.grayNormal,
      ),
      minLines: 6,
      controller: controller,
    );
  }
}

class GuideToUse extends StatelessWidget {
  const GuideToUse({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 36),
      child: RichText(
        text: TextSpan(
          style: EconaTextStyle.labelMedium2140( // デフォルトのテキストスタイル
            color: EconaColor.grayNormal,
          ),
          children: <TextSpan>[
            const TextSpan(
              text: 'もし操作に迷われた場合は ',
            ),
            TextSpan(
              text: 'ヘルプページ',
              style: EconaTextStyle.labelMedium2140(
                color: const Color(0xFF4466FF),
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await const WebViewRouteData(
                      url: EconaWebUrl.contact,
                      title: 'ヘルプ・お問い合わせ',
                  ).push<void>(context);
                },
            ),
            const TextSpan(
              text: 'をご覧ください。',
            ),
          ],
        ),
      ),
    );
  }
}

String getWithdrawalReasonText(WithdrawalReasonCode reasonCode) {
  return switch (reasonCode) {
    WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_MATCHED_IN_LAVI => 'Laviで恋人ができたから',
    WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_MATCHED_ELSEWHERE => 'Lavi以外で恋人ができたから',
    WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_NO_GOOD_TYPE => 'タイプの人がいないから',
    WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_NO_GOOD_MATCH => 'タイプの人とマッチしないから',
    WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_NO_GOOD_USAGE => '使い方がよくわからない',
    WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_OTHER => 'その他',
    WithdrawalReasonCode.WITHDRAWAL_REASON_CODE_UNSPECIFIED => '',
    WithdrawalReasonCode() => throw UnimplementedError(),
  };
}