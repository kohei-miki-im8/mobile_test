import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_toggle.dart';
import 'package:econa_mobile_app/presentations/components/setting_list_tile.dart';
import 'package:econa_mobile_app/presentations/components/setting_section.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/offline_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineSettingPage extends HookConsumerWidget {
  const OfflineSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(offlineSettingPageViewModelProvider);
    final notifier = ref.read(offlineSettingPageViewModelProvider.notifier);

    ref.listen(offlineSettingPageViewModelProvider, (prev, next) async {
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
        titleText: 'オフライン設定',
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
                      title: 'オフライン設定',
                      trailing: EconaToggle(
                        enable: data.enableOfflineMode,
                        onTap: () async {
                          await notifier.updateOfflineMode(!data.enableOfflineMode);
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                  ],
                ),
                const _SupplementText(
                  text: 'オンライン状態だと（アプリを使用しているとお相手に）知られたくない場合、ONにすることでログイン状態が１週間以内の表示になります',
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
