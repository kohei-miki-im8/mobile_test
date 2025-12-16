import 'dart:async';
import 'dart:ui';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/certification.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart';
import 'package:econa_mobile_app/domains/entities/chat_input_config.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart' as profile_entity;
import 'package:econa_mobile_app/domains/entities/subscription_status.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/service_review_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/get_blocked_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/update_user_block.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_visible_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/block.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/chat_bubble.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/components/econa_checkbox.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_tag.dart';
import 'package:econa_mobile_app/presentations/components/econa_toggle.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_box.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_container.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/photo_frame.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/helpers/app_lifecycle_observer.dart';
import 'package:econa_mobile_app/presentations/pages/chat/chat_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/chat_room/chat_room_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/error_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/util/error_message_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

part 'chat_content.dart';
part 'chat_topics_sheet.dart';
part 'date_intent.dart';
part 'persona_actions_sheet.dart';
part 'pinned_message.dart';


/// チャットページ
class ChatPage extends HookConsumerWidget {
  const ChatPage({
    required this.chatRoomId,
    required this.toUser,
    this.isForceReadPurchased,
    super.key,
  });

  final String chatRoomId;
  final ThumbnailUser toUser;
  final bool? isForceReadPurchased;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatPageViewModelProvider(chatRoomId));
    final vmProvider = chatPageViewModelProvider(chatRoomId);
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);
    final scrollController = useScrollController();
    final shouldScrollToBottomOnNewOwnMessage = useRef<bool>(false);

    // プロフィール詳細画面への多重遷移防止フラグ
    final isPushingUserDetail = useState(false);

    if(state.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    if(state.userStatus == null) {
      return ErrorPage(
        title: 'エラーが発生しました',
        message: 'ユーザー情報が取得できませんでした',
        onRetry: () => ref.refresh(chatPageViewModelProvider(chatRoomId)),
      );
    }

    final myUserId = state.userStatus!.userId;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.setUserDetail(user: toUser);
      });
      return null;
      }, const [], // ChatPage に入ってきたタイミングで1回だけ実行したいので空依存
    );

    // isForceReadPurchasedが渡された場合、ViewModelの状態を更新
    useEffect(() {
      if (isForceReadPurchased != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          notifier.setIsForceReadPurchased(isForceReadPurchased!);
        });
      }
      return null;
    }, [isForceReadPurchased]);

    // ChatPage 入室時にユーザーステータスを最新化（本人確認後の状態を反映するため）
    useEffect(() {
      () async {
        await notifier.refreshUserStatus();
      }();
      return null;
    }, const []);

    // RevenueCat からサブスクリプションティアを取得（取得失敗時は null のまま）
    final subscriptionTierFromRevenueCat = useState<SubscriptionTier?>(null);
    useEffect(() {
      () async {
        try {
          // プロフィールから性別を取得する必要がある場合
          // ここでは簡略化のため、既存のロジックを使用
          final hasPremium = await RevenueCatService.hasEntitlement('premium_access');
          final hasBasic = await RevenueCatService.hasEntitlement('basic_access');
          
          if (hasPremium) {
            subscriptionTierFromRevenueCat.value = SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM;
          } else if (hasBasic) {
            subscriptionTierFromRevenueCat.value = SubscriptionTier.SUBSCRIPTION_TIER_BASIC;
          } else {
            // RevenueCatでエンタイトルメントがない場合は、DBの値を使用するためnullのまま
            subscriptionTierFromRevenueCat.value = null;
          }
        } catch (_) {
          // エラー時はnullのまま（DBの値を使用）
          subscriptionTierFromRevenueCat.value = null;
        }
      }();
      return null;
    }, const []);

    // 手動再接続時のみ通知を出すためのフラグ
    final manualReconnectToast = useRef<bool>(false);
    // エラーモーダル多重表示防止フラグ
    final isErrorDialogOpen = useRef<bool>(false);

    // ネットワークエラー等はモーダルで通知（error_message_formatter使用）
    ref.listen(vmProvider, (previousState, currentState) {
      final previousError = previousState?.error;
      final currentError = currentState.error;

      // --- 1. エラーハンドリング（エラーが変化したときだけ） ---
      if (currentError != null && currentError != previousError) {
        // 既読購入まわりのエラーはここでスルー（モーダルは出さない）
        final isForceReadError =
            currentError.operation == EconaErrorOperation.forceReadPurchased ||
                currentError.operation == EconaErrorOperation.forceReadPurchasedAlready ||
                currentError.operation == EconaErrorOperation.lackOfMp;

        if (!isForceReadError) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!context.mounted) return;
            if (isErrorDialogOpen.value) return;

            // メンテナンスモードであれば即座にメンテナンス画面へ遷移
            final handled = await handleEconaError(context, currentError);
            if (handled) {
              notifier.clearError();
              return;
            }

            // ネットワークエラー かつ アプリがフォアグラウンドでない場合は握りつぶす
            if (currentError.cause == EconaErrorCause.network) {
              final lifecycleState = WidgetsBinding.instance.lifecycleState;
              final isForeground =
                  lifecycleState == null || lifecycleState == AppLifecycleState.resumed;

              if (!isForeground) {
                // バックグラウンド関連で発生したネットワークエラーは表示しない
                notifier.clearError();
                return;
              }
            }

            isErrorDialogOpen.value = true;
            await showDialog<void>(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                child: EconaModal(
                  message: ErrorMessageFormatter.formatUserMessage(currentState.error!),
                  messageStyle: EconaTextStyle.regularMedium2160(
                    color: EconaColor.grayDarkActive,
                  ),
                  buttonText: '再接続',
                  onButtonPressed: () async {
                    context.pop();
                    isErrorDialogOpen.value = false;
                    notifier.clearError();
                    manualReconnectToast.value = true;

                    if (!context.mounted) return;
                    await EconaNotification.showTopToast(
                      context,
                      message: '再接続を試行しています…',
                      duration: const Duration(seconds: 1),
                    );

                    notifier.manualReconnect(chatRoomId: chatRoomId);
                    unawaited(
                      Future<void>.delayed(
                        const Duration(milliseconds: 800),
                            () => notifier.revalidate(chatRoomId: chatRoomId),
                      ),
                    );
                  },
                ),
              ),
            ).whenComplete(() {
              isErrorDialogOpen.value = false;
            });
          });
        }
      }

      // --- 2. 接続状態の通知は「再接続ボタン」押下時に限定 ---
      final prevReconnecting = previousState?.isReconnecting ?? false;
      final currReconnecting = currentState.isReconnecting;
      if (manualReconnectToast.value) {
        if (!prevReconnecting && currReconnecting) {
          // 再接続開始
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!context.mounted) return;
            await EconaNotification.showTopToast(
              context,
              message: '再接続中…',
              duration: const Duration(seconds: 2),
            );
          });
        }
        if (prevReconnecting && !currReconnecting) {
          // 再接続完了と判定する条件を厳格化: 最後のイベントがmessage/typing/既知のイベント等
          final publishType = currentState.subscribeChatSessionPublishType?.name ?? '';
          final hasStreamActivity = publishType.isNotEmpty ||
              (currentState.subscribeChatSessionPublishedUserId?.isNotEmpty ?? false);

          // 念のため、手動再接続完了時は最新取得を明示的に実行
          unawaited(notifier.revalidate(chatRoomId: chatRoomId));
          if (hasStreamActivity && (currentState.error != null)) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              if (!context.mounted) return;
              await EconaNotification.showTopToast(
                context,
                message: '接続しました',
                duration: const Duration(seconds: 2),
              );
            });
          }
          manualReconnectToast.value = false;
        }
      }

      // --- 3. 自分の新規メッセージ追加時の自動スクロール ---
      final previousLength = previousState?.chatMessages.length ?? 0;
      final currentLength = currentState.chatMessages.length;

      if (shouldScrollToBottomOnNewOwnMessage.value &&
          currentLength > previousLength &&
          currentState.chatMessages.isNotEmpty &&
          // chatMessages は最新→過去の順に並んでいるので index 0 が最新
          currentState.chatMessages.first.publishedUserId == myUserId) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!scrollController.hasClients) {
            return;
          }
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
        shouldScrollToBottomOnNewOwnMessage.value = false;
      }
    });

    // Stream購読
    useEffect(() {
      // Subscription購読開始
      notifier.subscribeChatSession(chatRoomId: chatRoomId);

      // ライフサイクルにオブザーバーを登録する
      final observer = OnResumeObserver(
        onResume: () => notifier.reconnectOnResume(chatRoomId: chatRoomId),
      );
      WidgetsBinding.instance.addObserver(observer);

      // ライフサイクルからオブザーバーを削除 / Stream切断
      return () {
        WidgetsBinding.instance.removeObserver(observer);
        final disconnectRequest = PublishDisconnectChatSessionRequest(
          chatRoomId: chatRoomId,
        );
        notifier.disconnectSession(disconnectRequest);
      };
    }, [chatRoomId]);

    // ChatRoomが変わったときにテキスト入力をクリア
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final inputNotifier = ref.read(econaChatInputViewModelProvider.notifier);
        final inputState = ref.read(econaChatInputViewModelProvider);
        // テキストが入力されている場合はクリア
        if (inputState.textController.text.isNotEmpty) {
          inputState.textController.clear();
          inputNotifier.clearPhoto();
        }
      });
      return null;
    }, [chatRoomId]);

    // 最新のやり取りへ戻るボタンの表示/非表示
    useEffect(() {
      final inputNotifier = ref.read(econaChatInputViewModelProvider.notifier);
      void scrollListener() {
        if (scrollController.offset < scrollController.position.maxScrollExtent - 200) {
          inputNotifier.updateScrollButtonVisibility(visible: true);
        } else {
          inputNotifier.updateScrollButtonVisibility(visible: false);
        }
      }

      scrollController.addListener(scrollListener);
      return () {
        scrollController.removeListener(scrollListener);
      };
    }, [scrollController],);

    final didInitialScrollToBottom = useRef<bool>(false);
    useEffect(() {
      if (didInitialScrollToBottom.value) return null;
      if (state.isLoading) return null; // データ読み込み完了を待つ
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!scrollController.hasClients) return;
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
        didInitialScrollToBottom.value = true;
      });
      return null;
    }, [state.isLoading]);

    // サブスクリプションプラン: RevenueCatを優先し、取得できなかった場合のみDBの値を使用
    final subscriptionTier = subscriptionTierFromRevenueCat.value ?? state.userStatus!.subscriptionTier;
    final subscriptionPlan = SubscriptionPlan.fromSubscriptionTier(subscriptionTier);

    final isPremiumPlan = subscriptionPlan == SubscriptionPlan.premium;

    // フリー判定
    final isFreePlan = subscriptionPlan.isFree;

    // 本人確認済みか
    final isVerified = Certification
        .fromCode(state.userStatus!.certificateLevelCode)
        .isIdentityVerified;

    // やり取りデータを取得
    final chatMessages = state.chatMessages.reversed.toList();

    // 相手ユーザーの非表示/ブロック状態（ページ単位のローカルステート）
    final chatRoomPageState = ref.watch(chatRoomPageViewModelProvider);
    bool? initialIsHidden;
    for (final room in chatRoomPageState.chatRooms) {
      if (room.chatRoomId == chatRoomId) {
        // 「やりとりの非表示」は isVisible=false とみなす
        initialIsHidden = !room.isVisible;
        break;
      }
    }

    final isHiddenState = useState<bool?>(null);
    final isBlockedState = useState<bool?>(null);

    useEffect(() {
      if (initialIsHidden != null) {
        isHiddenState.value = initialIsHidden;
      }
      return null;
    }, [initialIsHidden]);

    useEffect(() {
      () async {
        // ブロック状態だけ API で取得
        try {
          final blocked = await ref.read(blockRepositoryProvider).getBlockedUsers(
            GetBlockedUsersRequest(
              toUserId: toUser.userId,
              cursor: PagerRequestCursor(
                limit: 1,
              ),
            ),
          );
          isBlockedState.value = blocked.thumbnailUsers.any(
                (u) => u.userId == toUser.userId,
          );
        } catch (_) {
          // エラー時は変更しない
        }
      }();
      return null;
    }, [toUser.userId]);


    final actionsLink = useMemoized(LayerLink.new);
    final isMenuOpen = useState(false);
    final overlayEntryRef = useRef<OverlayEntry?>(null);

    final avatarIconUrl = resolvePhotoUrl(
      profile: toUser.profile,
      kind: PhotoUrlKind.mediumThumbnailWebpUrl,
    );

    if(state.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }


    return Scaffold(
      appBar: AvatarAppBar(
        nameText: toUser.profile.updatableProfile.requiringReviewNickname.currentNickname,
        avatarUrl: avatarIconUrl,
        avatarOnTap: () async {
          if (isPushingUserDetail.value) {
            return;
          }
          isPushingUserDetail.value = true;

          try {
            await HomeUserDetailRouteData(
              userId: toUser.userId,
              pageType: DetailPageType.chat,
              chatRoomId: chatRoomId,
            ).push<void>(context);
          } finally {
            isPushingUserDetail.value = false;
          }
        },
        backgroundColor: EconaColor.background,
        actionLayerLink: actionsLink,
        actionOnPressed: () {
          if (isMenuOpen.value) {
            overlayEntryRef.value?.remove();
            overlayEntryRef.value = null;
            isMenuOpen.value = false;
            return;
          }
          final entry = _createModerationOverlay(
            parentContext: context,
            link: actionsLink,
            chatRoomId: chatRoomId,
            toUserId: toUser.userId,
            toUserNickname: toUser.profile.updatableProfile
                .requiringReviewNickname.currentNickname,
            myUserId: myUserId,
            isVerified: isVerified,
            isHidden: isHiddenState.value,
            isBlocked: isBlockedState.value,
            setHidden: (v) => isHiddenState.value = v,
            setBlocked: (v) => isBlockedState.value = v,
            onClose: () {
              overlayEntryRef.value?.remove();
              overlayEntryRef.value = null;
              isMenuOpen.value = false;
            },
          );
          Overlay.of(context).insert(entry);
          overlayEntryRef.value = entry;
          isMenuOpen.value = true;
        },
      ),
      backgroundColor: EconaColor.background,
      // GestureDetectorでラップし、チャット入力欄以外がタップされたときにフォーカスを解除
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            final focusNode = ref.read(econaChatInputViewModelProvider).focusNode;
            if (focusNode.hasFocus) focusNode.unfocus();
          },
          child: Builder(builder: (context) {
            // チャットメッセージ
            final messages = chatMessages;
            // やり取りがあるか
            final hasMessages = messages.isNotEmpty;
            // 自分のメッセージがあるか（なりきり挨拶判定用）
            final bool hasOwnHistory = state.chatMessages
                .any((m) => m.publishedUserId == myUserId && !m.content.isPhoto);
            // なりきり挨拶か否か
            final bool isPersonaGreeting = !hasOwnHistory;
            // 入力欄のヒントテキスト
            final String inputHintText = hasOwnHistory
                ? 'メッセージを入力'
                : '最初のメッセージを送りましょう';

            // サブスク制限用：自分のメッセージが1通以上あるか（写真含む）
            final bool hasOwnHistoryForLimit = state.chatMessages
                .any((m) => m.publishedUserId == myUserId);
            // 無料プラン かつ 既に1通以上送信済みなら、入力をブロック
            final bool shouldBlockInputBySubscription =
                isFreePlan && hasOwnHistoryForLimit;

            return Stack(
              children: [
                Column(
                  children: [
                    HookBuilder(builder: (context) {
                      final didInitialReadPublish = useRef<bool>(false);
                      useEffect(() {
                        if (didInitialReadPublish.value) return null;

                        // chatMessages は最新→過去の順に並んでいる前提
                        final index = chatMessages
                            .lastIndexWhere((m) => m.publishedUserId != myUserId);
                        if (index >= 0) {
                          final latestOther = chatMessages[index];
                          unawaited(
                            notifier.publishMessageRead(
                              publishedUserId: myUserId,
                              chatRoomId: chatRoomId,
                              chatMessageId: latestOther.chatMessageId,
                            ),
                          );
                          didInitialReadPublish.value = true;
                        }
                        return null;
                      }, [chatMessages]); // メッセージが変わったら再評価
                      return const SizedBox.shrink();
                    }),
                    if (hasMessages) ...[
                      Expanded(
                        child: _ChatContent(
                          messages: messages,
                          nextCursorId: state.nextCursorId,
                          chatRoomId: chatRoomId,
                          isFreePlan: isFreePlan,
                          isPremiumPlan: isPremiumPlan,
                          toUser: toUser,
                          scrollController: scrollController,
                          isVerified: isVerified,
                        ),
                      ),
                    ] else ...[
                      Expanded(
                        child: ChatEmptyState(
                          userId: myUserId,
                          chatRoomId: chatRoomId,
                          toUser: toUser,
                        ),
                      ),
                    ],
                    Stack(
                      children: [
                        EconaChatInput(
                          config: ChatInputConfig.chat(
                            userId: myUserId,
                            chatRoomId: chatRoomId,
                            hintText: inputHintText,
                            chatActions: [
                              _ChatTopicsEntry(
                                userId: myUserId,
                                chatRoomId: chatRoomId,
                                toUser: toUser,
                              ),
                              const SizedBox(width: 8),
                              _PersonaActionsEntry(
                                userId: myUserId,
                                chatRoomId: chatRoomId,
                                isPersonaGreeting: isPersonaGreeting,
                              ),
                            ],
                            onSend: () async {
                              shouldScrollToBottomOnNewOwnMessage.value = true;

                              await _handleSendMessageWithValidationCheck(
                                context,
                                ref,
                                userId: myUserId,
                                chatRoomId: chatRoomId,
                              );
                            },
                          ),
                        ),
                        if (shouldBlockInputBySubscription) ...[
                          Positioned.fill(
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () async {
                                if (!context.mounted) return;
                                await _showRequireSubscriptionModal(context);
                              },
                              child: const SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                if (!isVerified) ...[
                  const NotIdentityVerificationMosaic(),
                ],
              ],
            );
          }),
        ),
      ),
    );
  }
}

/// チャット空の場合の表示
class ChatEmptyState extends HookConsumerWidget {
  const ChatEmptyState({
    required this.userId,
    required this.chatRoomId,
    this.toUser,
    super.key,
  });

  final String userId;
  final String chatRoomId;
  final ThumbnailUser? toUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 写真（最大7件表示）
    final photos = toUser?.profile.requiringReviewProfilePhotos ?? const [];
    final imageUrls = photos
        .map((p) => p.currentSignedImageUrls.smallThumbnailWebpUrl)
        .where((u) => u.isNotEmpty)
        .take(7)
        .toList();
    final firstRow = imageUrls.take(4).toList();
    final secondRow = imageUrls.length > 4 ? imageUrls.sublist(4) : <String>[];

    // 共通タグ（自分×相手）
    final currentUserId = userId;
    final commonTagsAsync = ref.watch(
      commonTagsProvider((currentUserId, toUser?.userId ?? '')),
    );

    // プロフィール詳細画面への多重遷移防止フラグ
    final isPushingUserDetail = useState(false);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: EconaColor.background,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Text(
            'この話題で話してみては？',
            style: EconaTextStyle.labelSmall140(
              color: EconaColor.grayNormal,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'お相手が登録している写真',
            style: EconaTextStyle.labelMedium2140(
              color: EconaColor.purpleDarker,
            ),
            textAlign: TextAlign.center,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  for (int i = 0; i < firstRow.length; i++) ...[
                    Container(
                      width: 36,
                      height: 72,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child: Image.network(
                        firstRow[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ],
              ),
              if (secondRow.isNotEmpty) const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  for (int i = 0; i < secondRow.length; i++) ...[
                    Container(
                      width: 36,
                      height: 72,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black,
                      ),
                      child: Image.network(
                        secondRow[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              final target = toUser;
              if (target == null) {
                return;
              }

              if (isPushingUserDetail.value) {
                return;
              }
              isPushingUserDetail.value = true;

              final profile = profile_entity.Profile.fromThumbnailUser(target);
              final userDetail = UserDetail(
                profile: profile,
                profileDetail: null,
                matchingReason: null,
              );
              ref
                  .read(userDetailPageViewModelProvider.notifier)
                  .setUser(userDetail);

              try {
                await HomeUserDetailRouteData(
                  userId: target.userId,
                  pageType: DetailPageType.chat,
                  chatRoomId: chatRoomId,
                ).push<void>(context);
              } finally {
                isPushingUserDetail.value = false;
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '違う写真を見てみる',
                  style: EconaTextStyle.labelSmall140(
                    color: EconaColor.grayNormal,
                  ),
                  textAlign: TextAlign.center,
                ),
                Assets.images.icons.chevronRight.svg(width: 16, height: 16),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'お二人の共通点',
            style: EconaTextStyle.labelMedium2140(
              color: EconaColor.purpleDarker,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 245,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                Builder(builder: (context) {
                  return commonTagsAsync.when(
                    data: (List<String> tags) {
                      return Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final String tag in tags) ...[
                            EconaTag(tag: tag),
                          ],
                        ],
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  );
                }),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              final target = toUser;
              if (target == null) {
                return;
              }

              if (isPushingUserDetail.value) {
                return;
              }
              isPushingUserDetail.value = true;

              final profile = profile_entity.Profile.fromThumbnailUser(target);
              final userDetail = UserDetail(
                profile: profile,
                profileDetail: null,
                matchingReason: null,
              );
              ref
                  .read(userDetailPageViewModelProvider.notifier)
                  .setUser(userDetail);

              try {
                await HomeUserDetailRouteData(
                  userId: target.userId,
                  pageType: DetailPageType.chat,
                  chatRoomId: chatRoomId,
                ).push<void>(context);
              } finally {
                isPushingUserDetail.value = false;
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '違う共通点を見てみる',
                  style: EconaTextStyle.labelSmall140(
                    color: EconaColor.grayNormal,
                  ),
                  textAlign: TextAlign.center,
                ),
                Assets.images.icons.chevronRight.svg(width: 16, height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 本人確認未実施の場合のモザイク
class NotIdentityVerificationMosaic extends StatelessWidget {
  const NotIdentityVerificationMosaic({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: false,
        child: ColoredBox(
          color: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: Colors.black.withValues(alpha: 0.08),
              alignment: Alignment.center,
              padding:
              const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 24,
                children: [
                  Text(
                    'メッセージを見るには\n本人確認が必要です',
                    style: EconaTextStyle.headlineHeadline(
                      color: EconaColor.grayDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  EconaGradientButton(
                    text: 'メッセージを見る',
                    onPressed: () async {
                      await const CertificatesRouteData().push<void>(context);
                    },
                  ),
                  Text(
                    '本人確認を行うと\n無料で1通メッセージを送信できます',
                    style: EconaTextStyle.labelMedium1140(
                      color: EconaColor.grayDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// モデレーションメニュー
class ModerationMenu extends HookConsumerWidget {
  const ModerationMenu({
    required this.chatRoomId,
    required this.toUserId,
    required this.toUserNickname,
    required this.myUserId,
    required this.isVerified,
    required this.rootContext,
    required this.isHidden,
    required this.isBlocked,
    required this.setHidden,
    required this.setBlocked,
    this.onClose,
    super.key,
  });

  final String chatRoomId;
  final String toUserId;
  final String toUserNickname;
  final String myUserId;
  final bool isVerified;
  final BuildContext rootContext;
  final bool? isHidden;
  final bool? isBlocked;
  final void Function(bool value) setHidden;
  final void Function(bool value) setBlocked;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = _ModerationItems.buildItems(
      context: context,
      rootContext: rootContext,
      ref: ref,
      chatRoomId: chatRoomId,
      toUserId: toUserId,
      toUserNickname: toUserNickname,
      myUserId: myUserId,
      isVerified: isVerified,
      onClose: onClose,
      isHidden: isHidden,
      isBlocked: isBlocked,
      setHidden: setHidden,
      setBlocked: setBlocked,
    );

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: _ModerationName(text: items[index].text),
          onTap: items[index].onTap,
        );
      },
    );
  }
}

/// モデレーションメニューの項目名をTextWidgetに変換して返却
class _ModerationName extends StatelessWidget {
  const _ModerationName({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: EconaTextStyle.regularMedium2200(
        color: EconaColor.grayDarkActive,
      ),
    );
  }
}

/// モデレーションメニュー項目
class _ModerationItems {
  static List<_ModerationItem> buildItems({
    required BuildContext context,
    required BuildContext rootContext,
    required WidgetRef ref,
    required String chatRoomId,
    required String toUserId,
    required String toUserNickname,
    required String myUserId,
    required bool isVerified,
    VoidCallback? onClose,
    bool? isHidden,
    bool? isBlocked,
    void Function(bool value)? setHidden,
    void Function(bool value)? setBlocked,
  }) {
    return [
      _ModerationItem(
        text: '違反報告する',
        onTap: () async {
          onClose?.call();

          if (!isVerified) {
            if (!rootContext.mounted) {
              return;
            }
            await EconaNotification.showTopToast(
              rootContext,
              message: '本人確認完了後にご利用いただけます',
            );
            return;
          }

          String reporterNickname = '';
          try {
            final profileState = ref.read(profilePageViewModelProvider);
            if (profileState.profile == null) {
              await ref
                  .read(profilePageViewModelProvider.notifier)
                  .getProfileNoLoading();
              final updated = ref.read(profilePageViewModelProvider).profile;
              reporterNickname = updated
                      ?.updatableProfile
                      .requiringReviewNickname
                      .currentNickname ??
                  '';
            } else {
              reporterNickname = profileState
                  .profile!
                  .updatableProfile
                  .requiringReviewNickname
                  .currentNickname;
            }
          } catch (_) {
            reporterNickname = '';
          }

          await _launchViolationReportEmail(
            context: rootContext,
            toUserNickname: toUserNickname,
            reporterNickname: reporterNickname,
            reporterUserId: myUserId,
          );

          AdjustEventTracker.trackReport();
        },
      ),
      _ModerationItem(
        text: isHidden ?? false ? '非表示を解除' : '非表示にする',
        onTap: () async {
          try {
            // 現在の「非表示」状態をローカル state から解釈
            final bool currentlyHidden = isHidden ?? false;

            // やりとりの表示ステータスを更新
            await ref.read(chatRepositoryProvider).updateVisibleStatus(
              UpdateVisibleStatusRequest(
                chatRoomId: chatRoomId,
                // 非表示 -> 表示 にするときは true, その逆は false
                isVisible: currentlyHidden,
              ),
            );

            // ローカルのチャットページ用 state をトグル
            setHidden?.call(!currentlyHidden);

            // チャットルーム一覧側の state も即時更新しておく
            ref
                .read(chatRoomPageViewModelProvider.notifier)
                .updateChatRoomVisibleStatusLocally(
              chatRoomId: chatRoomId,
              isVisible: currentlyHidden,
            );

            if (rootContext.mounted) {
              await EconaNotification.showTopToast(
                rootContext,
                message: currentlyHidden
                    ? '非表示を解除しました'
                    : 'やりとりを非表示にしました',
              );
            }
            onClose?.call();
          } catch (e) {
            if (!rootContext.mounted) return;
            await EconaNotification.showTopToast(
              rootContext,
              message: '非表示の更新に失敗しました',
            );
          }
        },
      ),
      _ModerationItem(
        text: isBlocked ?? false ? 'ブロックを解除' : 'ブロックする',
        onTap: () async {
          try {
            final blocked = await ref.read(blockRepositoryProvider).getBlockedUsers(
              GetBlockedUsersRequest(
                toUserId: toUserId,
                cursor: PagerRequestCursor(
                  limit: 1,
                ),
              ),
            );
            final isAlreadyBlocked = blocked.thumbnailUsers.any(
                  (u) => u.userId == toUserId,
            );
            await ref.read(blockRepositoryProvider).updateUserBlock(
              UpdateUserBlockRequest(
                toUserId: toUserId,
                block: !isAlreadyBlocked,
              ),
            );
            if(!isAlreadyBlocked) {
              AdjustEventTracker.trackBlock();
            }
            setBlocked?.call(!isAlreadyBlocked);
            if (rootContext.mounted) {
              await EconaNotification.showTopToast(
                rootContext,
                message: isAlreadyBlocked
                    ? 'ブロックを解除しました'
                    : 'ブロックしました',
              );
            }
            onClose?.call();
          } catch (e) {
            if (!rootContext.mounted) return;
            await EconaNotification.showTopToast(
              rootContext,
              message: 'ブロックの更新に失敗しました',
            );
          }
        },
      ),
    ];
  }
}

/// モデレーションメニューの構造
class _ModerationItem {
  const _ModerationItem({
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function()? onTap;
}

Future<void> _launchViolationReportEmail({
  required BuildContext context,
  required String toUserNickname,
  required String reporterNickname,
  required String reporterUserId,
}) async {
  final buffer = StringBuffer()
    ..writeln('内容を確認後、送信してください。')
    ..writeln()
    ..writeln('[違反者]')
    ..writeln(toUserNickname)
    ..writeln()
    ..writeln('[違反の内容を一言で]')
    ..writeln()
    ..writeln('[違反の具体的な内容をできるだけ詳しく]')
    ..writeln()
    ..writeln('[報告者]')
    ..writeln(reporterNickname)
    ..writeln()
    ..writeln('[運営確認欄]')
    ..writeln(reporterUserId);

  final uri = Uri(
    scheme: 'mailto',
    path: 'support@lavigation.com',
    queryParameters: <String, String>{
      'subject': 'Lavi ユーザー違反報告',
      'body': buffer.toString(),
    },
  );

  try {
    final ok = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // メールアプリを明示的に外部起動
    );
    if (!ok && context.mounted) {
      await EconaNotification.showTopToast(
        context,
        message: 'メールアプリを起動できませんでした',
      );
    }
  } catch (_) {
    if (!context.mounted) return;
    await EconaNotification.showTopToast(
      context,
      message: 'メールアプリを起動できませんでした',
    );
  }
}

/// モデレーションメニューのオーバーレイを作成
OverlayEntry _createModerationOverlay({
  required BuildContext parentContext,
  required LayerLink link,
  required String chatRoomId,
  required String toUserId,
  required String toUserNickname,
  required String myUserId,
  required bool isVerified,
  required bool? isHidden,
  required bool? isBlocked,
  required void Function(bool value) setHidden,
  required void Function(bool value) setBlocked,
  required VoidCallback onClose,
}) {
  return OverlayEntry(
    builder: (context) {
      return Stack(
        children: [
          // 背景タップで閉じる
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onClose,
              child: const SizedBox.shrink(),
            ),
          ),
          // アクションボタン位置に追従するメニュー
          CompositedTransformFollower(
            link: link,
            showWhenUnlinked: false,
            offset: const Offset(-150, 28), // 右上角が中央に来るよう調整
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1F000000),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 170,
                  child: ModerationMenu(
                    chatRoomId: chatRoomId,
                    toUserId: toUserId,
                    toUserNickname: toUserNickname,
                    myUserId: myUserId,
                    isVerified: isVerified,
                    rootContext: parentContext,
                    isHidden: isHidden,
                    isBlocked: isBlocked,
                    setHidden: setHidden,
                    setBlocked: setBlocked,
                    onClose: onClose,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

/// サブスク必須モーダルを表示
Future<void> _showRequireSubscriptionModal(BuildContext context) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      child: EconaModal(
        message: 'ベーシックプラン加入が必要です',
        buttonText: 'プランを確認する',
        onButtonPressed: () {
          // まずモーダルを閉じる
          dialogContext.pop();
          // その後、サブスクリプションページ（ベーシックプラン）へ遷移
          if (!dialogContext.mounted) return;
          unawaited(
            const CurrentPlanRouteData().push<void>(context),
          );
        },
      ),
    ),
  );
}

/// メッセージ送信処理（チェック付き）
Future<void> _handleSendMessageWithValidationCheck(
    BuildContext context,
    WidgetRef ref, {
      required String userId,
      required String chatRoomId,
    }) async {
  try {
    final notifier = ref.read(chatPageViewModelProvider(chatRoomId).notifier);
    final state = ref.read(chatPageViewModelProvider(chatRoomId));

    final firstMessageReviewStatus = state.userStatus?.firstMessageServiceReviewStatus ??
        ServiceReviewStatus.SERVICE_REVIEW_STATUS_UNSPECIFIED;

    if (firstMessageReviewStatus == ServiceReviewStatus.SERVICE_REVIEW_STATUS_REVIEWING) {
      if (!context.mounted) return;
      await showDialog<void>(
        context: context,
        builder: (dialogContext) =>
            Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              insetPadding: const EdgeInsets.symmetric(horizontal: 12),
              child: EconaModal(
                message: 'メッセージの審査中につき、もうしばらくお待ちください。',
                subMessage: '※健全なサービス運営を目的として1通目のみ確認いたします',
                buttonText: 'OK',
                onButtonPressed: () {
                  dialogContext.pop();
                },
              ),
            ),
      );
      return;
    }

    final result = await notifier.sentMessageValidationCheck(publishedUserId: userId);


    // サブスクリプションプランに加入しているかチェック
    if (result == SentValidationResult.requireSubscription) {
      if (!context.mounted) return;
      await _showRequireSubscriptionModal(context);
      return;
    }
    await ref.read(econaChatInputViewModelProvider.notifier).sendMessage(
      userId: userId,
      chatRoomId: chatRoomId,
      needFirstMessageStatusCheck: true,
      onSendFailed: () async {
        if (!context.mounted) return;
        await showDialog<void>(
          context: context,
          builder: (dialogContext) => Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            child: EconaModal(
              message: 'メッセージの審査中につき、もうしばらくお待ちください。',
              subMessage: '※健全なサービス運営を目的として1通目のみ確認いたします',
              buttonText: 'OK',
              onButtonPressed: () {
                dialogContext.pop();
              },
            ),
          ),
        );
      },
    );
  } on Exception catch (e) {
    if (!context.mounted) return;
    await EconaNotification.showTopToast(
      context,
      message: ErrorMessageFormatter.formatUserMessage(e),
      duration: const Duration(seconds: 2),
    );
  }
}

Future<void> _showPersonaRequireCounselingModal(
    BuildContext context, {
      required bool isPersonaGreeting,
    }) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      child: EconaModal(
        message: isPersonaGreeting
            ? 'なりきり挨拶を利用するには、AIカウンセリングを行ってください'
            : 'なりきり返信を利用するには、AIカウンセリングを行ってください',
        buttonText: 'AIカウンセリングで\n価値観診断をする',
        onButtonPressed: () {
          dialogContext.pop();
          if(!dialogContext.mounted) return;
          const CounselingRouteData().push<void>(dialogContext);
        },
      ),
    ),
  );
}