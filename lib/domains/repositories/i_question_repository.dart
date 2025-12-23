import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/approve_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/create_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/delete_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/delete_question_answer.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/get_approved_questions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/subscribe_question_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/update_question_answer.pb.dart';

/// 質問関連のRepository Interface
abstract class IQuestionRepository  {
  /// しつもん承認
  Future<ApproveQuestionResponse> approveQuestion(ApproveQuestionRequest request);

  /// しつもん作成
  Future<CreateQuestionResponse> createQuestion(CreateQuestionRequest request);

  /// しつもんに対する回答を削除
  Future<DeleteQuestionAnswerResponse> deleteQuestionAnswer(DeleteQuestionAnswerRequest request);

  /// しつもんを削除
  Future<DeleteQuestionResponse> deleteQuestion(DeleteQuestionRequest request);

  /// 認証済みしつもん群を取得
  Future<GetApprovedQuestionsResponse> getApprovedQuestion(GetApprovedQuestionsRequest request);

  /// しつもんセッション購読
  Future<SubscribeQuestionSessionResponse> subscribeQuestionSession(SubscribeQuestionSessionRequest request);

  /// 質問に対する回答を更新
  Future<UpdateQuestionAnswerResponse> updateQuestionAnswer(UpdateQuestionAnswerRequest request);

}