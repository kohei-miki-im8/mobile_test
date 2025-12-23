import 'dart:io';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/chat_input_config.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_state.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// チャット入力コンポーネント（統一インターフェース）
class EconaChatInput extends HookConsumerWidget {
  const EconaChatInput({
    required this.config,
    super.key,
  });

  final ChatInputConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(econaChatInputViewModelProvider.notifier);
    final state = ref.read(econaChatInputViewModelProvider);

    // initialMessageをテキストコントローラーに設定（既入力がある場合は上書きしない）
    if (config is ChatInputConfigSimple) {
      final simpleConfig = config as ChatInputConfigSimple;
      useEffect(
        () {
          if (simpleConfig.initialMessage != null &&
              simpleConfig.initialMessage!.isNotEmpty &&
              state.textController.text.isEmpty) {
            state.textController.text = simpleConfig.initialMessage!;
          }
          return null;
        },
        [simpleConfig.initialMessage],
      );
    }

    if (config is ChatInputConfigChat) {
      return _ChatInputField(config: config as ChatInputConfigChat);
    } else if (config is ChatInputConfigQuestion) {
      final questionConfig = config as ChatInputConfigQuestion;
      // 初期フェーズを設定
      if (questionConfig.initialPhase != null) {
        useEffect(
          () {
            Future.microtask(() {
              notifier.setQuestionPhase(questionConfig.initialPhase!);
            });
            return null;
          },
          [questionConfig.initialPhase],
        );
      }
      return _QuestionInputField(config: questionConfig);
    } else if (config is ChatInputConfigSimple) {
      return _SimpleInputField(config: config as ChatInputConfigSimple);
    }
    // ここには来ない想定だが、型安全のためのフォールバック
    return const SizedBox.shrink();
  }
}

/// チャット入力の共通コンテナ
class _ChatInputContainer extends StatelessWidget {
  const _ChatInputContainer({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 78),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ShadowAndGradientBorderContainer(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        borderWidth: 1,
        gradients: [
          LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFFFFF).withValues(alpha: 1),
              const Color(0xFFFFFFFF).withValues(alpha: 0),
            ],
          ),
          const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFD6E3F3),
              Color(0xFFFFFFFF),
            ],
          ),
        ],
        backgroundColor: EconaColor.chatInputBackground,
        innerShadows: const [],
        dropShadows: [
          BoxShadow(
            color: const Color(0xFF3E4AB5).withValues(alpha: 0.24),
            blurRadius: 20,
            offset: const Offset(-4, -4),
          ),
          const BoxShadow(
            color: Color(0xFFFFFFFF),
            blurRadius: 20,
            offset: Offset(-6, -6),
          ),
        ],
        child: child,
      ),
    );
  }
}

/// テキスト入力フィールドコンポーネント
class _TextInputField extends ConsumerWidget {
  const _TextInputField({
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(econaChatInputViewModelProvider);
    final isFocused = state.isFocused;

    return TextField(
      controller: state.textController,
      focusNode: state.focusNode,
      minLines: 1,
      maxLines: 9,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      style: EconaTextStyle.regularMedium160(
        color: EconaColor.grayDarkActive,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: EconaTextStyle.labelHintText(
          color: EconaColor.chatInputHintText,
        ),
        contentPadding: isFocused
            ? const EdgeInsets.fromLTRB(12, 16, 12, 0)
            : const EdgeInsets.fromLTRB(12, 0, 12, 0),
      ),
    );
  }
}

/// 送信ボタンコンポーネント
class _SendButton extends ConsumerWidget {
  const _SendButton({
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(econaChatInputViewModelProvider);
    final canSend = state.canSend;

    return SizedBox(
      width: 50,
      height: 50,
      child: IconButton(
        icon: canSend
            ? Assets.images.icons.canSend.svg(width: 30, height: 30)
            : Assets.images.icons.cantSend.svg(width: 30, height: 30),
        onPressed: canSend ? onPressed : null,
      ),
    );
  }
}

/// 写真プレビューコンポーネント
class _PhotoPreview extends ConsumerWidget {
  const _PhotoPreview({
    required this.photo,
  });

  final XFile photo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Image(
              image: FileImage(File(photo.path)),
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 7,
            right: 7,
            child: InkWell(
              onTap: ref
                  .watch(econaChatInputViewModelProvider.notifier)
                  .clearPhoto,
              child: Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// チャットページ用の入力フィールド
class _ChatInputField extends ConsumerWidget {
  const _ChatInputField({
    required this.config,
  });

  final ChatInputConfigChat config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(econaChatInputViewModelProvider);
    final notifier = ref.watch(econaChatInputViewModelProvider.notifier);
    final photo = state.photo;

    Future<void> handleSend() async {
      // ChatPage から onSend が渡されている場合は、そちらでバリデーション＆送信を行う
      if (config.onSend != null) {
        await config.onSend!();
        return;
      }

      // 従来通りの送信（制限が不要な別画面などで使用）
      await notifier.sendMessage(
        userId: config.userId,
        chatRoomId: config.chatRoomId,
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
    }

    return _ChatInputContainer(
      child: ColoredBox(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // 写真があればプレビュー表示
            if (photo != null) ...[
              _PhotoPreview(photo: photo),
            ],
            // 入力フィールド
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!state.isFocused) ...[
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: IconButton(
                        onPressed: () async {
                          try {
                            await notifier.pickImage(ImageSource.camera);
                          } on Exception catch (_) {
                            if(!context.mounted) return;
                            await EconaNotification.showTopToast(
                              context,
                              message: '写真の取得に失敗しました。通信環境や端末の設定をご確認のうえ、もう一度お試しください。',
                            );
                          }
                        },
                        icon: Assets.images.icons.add
                            .image(width: 24, height: 24),
                      ),
                    ),
                  ],
                  Expanded(
                    child: _TextInputField(
                      hintText: config.hintText ?? 'メッセージを入力',
                    ),
                  ),
                  if (!state.isFocused) ...[
                    _SendButton(
                      onPressed: handleSend,
                    ),
                  ],
                ],
              ),
            ),
            // フォーカス時のアクションボタン
            if (state.isFocused) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // カメラボタン
                        IconButton(
                          icon: Assets.images.icons.camera
                              .image(width: 30, height: 30),
                            onPressed: () async {
                              try {
                                await notifier.pickImage(ImageSource.camera);
                              } on Exception catch (_) {
                                if(!context.mounted) return;
                                await EconaNotification.showTopToast(
                                  context,
                                  message: '写真の取得に失敗しました。通信環境や端末の設定をご確認のうえ、もう一度お試しください。',
                                );
                              }
                            }
                        ),
                        // ギャラリーボタン
                        IconButton(
                          icon: Assets.images.icons.gallery.image(width: 30, height: 30),
                          onPressed: () async {
                            try {
                              await notifier.pickImage(ImageSource.gallery);
                            } on Exception catch (_) {
                              if(!context.mounted) return;
                              await EconaNotification.showTopToast(
                                context,
                                message: '写真の取得に失敗しました。通信環境や端末の設定をご確認のうえ、もう一度お試しください。',
                              );
                            }
                          }
                        ),
                        const SizedBox(width: 8),
                        // Chat専用のボタン（話題、なりきり挨拶）
                        ...config.chatActions,
                      ],
                    ),
                    // 送信ボタン
                    _SendButton(
                      onPressed: handleSend,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// 質問ページ用の入力フィールド
class _QuestionInputField extends ConsumerWidget {
  const _QuestionInputField({
    required this.config,
  });

  final ChatInputConfigQuestion config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(econaChatInputViewModelProvider);
    final notifier = ref.watch(econaChatInputViewModelProvider.notifier);

    // Approve 完了時に QuestionViewModel からトリガーされたフラグを見てバナー表示
    if (state.showQuestionSentBanner) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) {
          return;
        }
        EconaBannerController.show(
          context,
          text: 'しつもんを送信しました。',
        );

        // ChatInput のモーダルを閉じる（rootNavigator:true で開いているのでどちらでもよい）
        Navigator.of(context, rootNavigator: true).pop();

        ref.read(econaChatInputViewModelProvider.notifier).clearQuestionSentBanner();
      });
    }

    Future<void> showQuestionResult({
      required BuildContext context,
      required EconaError? error,
      required String successMessage,
    }) async {
      if (!context.mounted) {
        return;
      }
      if (error == null) {
        EconaBannerController.show(
          context,
          text: successMessage,
        );
        return;
      }

      if (error.operation == EconaErrorOperation.lackOfLp) {
        await showDialog<void>(
          context: context,
          builder: (dialogContext) => Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            child: EconaModal(
              message: error.operationMessage,
              buttonText: 'LPを追加する',
              onButtonPressed: () async {
                dialogContext.pop();
                await const PurchaseRouteData(type: PurchasePageType.lp).push<void>(context);
              },
            ),
          ),
        );
      } else {
        await EconaNotification.showTopToast(
          context,
          message: error.operationMessage,
        );
      }
    }

    return _ChatInputContainer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.editingQuestion != null ||
                state.proposedQuestion != null) ...[
              Row(
                children: [
                  Assets.images.icons.personaAction.svg(width: 32, height: 32),
                  RichText(
                    text: TextSpan(
                      text: '利用規約',
                      style: EconaTextStyle.regularSmall140(
                        color: EconaColor.feedbackRed400,
                      ).copyWith(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          const WebViewRouteData(
                            url: EconaWebUrl.privacy,
                            title: '利用規約・プライバシーポリシー',
                          ).push<void>(context);
                        },
                      children: <TextSpan>[
                        TextSpan(
                          text:
                          'に反する言葉が使用されています。\n相手の気持ちを考えてメッセージを送りましょう。',
                          style: EconaTextStyle.regularSmall140(
                            color: EconaColor.grayDarkActive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
            if (state.editingQuestion != null &&
                state.proposedQuestion != null) ...[
              IntrinsicHeight(
                child: Row(
                  spacing: 8,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: _EditingQuestion(
                        text: state.editingQuestion!,
                        isAiProposed: false,
                        onSelect: () {
                          notifier.setText(state.editingQuestion!);
                        },
                      ),
                    ),
                    Expanded(
                      child: _EditingQuestion(
                        text: state.proposedQuestion!,
                        isAiProposed: true,
                        onSelect: () {
                          notifier.setText(state.proposedQuestion!);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: state.textController,
                    focusNode: state.focusNode,
                    minLines: 1,
                    maxLines: 9,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    style: EconaTextStyle.questionProposed(
                      color: EconaColor.grayDarkActive,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: EconaTextStyle.labelHintText(
                        color: EconaColor.chatInputHintText,
                      ),
                      contentPadding: state.isFocused
                          ? const EdgeInsets.fromLTRB(12, 16, 12, 0)
                          : const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    ),
                  ),
                ),
                if (state.questionPhase == QuestionPhase.creating) ...[
                  const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: EconaLoadingIndicator(
                        size: 20,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ] else ...[
                  _SendButton(
                    onPressed: state.canSend
                        ? () async {
                            final phase = state.questionPhase;

                            // 生成中/承認中は連打防止で無視
                            if (phase == QuestionPhase.creating ||
                                phase == QuestionPhase.approving) {
                              return;
                            }

                            if (phase == QuestionPhase.idle ||
                                phase == QuestionPhase.selecting) {
                              // 初回 & 編集後どちらも createQuestion (upsert)
                              if (config.toUserId == null) {
                                return;
                              }

                              await notifier.createQuestion(
                                toUserId: config.toUserId!,
                                rawQuestion: state.textController.text,
                              );

                              // 質問送信フェーズでは成功バナーは Stream→Approve 完了時に出す。
                              // ここではエラーのみハンドリング。
                              final error = ref
                                  .read(econaChatInputViewModelProvider)
                                  .error;
                              if (error != null) {
                                await showQuestionResult(
                                  context: context,
                                  error: error,
                                  successMessage: 'しつもんを送信しました。',
                                );
                              }
                            } else if (phase == QuestionPhase.answer) {
                              // 回答フェーズは従来通りここで完結
                              if (config.questionId == null) {
                                return;
                              }

                              await notifier.updateQuestionAnswer(
                                questionId: config.questionId!,
                                answer: state.textController.text,
                                publishedUserId: '',
                              );

                              final error = ref
                                  .read(econaChatInputViewModelProvider)
                                  .error;

                              await showQuestionResult(
                                context: context,
                                error: error,
                                successMessage: '回答を送信しました。',
                              );
                            }

                            state.textController.clear();
                          }
                        : null,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EditingQuestion extends StatelessWidget {
  const _EditingQuestion({
    required this.text,
    this.isAiProposed = false,
    this.onSelect,
  });

  final String text;
  final bool isAiProposed;
  final void Function()? onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: EconaColor.grayLightActive,
        ),
      ),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isAiProposed ? 'AI：' : 'あなた：',
            style: EconaTextStyle.questionWhoProposed(
              color: EconaColor.grayDarkActive,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: EconaTextStyle.questionProposed(
                color: EconaColor.grayDarkActive,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConvexPanel(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              backgroundColor: Colors.white,
              onTap: onSelect,
              child: Text(
                isAiProposed ? 'AIを選択' : 'あなたの回答を選択',
                style: EconaTextStyle.labelSmall140(
                  color: EconaColor.grayNormal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// その他のページ用の入力フィールド（counseling, simulation, matching）
class _SimpleInputField extends ConsumerWidget {
  const _SimpleInputField({
    required this.config,
  });

  final ChatInputConfigSimple config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(econaChatInputViewModelProvider);
    final notifier = ref.watch(econaChatInputViewModelProvider.notifier);

    return _ChatInputContainer(
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    // matching用のラベル表示
                    if (config.aiAgentCode ==
                        AiAgentCode.AI_AGENT_CODE_UNSPECIFIED) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: InnerShadowText(
                                text: '初回定型文',
                                textStyle: EconaTextStyle.labelMedium1140(
                                  color: EconaColor.gray200,
                                ),
                                innerShadowTextStyles: [
                                  EconaTextStyle.labelMedium1140(
                                    foreground: Paint()
                                      ..style = PaintingStyle.fill
                                      ..color = const Color(0xFF353E72)
                                          .withValues(alpha: 0.915)
                                      ..maskFilter = Platform.isIOS
                                          ? const MaskFilter.blur(BlurStyle.normal, 0)
                                          : const MaskFilter.blur(
                                            BlurStyle.inner,
                                            2,
                                          ),
                                  ),
                                  EconaTextStyle.labelMedium1140(
                                    foreground: Paint()
                                      ..style = PaintingStyle.fill
                                      ..color = Color(0xFFFFFFFF)
                                          .withValues(alpha: 0.8 * 3 / 2)
                                      ..maskFilter = Platform.isIOS
                                          ? const MaskFilter.blur(BlurStyle.normal, 0)
                                          : const MaskFilter.blur(
                                            BlurStyle.inner,
                                            2,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                    _TextInputField(
                      hintText: config.hintText ?? 'メッセージを入力',
                    ),
                  ],
                ),
              ),
              _SendButton(
                onPressed: config.onSend != null
                    ? () async {
                        await config.onSend!(
                          state.textController.text,
                          photo: state.photo,
                        );
                      }
                    : () async {
                        await notifier.sendMessage(
                          userId: config.userId,
                          chatRoomId: config.chatRoomId,
                          aiAgentCode: config.aiAgentCode,
                          onSendSuccess: config.onSendSuccess,
                        );
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
