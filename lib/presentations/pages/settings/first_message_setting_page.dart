import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_toggle.dart';
import 'package:econa_mobile_app/presentations/components/input_field.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/setting_list_tile.dart';
import 'package:econa_mobile_app/presentations/components/setting_section.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/first_message_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirstMessageSettingPage extends HookConsumerWidget {
  const FirstMessageSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(firstMessageSettingPageViewModelProvider);
    final notifier = ref.read(firstMessageSettingPageViewModelProvider.notifier);

    final greetingController = useTextEditingController();
    final personaGreetingEnabled = useState(true);

    // ViewModelの状態が変化したら、UIのState（コントローラとuseState）に反映させる
    ref..listen(
      firstMessageSettingPageViewModelProvider,
      (_, newState) {
        if (newState.hasValue) {
          final data = newState.value;
          if (data != null) {
            if (data.greeting != greetingController.text) {
              greetingController.text = data.greeting;
            }
            if (data.isPersonaGreetingDefault != personaGreetingEnabled.value) {
              personaGreetingEnabled.value = data.isPersonaGreetingDefault;
            }
          }
        }
      },
    )
    ..listen(firstMessageSettingPageViewModelProvider, (prev, next) async {
      final error = next.valueOrNull?.error;
      if (error != null) {
        if (!context.mounted) return;
        final handled = await handleEconaError(context, error);
        if (handled) {
          notifier.clearError();
          return;
        }
        await EconaNotification.showTopToast(
          context,
          message: error.userMessage,
        );
        notifier.clearError();
      }
    });

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '初回メッセージ設定',
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: state.when(
        data: (state) {
          return SingleChildScrollView(
            // スクロール可能にする
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _SupplementText(
                    text: 'マッチングしたお相手に送る1通目のメッセージを事前に作ることができます。入力して保存すると、次回マッチングした際から初回定型文が使えるようになります。',
                  ),
                  _InputField(
                    controller: greetingController,
                    onChanged: (value) {},
                    hintText: '趣味、休日の過ごし方、仕事内容などを\n書いてあなたのことを伝えてみましょう',
                    hintTextStyle: EconaTextStyle.labelHintTextBold(
                      color: EconaColor.grayNormal,
                    ),
                  ),
                  EconaGradientButton(
                    text: '保存',
                    onPressed: () async {
                      await notifier.updateGreeting(greetingController.text);
                      if (!context.mounted) return;
                      await EconaNotification.showTopToast(
                        context,
                        message: '設定を保存しました',
                        duration: const Duration(seconds: 2),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: SettingSection(items: [
                      SettingListTile(
                        title: 'なりきり挨拶',
                        trailing: EconaToggle(
                          enable: personaGreetingEnabled.value,
                          onTap: () async {
                            await notifier.updatePersonaGreetingDefault(
                              !personaGreetingEnabled.value,
                            );
                          },
                          backgroundColor: EconaColor.toggleEnableBackground,
                        ),
                      ),
                    ]),
                  ),
                  if (!personaGreetingEnabled.value) ...[
                    const _SupplementText(
                      text: 'なりきり挨拶をONに設定すると、マッチングする度にAIが自動であなたらしい1通目のメッセージを作成してくれます。',
                    ),
                    const _SupplementText(
                      text: '※なりきり挨拶はAIカウンセリングや、やりとりシミュレーションなどの機能をご利用いただくことで使用できるようになります。',
                    ),
                  ],
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: EconaLoadingIndicator()),
        error: (error, stackTrace) => Center(child: Text('エラーが発生しました: $error')),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.onChanged,
    this.hintText = 'sample@example.com',
    this.hintTextStyle,
  });

  final TextEditingController controller;
  final void Function(String) onChanged;
  final String hintText;
  final TextStyle? hintTextStyle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: MultiLineInputFieldContainer(
          height: 190,
          borderRadius: BorderRadius.circular(16),
          borderWidth: 1,
          hintText: hintText,
          hintTextStyle: hintTextStyle,
          controller: controller,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

/// 補足テキスト
class _SupplementText extends StatelessWidget {
  const _SupplementText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Text(
        text,
        style: EconaTextStyle.regularSmall140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}
