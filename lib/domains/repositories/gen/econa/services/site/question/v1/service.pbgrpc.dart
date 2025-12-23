//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'approve_answer.pb.dart' as $69;
import 'approve_question.pb.dart' as $65;
import 'create_question.pb.dart' as $64;
import 'delete_question.pb.dart' as $70;
import 'delete_question_answer.pb.dart' as $71;
import 'get_approved_questions.pb.dart' as $66;
import 'subscribe_question_session.pb.dart' as $67;
import 'update_question_answer.pb.dart' as $68;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.question.v1.QuestionService')
class QuestionServiceClient extends $grpc.Client {
  static final _$createQuestion = $grpc.ClientMethod<$64.CreateQuestionRequest, $64.CreateQuestionResponse>(
      '/econa.services.site.question.v1.QuestionService/CreateQuestion',
      ($64.CreateQuestionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $64.CreateQuestionResponse.fromBuffer(value));
  static final _$approveQuestion = $grpc.ClientMethod<$65.ApproveQuestionRequest, $65.ApproveQuestionResponse>(
      '/econa.services.site.question.v1.QuestionService/ApproveQuestion',
      ($65.ApproveQuestionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $65.ApproveQuestionResponse.fromBuffer(value));
  static final _$getApprovedQuestions = $grpc.ClientMethod<$66.GetApprovedQuestionsRequest, $66.GetApprovedQuestionsResponse>(
      '/econa.services.site.question.v1.QuestionService/GetApprovedQuestions',
      ($66.GetApprovedQuestionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $66.GetApprovedQuestionsResponse.fromBuffer(value));
  static final _$subscribeQuestionSession = $grpc.ClientMethod<$67.SubscribeQuestionSessionRequest, $67.SubscribeQuestionSessionResponse>(
      '/econa.services.site.question.v1.QuestionService/SubscribeQuestionSession',
      ($67.SubscribeQuestionSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $67.SubscribeQuestionSessionResponse.fromBuffer(value));
  static final _$updateQuestionAnswer = $grpc.ClientMethod<$68.UpdateQuestionAnswerRequest, $68.UpdateQuestionAnswerResponse>(
      '/econa.services.site.question.v1.QuestionService/UpdateQuestionAnswer',
      ($68.UpdateQuestionAnswerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $68.UpdateQuestionAnswerResponse.fromBuffer(value));
  static final _$approveAnswer = $grpc.ClientMethod<$69.ApproveAnswerRequest, $69.ApproveAnswerResponse>(
      '/econa.services.site.question.v1.QuestionService/ApproveAnswer',
      ($69.ApproveAnswerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $69.ApproveAnswerResponse.fromBuffer(value));
  static final _$deleteQuestion = $grpc.ClientMethod<$70.DeleteQuestionRequest, $70.DeleteQuestionResponse>(
      '/econa.services.site.question.v1.QuestionService/DeleteQuestion',
      ($70.DeleteQuestionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $70.DeleteQuestionResponse.fromBuffer(value));
  static final _$deleteQuestionAnswer = $grpc.ClientMethod<$71.DeleteQuestionAnswerRequest, $71.DeleteQuestionAnswerResponse>(
      '/econa.services.site.question.v1.QuestionService/DeleteQuestionAnswer',
      ($71.DeleteQuestionAnswerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $71.DeleteQuestionAnswerResponse.fromBuffer(value));

  QuestionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$64.CreateQuestionResponse> createQuestion($64.CreateQuestionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createQuestion, request, options: options);
  }

  $grpc.ResponseFuture<$65.ApproveQuestionResponse> approveQuestion($65.ApproveQuestionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveQuestion, request, options: options);
  }

  $grpc.ResponseFuture<$66.GetApprovedQuestionsResponse> getApprovedQuestions($66.GetApprovedQuestionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getApprovedQuestions, request, options: options);
  }

  $grpc.ResponseStream<$67.SubscribeQuestionSessionResponse> subscribeQuestionSession($67.SubscribeQuestionSessionRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeQuestionSession, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$68.UpdateQuestionAnswerResponse> updateQuestionAnswer($68.UpdateQuestionAnswerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateQuestionAnswer, request, options: options);
  }

  $grpc.ResponseFuture<$69.ApproveAnswerResponse> approveAnswer($69.ApproveAnswerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$approveAnswer, request, options: options);
  }

  $grpc.ResponseFuture<$70.DeleteQuestionResponse> deleteQuestion($70.DeleteQuestionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteQuestion, request, options: options);
  }

  $grpc.ResponseFuture<$71.DeleteQuestionAnswerResponse> deleteQuestionAnswer($71.DeleteQuestionAnswerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteQuestionAnswer, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.question.v1.QuestionService')
abstract class QuestionServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.question.v1.QuestionService';

  QuestionServiceBase() {
    $addMethod($grpc.ServiceMethod<$64.CreateQuestionRequest, $64.CreateQuestionResponse>(
        'CreateQuestion',
        createQuestion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $64.CreateQuestionRequest.fromBuffer(value),
        ($64.CreateQuestionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$65.ApproveQuestionRequest, $65.ApproveQuestionResponse>(
        'ApproveQuestion',
        approveQuestion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $65.ApproveQuestionRequest.fromBuffer(value),
        ($65.ApproveQuestionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$66.GetApprovedQuestionsRequest, $66.GetApprovedQuestionsResponse>(
        'GetApprovedQuestions',
        getApprovedQuestions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $66.GetApprovedQuestionsRequest.fromBuffer(value),
        ($66.GetApprovedQuestionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$67.SubscribeQuestionSessionRequest, $67.SubscribeQuestionSessionResponse>(
        'SubscribeQuestionSession',
        subscribeQuestionSession_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $67.SubscribeQuestionSessionRequest.fromBuffer(value),
        ($67.SubscribeQuestionSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$68.UpdateQuestionAnswerRequest, $68.UpdateQuestionAnswerResponse>(
        'UpdateQuestionAnswer',
        updateQuestionAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $68.UpdateQuestionAnswerRequest.fromBuffer(value),
        ($68.UpdateQuestionAnswerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$69.ApproveAnswerRequest, $69.ApproveAnswerResponse>(
        'ApproveAnswer',
        approveAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $69.ApproveAnswerRequest.fromBuffer(value),
        ($69.ApproveAnswerResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$70.DeleteQuestionRequest, $70.DeleteQuestionResponse>(
        'DeleteQuestion',
        deleteQuestion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $70.DeleteQuestionRequest.fromBuffer(value),
        ($70.DeleteQuestionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$71.DeleteQuestionAnswerRequest, $71.DeleteQuestionAnswerResponse>(
        'DeleteQuestionAnswer',
        deleteQuestionAnswer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $71.DeleteQuestionAnswerRequest.fromBuffer(value),
        ($71.DeleteQuestionAnswerResponse value) => value.writeToBuffer()));
  }

  $async.Future<$64.CreateQuestionResponse> createQuestion_Pre($grpc.ServiceCall call, $async.Future<$64.CreateQuestionRequest> request) async {
    return createQuestion(call, await request);
  }

  $async.Future<$65.ApproveQuestionResponse> approveQuestion_Pre($grpc.ServiceCall call, $async.Future<$65.ApproveQuestionRequest> request) async {
    return approveQuestion(call, await request);
  }

  $async.Future<$66.GetApprovedQuestionsResponse> getApprovedQuestions_Pre($grpc.ServiceCall call, $async.Future<$66.GetApprovedQuestionsRequest> request) async {
    return getApprovedQuestions(call, await request);
  }

  $async.Stream<$67.SubscribeQuestionSessionResponse> subscribeQuestionSession_Pre($grpc.ServiceCall call, $async.Future<$67.SubscribeQuestionSessionRequest> request) async* {
    yield* subscribeQuestionSession(call, await request);
  }

  $async.Future<$68.UpdateQuestionAnswerResponse> updateQuestionAnswer_Pre($grpc.ServiceCall call, $async.Future<$68.UpdateQuestionAnswerRequest> request) async {
    return updateQuestionAnswer(call, await request);
  }

  $async.Future<$69.ApproveAnswerResponse> approveAnswer_Pre($grpc.ServiceCall call, $async.Future<$69.ApproveAnswerRequest> request) async {
    return approveAnswer(call, await request);
  }

  $async.Future<$70.DeleteQuestionResponse> deleteQuestion_Pre($grpc.ServiceCall call, $async.Future<$70.DeleteQuestionRequest> request) async {
    return deleteQuestion(call, await request);
  }

  $async.Future<$71.DeleteQuestionAnswerResponse> deleteQuestionAnswer_Pre($grpc.ServiceCall call, $async.Future<$71.DeleteQuestionAnswerRequest> request) async {
    return deleteQuestionAnswer(call, await request);
  }

  $async.Future<$64.CreateQuestionResponse> createQuestion($grpc.ServiceCall call, $64.CreateQuestionRequest request);
  $async.Future<$65.ApproveQuestionResponse> approveQuestion($grpc.ServiceCall call, $65.ApproveQuestionRequest request);
  $async.Future<$66.GetApprovedQuestionsResponse> getApprovedQuestions($grpc.ServiceCall call, $66.GetApprovedQuestionsRequest request);
  $async.Stream<$67.SubscribeQuestionSessionResponse> subscribeQuestionSession($grpc.ServiceCall call, $67.SubscribeQuestionSessionRequest request);
  $async.Future<$68.UpdateQuestionAnswerResponse> updateQuestionAnswer($grpc.ServiceCall call, $68.UpdateQuestionAnswerRequest request);
  $async.Future<$69.ApproveAnswerResponse> approveAnswer($grpc.ServiceCall call, $69.ApproveAnswerRequest request);
  $async.Future<$70.DeleteQuestionResponse> deleteQuestion($grpc.ServiceCall call, $70.DeleteQuestionRequest request);
  $async.Future<$71.DeleteQuestionAnswerResponse> deleteQuestionAnswer($grpc.ServiceCall call, $71.DeleteQuestionAnswerRequest request);
}
