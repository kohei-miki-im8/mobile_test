import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

enum QuestionPhase {
  idle,
  creating,
  selecting,
  approving,
  answer,
}

/// 基本的な入力状態（全タイプ共通）
class ChatInputBaseState {
  const ChatInputBaseState({
    required this.textController,
    required this.focusNode,
    this.text,
    this.photo,
    this.isFocused = false,
    this.isLoading = false,
    this.error,
  });

  final TextEditingController textController;
  final FocusNode focusNode;
  final String? text;
  final XFile? photo;
  final bool isFocused;
  final bool isLoading;
  final EconaError? error;

  bool get canSend => (textController.text.trim().isNotEmpty || photo != null) && !isLoading;

  static const _unset = Object();

  ChatInputBaseState copyWith({
    TextEditingController? textController,
    FocusNode? focusNode,
    String? text,
    Object? photo = _unset,
    bool? isFocused,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newPhoto = identical(photo, _unset)
        ? this.photo
        : photo as XFile?;

    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return ChatInputBaseState(
      textController: textController ?? this.textController,
      focusNode: focusNode ?? this.focusNode,
      text: text ?? this.text,
      photo: newPhoto,
      isFocused: isFocused ?? this.isFocused,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}

/// 質問入力専用の状態
class QuestionInputState {
  const QuestionInputState({
    this.questionPhase = QuestionPhase.idle,
    this.editingQuestion,
    this.proposedQuestion,
    this.userQuestionId,
  });

  final QuestionPhase questionPhase;
  final String? editingQuestion;
  final String? proposedQuestion;
  final String? userQuestionId;

  QuestionInputState copyWith({
    QuestionPhase? questionPhase,
    String? editingQuestion,
    String? proposedQuestion,
    String? userQuestionId,
  }) {
    return QuestionInputState(
      questionPhase: questionPhase ?? this.questionPhase,
      editingQuestion: editingQuestion ?? this.editingQuestion,
      proposedQuestion: proposedQuestion ?? this.proposedQuestion,
      userQuestionId: userQuestionId ?? this.userQuestionId,
    );
  }
}

/// 後方互換性のための既存State（段階的に移行）
class  EconaChatInputState {
  const EconaChatInputState({
    required this.textController,
    required this.focusNode,
    this.text,
    this.userQuestionId,
    this.questionPhase = QuestionPhase.idle,
    this.editingQuestion,
    this.proposedQuestion,
    this.photo,
    this.isFocused = false,
    this.showScrollToBottomButton = false,
    this.showQuestionSentBanner = false,
    this.isLoading = false,
    this.error,
  });

  final TextEditingController textController;
  final FocusNode focusNode;
  final String? text;
  final String? userQuestionId;
  final QuestionPhase questionPhase;
  final String? editingQuestion;
  final String? proposedQuestion;
  final XFile? photo;
  final bool isFocused;
  final bool showScrollToBottomButton;
  final bool showQuestionSentBanner;
  final bool isLoading;
  final EconaError? error;

  bool get canSend => (textController.text.trim().isNotEmpty || photo != null) && !isLoading;

  static const _unset = Object();

  EconaChatInputState copyWith({
    TextEditingController? textController,
    FocusNode? focusNode,
    String? text,
    String? userQuestionId,
    QuestionPhase? questionPhase,
    String? editingQuestion,
    String? proposedQuestion,
    Object? photo = _unset,
    bool? isFocused,
    bool? showScrollToBottomButton,
    bool? showQuestionSentBanner,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newPhoto = identical(photo, _unset)
        ? this.photo
        : photo as XFile?;

    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return EconaChatInputState(
      textController: textController ?? this.textController,
      focusNode: focusNode ?? this.focusNode,
      text: text ?? this.text,
      userQuestionId: userQuestionId ?? this.userQuestionId,
      questionPhase: questionPhase ?? this.questionPhase,
      editingQuestion: editingQuestion ?? this.editingQuestion,
      proposedQuestion: proposedQuestion ?? this.proposedQuestion,
      photo: newPhoto,
      isFocused: isFocused ?? this.isFocused,
      showScrollToBottomButton: showScrollToBottomButton ?? this.showScrollToBottomButton,
      showQuestionSentBanner: showQuestionSentBanner ?? this.showQuestionSentBanner,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}