import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/setting_user_list.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/block_user_setting_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/settings/block_user_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BlockUserSettingPage extends HookConsumerWidget {
  const BlockUserSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(blockUserSettingPageViewModelProvider);
    final notifier = ref.read(blockUserSettingPageViewModelProvider.notifier);

    ref.listen(blockUserSettingPageViewModelProvider, (prev, next) async {
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
        titleText: 'ブロックしたお相手',
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: stateAsync.when(
        data: (state) {
          if (state.users.isEmpty) {
            return const Center(child: Text('ブロックしたユーザーはいません'));
          }
          return InfiniteScrollList<BlockUser>(
            initialItems: state.users,
            nextCursorId: state.nextCursorId,
            scrollDirection: Axis.vertical,
            fetchMoreData: (cursorId) async {
              await notifier.loadMore();
            },
            itemBuilder: (context, item, index) {
              final blockUser = item;
              final isBlocked = blockUser.isBlocked;

              return SettingUserTile(
                user: blockUser.user,
                trailingBuilder: (context, user) {
                  return EconaPlainButton(
                    text: isBlocked ? '解除する' : 'ブロック',
                    onPressed: () async {
                      final isSuccess = await notifier.updateUserBlocked(
                        user.userId,
                        isBlocked: !isBlocked,
                      );
                      if (context.mounted && isSuccess) {
                        await showActionCompletionModal(
                          context: context,
                          user: user,
                          completionText: isBlocked ? 'ブロックを解除しました' : 'ブロックしました',
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
        loading: () => const Center(child: EconaLoadingIndicator(size: 24)),
        error: (err, stack) => Center(child: Text('エラー: $err')),
      ),
    );
  }
}
