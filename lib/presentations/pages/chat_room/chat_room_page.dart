import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/message_content_type.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/messenger_status_badge.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/signed_url.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/google/protobuf/timestamp.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/empty_state.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/photo_frame.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/helpers/chat_display_helper.dart';
import 'package:econa_mobile_app/presentations/pages/chat/chat_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/chat_room/chat_room_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/chat_room/chat_room_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatRoomPage extends HookConsumerWidget {
  const ChatRoomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdAsyncValue = ref.watch(currentUserIdProvider);
    final isNavigating = ref.watch(
      chatRoomPageViewModelProvider.select((s) => s.isNavigating),
    );

    return AbsorbPointer(
      absorbing: isNavigating,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CenterAppBar(titleText: EconaAppBarText.chatListTitle),
        body: userIdAsyncValue.when(
          data: (_) => const _ChatRoomListView(),
          loading: () => const Center(child: EconaLoadingIndicator()),
          error: (err, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ユーザー情報の取得に失敗しました'),
                ElevatedButton(
                  onPressed: () => ref.refresh(currentUserIdProvider),
                  child: const Text('再試行'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// チャットルーム一覧を表示
class _ChatRoomListView extends ConsumerWidget {
  const _ChatRoomListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatRoomPageViewModelProvider);

    // チャットルームページ読み込み時のエラーでメンテナンスモードを検知
    ref.listen<ChatRoomPageState>(chatRoomPageViewModelProvider, (previous, next) async {
      final error = next.error;
      if (error == null) {
        return;
      }

      await handleEconaError(context, error);
    });

    if (state.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }
    if (state.error != null) {
      return _ErrorScreen(
        error: state.error!,
        onTap: () => ref.read(chatRoomPageViewModelProvider.notifier).refreshChatRooms(),
      );
    }

    final isEmpty = isChatRoomsEmpty(ref);
    if (isEmpty) {
      return EmptyState(
        title: 'あなたとマッチングした\nお相手が表示されます',
        subtitle: 'プロフィールを充実させて\nいいねをもらいましょう！',
        subtitleStyle: EconaTextStyle.regularSmall140(
          color: EconaColor.grayNormal,
        ),
        buttonText: 'プロフィールを編集する',
        onButtonTap: () async {
          await const ProfileRouteData().push<void>(context);
        },
      );
    }

    return const _ChatRoomBody();
  }
}

/// チャットルームページ
class _ChatRoomBody extends ConsumerWidget {
  const _ChatRoomBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ChatRoomSubTitle(text: 'マッチング後24時間以内のお相手'),
        _ScheduledChatRooms(),
        _ChatRoomSubTitle(text: 'やりとり中のお相手'),
        Expanded(
          child: _ChatRooms(),
        ),
      ],
    );
  }
}

/// チャットルームのサブタイトル部分
class _ChatRoomSubTitle extends StatelessWidget {
  const _ChatRoomSubTitle({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      color: Colors.white.withValues(alpha: 0.05),
      child: Text(
        text,
        style: EconaTextStyle.labelSmall140(
          color: EconaColor.grayNormalHover,
        ),
      ),
    );
  }
}

/// スケジュールされたチャットルーム一覧
class _ScheduledChatRooms extends ConsumerWidget {
  const _ScheduledChatRooms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(chatRoomPageViewModelProvider.notifier);
    // 必要なデータだけを1回のselectで監視
    final data = ref.watch(
      chatRoomPageViewModelProvider.select((s) => _ScheduledRoomsViewData(
          items: s.scheduledChatRooms,
          nextCursorId: s.scheduledChatRoomsCursor?.nextCursorId,
        ),
      ),
    );

    if (data.items.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            '24時間以内にマッチした相手はいません',
            style: TextStyle(color: EconaColor.grayDarkActive),
          ),
        ),
      );
    }

    return SizedBox(
      height: 139,
      child: InfiniteScrollList<ScheduledChatRoom>(
        initialItems: data.items,
        nextCursorId: data.nextCursorId,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        fetchMoreData: (String? cursorId) async {
          if (cursorId == null || cursorId.isEmpty) {
            await notifier.refreshOnlyScheduledChatRooms();
          } else {
            await notifier.loadMoreScheduledChatRooms(cursorId);
          }
        },
        itemBuilder: (context, item, index) {
          return SizedBox(
            height: 109,
            width: 72,
            child: _ScheduledChatRoomsItem(
              key: ValueKey(item.scheduledChatRoomId),
              room: item,
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        loadingBuilder: (context) => const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: Center(child: EconaLoadingIndicator()),
          ),
        ),
        errorBuilder: (context, error, onRetry) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('エラーが発生しました'),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('再試行'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// スケジュールされたチャットルームのアイテムを作成
class _ScheduledChatRoomsItem extends ConsumerWidget {
  const _ScheduledChatRoomsItem({
    required this.room,
    super.key,
  });
  final ScheduledChatRoom room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarIconUrl = resolvePhotoUrl(
      profile: room.thumbnailUser.profile,
      kind: PhotoUrlKind.mediumThumbnailWebpUrl,
    );

    return InkWell(
      onTap: () async {
        final notifier = ref.read(chatRoomPageViewModelProvider.notifier)
          ..setNavigating(isNavigating: true);

        try {
          await context.push(
            ChatRouteData(chatRoomId: room.scheduledChatRoomId).location,
            extra: {
              'toUser': room.thumbnailUser,
            },
          );
          // 戻ってきたタイミングでSWR再検証（差分があれば静かに更新）
          final container = ProviderScope.containerOf(context, listen: false);
          await container
              .read(chatRoomPageViewModelProvider.notifier)
              .revalidateChatRooms();
        } finally {
          notifier.setNavigating(isNavigating: false);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhotoFrame(
            imageUrl: avatarIconUrl,
            size: 56.5,
          ),
          const SizedBox(height: 8),
          Text(
            calculateAgeJp(room.thumbnailUser.profile.updatableProfile.birthday),
            style: EconaTextStyle.regularSmall140(
              color: EconaColor.grayDarkActive,
            ),
          ),
          Text(
            room.thumbnailUser.profile.updatableProfile.residenceRegion.name,
            style: EconaTextStyle.regularSmall140(
              color: EconaColor.grayDarkActive,
            ),
          ),
        ],
      ),
    );
  }
}

/// チャットルーム一覧
class _ChatRooms extends ConsumerWidget {
  const _ChatRooms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(chatRoomPageViewModelProvider.notifier);
    final data = ref.watch(
      chatRoomPageViewModelProvider.select((s) => _ChatRoomsViewData(
            items: s.chatRooms,
            nextCursorId: s.chatRoomsCursor?.nextCursorId,
          )),
    );

    if (data.items.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'チャット中のお相手はいません',
            style: TextStyle(color: EconaColor.grayDarkActive),
          ),
        ),
      );
    }

    return InfiniteScrollList<ChatRoom>(
      initialItems: data.items,
      nextCursorId: data.nextCursorId,
      scrollDirection: Axis.vertical,
      enablePullToRefresh: true,
      fetchMoreData: (String? cursorId) async {
        if (cursorId == null || cursorId.isEmpty) {
          await notifier.refreshOnlyChatRooms();
        } else {
          await notifier.loadMoreChatRooms(cursorId);
        }
      },
      itemBuilder: (context, item, index) {
        return _ChatRoomItem(
          key: ValueKey(item.chatRoomId),
          room: item,
        );
      },
      loadingBuilder: (context) => const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: EconaLoadingIndicator()),
        ),
      ),
      errorBuilder: (context, error, onRetry) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: GestureDetector(
          onTap: onRetry,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: EconaColor.gray200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '読み込みに失敗しました。タップして再試行',
              style: EconaTextStyle.regularSmall140(
                color: EconaColor.grayDarkActive,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

/// チャットルームのアイテムを作成
class _ChatRoomItem extends ConsumerWidget {
  const _ChatRoomItem({
    required this.room,
    super.key,
  });

  final ChatRoom room;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastChatMessage = room.hasLatestChatMessage()
        ? room.latestChatMessage
        : null;
    final thumbnailUser = room.thumbnailUser;

    final photos = room.thumbnailUser.profile.requiringReviewProfilePhotos;

    // currentSignedImageUrlsが存在する写真を探す（ベスト画像を優先）
    SignedImageUrls? currentSignedImageUrls;
    if (photos.isNotEmpty) {
      // ベスト画像でcurrentSignedImageUrlsがあるものを探す
      final bestPhoto = photos.where((p) => p.isBestPhoto && p.hasCurrentSignedImageUrls()).firstOrNull;
      if (bestPhoto != null) {
        currentSignedImageUrls = bestPhoto.currentSignedImageUrls;
      } else {
        // ベスト画像がない場合は、currentSignedImageUrlsがある最初の写真を使用
        final firstPhotoWithUrls = photos.where((p) => p.hasCurrentSignedImageUrls()).firstOrNull;
        if (firstPhotoWithUrls != null) {
          currentSignedImageUrls = firstPhotoWithUrls.currentSignedImageUrls;
        }
      }
    }

    final avatarIconUrl = resolvePhotoUrl(
      profile: room.thumbnailUser.profile,
      kind: PhotoUrlKind.avatarIconWebpUrl,
      urls: currentSignedImageUrls,
    );

    return InkWell(
      onTap: () async {
        final notifier = ref.read(chatRoomPageViewModelProvider.notifier)
          ..setNavigating(isNavigating: true);
        try {
          await _prefetchChatRoomData(ref, room.chatRoomId);
          await context.push(
            ChatRouteData(chatRoomId: room.chatRoomId).location,
            extra: {
              'toUser': thumbnailUser,
              'isForceReadPurchased': room.isForceReadPurchased,
            },
          );
          // 戻ってきたタイミングでSWR再検証（差分があれば静かに更新）
          final container = ProviderScope.containerOf(context, listen: false);
          await container
              .read(chatRoomPageViewModelProvider.notifier)
              .revalidateChatRooms();
        } finally {
          notifier.setNavigating(isNavigating: false);
        }
      },
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhotoFrame(
              imageUrl: avatarIconUrl,
              size: 56.5,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TopRow(
                    nickname: thumbnailUser.profile.updatableProfile.requiringReviewNickname.currentNickname,
                    birthday: thumbnailUser.profile.updatableProfile.birthday,
                    lastMessage: lastChatMessage,
                  ),
                  _BottomRow(
                    lastMessage: lastChatMessage,
                    badge: room.hasMessengerStatusBadge()
                        ? room.messengerStatusBadge
                        : null,
                    toUserId: thumbnailUser.userId,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// チャット入室前に最低限のデータをプリフェッチしてキャッシュへ投入
Future<void> _prefetchChatRoomData(WidgetRef ref, String chatRoomId) async {
  try {
   await ref.read(chatPageViewModelProvider(chatRoomId).notifier).prefetch(chatRoomId: chatRoomId);
  } on Exception catch (_) {
    // プリフェッチ失敗は握りつぶす
  }
}

/// 上段（名前・年齢・時間）を表示するウィジェット
class _TopRow extends StatelessWidget {
  const _TopRow({
    required this.nickname,
    required this.birthday,
    this.lastMessage,
  });

  final String nickname;
  final Timestamp birthday;
  final ChatMessage? lastMessage;

  @override
  Widget build(BuildContext context) {
    final displayName = ChatDisplayHelper.formatUserDisplayName(
      nickname,
      birthday,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              displayName,
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayDarkActive,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          lastMessage != null
              ? ChatDisplayHelper.formatTime(lastMessage!.sentAt)
              : '',
          style: EconaTextStyle.labelSmall140(
            color: EconaColor.gray400,
          ),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}

/// 下段（最新メッセージ・バッジ）を表示するウィジェット
class _BottomRow extends ConsumerWidget {
  const _BottomRow({
    required this.toUserId,
    this.lastMessage,
    this.badge,
  });

  final String toUserId;
  final ChatMessage? lastMessage;
  final MessengerStatusBadge? badge;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(chatRoomPageViewModelProvider);

    String latestMessage = '';

    if (lastMessage == null) {
      // lastMessageがない場合
      latestMessage = '';
    } else if (lastMessage!.publishedUserId == toUserId) {
      // 相手からのメッセージ
      if (state.isSubscribed && lastMessage!.contentType == MessageContentType.MESSAGE_CONTENT_TYPE_TEXT) {
        // テキストかつサブスク加入済みの場合はメッセージを表示
        latestMessage = lastMessage!.text.text;
      } else if (lastMessage!.contentType == MessageContentType.MESSAGE_CONTENT_TYPE_PHOTO) {
        // 写真の場合は写真が届いている旨を表示
        latestMessage = '写真が届いています';
      } else {
        // サブスク未加入時の場合
        latestMessage = 'メッセージが届いています';
      }
    } else {
      // 自分のメッセージ
      if (lastMessage!.contentType == MessageContentType.MESSAGE_CONTENT_TYPE_TEXT) {
        // テキスト
        latestMessage = lastMessage!.text.text;
      } else if (lastMessage!.contentType == MessageContentType.MESSAGE_CONTENT_TYPE_PHOTO) {
        // 写真
        latestMessage = '写真を送信しました';
      }
    }


    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            latestMessage,
            style: EconaTextStyle.regularSmall140(
              color: EconaColor.grayDarkActive,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
        if (badge != null && ChatDisplayHelper.getBadgeText(badge!).isNotEmpty) ...[
          const SizedBox(width: 8),
          _MessengerBadge(badge: badge!),
        ],
      ],
    );
  }
}

class _MessengerBadge extends StatelessWidget {
  const _MessengerBadge({required this.badge});
  final MessengerStatusBadge badge;

  @override
  Widget build(BuildContext context) {
    final text = ChatDisplayHelper.getBadgeText(badge);
    if (badge == MessengerStatusBadge.MESSENGER_STATUS_BADGE_SHOOTING_STAR_MATCH) {
      return Container(
        height: 22,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFF58DB8), // pink
              Color(0xFF6FA8FF), // blue
              Color(0xFFA2E8DA), // mint
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Text(
          text,
          style: EconaTextStyle.labelXSmall(color: Colors.white),
        ),
      );
    }
    // NEW / 未送信 は従来スタイル（単色）
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: const Color(0xFF656DF0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      ),
      child: Text(
        text,
        style: EconaTextStyle.labelXSmall(color: Colors.white),
      ),
    );
  }
}

/// エラー画面
class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({
    required this.error,
    required this.onTap,
    super.key,
  });

  final EconaError error;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 52,
            child: Text(
              error.operationMessage,
              style: EconaTextStyle.labelSmall22(
                color: EconaColor.grayDarkActive,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: IntrinsicWidth(
              child: Container(
                height: 52,
                padding:
                const EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(0, 0.44),
                    end: Alignment(1.08, 0.50),
                    colors: [
                      Color(0xFFD097DB),
                      Color(0xFF8887EE),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xFF9A94EE),
                      blurRadius: 20,
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      blurRadius: 20,
                      offset: Offset(-6, -6),
                    ),
                    BoxShadow(
                      color: Color(0xFF9A94EE),
                      blurRadius: 12,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Text(
                  '再読み込み',
                  style: EconaTextStyle.labelSmall22(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// View用の軽量データ（再ビルド抑制のため）
class _ChatRoomsViewData {
  const _ChatRoomsViewData({
    required this.items,
    required this.nextCursorId,
  });
  final List<ChatRoom> items;
  final String? nextCursorId;
}

class _ScheduledRoomsViewData {
  const _ScheduledRoomsViewData({
    required this.items,
    required this.nextCursorId,
  });
  final List<ScheduledChatRoom> items;
  final String? nextCursorId;
}
