//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/service.proto
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

import 'create_user_inquiry.pb.dart' as $39;
import 'get_violation_categories.pb.dart' as $40;
import 'respond_to_disciplinary_action.pb.dart' as $41;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.inquiry.v1.InquiryService')
class InquiryServiceClient extends $grpc.Client {
  static final _$createUserInquiry = $grpc.ClientMethod<$39.CreateUserInquiryRequest, $39.CreateUserInquiryResponse>(
      '/econa.services.site.inquiry.v1.InquiryService/CreateUserInquiry',
      ($39.CreateUserInquiryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $39.CreateUserInquiryResponse.fromBuffer(value));
  static final _$getViolationCategories = $grpc.ClientMethod<$40.GetViolationCategoriesRequest, $40.GetViolationCategoriesResponse>(
      '/econa.services.site.inquiry.v1.InquiryService/GetViolationCategories',
      ($40.GetViolationCategoriesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $40.GetViolationCategoriesResponse.fromBuffer(value));
  static final _$respondToDisciplinaryAction = $grpc.ClientMethod<$41.RespondToDisciplinaryActionRequest, $41.RespondToDisciplinaryActionResponse>(
      '/econa.services.site.inquiry.v1.InquiryService/RespondToDisciplinaryAction',
      ($41.RespondToDisciplinaryActionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $41.RespondToDisciplinaryActionResponse.fromBuffer(value));

  InquiryServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$39.CreateUserInquiryResponse> createUserInquiry($39.CreateUserInquiryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUserInquiry, request, options: options);
  }

  $grpc.ResponseFuture<$40.GetViolationCategoriesResponse> getViolationCategories($40.GetViolationCategoriesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getViolationCategories, request, options: options);
  }

  $grpc.ResponseFuture<$41.RespondToDisciplinaryActionResponse> respondToDisciplinaryAction($41.RespondToDisciplinaryActionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$respondToDisciplinaryAction, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.inquiry.v1.InquiryService')
abstract class InquiryServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.inquiry.v1.InquiryService';

  InquiryServiceBase() {
    $addMethod($grpc.ServiceMethod<$39.CreateUserInquiryRequest, $39.CreateUserInquiryResponse>(
        'CreateUserInquiry',
        createUserInquiry_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $39.CreateUserInquiryRequest.fromBuffer(value),
        ($39.CreateUserInquiryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$40.GetViolationCategoriesRequest, $40.GetViolationCategoriesResponse>(
        'GetViolationCategories',
        getViolationCategories_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $40.GetViolationCategoriesRequest.fromBuffer(value),
        ($40.GetViolationCategoriesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$41.RespondToDisciplinaryActionRequest, $41.RespondToDisciplinaryActionResponse>(
        'RespondToDisciplinaryAction',
        respondToDisciplinaryAction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $41.RespondToDisciplinaryActionRequest.fromBuffer(value),
        ($41.RespondToDisciplinaryActionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$39.CreateUserInquiryResponse> createUserInquiry_Pre($grpc.ServiceCall call, $async.Future<$39.CreateUserInquiryRequest> request) async {
    return createUserInquiry(call, await request);
  }

  $async.Future<$40.GetViolationCategoriesResponse> getViolationCategories_Pre($grpc.ServiceCall call, $async.Future<$40.GetViolationCategoriesRequest> request) async {
    return getViolationCategories(call, await request);
  }

  $async.Future<$41.RespondToDisciplinaryActionResponse> respondToDisciplinaryAction_Pre($grpc.ServiceCall call, $async.Future<$41.RespondToDisciplinaryActionRequest> request) async {
    return respondToDisciplinaryAction(call, await request);
  }

  $async.Future<$39.CreateUserInquiryResponse> createUserInquiry($grpc.ServiceCall call, $39.CreateUserInquiryRequest request);
  $async.Future<$40.GetViolationCategoriesResponse> getViolationCategories($grpc.ServiceCall call, $40.GetViolationCategoriesRequest request);
  $async.Future<$41.RespondToDisciplinaryActionResponse> respondToDisciplinaryAction($grpc.ServiceCall call, $41.RespondToDisciplinaryActionRequest request);
}
