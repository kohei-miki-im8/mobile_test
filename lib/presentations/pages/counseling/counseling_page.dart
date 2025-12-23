import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/domains/entities/chat_input_config.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pb.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_state.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/counseling/counseling_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/counseling/typing_dots.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class CounselingPage extends HookConsumerWidget {
  const CounselingPage({
    this.isRegistrationFlow = false,
    super.key,
  });

  final bool isRegistrationFlow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counselingPageViewModelProvider);
    final isDisplayButton = useState(false);
    final hasExistingSession = state.session != null;

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        leading: IconButton(
          color: Colors.white,
          icon: Assets.images.icons.close.image(height: 32, width: 32),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {
            context.pop();
          },
        ),
        backgroundColor: const Color(0xFF060A2D).withValues(alpha: 0.9),
        actions: [
          if(isRegistrationFlow)...[
            TextButton(
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const CounselingSkipModal(),
                  ),
                );
              },
              child: InnerShadowText(
                text: 'スキップ',
                textStyle: EconaTextStyle.labelMedium1140(
                  color: EconaColor.gray200,
                  shadows: EconaShadow.headlineShadows,
                ),
                innerShadowTextStyles: [
                  EconaTextStyle.labelMedium1140(
                    foreground: EconaShadow().headlineInnerShadow,
                  ),
                ],
              ),
            ),
          ],
          if(state.session != null)...[
            IconButton(
              onPressed: () async {
                await showDialog<void>(
                  context: context,
                  builder: (dialogContext) => Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                    child: EconaModal(
                      message: 'カウンセリングを終了しますか？',
                      buttonText: '終了する',
                      onButtonPressed: () async {
                        dialogContext.pop(); // 1. モーダルを閉じる
                        final chatRoomId = state.session?.chatRoomId;
                        if (chatRoomId != null && chatRoomId.isNotEmpty) {
                          final notifier = ref.read(counselingPageViewModelProvider.notifier);
                          await notifier.leaveCounselingChatRoom(chatRoomId: chatRoomId);
                        }
                        if(context.mounted) {
                          context.pop(); // 2. 1つ前のページに戻る
                        }
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ],
      ),
      body: state.isLoading || state.userStatus == null
          ? Container(
        alignment: Alignment.center,
        color: const Color(0xFF060A2D).withValues(alpha: 0.9),
        child: const EconaLoadingIndicator(),
      )
          : Container(
        width: double.infinity,
        color: const Color(0xFF060A2D).withValues(alpha: 0.9),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: -70,
              left: 0,
              right: 0,
              child: Assets.images.backgrounds.counselingGradationBg.image(
                width: 1170,
                height: 312,
                fit: BoxFit.cover,
              ),
            ),
            CounselingFlowManager(
              userId: state.userStatus!.userId,
              isDisplayButton: isDisplayButton,
              isRegistrationFlow: isRegistrationFlow,
              initialPageIndex: hasExistingSession ? 1 : 0,
            ),
          ],
        ),
      ),
    );
  }
}

// Top
class CounselingTop extends ConsumerWidget {
  const CounselingTop({
    required this.onNextPage,
    this.isDisplayButton,
    super.key,
  });

  final VoidCallback onNextPage;
  final ValueNotifier<bool>? isDisplayButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(counselingPageViewModelProvider);
    final notifier = ref.watch(counselingPageViewModelProvider.notifier);
    final nickname = state.profile?.updatableProfile.requiringReviewNickname.currentNickname ?? '';

    if(state.isLoading || state.profile == null) {
      return const Center(child: EconaLoadingIndicator());
    }

    final bodyText = '$nicknameさん、はじめまして…\n'
        'これからあなたにいくつか質問をします\n'
        '質問に答えていくことで、あなたが大切にしている価値観やどんなお相手を求めているかが、より明確になります\n'
        '自分の深層心理に触れられる良い機会ですので、落ち着ける環境でリラックスしながら取り組んでみてください\n'
        '\n'
        'カウンセリング結果はカルテでご確認いただけます\n'
        'カウンセリング結果をもとにあなたにピッタリのお相手をご紹介します\n';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CounselingTitle(),
          const SizedBox(height: 16),
          CounselingBody(text: bodyText, isDisplayButton: isDisplayButton, enableAnimation: false),
          IconButton(
            onPressed: () async {
              try {
                await notifier.startCounseling();
                onNextPage();
              } catch (e) {
                if(context.mounted) {
                  await EconaNotification.showTopToast(
                    context,
                    message: e.toString(),
                  );
                }
              }
            },
            icon: Assets.images.icons.caret.image(height: 52),
          ),
        ],
      ),
    );
  }
}

// チャット
class CounselingChat extends HookConsumerWidget {
  const CounselingChat({
    required this.onFinish,
    super.key,
  });

  final VoidCallback onFinish;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(counselingPageViewModelProvider.notifier);
    final state = ref.watch(counselingPageViewModelProvider);

    if (state.session == null) {
      return const Center(
        child: EconaLoadingIndicator(),
      );
    }

    useEffect((){
      // 復帰で再購読
      final observer = _AppLifecycleObserver(onResume: notifier.reconnectOnResume);
      WidgetsBinding.instance.addObserver(observer);
      return () => WidgetsBinding.instance.removeObserver(observer);
    }, []);

    final session = state.session;

    useEffect(() {
      if (session == null) return null;

      final notifier = ref.read(counselingPageViewModelProvider.notifier)
        ..ensureSubscribed();

      return () {
        // Stream購読を解除
        final chatRoomId = session.chatRoomId;
        if (chatRoomId.isNotEmpty) {
          notifier.disconnectSession(chatRoomId: chatRoomId);
        }
      };
    }, [session?.chatRoomId]);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        final chatRoomId = state.session?.chatRoomId;

        if (chatRoomId == null) {
          final latestState = ref.read(counselingPageViewModelProvider);
          final errorMessage = latestState.error?.userMessage ??
              'カウンセリングの開始に失敗しました。';

          if (context.mounted) {
            await EconaNotification.showTopToast(
              context,
              message: errorMessage,
            );
          }
        }

        if (!didPop || chatRoomId == null) return;

        final notifier = ref.read(counselingPageViewModelProvider.notifier);
        await notifier.disconnectSession(chatRoomId: chatRoomId);
      },
      child: GestureDetector(
        onTap: () {
          final focusNode = ref.read(econaChatInputViewModelProvider).focusNode;
          if (focusNode.hasFocus) focusNode.unfocus();
        },
        child: HookBuilder(
          builder: (context) {
            final session = state.session;
            if (session == null || session.chatRoomId.isEmpty) {
              return const Center(child: Text('チャットルームが見つかりません'));
            }
            final chatRoomId = session.chatRoomId;
            final aiMessage = session.lastAiMessage;
            final hasAiText = aiMessage?.content.textOrNull?.isNotEmpty ?? false;
            final aiText = hasAiText ? aiMessage!.content.textOrNull! : '';

            final bool showTypingDots = state.isPublishing || !hasAiText;
            final isFinished = session.isFinished ?? false;


            final notifier = ref.read(counselingPageViewModelProvider.notifier);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CounselingTitle(),
                        Builder(
                          builder: (_) {
                            final session = state.session!;
                            final aiMessage = session.lastAiMessage;
                            final hasAiText = aiMessage?.content.textOrNull?.isNotEmpty ?? false;

                            final String aiText =
                            hasAiText ? aiMessage!.content.textOrNull! : '';

                            final bool showTypingDots =
                                state.isPublishing || !hasAiText;

                            return CounselingBody(
                              key: ValueKey(aiMessage?.chatMessageId ?? '_typing'),
                              text: aiText,
                              isPublishing: showTypingDots,
                              enableAnimation: hasAiText,
                              onAnimationComplete: isFinished
                                  ? () async {
                                    // アニメーションが終わってから 3 秒待って遷移
                                    await Future.delayed(const Duration(milliseconds: 3000));
                                    if (context.mounted) {
                                      onFinish();
                                    }
                                  }
                                  : null,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                EconaChatInput(
                  config: ChatInputConfig.simple(
                    userId: state.userStatus!.userId,
                    chatRoomId: chatRoomId,
                    aiAgentCode: AiAgentCode.AI_AGENT_CODE_AI_COUNSELOR,
                    onSendSuccess: () {
                      notifier.setSendingMessage(isPublishing: true);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// カウンセリング終了
class CounselingFinished extends HookConsumerWidget {
  const CounselingFinished({
    required this.isRegistrationFlow,
    required this.isDisplayButton,
    super.key,
  });

  final bool isRegistrationFlow;
  final ValueNotifier<bool>? isDisplayButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if(isRegistrationFlow) {
      const bodyText = 'カウンセリングが終わりました\n'
          'おつかれさまでした。\n'
          '\n'
          'カウンセリング結果は、カルテでいつでも確認できます。\n'
          '\n'
          'また最新の診断結果をもとに、あなたにぴったりなお相手を紹介している「らしさマッチ」もぜひご覧ください！';

      return GestureDetector(
        onTap: () async {
          try {
            // 登録ステップログを作成
            await ref.read(registrationPageViewModelProvider.notifier).createRegistrationStepLog(
              CreateRegistrationStepLogRequest(
                registrationStep: RegistrationStep.REGISTRATION_STEP_5_02,
              ),
            );

            await context.push(EconaPath.subProfileOnboarding);
          } catch (e) {
            // エラーが発生した場合でも遷移は継続
            await context.push(EconaPath.subProfileOnboarding);
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                SizedBox(height: 16),
                CounselingTitle(),
                CounselingBody(text: bodyText),
              ],
            ),
          ),
        ),
      );
    } else {
      const bodyText = 'カウンセリングが終わりました\n'
          'おつかれさまでした。\n'
          '\n'
          'カウンセリング結果は、カルテでいつでも確認できます。\n'
          '\n'
          'また最新の診断結果をもとに、あなたにぴったりなお相手を紹介している「らしさマッチ」もぜひご覧ください！';

      return SizedBox(
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              const SizedBox(height: 16),
              const CounselingTitle(),
              CounselingBody(text: bodyText, isDisplayButton: isDisplayButton),
              EconaGradientButton(
                text: 'AIからの紹介を見る',
                enableShadow: false,
                onPressed: () async {
                  const LavigationRouteData().go(context);
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}

// タイトル
class CounselingTitle extends StatelessWidget {
  const CounselingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'AIカウンセリング',
        style: EconaTextStyle.grayTextInvert(
          color: Colors.white,
        ),
      ),
    );
  }
}

// Body
class CounselingBody extends StatelessWidget {
  const CounselingBody ({
    required this.text,
    this.isDisplayButton,
    this.enableAnimation = true,
    this.isPublishing = false,
    this.onAnimationComplete,
    super.key,
  });

  final String text;
  final ValueNotifier<bool>? isDisplayButton;
  final bool enableAnimation;
  final bool isPublishing;
  final VoidCallback? onAnimationComplete;

  @override
  Widget build(BuildContext context) {
    final animationRepeat = isPublishing;

    return Center (
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: isPublishing
            ? const TypingDots()
            : DefaultTextStyle(
          style: EconaTextStyle.grayLightHover(),
          child: enableAnimation
              ? AnimatedTextKit(
            pause: const Duration(microseconds: 100),
            animatedTexts: [
              TyperAnimatedText(text),
            ],
            isRepeatingAnimation: animationRepeat,
            repeatForever: animationRepeat,
            onFinished: onAnimationComplete,
          )
              : Text(text),
        ),
      ),
    );
  }
}

// 遷移管理
class CounselingFlowManager extends StatefulWidget {
  const CounselingFlowManager({
    required this.userId,
    this.isDisplayButton,
    this.isRegistrationFlow = false,
    this.initialPageIndex = 0,
    super.key,
  });

  final String userId;
  final ValueNotifier<bool>? isDisplayButton;
  final bool isRegistrationFlow;
  final int initialPageIndex;

  @override
  State<CounselingFlowManager> createState() => _CounselingFlowManagerState();
}

class _CounselingFlowManagerState extends State<CounselingFlowManager> {
  // 0: CounselingTop, 1: CounselingQuestion, 2: CounselingFinished
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialPageIndex;
  }

  void _goToNextPage() {
    setState(() {
      _currentPageIndex++;
    });
  }

  void _finishCounseling() {
    setState(() {
      _currentPageIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_currentPageIndex) {
      case 0:
        return CounselingTop(onNextPage: _goToNextPage, isDisplayButton: widget.isDisplayButton);
      case 1:
        return CounselingChat(onFinish: _finishCounseling);
      case 2:
        return CounselingFinished(isRegistrationFlow: widget.isRegistrationFlow, isDisplayButton: widget.isDisplayButton);
      default:
        return Container(); // エラーハンドリング
    }
  }
}

class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver({required this.onResume});

  final VoidCallback onResume;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    }
  }
}