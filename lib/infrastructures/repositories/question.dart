import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/approve_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/create_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/delete_question.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/delete_question_answer.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/get_approved_questions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/subscribe_question_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/question/v1/update_question_answer.pb.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question.g.dart';

/// QuestionRepositoryのインスタンスを提供する
class QuestionRepository {
  QuestionRepository(this._apiClient) {
    _questionClient = _apiClient.createClient(QuestionServiceClient.new);
  }

  final ApiClient _apiClient;
  late final QuestionServiceClient _questionClient;

  /// しつもん承認
  Future<ApproveQuestionResponse> approveQuestion(ApproveQuestionRequest request) async {
    try {
      final result = await _apiClient.call<ApproveQuestionResponse>(
        client: _questionClient,
        method: ApiMethodUnary.approveQuestion,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed approve Question: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed approve Question: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed approve Question: $e');
    }
  }

  /// しつもん作成
  Future<CreateQuestionResponse> createQuestion(CreateQuestionRequest request) async {
    try {
      final result = await _apiClient.call<CreateQuestionResponse>(
        client: _questionClient,
        method: ApiMethodUnary.createQuestion,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed create Question: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create Question: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create Question: $e');
    }
  }

  /// しつもんに対する回答を削除
  Future<DeleteQuestionAnswerResponse> deleteQuestionAnswer(DeleteQuestionAnswerRequest request) async {
    try {
      final result = await _apiClient.call<DeleteQuestionAnswerResponse>(
        client: _questionClient,
        method: ApiMethodUnary.deleteQuestionAnswer,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed delete QuestionAnswer: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed delete QuestionAnswer: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed delete QuestionAnswer: $e');
    }
  }

  /// しつもんを削除
  Future<DeleteQuestionResponse> deleteQuestion(DeleteQuestionRequest request) async {
    try {
      final result = await _apiClient.call<DeleteQuestionResponse>(
        client: _questionClient,
        method: ApiMethodUnary.deleteQuestion,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed delete Question: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed delete Question: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed delete Question: $e');
    }
  }

  /// 認証済みしつもん群を取得
  Future<GetApprovedQuestionsResponse> getApprovedQuestions(
      GetApprovedQuestionsRequest request,
      ) async {
    try {
      final result = await _apiClient.call<GetApprovedQuestionsResponse>(
        client: _questionClient,
        method: ApiMethodUnary.getApprovedQuestions,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed get ApprovedQuestions: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get ApprovedQuestions: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get ApprovedQuestions: $e');
    }
  }

  /// しつもんセッション購読（サーバーストリーミング）
  Stream<SubscribeQuestionSessionResponse> subscribeQuestionSession(
      SubscribeQuestionSessionRequest request,
  ) {
    try {
      final apiResultStream = _apiClient.callStream<SubscribeQuestionSessionResponse>(
        client: _questionClient,
        method: ApiMethodStream.subscribeQuestionSession,
        request: request,
      );
      return apiResultStream.map((result) {
        if (result.isSuccess) {
          return result.data ??
              (throw Exception('failed subscribe QuestionSession: response data is null'));
        } else {
          final errorText = result.error ?? '';
          throw Exception('failed subscribe QuestionSession: $errorText');
        }
      });
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed subscribe QuestionSession: $e');
    }
  }

  /// 質問に対する回答を更新
  Future<UpdateQuestionAnswerResponse> updateQuestionAnswer(
      UpdateQuestionAnswerRequest request,
      ) async {
    try {
      final result = await _apiClient.call<UpdateQuestionAnswerResponse>(
        client: _questionClient,
        method: ApiMethodUnary.updateQuestionAnswer,
        request: request,
      );
      if(result.error != null) {
        throw Exception('failed update QuestionAnswer: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update QuestionAnswer: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update QuestionAnswer: $e');
    }
  }
}

/// QuestionRepository
@riverpod
QuestionRepository questionRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return QuestionRepository(apiClient);
}
