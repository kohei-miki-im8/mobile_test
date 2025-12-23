import 'dart:async';
import 'dart:math' as math;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/question.dart' as entity;
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/moderation_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/approve_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/get_approved_questions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/subscribe_question_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/update_question_answer.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/favorite.dart';
import 'package:econa_mobile_app/infrastructures/repositories/question.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/home/question_page_state.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPageViewModel extends StateNotifier<QuestionPageState> {
  QuestionPageViewModel(this.ref) : super(const QuestionPageState());

  final Ref ref;

  final int _pageLimit = 5;

  // Streamセッション
  StreamSubscription<SubscribeQuestionSessionResponse>? _questionSession;

  // SWR再検証フラグ
  bool _isAnsweredRevalidating = false;
  bool _isReceivedRevalidating = false;
  bool _isRevalidating = false;

  // Stream再接続フラグ
  bool _authResubscribeAttempted = false;

  // Stream再接続の遅延予約タイマー
  Timer? _reconnectTimer;
  // 接続後にイベントが来ない場合のフォールバック用タイマー
  Timer? _postConnectTimer;
  // 再接続試行回数
  int _attempts = 0;

  @override
  void dispose() {
    _questionSession?.cancel();
    _cancelTimers();
    super.dispose();
  }

  /// タブの切り替え
  void updateSelectedTabIndex(int index) {
    state = state.copyWith(selectedTabIndex: index);
    if (index == 0) {
      if (state.answeredItems.isEmpty) {
        unawaited(fetchApprovedAnswered(cursorId: null));
      } else {
        unawaited(revalidateAnswered());
      }
    } else {
      if (state.receivedItems.isEmpty) {
        unawaited(fetchApprovedReceived(cursorId: null));
      } else {
        unawaited(revalidateReceived());
      }
    }
  }

  /// 質問の回答を取得
  Future<void> fetchApprovedAnswered({
    String? cursorId,
    bool isTransferOperation = false,
    bool isRevalidate = false,
  }) async {
    if (isRevalidate) {
      if (_isAnsweredRevalidating) return;
      _isAnsweredRevalidating = true;
    } else {
      if (state.isAnsweredLoading) return;
      state = state.copyWith(
        isAnsweredLoading: !isTransferOperation,
        error: null,
      );
    }

    try {
      final isInitialFetch = cursorId == null;
      final response = await ref.read(questionRepositoryProvider).getApprovedQuestions(
        GetApprovedQuestionsRequest(
          isFromMe: true,
          moderationStatusCode: ModerationStatusCode.MODERATION_STATUS_CODE_APPROVED,
          cursor: isInitialFetch
              ? PagerRequestCursor(limit: _pageLimit)
              : PagerRequestCursor(cursorId: cursorId, limit: _pageLimit),
        ),
      );

      final getUserResponse = await ref.read(userRepositoryProvider).getUserStatus(
        GetUserStatusRequest(),
      );

      // お気に入り一覧
      final favoriteUserIds = response.questions
          .where((q) => q.postedQuestion.thumbnailUser.isFavorite)
          .map((q) => q.postedQuestion.thumbnailUser.userId)
          .toSet();

      // 回答ありのみ → 表示用集約へ変換（お気に入り反映）
      final items = response.questions
          .where((q) => q.postedQuestion.hasAnswer() && q.postedQuestion.answer.isNotEmpty)
          .map((q) => entity.AnsweredQuestion.fromProtos(
        question: q,
      ),
      ).whereType<entity.AnsweredQuestion>()
          .toList();

      final nextCursor = response.cursor.hasNextCursorId()
          ? response.cursor.nextCursorId
          : null;
      final updatedItems = isInitialFetch
          ? items
          : <entity.AnsweredQuestion>[...state.answeredItems, ...items];
      final updatedFavoriteIds = isInitialFetch
          ? favoriteUserIds
          : (Set<String>.from(state.favoriteUserIds)..addAll(favoriteUserIds));

      state = state.copyWith(
        userStatus: getUserResponse.userStatus,
        answeredItems: updatedItems,
        favoriteUserIds: updatedFavoriteIds,
        answeredCursorId: nextCursor,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.approvedQuestionFetch,
      );

      if (!isRevalidate) {
        state = state.copyWith(
          error: econaError,
        );
      }
      if (isTransferOperation && !isRevalidate) {
        throw Exception(econaError);
      }
    } finally {
      if (isRevalidate) {
        _isAnsweredRevalidating = false;
      } else {
        state = state.copyWith(
          isAnsweredLoading: false,
        );
      }
    }
  }

  /// 届いた質問を取得
  Future<void> fetchApprovedReceived({
    String? cursorId,
    bool isTransferOperation = false,
    bool isRevalidate = false,
  }) async {
    if (isRevalidate) {
      if (_isReceivedRevalidating) return;
      _isReceivedRevalidating = true;
    } else {
      if (state.isReceivedLoading) return;
      state = state.copyWith(
        isReceivedLoading: !isTransferOperation,
        error: null,
      );
    }


    try {
      final isInitialFetch = cursorId == null;
      final response = await ref.read(questionRepositoryProvider).getApprovedQuestions(
        GetApprovedQuestionsRequest(
          isFromMe: false,
          moderationStatusCode: ModerationStatusCode.MODERATION_STATUS_CODE_APPROVED,
          cursor: isInitialFetch
              ? PagerRequestCursor(limit: _pageLimit)
              : PagerRequestCursor(cursorId: cursorId, limit: _pageLimit),
        ),
      );

      final getUserResponse = await ref.read(userRepositoryProvider).getUserStatus(
         GetUserStatusRequest(),
       );

      final items = response.questions
          .map((q) => entity.ReceivedQuestion.fromProtos(question: q))
          .whereType<entity.ReceivedQuestion>()
          .toList();

      final nextCursor = response.cursor.hasNextCursorId()
          ? response.cursor.nextCursorId
          : null;
      final updatedItems = isInitialFetch
          ? items
          : <entity.ReceivedQuestion>[...state.receivedItems, ...items];
      state = state.copyWith(
        userStatus: getUserResponse.userStatus,
        receivedItems: updatedItems,
        receivedCursorId: nextCursor,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.approvedQuestionFetch,
      );
      if (!isRevalidate) {
        state = state.copyWith(error: econaError);
      }
      if (isTransferOperation && !isRevalidate) {
        throw Exception(econaError);
      }
    } finally {
      if (isRevalidate) {
        _isReceivedRevalidating = false;
      } else {
        state = state.copyWith(
          isReceivedLoading: false,
        );
      }
    }
  }

  /// 回答された質問をSWRで取得
  Future<void> revalidateAnswered() async {
    if (state.answeredItems.isEmpty) {
      await fetchApprovedAnswered(cursorId: null);
      return;
    }

    await fetchApprovedAnswered(
      cursorId: null,
      isRevalidate: true,
    );
  }

  /// 届いた質問をSWRで取得
  Future<void> revalidateReceived() async {
    if (state.receivedItems.isEmpty) {
      await fetchApprovedReceived(cursorId: null);
      return;
    }

    await fetchApprovedReceived(
      cursorId: null,
      isRevalidate: true,
    );
  }

  /// 質問を承認
  Future<void> approveQuestion({
    required String userQuestionId,
    required String approvedQuestion,
  }) async {
    state = state.copyWith(error: null);

    try {
      await ref.read(questionRepositoryProvider).approveQuestion(
        ApproveQuestionRequest(
          userQuestionId: userQuestionId,
          approvedQuestion: approvedQuestion,
        ),
      );
      AdjustEventTracker.trackQuestionPost();
    } on Exception catch (e) {
      if (e.toString().contains('insufficient points')) {
        final econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.lackOfLp,
        );
        state = state.copyWith(error: econaError);
        return;
      }
      rethrow;
    }
  }

  /// お気に入り登録/解除
  Future<void> toggleFavorite({
    required String toUserId,
    required bool favorite,
  }) async {
    try {
      await ref.read(favoriteRepositoryProvider).updateUserFavorite(
        UpdateUserFavoriteRequest(toUserId: toUserId, favorite: favorite),
      );
      final updated = Set<String>.from(state.favoriteUserIds);
      if (favorite) {
        updated.add(toUserId);
      } else {
        updated.remove(toUserId);
      }
      state = state.copyWith(favoriteUserIds: updated);
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.favoriteUsersUpdate,
      );
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  /// 回答送信: UpdateQuestionAnswerRequest を実行し、該当行を回答表示に切り替える
  Future<void> submitAnswer({
    required String questionId,
    required String answer,
    required String publishedUserId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await ref.read(questionRepositoryProvider).updateQuestionAnswer(
        UpdateQuestionAnswerRequest(
          userQuestionId: questionId,
          rawUserAnswer: answer,
          publishedUserId: publishedUserId,
        ),
      );
      AdjustEventTracker.trackQuestionAnswer();

      // 受信一覧の該当アイテムを更新（回答テキスト反映）
      final updated = state.receivedItems.map((e) {
        if (e.question.questionId != questionId) return e;
        return e.copyWith(
          question: e.question.copyWith(answer: answer),
        );
      }).toList();

      state = state.copyWith(receivedItems: updated);
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.answerSend,
      );
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  /// Stream接続
  Future<void> subscribeQuestionSession({required String userQuestionId}) async {
    try {
      debugPrint('[QuestionSession] subscribeQuestionSession() called'
          ' userQuestionId=$userQuestionId');

      final request = SubscribeQuestionSessionRequest(userQuestionId: userQuestionId);

      final stream = ref.read(questionRepositoryProvider).subscribeQuestionSession(
        request,
      );
      await _questionSession?.cancel();
      _cancelTimers();
      _questionSession = stream.listen(
            (response) async {
          debugPrint(
            '[QuestionSession] event: which=${response.whichResponse()} '
                'isSuccessful=${response.hasIsSuccessful() ? response.isSuccessful : null}',
          );
          if (response.hasIsSuccessful() && !response.isSuccessful) {
            return;
          }

          switch (response.whichResponse()) {
            case SubscribeQuestionSessionResponse_Response.editingQuestion:
              final editingQuestion = response.editingQuestion;
              state = state.copyWith(editingQuestion: editingQuestion);

              await Future.microtask(() {
                ref.read(econaChatInputViewModelProvider.notifier)
                  ..setQuestion(editingQuestion)
                  ..requestFocus();
              });
              return;
            case SubscribeQuestionSessionResponse_Response.postedQuestion:
              final postedQuestion = response.postedQuestion;
              state = state.copyWith(postedQuestion: postedQuestion);

              final chatInputState = ref.read(econaChatInputViewModelProvider);
              final userQuestionIdFromState = chatInputState.userQuestionId;
              final approvedQuestion = postedQuestion.moderatedQuestion;

              if (userQuestionIdFromState != null &&
                  userQuestionIdFromState.isNotEmpty &&
                  approvedQuestion.isNotEmpty) {
                unawaited(
                  Future.microtask(
                        () => ref
                        .read(econaChatInputViewModelProvider.notifier)
                        .approveQuestion(
                          userQuestionId: userQuestionIdFromState,
                          approvedQuestion: approvedQuestion,
                        ),
                  ),
                );
              }

              await revalidateReceived();
              return;
            case SubscribeQuestionSessionResponse_Response.notSet:
              return;
            case SubscribeQuestionSessionResponse_Response.editingAnswer:
            case SubscribeQuestionSessionResponse_Response.postedAnswer:
              return;
          }
        },
        onDone: () async {
          if (await _isOnline()) {
            _scheduleReconnect(userQuestionId: userQuestionId);
          } else {
            debugPrint('QuestionPageViewModel: Stream disconnected - offline');
            _attempts = 0;
          }
        },
        onError: (Object e, StackTrace st) async {
          if (_isAuthError(e) && !_authResubscribeAttempted) {
            _authResubscribeAttempted = true;
            unawaited(() async {
              await _authRefreshForce();
              await subscribeQuestionSession(userQuestionId: userQuestionId);
              await _revalidate();
              _authResubscribeAttempted = false;
            }());
            return;
          }

          if (_isNetworkUnreachable(e) || !(await _isOnline())) {
            debugPrint('QuestionPageViewModel: Stream disconnected - offline');
            _attempts = 0;
            return;
          }

          _scheduleReconnect(userQuestionId: userQuestionId);
        },
        cancelOnError: false,
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  /// バックグラウンドからの復帰等のStream再接続
  void reconnectOnResume({required String userQuestionId}) {
    // 簡素化段階ではそのまま再購読のみ
    subscribeQuestionSession(userQuestionId: userQuestionId);
  }

  /// 認証失効検知
  bool _isAuthError(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('401') || msg.contains('unauth');
  }

  /// 認証トークンを強制リフレッシュ（401時の再購読前）
  Future<void> _authRefreshForce() async {
    try {
      await ref.read(authRepositoryProvider).refreshToken();
    } on Exception catch (_) {
      // エラーを出さないため失敗は握りつぶす
    }
  }

  /// Streamエラー時の再検証
  Future<void> _revalidate() async {
    if (_isRevalidating) return;
    _isRevalidating = true;
    try {
      final previousState = state;

      final ansResponse = await ref.read(questionRepositoryProvider).getApprovedQuestions(
        GetApprovedQuestionsRequest(
          isFromMe: true,
          moderationStatusCode: ModerationStatusCode.MODERATION_STATUS_CODE_APPROVED,
          cursor: PagerRequestCursor(limit: _pageLimit),
        ),
      );

      final oldAnsweredQuestions = state.answeredItems;
      final newAnsweredQuestions = ansResponse.questions
          .map((q) => entity.AnsweredQuestion.fromProtos(question: q))
          .whereType<entity.AnsweredQuestion>()
          .toList();

      final oldAnsCursorId = previousState.answeredCursorId;
      final newAnsCursorId = ansResponse.cursor.hasNextCursorId()
          ? ansResponse.cursor.nextCursorId
          : null;

      final recResponse = await ref.read(questionRepositoryProvider).getApprovedQuestions(
        GetApprovedQuestionsRequest(
          isFromMe: false,
          moderationStatusCode: ModerationStatusCode.MODERATION_STATUS_CODE_APPROVED,
          cursor: PagerRequestCursor(limit: _pageLimit),
        ),
      );

      final oldReceivedQuestions = previousState.receivedItems;
      final newReceivedQuestions = recResponse.questions
          .map((q) => entity.ReceivedQuestion.fromProtos(question: q))
          .whereType<entity.ReceivedQuestion>()
          .toList();

      final oldRecCursorId = previousState.receivedCursorId;
      final newRecCursorId = recResponse.cursor.hasNextCursorId()
          ? recResponse.cursor.nextCursorId
          : null;

      if (listEquals(oldAnsweredQuestions, newAnsweredQuestions)
          && oldAnsCursorId == newAnsCursorId
          && listEquals(oldReceivedQuestions, newReceivedQuestions)
          && oldRecCursorId == newRecCursorId
      ) {
        return;
      }

      state = state.copyWith(
        answeredItems: newAnsweredQuestions,
        answeredCursorId: newAnsCursorId,
        receivedItems: newReceivedQuestions,
        receivedCursorId: newRecCursorId,
      );
    } on Exception catch(_) {
      // バックグラウンド更新は握りつぶす
    } finally {
      _isRevalidating = false;
    }
  }

  /// 端末がネットワークに接続されているかどうかの判断
  Future<bool> _isOnline() async {
    try {
      final List<ConnectivityResult> results = await Connectivity().checkConnectivity();
      return results.any((r) => r != ConnectivityResult.none);
    } catch (_) {
      return true;
    }
  }

  /// エラーや切断時の再接続を指数バックオフ+ジッターの遅延でタイマー予約
  void _scheduleReconnect({required String userQuestionId}) {
    const maxAttempts = 10;
    const baseDelay = Duration(seconds: 1);
    _reconnectTimer?.cancel();
    if (_attempts >= maxAttempts) {
      return; // 何もしない（通知は呼び出し元ポリシーに委ねる）
    }
    final backoffSeconds =
        baseDelay.inSeconds * math.pow(2, _attempts).toInt();
    final delayMs = math.min(backoffSeconds, 30) * 1000;
    final jitter = math.Random().nextInt(300);
    _reconnectTimer = Timer(Duration(milliseconds: delayMs + jitter), () {
      _attempts++;
      unawaited(subscribeQuestionSession(userQuestionId: userQuestionId));
    });
  }

  /// タイマーを破棄
  void _cancelTimers() {
    _reconnectTimer?.cancel();
    _reconnectTimer = null;
    _postConnectTimer?.cancel();
    _postConnectTimer = null;
  }

  ///　エラーがネットワークによるものかどうかの判断
  bool _isNetworkUnreachable(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('failed host lookup') || msg.contains('socketexception');
  }
}


final questionPageViewModelProvider =
StateNotifierProvider<QuestionPageViewModel, QuestionPageState>(
  QuestionPageViewModel.new,
);