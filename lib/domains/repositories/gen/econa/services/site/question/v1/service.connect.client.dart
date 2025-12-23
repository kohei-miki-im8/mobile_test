//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_question.pb.dart" as econaservicessitequestionv1create_question;
import "service.connect.spec.dart" as specs;
import "approve_question.pb.dart" as econaservicessitequestionv1approve_question;
import "get_approved_questions.pb.dart" as econaservicessitequestionv1get_approved_questions;
import "subscribe_question_session.pb.dart" as econaservicessitequestionv1subscribe_question_session;
import "update_question_answer.pb.dart" as econaservicessitequestionv1update_question_answer;
import "approve_answer.pb.dart" as econaservicessitequestionv1approve_answer;
import "delete_question.pb.dart" as econaservicessitequestionv1delete_question;
import "delete_question_answer.pb.dart" as econaservicessitequestionv1delete_question_answer;

/// 「しつもん」機能を提供するサービス
extension type QuestionServiceClient (connect.Transport _transport) {
  /// CreateQuestion: 質問を作成（冪等化対応：user_question_id指定で既存質問を更新可能）
  Future<econaservicessitequestionv1create_question.CreateQuestionResponse> createQuestion(
    econaservicessitequestionv1create_question.CreateQuestionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.QuestionService.createQuestion,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// ApproveQuestion: 質問を承認
  Future<econaservicessitequestionv1approve_question.ApproveQuestionResponse> approveQuestion(
    econaservicessitequestionv1approve_question.ApproveQuestionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.QuestionService.approveQuestion,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetApprovedQuestions: 承認済み質問を取得（自分が受信した質問、または自分が送信した質問）
  Future<econaservicessitequestionv1get_approved_questions.GetApprovedQuestionsResponse> getApprovedQuestions(
    econaservicessitequestionv1get_approved_questions.GetApprovedQuestionsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.QuestionService.getApprovedQuestions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// SubscribeQuestionSession: 質問セッションを購読
  Stream<econaservicessitequestionv1subscribe_question_session.SubscribeQuestionSessionResponse> subscribeQuestionSession(
    econaservicessitequestionv1subscribe_question_session.SubscribeQuestionSessionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.QuestionService.subscribeQuestionSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateQuestionAnswer: 質問に対する回答を更新
  Future<econaservicessitequestionv1update_question_answer.UpdateQuestionAnswerResponse> updateQuestionAnswer(
    econaservicessitequestionv1update_question_answer.UpdateQuestionAnswerRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.QuestionService.updateQuestionAnswer,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// ApproveAnswer: 回答を承認 (EDEV-892)
  Future<econaservicessitequestionv1approve_answer.ApproveAnswerResponse> approveAnswer(
    econaservicessitequestionv1approve_answer.ApproveAnswerRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.QuestionService.approveAnswer,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// DeleteQuestion: 質問を削除
  Future<econaservicessitequestionv1delete_question.DeleteQuestionResponse> deleteQuestion(
    econaservicessitequestionv1delete_question.DeleteQuestionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.QuestionService.deleteQuestion,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// DeleteQuestionAnswer: 質問に対する回答を削除
  Future<econaservicessitequestionv1delete_question_answer.DeleteQuestionAnswerResponse> deleteQuestionAnswer(
    econaservicessitequestionv1delete_question_answer.DeleteQuestionAnswerRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.QuestionService.deleteQuestionAnswer,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
