import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/bordered_photo_component.dart';
import 'package:econa_mobile_app/domains/entities/chat_input_config.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pb.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_tag.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchingPage extends HookConsumerWidget {
  const MatchingPage({
    required this.matching,
    super.key,
  });

  final Matching matching;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 画面遷移時に初期化処理を実行
    useEffect(
      () {
        Future.microtask(() async {
          try {
            await ref
                .read(matchingPageViewModelProvider.notifier)
                .init(matching.toUserId);
          } on EconaError catch (econaError) {
            if (!context.mounted) return;

            final handled = await handleEconaError(context, econaError);
            if (handled) {
              return;
            }

            // getUserInfoの失敗時のみトースト表示
            if (econaError.operation == EconaErrorOperation.userInfoFetch) {
              WidgetsBinding.instance.addPostFrameCallback((_) async {
                await EconaNotification.showTopToast(
                  context,
                  message: econaError.userMessage,
                  duration: const Duration(seconds: 2),
                );
              });
            }
          }
        });
        return null;
      },
      const [],
    );

    // メッセージ送信エラー時にトーストを表示
    final chatInputError = ref
        .watch(econaChatInputViewModelProvider.select((state) => state.error));
    useEffect(
      () {
        Future.microtask(() async {
          final error = chatInputError;
          if (error == null) {
            return;
          }

          if (!context.mounted) return;

          final handled = await handleEconaError(context, error);
          if (handled) {
            return;
          }

          if (error.operation == EconaErrorOperation.chatMessageSend) {
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              await EconaNotification.showTopToast(
                context,
                message: error.userMessage,
                duration: const Duration(seconds: 2),
              );
            });
          }
        });

        return null;
      },
      [chatInputError],
    );

    // メッセージ入力欄の表示条件を取得
    final shouldShowChatInput = ref.watch(
      matchingPageViewModelProvider.select(
        (state) => state.shouldShowChatInput,
      ),
    );

    final initialMessage = ref.watch(
      matchingPageViewModelProvider.select(
        (state) => state.initialMessage,
      ),
    );

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // 欄外タップでソフトキーボードを閉じる
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.backgrounds.matching.provider(),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _MatchingBody(matching: matching),
                if (shouldShowChatInput.valueOrNull ?? false)
                  Column(
                    children: [
                      const Spacer(),
                      EconaChatInput(
                        config: ChatInputConfig.simple(
                          userId: matching.myUserId,
                          chatRoomId: matching.chatRoomId,
                          aiAgentCode: AiAgentCode.AI_AGENT_CODE_UNSPECIFIED,
                          hintText: '',
                          initialMessage: initialMessage.valueOrNull,
                          onSend: (text, {photo}) =>
                              _handleSendMessage(context, ref, matching.chatRoomId),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MatchingBody extends StatelessWidget {
  const _MatchingBody({
    required this.matching,
  });

  final Matching matching;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _Header(),
          const SizedBox(height: 57),
          Text(
            'おめでとうございます\nマッチングしました！',
            style: EconaTextStyle.headlineHeadline(
              color: EconaColor.grayTextInvert,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'あなたからメッセージを送ってみましょう',
            style: EconaTextStyle.regularMedium2160(
              color: EconaColor.grayTextInvert,
            ),
          ),
          const SizedBox(height: 24),
          _AngledProfileImages(matching: matching),
          const SizedBox(height: 21.3),
          Text(
            'お二人の共通点',
            style: EconaTextStyle.labelMedium2140(
              color: EconaColor.grayTextInvert,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const _CommonTags(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: Assets.images.icons.close.image(
              height: 32,
              width: 32,
            ),
            iconSize: 32,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
        ],
      ),
    );
  }
}

class _AngledProfileImages extends ConsumerWidget {
  const _AngledProfileImages({
    required this.matching,
  });

  final Matching matching;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (myBestImageUrl, isUserMale) = ref.watch(
      matchingPageViewModelProvider
          .select((state) => (state.myBestImageUrl, state.isUserMale)),
    );

    return SizedBox(
      width: 174.72,
      height: 165.84,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 8.84,
            right: 0,
            child: Transform.rotate(
              angle: 22.57 * 3.14159265359 / 180,
              child: BorderedPhotoComponent(
                image: Image.network(
                  matching.toUserBestImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return matching.isToUserMale
                        ? Assets.images.illusts.noImageMaleLarge.image(
                            fit: BoxFit.cover,
                          )
                        : Assets.images.illusts.noImageFemaleLarge.image(
                            fit: BoxFit.cover,
                          );
                  },
                ),
                fillColor: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: 8.84,
            left: 0,
            child: Transform.rotate(
              angle: -22.57 * 3.14159265359 / 180,
              child: BorderedPhotoComponent(
                image: Image.network(
                  myBestImageUrl.valueOrNull ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return isUserMale.valueOrNull ?? true
                        ? Assets.images.illusts.noImageMaleLarge.image(
                            fit: BoxFit.cover,
                          )
                        : Assets.images.illusts.noImageFemaleLarge.image(
                            fit: BoxFit.cover,
                          );
                  },
                ),
                fillColor: Colors.grey,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child:
                Assets.images.icons.whiteHeart.image(width: 20.44, height: 16),
          ),
        ],
      ),
    );
  }
}

class _CommonTags extends ConsumerWidget {
  const _CommonTags();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonTagsAsync = ref.watch(
      matchingPageViewModelProvider.select((state) => state.commonTags),
    );

    return SizedBox(
      width: 245,
      child: commonTagsAsync.when(
        data: (tags) => Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final String tag in tags) ...[
              EconaTag(tag: tag),
            ],
          ],
        ),
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
      ),
    );
  }
}

/// メッセージ送信処理
Future<void> _handleSendMessage(
  BuildContext context,
  WidgetRef ref,
  String chatRoomId,
) async {
  try {
    final myUserId = await ref.read(currentUserIdProvider.future);
    await ref.read(econaChatInputViewModelProvider.notifier).sendMessage(
          userId: myUserId,
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
    final chatInputState = ref.read(econaChatInputViewModelProvider);
    if (chatInputState.error?.operation ==
        EconaErrorOperation.chatMessageSend) {
      return;
    }
    // _handleSuccess内でcontext.mountedチェックあり
    // ignore: use_build_context_synchronously
    _handleSuccess(context);
  } on Exception catch (e) {
    final econaError = EconaError.fromException(
      e,
      operation: EconaErrorOperation.chatMessageSend,
    );
    // _handleError内でcontext.mountedチェックあり
    // ignore: use_build_context_synchronously
    await _handleError(context, econaError);
  }
}

/// メッセージ送信成功時の共通処理
void _handleSuccess(BuildContext context) {
  if (context.mounted) {
    context.pop();
  }
}

/// エラーハンドリングとトースト表示の共通処理
Future<void> _handleError(BuildContext context, EconaError econaError) async {
  if (!context.mounted) return;

  final handled = await handleEconaError(context, econaError);
  if (handled) {
    return;
  }

  await EconaNotification.showTopToast(
    context,
    message: econaError.userMessage,
    duration: const Duration(seconds: 2),
  );
}
