import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_toggle.dart';
import 'package:econa_mobile_app/presentations/components/setting_list_tile.dart';
import 'package:econa_mobile_app/presentations/components/setting_section.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/private_mode_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivateModeSettingPage extends HookConsumerWidget {
  const PrivateModeSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(privateModeSettingPageViewModelProvider);
    final notifier = ref.read(privateModeSettingPageViewModelProvider.notifier);

    ref.listen(privateModeSettingPageViewModelProvider, (prev, next) async {
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
        titleText: 'プライベートモード',
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: state.when(
            data: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingSection(
                  items: [
                    SettingListTile(
                      title: 'プライベートモード',
                      trailing: EconaToggle(
                        enable: data.enablePrivateMode,
                        onTap: () async {
                          await notifier.updatePrivateMode(!data.enablePrivateMode);
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                  ],
                ),
                const _SupplementText(
                  text: 'ONにすると、あなたが非表示になります（ホーム、Lavigation、お相手の足あとなどで非表示になります）',
                ),
                const _SupplementText(text: 'あなたが「いいね」をしたお相手にだけ、あなたが表示されます。',
                ),
              ],
            ),
            loading: () => const Center(child: EconaLoadingIndicator()),
            error: (e, s) => const Center(child: Text('エラーが発生しました')),
          ),
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
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: EconaTextStyle.regularSmall140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}
