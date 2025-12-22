//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/service.proto
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

import 'create_affinity_recommendation.pb.dart' as $74;
import 'get_affinity_recommendation_users.pb.dart' as $76;
import 'get_latest_user_search_conditions.pb.dart' as $78;
import 'get_recommendation_users.pb.dart' as $77;
import 'get_search_users.pb.dart' as $79;
import 'subscribe_search_session.pb.dart' as $75;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.search.v1.SearchService')
class SearchServiceClient extends $grpc.Client {
  static final _$createAffinityRecommendation = $grpc.ClientMethod<$74.CreateAffinityRecommendationRequest, $74.CreateAffinityRecommendationResponse>(
      '/econa.services.site.search.v1.SearchService/CreateAffinityRecommendation',
      ($74.CreateAffinityRecommendationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $74.CreateAffinityRecommendationResponse.fromBuffer(value));
  static final _$subscribeSearchSession = $grpc.ClientMethod<$75.SubscribeSearchSessionRequest, $75.SubscribeSearchSessionResponse>(
      '/econa.services.site.search.v1.SearchService/SubscribeSearchSession',
      ($75.SubscribeSearchSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $75.SubscribeSearchSessionResponse.fromBuffer(value));
  static final _$getAffinityRecommendationUsers = $grpc.ClientMethod<$76.GetAffinityRecommendationUsersRequest, $76.GetAffinityRecommendationUsersResponse>(
      '/econa.services.site.search.v1.SearchService/GetAffinityRecommendationUsers',
      ($76.GetAffinityRecommendationUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $76.GetAffinityRecommendationUsersResponse.fromBuffer(value));
  static final _$getRecommendationUsers = $grpc.ClientMethod<$77.GetRecommendationUsersRequest, $77.GetRecommendationUsersResponse>(
      '/econa.services.site.search.v1.SearchService/GetRecommendationUsers',
      ($77.GetRecommendationUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $77.GetRecommendationUsersResponse.fromBuffer(value));
  static final _$getLatestUserSearchConditions = $grpc.ClientMethod<$78.GetLatestUserSearchConditionsRequest, $78.GetLatestUserSearchConditionsResponse>(
      '/econa.services.site.search.v1.SearchService/GetLatestUserSearchConditions',
      ($78.GetLatestUserSearchConditionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $78.GetLatestUserSearchConditionsResponse.fromBuffer(value));
  static final _$getSearchUsers = $grpc.ClientMethod<$79.GetSearchUsersRequest, $79.GetSearchUsersResponse>(
      '/econa.services.site.search.v1.SearchService/GetSearchUsers',
      ($79.GetSearchUsersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $79.GetSearchUsersResponse.fromBuffer(value));

  SearchServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$74.CreateAffinityRecommendationResponse> createAffinityRecommendation($74.CreateAffinityRecommendationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAffinityRecommendation, request, options: options);
  }

  $grpc.ResponseStream<$75.SubscribeSearchSessionResponse> subscribeSearchSession($75.SubscribeSearchSessionRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeSearchSession, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$76.GetAffinityRecommendationUsersResponse> getAffinityRecommendationUsers($76.GetAffinityRecommendationUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAffinityRecommendationUsers, request, options: options);
  }

  $grpc.ResponseFuture<$77.GetRecommendationUsersResponse> getRecommendationUsers($77.GetRecommendationUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRecommendationUsers, request, options: options);
  }

  $grpc.ResponseFuture<$78.GetLatestUserSearchConditionsResponse> getLatestUserSearchConditions($78.GetLatestUserSearchConditionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLatestUserSearchConditions, request, options: options);
  }

  $grpc.ResponseFuture<$79.GetSearchUsersResponse> getSearchUsers($79.GetSearchUsersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSearchUsers, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.search.v1.SearchService')
abstract class SearchServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.search.v1.SearchService';

  SearchServiceBase() {
    $addMethod($grpc.ServiceMethod<$74.CreateAffinityRecommendationRequest, $74.CreateAffinityRecommendationResponse>(
        'CreateAffinityRecommendation',
        createAffinityRecommendation_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $74.CreateAffinityRecommendationRequest.fromBuffer(value),
        ($74.CreateAffinityRecommendationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$75.SubscribeSearchSessionRequest, $75.SubscribeSearchSessionResponse>(
        'SubscribeSearchSession',
        subscribeSearchSession_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $75.SubscribeSearchSessionRequest.fromBuffer(value),
        ($75.SubscribeSearchSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$76.GetAffinityRecommendationUsersRequest, $76.GetAffinityRecommendationUsersResponse>(
        'GetAffinityRecommendationUsers',
        getAffinityRecommendationUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $76.GetAffinityRecommendationUsersRequest.fromBuffer(value),
        ($76.GetAffinityRecommendationUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$77.GetRecommendationUsersRequest, $77.GetRecommendationUsersResponse>(
        'GetRecommendationUsers',
        getRecommendationUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $77.GetRecommendationUsersRequest.fromBuffer(value),
        ($77.GetRecommendationUsersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$78.GetLatestUserSearchConditionsRequest, $78.GetLatestUserSearchConditionsResponse>(
        'GetLatestUserSearchConditions',
        getLatestUserSearchConditions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $78.GetLatestUserSearchConditionsRequest.fromBuffer(value),
        ($78.GetLatestUserSearchConditionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$79.GetSearchUsersRequest, $79.GetSearchUsersResponse>(
        'GetSearchUsers',
        getSearchUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $79.GetSearchUsersRequest.fromBuffer(value),
        ($79.GetSearchUsersResponse value) => value.writeToBuffer()));
  }

  $async.Future<$74.CreateAffinityRecommendationResponse> createAffinityRecommendation_Pre($grpc.ServiceCall call, $async.Future<$74.CreateAffinityRecommendationRequest> request) async {
    return createAffinityRecommendation(call, await request);
  }

  $async.Stream<$75.SubscribeSearchSessionResponse> subscribeSearchSession_Pre($grpc.ServiceCall call, $async.Future<$75.SubscribeSearchSessionRequest> request) async* {
    yield* subscribeSearchSession(call, await request);
  }

  $async.Future<$76.GetAffinityRecommendationUsersResponse> getAffinityRecommendationUsers_Pre($grpc.ServiceCall call, $async.Future<$76.GetAffinityRecommendationUsersRequest> request) async {
    return getAffinityRecommendationUsers(call, await request);
  }

  $async.Future<$77.GetRecommendationUsersResponse> getRecommendationUsers_Pre($grpc.ServiceCall call, $async.Future<$77.GetRecommendationUsersRequest> request) async {
    return getRecommendationUsers(call, await request);
  }

  $async.Future<$78.GetLatestUserSearchConditionsResponse> getLatestUserSearchConditions_Pre($grpc.ServiceCall call, $async.Future<$78.GetLatestUserSearchConditionsRequest> request) async {
    return getLatestUserSearchConditions(call, await request);
  }

  $async.Future<$79.GetSearchUsersResponse> getSearchUsers_Pre($grpc.ServiceCall call, $async.Future<$79.GetSearchUsersRequest> request) async {
    return getSearchUsers(call, await request);
  }

  $async.Future<$74.CreateAffinityRecommendationResponse> createAffinityRecommendation($grpc.ServiceCall call, $74.CreateAffinityRecommendationRequest request);
  $async.Stream<$75.SubscribeSearchSessionResponse> subscribeSearchSession($grpc.ServiceCall call, $75.SubscribeSearchSessionRequest request);
  $async.Future<$76.GetAffinityRecommendationUsersResponse> getAffinityRecommendationUsers($grpc.ServiceCall call, $76.GetAffinityRecommendationUsersRequest request);
  $async.Future<$77.GetRecommendationUsersResponse> getRecommendationUsers($grpc.ServiceCall call, $77.GetRecommendationUsersRequest request);
  $async.Future<$78.GetLatestUserSearchConditionsResponse> getLatestUserSearchConditions($grpc.ServiceCall call, $78.GetLatestUserSearchConditionsRequest request);
  $async.Future<$79.GetSearchUsersResponse> getSearchUsers($grpc.ServiceCall call, $79.GetSearchUsersRequest request);
}
