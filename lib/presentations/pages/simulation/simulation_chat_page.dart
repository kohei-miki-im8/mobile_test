import 'dart:async';

import 'package:camera/camera.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart';
import 'package:econa_mobile_app/domains/entities/chat_input_config.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/chat_bubble.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/components/econa_feature_action_sheet.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_box.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/photo_frame.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/helpers/app_lifecycle_observer.dart';
import 'package:econa_mobile_app/presentations/pages/error_page.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_chat_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/util/error_message_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SimulationChatPage extends HookConsumerWidget {
  const SimulationChatPage({
    required this.chatRoomId,
    required this.selectedChatRoom,
    super.key,
  });

  final String chatRoomId;
  final SimulatorChatRoom selectedChatRoom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(simulationChatViewModelProvider(chatRoomId));
    final notifier = ref.read(simulationChatViewModelProvider(chatRoomId).notifier);
    final provider = simulationChatViewModelProvider(chatRoomId);

    final inputState = ref.read(econaChatInputViewModelProvider);
    final inputProvider = ref.watch(econaChatInputViewModelProvider);

    final scrollController = useScrollController();

    final avatarIconUrl = resolvePhotoUrl(
      urls: selectedChatRoom.dummyProfilePhotoUrls,
      kind: PhotoUrlKind.mediumThumbnailWebpUrl,
    );


    //#region 初期処理
    useEffect(() {
      Future.microtask(() async {
        await notifier.initialize();
        await notifier.subscribeChatSession(chatRoomId: chatRoomId);
      });
      return null;
    }, const []);
    //#endregion

    if(state.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    if(state.userId == null) {
      return ErrorPage(
        title: 'エラーが発生しました',
        message: 'ユーザー情報が取得できませんでした',
        onRetry: () {
          final notifier = ref.read(provider.notifier)
          ..clearError();
          unawaited(notifier.initialize());
        },
      );
    }

    // 手動再接続時のみ通知を出すためのフラグ
    final manualReconnectToast = useRef<bool>(false);
    // エラーモーダル多重表示防止フラグ
    final isErrorDialogOpen = useRef<bool>(false);

    // ポイント案内モーダルを「このページで1回だけ」出すためのフラグ
    final hasShownPointNotice = useRef<bool>(false);

    Future<void> handleSimulationSend(
      String text, {
      XFile? photo,
    }) async {
      // 何も入力されていない場合は送信しない
      final trimmed = text.trim();
      if (trimmed.isEmpty) {
        return;
      }

      // まだポイント案内を出していない場合のみチェック
      if (!hasShownPointNotice.value) {
        // LPを取得
        final lp = await fetchUserPoint(ref, PointType.lp);
        if (!context.mounted) {
          return;
        }

        if (lp < 1) {
          // ポイント不足モーダルを表示して送信はしない
          await showDialog<void>(
            context: context,
            builder: (dialogContext) => Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              insetPadding: const EdgeInsets.symmetric(horizontal: 12),
              child: EconaModal(
                message: 'LPが不足しています。',
                buttonText: 'OK',
                onButtonPressed: () {
                  dialogContext.pop();
                },
              ),
            ),
          );
          return;
        }

        // ポイントがある場合：1回目だけ「1ポイント消費」案内を出す
        bool accepted = false;
        await showDialog<void>(
          context: context,
          builder: (dialogContext) => Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            child: EconaModal(
              message: '送信には1LPを消費します',
              buttonText: 'OK',
              onButtonPressed: () {
                accepted = true;
                dialogContext.pop();
              },
            ),
          ),
        );
        if (!context.mounted) {
          return;
        }
        // OKボタン以外で閉じた場合は送信せず終了
        if (!accepted) {
          return;
        }
        hasShownPointNotice.value = true;
      }

      // 実際の送信処理（従来の sendMessage と同等）
      final inputNotifier = ref.read(econaChatInputViewModelProvider.notifier);
      await inputNotifier.sendMessage(
        userId: state.userId!,
        chatRoomId: chatRoomId,
        aiAgentCode: AiAgentCode.AI_AGENT_CODE_UNSPECIFIED,
      );
    }


    // ネットワークエラー等はモーダルで通知（error_message_formatter使用）
    ref.listen(provider, (previousState, currentState) {
      final previousError = previousState?.error;
      final currentError = currentState.error;

      if (currentError != null && currentError != previousError) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!context.mounted) return;
          if (isErrorDialogOpen.value) return;

          // メンテナンスモードであれば即座にメンテナンス画面へ遷移
          final handled = await handleEconaError(context, currentError);
          if (handled) {
            notifier.clearError();
            return;
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
                  // フォールバック: 状態遷移が来ない場合でも最新を取得
                  unawaited(Future<void>.delayed(
                    const Duration(milliseconds: 800),
                        () => notifier.revalidate(chatRoomId: chatRoomId),
                  ),);
                },
              ),
            ),
          ).whenComplete(() {
            isErrorDialogOpen.value = false;
          });
        });
        return;
      }

      // 接続状態の通知は「再接続ボタン」押下時に限定
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
          final hasStreamActivity = publishType.isNotEmpty
              || (currentState.subscribeChatSessionPublishedUserId?.isNotEmpty ?? false);

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
        notifier.disconnectSession(chatRoomId: chatRoomId);
      };
    }, [chatRoomId]);

    // 最新のやり取りへ戻るボタンの表示/非表示
    useEffect(() {
      void scrollListener() {
        final notifier = ref.watch(econaChatInputViewModelProvider.notifier);
        if (scrollController.offset < 200) {
          notifier.updateScrollButtonVisibility(visible: true);
        } else {
          notifier.updateScrollButtonVisibility(visible: false);
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

    final chatMessages = state.chatMessages.reversed.toList();

    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) return;
        final notifier = ref.read(simulationChatViewModelProvider(chatRoomId).notifier);
        await notifier.disconnectSession(chatRoomId: chatRoomId);
      },
      child: Scaffold(
        appBar: AvatarAppBar(
          avatarUrl: avatarIconUrl,
          nameText: selectedChatRoom.anonymizeDummyNickname,
          isAiChatRoom: true,
          leaveRoomOnPressed: () async {
            await showDialog<void>(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                child: EconaModal(
                  message: 'シミュレーションを終了しますか？',
                  buttonText: '終了する',
                  onButtonPressed: () async {
                    context.pop(); // 1. モーダルを閉じる
                    final notifier = ref.read(simulationChatViewModelProvider(chatRoomId).notifier);
                    await notifier.leaveSimulationChatRoom(chatRoomId: chatRoomId);
                    if(context.mounted) {
                      context.pop(); // 2. 1つ前のページに戻る
                    }
                  },
                ),
              ),
            );
          },
        ),
        backgroundColor: const Color(0xFFF0EFFD),
        body: SafeArea(
          child: GestureDetector(
          onTap: () {
            final focusNode = inputState.focusNode;
            if (focusNode.hasFocus) focusNode.unfocus();
          },
          child: state.chatMessages.isEmpty
              ? _EmptyState(
                  userId: state.userId!,
                  chatRoomId: chatRoomId,
                  onSend: handleSimulationSend,
                )
              : Column(
                children: [
                  Expanded(
                    child: PrimaryScrollController(
                      controller: scrollController,
                      child: Stack(
                        children: [
                          InfiniteScrollList<ChatMessageEntity>(
                            initialItems: chatMessages,
                            nextCursorId: state.nextCursorId,
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.only(bottom: 32, top: 8),
                            controller: scrollController,
                            fetchMoreData: (cursorId) async {
                              if (cursorId != null && cursorId.isNotEmpty) {
                                await notifier.fetchMessage(nextCursorId: cursorId);
                              }
                            },
                            separatorBuilder: (context, index) => const SizedBox(height: 8),
                            itemBuilder: (context, message, index) {
                              return _MessageRow(
                                message: message,
                                chatRoomId: chatRoomId,
                                avatarIconUrl: avatarIconUrl,
                              );
                            },
                            loadingBuilder: (context) => const Center(child: EconaLoadingIndicator(size: 24)),
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
                          ),
                          Consumer(
                            builder: (context, ref, _) {
                              final showButton = inputProvider.showScrollToBottomButton;
                              return showButton
                                  ? const Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: _ScrollToBottomButtonProxy(),
                              )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  EconaChatInput(
                    config: ChatInputConfig.simple(
                      userId: state.userId!,
                      chatRoomId: chatRoomId,
                      aiAgentCode: AiAgentCode.AI_AGENT_CODE_CHAT_SIMULATOR,
                      onSend: handleSimulationSend,
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.userId,
    required this.chatRoomId,
    required this.onSend,
  });

  final String userId;
  final String chatRoomId;
  final Future<void> Function(String text, {XFile? photo}) onSend;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: GradientBorderBox(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'やりとりシミュレーションが始まりました！\nマッチングをしたお相手だと思って会話してみましょう。\nある程度会話を楽しむと、あなたの「あなたの恋愛観」が更新されます',
                  style: EconaTextStyle.simulationSystemMessages(
                    color: EconaColor.grayDarkActive,
                    opacity: 0.7,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
        EconaChatInput(
          config: ChatInputConfig.simple(
            userId: userId,
            chatRoomId: chatRoomId,
            aiAgentCode: AiAgentCode.AI_AGENT_CODE_CHAT_SIMULATOR,
            onSend: onSend,
          ),
        ),
      ],
    );
  }
}

class _MessageRow extends ConsumerWidget {
  const _MessageRow({
    required this.message,
    required this.chatRoomId,
    required this.avatarIconUrl,
  });

  final ChatMessageEntity message;
  final String chatRoomId;
  final String avatarIconUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(simulationChatViewModelProvider(chatRoomId));

    final isMyMessage = message.publishedUserId == state.userId &&
        message.aiAgentCode == AiAgentCode.AI_AGENT_CODE_UNSPECIFIED;

    final messageText = message.content.textOrNull ?? '';

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
                Flexible(
                  child: ChatBubble(message: messageText, isMe: isMyMessage),
                ),
              ],
            ),
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
                  ChatBubble(message: messageText, isMe: isMyMessage),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

class _ScrollToBottomButtonProxy extends HookConsumerWidget {
  const _ScrollToBottomButtonProxy({super.key});

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
