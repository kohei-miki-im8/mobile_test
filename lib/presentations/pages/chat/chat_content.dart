part of 'chat_page.dart';

/// チャットメッセージ部分の構築
class _ChatContent extends ConsumerWidget {
  const _ChatContent({
    required this.messages,
    required this.nextCursorId,
    required this.chatRoomId,
    required this.isVerified,
    required this.isFreePlan,
    required this.isPremiumPlan,
    required this.toUser,
    required this.scrollController,
  });

  final List<ChatMessageEntity> messages;
  final String? nextCursorId;
  final String chatRoomId;
  final bool isVerified;
  final bool isFreePlan;
  final bool isPremiumPlan;
  final ThumbnailUser toUser;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);
    final state = ref.read(chatPageViewModelProvider(chatRoomId));

    final pinnedChatMessageId = state.pinnedChatMessageId;
    final index = state.chatMessages.indexWhere((m) => m.chatMessageId == pinnedChatMessageId);
    final pinnedMessageText = index > -1
        ? state.chatMessages[index].content.textOrNull
        : null;

    final firstPartnerIndex = messages
        .indexWhere((m) => m.publishedUserId == toUser.userId,
    );

    final list = InfiniteScrollList<ChatMessageEntity>(
      initialItems: messages,
      nextCursorId: nextCursorId,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      controller: scrollController,
      fetchMoreData: (cursorId) async {
        if (cursorId == null || cursorId.isEmpty) return;
        await notifier.getMessages(chatRoomId: chatRoomId);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, message, index) {
        final isLocked = index != firstPartnerIndex && (isFreePlan || !isVerified);
        return _MessageRow(
          message: message,
          chatRoomId: chatRoomId,
          isPremiumPlan: isPremiumPlan,
          toUser: toUser,
          isFreePlan: isFreePlan,
          isVerified: isVerified,
          isLocked: isLocked,
        );
      },
      loadingBuilder: (context) =>
          const Center(child: EconaLoadingIndicator(size: 24)),
      errorBuilder: (context, error, onRetry) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await EconaNotification.showTopToast(
            context,
            message: ErrorMessageFormatter.formatUserMessage(error),
            duration: const Duration(seconds: 2),
          );
        });
        return const SizedBox.shrink();
      },
    );

    return PrimaryScrollController(
      controller: scrollController,
      child: Stack(
        children: [
          list,
          Consumer(
            builder: (context, ref, _) {
              final showButton = ref.watch(econaChatInputViewModelProvider).showScrollToBottomButton;
              return showButton
                  ? const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ScrollToBottomButtonProxy(),
                    )
                  : const SizedBox.shrink();
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) {
                final inTween = Tween<Offset>(
                  begin: const Offset(0, -1),
                  end: Offset.zero,
                );
                final outTween = Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(0, 1),
                );
                final isReversing = animation.status == AnimationStatus.reverse;
                final curved = CurvedAnimation(parent: animation, curve: Curves.easeOut);
                final offsetAnim = (isReversing ? outTween : inTween).animate(curved);
                return ClipRect(
                  child: SlideTransition(
                    position: offsetAnim,
                    child: child,
                  ),
                );
              },
              child: pinnedMessageText != null
                  ? Container(
                      key: const ValueKey('pinned_present'),
                      padding: const EdgeInsets.only(top: 12),
                      child: PinnedMessage(
                        chatRoomId: chatRoomId,
                        text: pinnedMessageText,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageRow extends ConsumerWidget {
  const _MessageRow({
    required this.message,
    required this.chatRoomId,
    required this.isPremiumPlan,
    required this.toUser,
    required this.isFreePlan,
    required this.isVerified,
    required this.isLocked,
  });

  final ChatMessageEntity message;
  final String chatRoomId;
  final bool isPremiumPlan;
  final bool isFreePlan;
  final bool isVerified;
  final ThumbnailUser toUser;
  final bool isLocked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(chatPageViewModelProvider(chatRoomId));

    final isMyMessage = message.publishedUserId == state.userStatus!.userId;
    // デート意向の場合
    if (message.content.isDateIntention) {
      return DateIntent(
        currentUserId: message.publishedUserId,
        chatRoomId: chatRoomId,
        chatMessageId: message.chatMessageId,
        nickname: toUser.profile.updatableProfile.requiringReviewNickname.currentNickname,
        initialHasDateIntention: isMyMessage
            ? (state.dateIntention?.hasDateIntention ?? false)
            : (state.toUserDateIntention?.hasDateIntention ?? false),
      );
    }

    final avatarIconUrl = resolvePhotoUrl(
      profile: toUser.profile,
      kind: PhotoUrlKind.mediumThumbnailWebpUrl,
    );

    if (isMyMessage) {
      //　自分が送信した場合のメッセージの場合
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _MessageAdditionalInfo(
                  chatRoomId: chatRoomId,
                  message: message,
                  isPremiumPlan: isPremiumPlan,
                ),
                Flexible(
                  child: _MessageBody(
                    chatRoomId: chatRoomId,
                    message: message,
                    isVerified: isVerified,
                    isLocked: isLocked,
                  ),
                ),
              ],
            ),
            if (!isPremiumPlan && !state.isForceReadPurchased)...[
              _ConfirmReadMessageButton(
                chatRoomId: chatRoomId,
              ),
            ]

          ],
        ),
      );
    } else {
      // 相手が送信した場合のメッセージの場合
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhotoFrame(
              imageUrl: avatarIconUrl,
              size: 28,
            ),
            Flexible(
              child: Row(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _MessageBody(
                    message: message,
                    chatRoomId: chatRoomId,
                    isLocked: isLocked,
                    isVerified: isVerified,
                  ),
                  _MessageAdditionalInfo(
                    chatRoomId: chatRoomId,
                    message: message,
                    isPremiumPlan: isPremiumPlan,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _MessageBody extends ConsumerWidget {
  const _MessageBody({
    required this.message,
    required this.chatRoomId,
    required this.isVerified,
    this.isLocked = false,
  });

  final ChatMessageEntity message;
  final String chatRoomId;
  final bool isVerified;
  final bool isLocked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(chatPageViewModelProvider(chatRoomId));
    final isMyMessage = message.publishedUserId == state.userStatus!.userId;

    final text = message.content.textOrNull;
    if (text != null && text.isNotEmpty) {
      return ChatBubble(
        message: text,
        isMe: isMyMessage,
        isLocked: isLocked,
        isVerified: isVerified,
      );
    }
    if (message.content.isPhoto) {
      final photoUrl = message.content.photoUrlOrNull ?? '';

      final photoContent = Container(
        constraints: const BoxConstraints(maxWidth: 160, maxHeight: 160),
        child: AspectRatio(
          aspectRatio: 1,
          child: photoUrl.isNotEmpty
              ? ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(photoUrl, fit: BoxFit.cover),
          )
              : const SizedBox.shrink(),
        ),
      );

      if (isLocked && !isMyMessage) {
        // ロック時はテキストメッセージと同じスタイルで表示
        return Container(
          constraints: const BoxConstraints(maxWidth: 160, maxHeight: 160),
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              children: [
                // 画像を表示（ぼかしで隠す）
                photoContent,
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () async {
                      await showDialog<void>(
                        context: context,
                        builder: (dialogContext) => Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                          child: EconaModal(
                            message: '本人確認と\n有料プラン登録から！',
                            subMessage: 'メッセージの確認や送信には、本人確認および有料プランへの登録が必要です',
                            buttonText: '詳細を見てみる',
                            onButtonPressed: () async {
                              dialogContext.pop();
                              if(isVerified) {
                                await const SubscriptionRouteData(
                                  type: SubscriptionPageType.basic,
                                ).push<void>(context);
                              } else {
                                await const CertificatesRouteData().push<void>(context);
                              }
                            },
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.5),
                          alignment: Alignment.center,
                          child: Container(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // ロックされていない場合は通常通り画像を表示
      return photoContent;
    }

    return const SizedBox.shrink();
  }
}

class _MessageAdditionalInfo extends ConsumerWidget {
  const _MessageAdditionalInfo({
    required this.chatRoomId,
    required this.message,
    required this.isPremiumPlan,
    this.crossAxisAlignment = CrossAxisAlignment.end,
  });

  final String chatRoomId;
  final ChatMessageEntity message;
  final bool isPremiumPlan;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(chatPageViewModelProvider(chatRoomId).select((state) => state.readLastChatMessageId));

    final state = ref.read(chatPageViewModelProvider(chatRoomId));
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);
    final isPinned = state.pinnedChatMessageId == message.chatMessageId;
    final isMyMessage = message.publishedUserId == state.userStatus!.userId;

    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 4),
      child: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: crossAxisAlignment,
            spacing: 4,
            children: [
              // ピンボタン
              GestureDetector(
                onTap: () async {
                  await notifier.updatePinnedMessage(
                    chatRoomId: chatRoomId,
                    chatMessageId: isPinned ? null : message.chatMessageId,
                  );
                },
                child: isPinned
                    ? Assets.images.icons.pinned.svg(width: 16, height: 16)
                    : Assets.images.icons.pin.svg(width: 16, height: 16),
              ),
              if (isMyMessage && isReadMessage(message, state)) ...[
                Text(
                  '既読',
                  style: EconaTextStyle.regularSmall140(
                    color: EconaColor.grayGrayPurple400,
                  ),
                ),
              ],
            ],
          ),
          // メッセージ送信時間
          Text(
            DateFormat('h:mm a', 'en_US')
                .format(message.sentAt.toUtc().add(const Duration(hours: 9))),
            style: EconaTextStyle.regularSmall140(
              color: EconaColor.grayGrayPurple400,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfirmReadMessageButton extends HookConsumerWidget {
  const _ConfirmReadMessageButton({
    required this.chatRoomId,
  });

  final String chatRoomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.icons.gradientMessageRead.image(height: 22, width: 22),
          ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(
                Rect.fromLTWH(0, 0, bounds.width, bounds.height),
              );
            },
            child: Text(
              '既読を確認',
              style: EconaTextStyle.labelXSmall(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      onTap: () async {
        try {
          final notifier = ref.watch(chatPageViewModelProvider(chatRoomId).notifier);
          await showDialog<void>(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              insetPadding: const EdgeInsets.symmetric(horizontal: 12),
              child: EconaModal(
                message: '5MPを消費して既読機能を開放します',
                buttonText: 'OK',
                cancelText: 'キャンセル',
                onButtonPressed: () async {
                  try {
                    await notifier.purchaseForceReadStatus(
                      chatRoomId: chatRoomId,
                    );
                    if (!context.mounted) {
                      return;
                    }
                    context.pop();

                    final String message;
                    final state = ref.watch(chatPageViewModelProvider(chatRoomId));
                    if(state.error != null) {
                      message = state.error!.operationMessage;
                    } else {
                      message = '既読機能を開放しました';
                    }

                    await EconaNotification.showTopToast(
                      context,
                      message: message,
                      duration: const Duration(seconds: 2),
                    );

                    await notifier.reloadForceReadStatus(chatRoomId: chatRoomId);
                  } catch (e) {
                    if (!context.mounted) {
                      return;
                    }
                    await EconaNotification.showTopToast(
                      context,
                      message: ErrorMessageFormatter.formatUserMessage(e),
                      duration: const Duration(seconds: 2),
                    );
                  }
                },
              ),
            ),
          );
        } catch (e) {
          if (!context.mounted) {
            return;
          }
          await EconaNotification.showTopToast(
            context,
            message: ErrorMessageFormatter.formatUserMessage(e),
            duration: const Duration(seconds: 2),
          );
        }
      },
    );
  }
}

/// 最新のチャットに戻るボタン
class ScrollToBottomButtonProxy extends HookConsumerWidget {
  const ScrollToBottomButtonProxy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = PrimaryScrollController.maybeOf(context);
    if (controller == null) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 45,
        padding: const EdgeInsets.only(bottom: 8.0),
        child: EconaPlainButton(
          text: '最新のやりとりへ',
          onPressed: () async {
            await controller.animateTo(
              controller.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          },
          leading: Assets.images.icons.downArrow.svg(
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
                EconaColor.grayDarkActive, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}