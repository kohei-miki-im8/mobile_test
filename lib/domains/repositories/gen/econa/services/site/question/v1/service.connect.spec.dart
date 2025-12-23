//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_question.pb.dart" as econaservicessitequestionv1create_question;
import "approve_question.pb.dart" as econaservicessitequestionv1approve_question;
import "get_approved_questions.pb.dart" as econaservicessitequestionv1get_approved_questions;
import "subscribe_question_session.pb.dart" as econaservicessitequestionv1subscribe_question_session;
import "update_question_answer.pb.dart" as econaservicessitequestionv1update_question_answer;
import "approve_answer.pb.dart" as econaservicessitequestionv1approve_answer;
import "delete_question.pb.dart" as econaservicessitequestionv1delete_question;
import "delete_question_answer.pb.dart" as econaservicessitequestionv1delete_question_answer;

/// 「しつもん」機能を提供するサービス
abstract final class QuestionService {
  /// Fully-qualified name of the QuestionService service.
  static const name = 'econa.services.site.question.v1.QuestionService';

  /// CreateQuestion: 質問を作成（冪等化対応：user_question_id指定で既存質問を更新可能）
  static const createQuestion = connect.Spec(
    '/$name/CreateQuestion',
    connect.StreamType.unary,
    econaservicessitequestionv1create_question.CreateQuestionRequest.new,
    econaservicessitequestionv1create_question.CreateQuestionResponse.new,
  );

  /// ApproveQuestion: 質問を承認
  static const approveQuestion = connect.Spec(
    '/$name/ApproveQuestion',
    connect.StreamType.unary,
    econaservicessitequestionv1approve_question.ApproveQuestionRequest.new,
    econaservicessitequestionv1approve_question.ApproveQuestionResponse.new,
  );

  /// GetApprovedQuestions: 承認済み質問を取得（自分が受信した質問、または自分が送信した質問）
  static const getApprovedQuestions = connect.Spec(
    '/$name/GetApprovedQuestions',
    connect.StreamType.unary,
    econaservicessitequestionv1get_approved_questions.GetApprovedQuestionsRequest.new,
    econaservicessitequestionv1get_approved_questions.GetApprovedQuestionsResponse.new,
  );

  /// SubscribeQuestionSession: 質問セッションを購読
  static const subscribeQuestionSession = connect.Spec(
    '/$name/SubscribeQuestionSession',
    connect.StreamType.server,
    econaservicessitequestionv1subscribe_question_session.SubscribeQuestionSessionRequest.new,
    econaservicessitequestionv1subscribe_question_session.SubscribeQuestionSessionResponse.new,
  );

  /// UpdateQuestionAnswer: 質問に対する回答を更新
  static const updateQuestionAnswer = connect.Spec(
    '/$name/UpdateQuestionAnswer',
    connect.StreamType.unary,
    econaservicessitequestionv1update_question_answer.UpdateQuestionAnswerRequest.new,
    econaservicessitequestionv1update_question_answer.UpdateQuestionAnswerResponse.new,
  );

  /// ApproveAnswer: 回答を承認 (EDEV-892)
  static const approveAnswer = connect.Spec(
    '/$name/ApproveAnswer',
    connect.StreamType.unary,
    econaservicessitequestionv1approve_answer.ApproveAnswerRequest.new,
    econaservicessitequestionv1approve_answer.ApproveAnswerResponse.new,
  );

  /// DeleteQuestion: 質問を削除
  static const deleteQuestion = connect.Spec(
    '/$name/DeleteQuestion',
    connect.StreamType.unary,
    econaservicessitequestionv1delete_question.DeleteQuestionRequest.new,
    econaservicessitequestionv1delete_question.DeleteQuestionResponse.new,
  );

  /// DeleteQuestionAnswer: 質問に対する回答を削除
  static const deleteQuestionAnswer = connect.Spec(
    '/$name/DeleteQuestionAnswer',
    connect.StreamType.unary,
    econaservicessitequestionv1delete_question_answer.DeleteQuestionAnswerRequest.new,
    econaservicessitequestionv1delete_question_answer.DeleteQuestionAnswerResponse.new,
  );
}
