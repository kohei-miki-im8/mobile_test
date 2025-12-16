import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/media_category.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/message_content_type.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/service_review_status.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/approve_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/create_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/update_question_answer.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/question.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/infrastructures/repositories/media.dart';
import 'package:econa_mobile_app/infrastructures/repositories/question.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/media_upload_service.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_state.dart';
import 'package:econa_mobile_app/presentations/pages/home/question_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final econaChatInputViewModelProvider =
NotifierProvider.autoDispose<EconaChatInputViewModel, EconaChatInputState>(
  EconaChatInputViewModel.new,
);

class EconaChatInputViewModel extends AutoDisposeNotifier<EconaChatInputState> {
  Timer? _questionTimeoutTimer;

  @override
  EconaChatInputState build() {
    final controller = TextEditingController();
    final focusNode = FocusNode();

    controller.addListener(() {
      Future.microtask(() {
        state = state.copyWith(text: controller.text);
      });
    });
    focusNode.addListener(() {
      Future.microtask(() {
        state = state.copyWith(isFocused: focusNode.hasFocus);
      });
    });

    ref.onDispose(() {
      controller.dispose();
      focusNode.dispose();
      _questionTimeoutTimer?.cancel();
      _questionTimeoutTimer = null;
    });

    return EconaChatInputState(
      textController: controller,
      focusNode: focusNode,
    );
  }

  // フォーカス
  void requestFocus() => state.focusNode.requestFocus();

  // フォーカス解除
  void unfocus() => state.focusNode.unfocus();

  // テキストを入力欄にセット
  void setText(String text) {
    state.textController.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
    state = state.copyWith(text: text);
  }

  // 最下部へのスクロールボタンの表示切替
  void updateScrollButtonVisibility({required bool visible}) {
    if (state.showScrollToBottomButton == visible) return;
    state = state.copyWith(showScrollToBottomButton: visible);
  }

  // 画像を取得
  Future<void> pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source);
      if (image != null) {
        state = state.copyWith(photo: image);
      }
    } on Exception catch(e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.mediaUpload,
      );
      state = state.copyWith(error: econaError);
    }
  }

  // 画像をクリア
  void clearPhoto() => state = state.copyWith(photo: null);

  // 送信
  Future<void> sendMessage({
    required String userId,
    required String chatRoomId,
    MessageContentType contentType = MessageContentType.MESSAGE_CONTENT_TYPE_TEXT,
    AiAgentCode aiAgentCode = AiAgentCode.AI_AGENT_CODE_UNSPECIFIED,
    bool needFirstMessageStatusCheck = false,
    VoidCallback? onSendSuccess,
    VoidCallback? onSendFailed,
  }) async {
    if (!state.canSend) return;

    state = state.copyWith(isLoading: true, error: null);

    if(needFirstMessageStatusCheck) {
      try {
        final userStatusResponse = await ref.read(userRepositoryProvider).getUserStatus(
          GetUserStatusRequest(),
        );
        final firstMessageReviewStatus = userStatusResponse.userStatus.hasFirstMessageServiceReviewStatus()
            ? userStatusResponse.userStatus.firstMessageServiceReviewStatus
            : ServiceReviewStatus.SERVICE_REVIEW_STATUS_UNSPECIFIED;

        // 初回メッセージステータスチェック
        if (firstMessageReviewStatus == ServiceReviewStatus.SERVICE_REVIEW_STATUS_REVIEWING) {
          state = state.copyWith(isLoading: false);
          onSendFailed?.call();
          return;
        }
      } on Exception catch (e) {
        // userStatus取得失敗時はエラーを設定してreturn
        final econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.chatMessageSend,
        );
        state = state.copyWith(
          error: econaError,
        );
        onSendFailed?.call();
        return;
      }
    }

    String chatMessageId = '';
    try {
      final photo = state.photo;
      if (photo != null) {
        // アップロード
        final mediaUploadService = ref.read(mediaUploadServiceProvider);
        final stream = mediaUploadService.buildStreamFromFile(
          filePath: photo.path,
          fileName: photo.name,
          category: MediaCategory.MEDIA_CATEGORY_CHAT_PHOTO,
          chatRoomId: chatRoomId,
        );

        final response = await ref
            .read(mediaRepositoryProvider)
            .chunkedMediaUpload(stream);

        chatMessageId = response.chatMessageId;

        final photoMsg = ChatMessage(
          publishedUserId: userId,
          chatMessageId: chatMessageId,
          contentType: MessageContentType.MESSAGE_CONTENT_TYPE_PHOTO,
          photo: PhotoMessageContent(
            signedImageUrls: response.signedImageUrls,
          ),
        );

        await ref.read(chatRepositoryProvider).publishChatMessage(
          PublishChatMessageRequest(
            chatRoomId: chatRoomId,
            chatMessage: photoMsg,
          ),
        );
        if (state.photo != null) {
          clearPhoto();
        }
      }
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.chatMessageSend,
      );
      state = state.copyWith(
        error: econaError,
      );
    }

    try {
      // テキスト送信前にエラーをクリア（画像送信失敗は独立して扱う）
      state = state.copyWith(error: null);
      final text = (state.text ?? state.textController.text).trim();
      if (text.isNotEmpty) {
        final message = ChatMessage(
          publishedUserId: userId,
          aiAgentCode: aiAgentCode,
          contentType: contentType,
          // TEXT
          text: contentType == MessageContentType.MESSAGE_CONTENT_TYPE_TEXT
              ? TextMessageContent(text: text)
              : null,
          // AI_AGENT
          aiAgent: contentType ==
              MessageContentType.MESSAGE_CONTENT_TYPE_AI_AGENT
              ? AiAgentMessageContent(text: text, isFinished: false)
              : null,
        );

        final req = PublishChatMessageRequest(
          chatRoomId: chatRoomId,
          chatMessage: message,
        );
        final response = await ref.read(chatRepositoryProvider).publishChatMessage(req);

        chatMessageId = response.chatMessageId;
        // ユーザーの通常テキスト送信のみをカウント（AIメッセージは除外）
        final isUserTextMessage =
            contentType == MessageContentType.MESSAGE_CONTENT_TYPE_TEXT &&
                aiAgentCode == AiAgentCode.AI_AGENT_CODE_UNSPECIFIED;
        if (isUserTextMessage) {
          AdjustEventTracker.trackMessageSent();
        }
        onSendSuccess?.call();
      }

      // 成功時は入力クリア
      state.textController.clear();
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.chatMessageSend,
      );
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }


  void setQuestion(EditingQuestion editingQuestion) {
    // モデレーション結果が返ってきたのでタイマー解除
    _questionTimeoutTimer?.cancel();
    _questionTimeoutTimer = null;

    final editing = editingQuestion.editingQuestion;
    final proposed = editingQuestion.proposedQuestion;

    // userQuestionIdはcreateQuestion()のレスポンスから既にstateに保存されているため、
    // ここではeditingQuestionとproposedQuestionのみを更新
    state = state.copyWith(
      questionPhase: QuestionPhase.selecting,
      editingQuestion: editing,
      proposedQuestion: proposed,
    );

    state.focusNode.requestFocus();
  }

  Future<void> createQuestion({required String toUserId, required String rawQuestion}) async {
    if (state.questionPhase == QuestionPhase.creating) return;

    // 既存タイマーをクリア
    _questionTimeoutTimer?.cancel();
    _questionTimeoutTimer = null;

    state = state.copyWith(
      questionPhase: QuestionPhase.creating,
      error: null,
    );

    // 90秒でローディング解除するフェイルセーフ
    _questionTimeoutTimer = Timer(const Duration(seconds: 90), () {
      if (state.questionPhase == QuestionPhase.creating) {
        state = state.copyWith(questionPhase: QuestionPhase.idle);
      }
    });

    try {
      final currentUserQuestionId = state.userQuestionId;

      final request = CreateQuestionRequest(
        toUserId: toUserId,
        rawQuestion: rawQuestion,
        // 既存IDがあれば upsert 用に利用
        userQuestionId: currentUserQuestionId != null &&
            currentUserQuestionId.isNotEmpty
            ? currentUserQuestionId
            : null,
      );

      final response = await ref.read(questionRepositoryProvider).createQuestion(request);
      // userQuestionIdをstateに保存
      if (response.hasUserQuestionId() && response.userQuestionId.isNotEmpty) {
        final newUserQuestionId = response.userQuestionId;
        state = state.copyWith(userQuestionId: newUserQuestionId);

        try {
          await ref
              .read(questionPageViewModelProvider.notifier)
              .subscribeQuestionSession(userQuestionId: newUserQuestionId);
        } catch (_) {
          // QuestionPage がマウントされていない等で失敗してもアプリは落とさない
        }
      }
    } on Exception catch (e) {
      _questionTimeoutTimer?.cancel();
      _questionTimeoutTimer = null;

      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.questionCreate,
      );
      state = state.copyWith(
        questionPhase: QuestionPhase.idle,
        error: econaError,
      );
    }
  }

  Future<void> approveQuestion({
    required String userQuestionId,
    required String approvedQuestion,
  }) async {
    _questionTimeoutTimer?.cancel();
    _questionTimeoutTimer = null;


    state = state.copyWith(
      questionPhase: QuestionPhase.approving,
      error: null,
    );

    try {
      await ref.read(questionRepositoryProvider).approveQuestion(
        ApproveQuestionRequest(
          userQuestionId: userQuestionId,
          approvedQuestion: approvedQuestion,
        ),
      );

      // Approve 成功時は編集用の質問表示をクリアし、フェーズを idle に戻す
      state = state.copyWith(
        questionPhase: QuestionPhase.idle,
        editingQuestion: null,
        proposedQuestion: null,
        showQuestionSentBanner: true,
      );
    } on Exception catch (e) {
      final EconaError econaError;
      if (e.toString().contains('insufficient points')) {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.lackOfLp,
        );
      } else {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.questionApprove,
        );
      }

      state = state.copyWith(
        questionPhase: QuestionPhase.idle,
        error: econaError,
      );
    } finally {
      state = state.copyWith(questionPhase: QuestionPhase.idle);
    }
  }

  void clearQuestionSentBanner() {
    if (!state.showQuestionSentBanner) {
      return;
    }
    state = state.copyWith(showQuestionSentBanner: false);
  }

  Future<void> updateQuestionAnswer({
    required String questionId,
    required String answer,
    required String publishedUserId,
  }) async {
    state = state.copyWith(error: null);

    try {
      await ref.read(questionRepositoryProvider).updateQuestionAnswer(
        UpdateQuestionAnswerRequest(
          userQuestionId: questionId,
          rawUserAnswer: answer,
          publishedUserId: publishedUserId,
        ),
      );
      await ref.read(questionPageViewModelProvider.notifier).fetchApprovedReceived();
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.answerSend,
      );
      state = state.copyWith(
        questionPhase: QuestionPhase.idle,
        error: econaError,
      );
    }
  }

  void setQuestionPhase(QuestionPhase phase) {
    state = state.copyWith(questionPhase: phase);
  }
}