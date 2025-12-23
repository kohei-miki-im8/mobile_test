import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/question.dart' as entity;
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart';

class QuestionPageState {
  const QuestionPageState({
    this.userStatus,
    this.selectedTabIndex = 0,
    this.answeredItems = const <entity.AnsweredQuestion>[],
    this.receivedItems = const <entity.ReceivedQuestion>[],
    this.editingQuestion,
    this.postedQuestion,
    this.favoriteUserIds = const <String>{},
    this.answeredCursorId,
    this.receivedCursorId,
    this.isLoading = false,
    this.isAnsweredLoading = false,
    this.isReceivedLoading = false,
    this.error,
  });

  final UserStatus? userStatus;
  final int selectedTabIndex;
  final List<entity.AnsweredQuestion> answeredItems;
  final List<entity.ReceivedQuestion> receivedItems;
  final EditingQuestion? editingQuestion;
  final PostedQuestion? postedQuestion;
  final Set<String> favoriteUserIds;
  final String? answeredCursorId;
  final String? receivedCursorId;
  final bool isLoading;
  final bool isAnsweredLoading;
  final bool isReceivedLoading;
  final EconaError? error;

  static const _unset = Object();

  QuestionPageState copyWith({
    UserStatus? userStatus,
    int? selectedTabIndex,
    List<entity.AnsweredQuestion>? answeredItems,
    List<entity.ReceivedQuestion>? receivedItems,
    Object? editingQuestion = _unset,
    Object? postedQuestion = _unset,
    Set<String>? favoriteUserIds,
    Object? answeredCursorId = _unset,
    Object? receivedCursorId = _unset,
    bool? isLoading,
    bool? isAnsweredLoading,
    bool? isReceivedLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;
    final newEditingQuestion = identical(editingQuestion, _unset)
        ? this.editingQuestion
        : editingQuestion as EditingQuestion?;
    final newPostedQuestion = identical(postedQuestion, _unset)
        ? this.postedQuestion
        : postedQuestion as PostedQuestion?;
    final newAnsweredCursorId = identical(answeredCursorId, _unset)
        ? this.answeredCursorId
        : answeredCursorId as String?;
    final newReceivedCursorId = identical(receivedCursorId, _unset)
        ? this.receivedCursorId
        : receivedCursorId as String?;


    return QuestionPageState(
      userStatus: userStatus ?? this.userStatus,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      answeredItems: answeredItems ?? this.answeredItems,
      receivedItems: receivedItems ?? this.receivedItems,
      editingQuestion: newEditingQuestion,
      postedQuestion: newPostedQuestion,
      favoriteUserIds: favoriteUserIds ?? this.favoriteUserIds,
      answeredCursorId: newAnsweredCursorId,
      receivedCursorId: newReceivedCursorId,
      isLoading: isLoading ?? this.isLoading,
      isAnsweredLoading: isAnsweredLoading ?? this.isAnsweredLoading,
      isReceivedLoading: isReceivedLoading ?? this.isReceivedLoading,
      error: newError,
    );
  }
}