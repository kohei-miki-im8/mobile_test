import 'dart:io';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_toggle.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/footprint_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FootprintSettingPage extends HookConsumerWidget {
  const FootprintSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(footprintSettingPageViewModelProvider);
    final notifier = ref.read(footprintSettingPageViewModelProvider.notifier);

    // エラー監視 → メンテナンスモード検知 → トースト → クリア
    ref.listen(footprintSettingPageViewModelProvider, (prev, next) async {
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
        titleText: 'あしあと設定',
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
                _SettingSection(
                  isEnabled: data.enableFootprint,
                  onChanged: (value) async {
                    await notifier.updateFootprintSetting(value);
                  },
                ),
                _SupplementText(
                  text: data.enableFootprint
                      ? 'お相手のプロフィールを閲覧すると、お相手にあなたのあしあとが残ります'
                      : 'お相手のプロフィールを閲覧しても、お相手にあなたのあしあとは表示されません',
                ),
                _SupplementText(
                  text: data.enableFootprint
                      ? 'これまでの足跡を非表示にすることはできません'
                      : 'あしあとを残すといいねが届きやすくなります',
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

/// 各種設定のセクション
class _SettingSection extends StatelessWidget {
  const _SettingSection({
    required this.isEnabled,
    required this.onChanged,
  });

  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: const _SettingItemName(text: 'あしあとを残す'),
            trailing: EconaToggle(
              enable: isEnabled,
              onTap: () => onChanged(!isEnabled),
              backgroundColor: EconaColor.toggleEnableBackground,
            ),
          ),
        ],
      ),
    );
  }
}

/// 設定項目名
class _SettingItemName extends StatelessWidget {
  const _SettingItemName({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InnerShadowText(
      text: text,
      textStyle: EconaTextStyle.labelMedium1140(
        color: EconaColor.grayNormal,
      ),
      innerShadowTextStyles: [
        EconaTextStyle.labelMedium1140(
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..color = const Color(0xFF353E72).withValues(alpha: 0.61 * 3 / 2)
            ..maskFilter = Platform.isIOS
                ? const MaskFilter.blur(BlurStyle.normal, 0)
                : const MaskFilter.blur(BlurStyle.inner, 14 / 20),
        ),
        EconaTextStyle.labelMedium1140(
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.8 * 3 / 2)
            ..maskFilter = Platform.isIOS
                ? const MaskFilter.blur(BlurStyle.normal, 0)
                : const MaskFilter.blur(BlurStyle.inner, 14 / 20),
        ),
      ],
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
