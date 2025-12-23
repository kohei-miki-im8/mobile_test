import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/setting_user_list.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_chat_rooms_setting_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_chat_rooms_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HideChatRoomsSettingPage extends HookConsumerWidget {
  const HideChatRoomsSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hideChatRoomsSettingPageViewModelProvider);
    final notifier = ref.read(hideChatRoomsSettingPageViewModelProvider.notifier);

    ref.listen(hideChatRoomsSettingPageViewModelProvider, (prev, next) async {
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
        titleText: '非表示にしたやり取り',
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
          if (state.chatRooms.isEmpty) {
            return const Center(child: Text('非表示にしたやり取りはありません'));
          }
          return InfiniteScrollList<HideChatRoom>(
            initialItems: state.chatRooms,
            nextCursorId: state.nextCursorId,
            scrollDirection: Axis.vertical,
            fetchMoreData: (cursorId) async {
              await notifier.loadMore();
            },
            itemBuilder: (context, item, index) {
              final match = item;
              final isHidden = match.isHidden;
              return SettingUserTile(
                key: ValueKey(match.chatRoom.chatRoomId),
                user: match.chatRoom.thumbnailUser,
                trailingBuilder: (context, user) {
                  return EconaPlainButton(
                    text: isHidden ? '再表示' : '非表示',
                    onPressed: () async {
                      final isSuccess = await notifier.updateChatHidden(
                        match.chatRoom.chatRoomId,
                        isHidden: !isHidden,
                      );
                      if (context.mounted && isSuccess) {
                        await showActionCompletionModal(
                          context: context,
                          user: user,
                          completionText:
                          isHidden ? 'やり取りを再表示しました' : 'やり取りを非表示にしました',
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
                child: EconaLoadingIndicator(),
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
        loading: () => const Center(child: EconaLoadingIndicator()),
        error: (err, stack) => Center(child: Text('エラー: $err')),
      ),
    );
  }
}
