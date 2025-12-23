import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/setting_user_list.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_user_setting_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_user_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HideUserSettingPage extends HookConsumerWidget {
  const HideUserSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hideUserSettingPageViewModelProvider);
    final notifier = ref.read(hideUserSettingPageViewModelProvider.notifier);

    ref.listen(hideUserSettingPageViewModelProvider, (prev, next) async {
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
        titleText: '非表示にしたお相手',
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
        loading: () => const Center(child: EconaLoadingIndicator(size: 24)),
        error: (err, stack) => Center(child: Text('エラー: $err')),
        data: (state) {
          if (state.users.isEmpty) {
            return const Center(child: Text('非表示にしたユーザーはいません'));
          }
          return InfiniteScrollList<HideUser>(
            initialItems: state.users,
            nextCursorId: state.nextCursorId,
            scrollDirection: Axis.vertical,
            fetchMoreData: (cursorId) async {
              await notifier.loadMore();
            },
            itemBuilder: (context, item, index) {
              final hideUser = item;
              final isHidden = hideUser.isHidden;

              return SettingUserTile(
                key: ValueKey(hideUser.user.userId),
                user: hideUser.user,
                trailingBuilder: (context, user) {
                  return EconaPlainButton(
                    text: isHidden ? '解除する' : '非表示',
                    onPressed: () async {
                      final isSuccess = await notifier.updateUserHidden(
                        user.userId,
                        isHidden: !isHidden,
                      );
                      if (context.mounted && isSuccess) {
                        await showActionCompletionModal(
                          context: context,
                          user: user,
                          completionText:
                          isHidden ? 'お相手の非表示を\n解除しました' : 'お相手を非表示にしました',
                        );
                      }
                    },
                  );
                },
              );
            },
            loadingBuilder: (context) => const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: EconaLoadingIndicator(size: 24),
              ),
            ),
            errorBuilder: (context, error, onRetry) => Center(
              child: TextButton(
                onPressed: onRetry,
                child: const Text('再読み込み'),
              ),
            ),
          );
        },
      ),
    );
  }
}
