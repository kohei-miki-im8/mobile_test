import 'dart:io';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/like_receive_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikeReceiveSettingPage extends HookConsumerWidget {
  const LikeReceiveSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(likeReceiveSettingPageViewModelProvider);
    final notifier = ref.read(likeReceiveSettingPageViewModelProvider.notifier);

    ref.listen(likeReceiveSettingPageViewModelProvider, (prev, next) async {
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

    final likeReceiveLimitSettingsItems = state.when(
      data: (data) => [
        _SettingItem(title: 'いいね受信上限設定', value: data.likeReceiveLimitLabel),
      ],
      loading: () => [
        const _SettingItem(title: 'いいね受信上限設定', value: '読込中...'),
      ],
      error: (e, s) => [
        const _SettingItem(title: 'いいね受信上限設定', value: 'エラー'),
      ],
    );

    return Scaffold(
      appBar: CenterAppBar(
        titleText: 'いいね受信設定',
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SettingSection(
              items: likeReceiveLimitSettingsItems,
              onItemSelected: (newValue) async {
                if (newValue != null) {
                  await notifier.updateLikeReceiveLimit(newValue);
                }
              },
            ),
            const _SupplementText(text: '受け取るいいねが多すぎる方は、受信上限を設定しましょう'),
          ],
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
    return Text(
      text,
      style: EconaTextStyle.regularSmall140(
        color: EconaColor.grayNormal,
      ),
    );
  }
}

/// 各種設定のセクション
class _SettingSection extends StatelessWidget {
  const _SettingSection({
    required this.items,
    required this.onItemSelected,
  });

  final List<_SettingItem> items;
  final ValueChanged<String?> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            visualDensity: VisualDensity.compact,
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            dense: true,
            title: _SettingItemName(text: items[index].title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    items[index].value!,
                    style: EconaTextStyle.regularSmall140(
                      color: EconaColor.purpleNormal,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.grey),
              ],
            ),
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => _SettingBottomSheet(
                  onOptionSelected: onItemSelected,
                ),
              );
            },
          );
        },
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

/// 設定項目の構造
class _SettingItem {
  const _SettingItem({
    required this.title,
    this.value,
  });

  final String title;
  final String? value;
}

/// 設定ボトムシート
class _SettingBottomSheet extends StatelessWidget {
  const _SettingBottomSheet({required this.onOptionSelected});

  final ValueChanged<String> onOptionSelected;

  @override
  Widget build(BuildContext context) {
    final options = ['無制限', '10人くらい', '20人くらい', '30人くらい'];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 64),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'いいね受信上限設定',
                style: EconaTextStyle.labelMedium2140(
                  color: EconaColor.grayNormal,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Assets.images.icons.close.image(height: 24, width: 24),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...options.map((option) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: EconaPlainButton(
                text: option,
                onPressed: () {
                  onOptionSelected(option);
                  context.pop();
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
