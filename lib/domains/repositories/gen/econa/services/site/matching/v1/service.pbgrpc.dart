//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/service.proto
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

import 'create_appeal.pb.dart' as $44;
import 'create_like.pb.dart' as $45;
import 'create_skip.pb.dart' as $46;
import 'delete_skip.pb.dart' as $49;
import 'get_likes.pb.dart' as $47;
import 'get_skips.pb.dart' as $48;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.matching.v1.MatchingService')
class MatchingServiceClient extends $grpc.Client {
  static final _$createAppeal = $grpc.ClientMethod<$44.CreateAppealRequest, $44.CreateAppealResponse>(
      '/econa.services.site.matching.v1.MatchingService/CreateAppeal',
      ($44.CreateAppealRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $44.CreateAppealResponse.fromBuffer(value));
  static final _$createLike = $grpc.ClientMethod<$45.CreateLikeRequest, $45.CreateLikeResponse>(
      '/econa.services.site.matching.v1.MatchingService/CreateLike',
      ($45.CreateLikeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $45.CreateLikeResponse.fromBuffer(value));
  static final _$createSkip = $grpc.ClientMethod<$46.CreateSkipRequest, $46.CreateSkipResponse>(
      '/econa.services.site.matching.v1.MatchingService/CreateSkip',
      ($46.CreateSkipRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $46.CreateSkipResponse.fromBuffer(value));
  static final _$getLikes = $grpc.ClientMethod<$47.GetLikesRequest, $47.GetLikesResponse>(
      '/econa.services.site.matching.v1.MatchingService/GetLikes',
      ($47.GetLikesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $47.GetLikesResponse.fromBuffer(value));
  static final _$getSkips = $grpc.ClientMethod<$48.GetSkipsRequest, $48.GetSkipsResponse>(
      '/econa.services.site.matching.v1.MatchingService/GetSkips',
      ($48.GetSkipsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $48.GetSkipsResponse.fromBuffer(value));
  static final _$deleteSkip = $grpc.ClientMethod<$49.DeleteSkipRequest, $49.DeleteSkipResponse>(
      '/econa.services.site.matching.v1.MatchingService/DeleteSkip',
      ($49.DeleteSkipRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $49.DeleteSkipResponse.fromBuffer(value));

  MatchingServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$44.CreateAppealResponse> createAppeal($44.CreateAppealRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAppeal, request, options: options);
  }

  $grpc.ResponseFuture<$45.CreateLikeResponse> createLike($45.CreateLikeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLike, request, options: options);
  }

  $grpc.ResponseFuture<$46.CreateSkipResponse> createSkip($46.CreateSkipRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSkip, request, options: options);
  }

  $grpc.ResponseFuture<$47.GetLikesResponse> getLikes($47.GetLikesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLikes, request, options: options);
  }

  $grpc.ResponseFuture<$48.GetSkipsResponse> getSkips($48.GetSkipsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSkips, request, options: options);
  }

  $grpc.ResponseFuture<$49.DeleteSkipResponse> deleteSkip($49.DeleteSkipRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteSkip, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.matching.v1.MatchingService')
abstract class MatchingServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.matching.v1.MatchingService';

  MatchingServiceBase() {
    $addMethod($grpc.ServiceMethod<$44.CreateAppealRequest, $44.CreateAppealResponse>(
        'CreateAppeal',
        createAppeal_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $44.CreateAppealRequest.fromBuffer(value),
        ($44.CreateAppealResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$45.CreateLikeRequest, $45.CreateLikeResponse>(
        'CreateLike',
        createLike_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $45.CreateLikeRequest.fromBuffer(value),
        ($45.CreateLikeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$46.CreateSkipRequest, $46.CreateSkipResponse>(
        'CreateSkip',
        createSkip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $46.CreateSkipRequest.fromBuffer(value),
        ($46.CreateSkipResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$47.GetLikesRequest, $47.GetLikesResponse>(
        'GetLikes',
        getLikes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $47.GetLikesRequest.fromBuffer(value),
        ($47.GetLikesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$48.GetSkipsRequest, $48.GetSkipsResponse>(
        'GetSkips',
        getSkips_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $48.GetSkipsRequest.fromBuffer(value),
        ($48.GetSkipsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$49.DeleteSkipRequest, $49.DeleteSkipResponse>(
        'DeleteSkip',
        deleteSkip_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $49.DeleteSkipRequest.fromBuffer(value),
        ($49.DeleteSkipResponse value) => value.writeToBuffer()));
  }

  $async.Future<$44.CreateAppealResponse> createAppeal_Pre($grpc.ServiceCall call, $async.Future<$44.CreateAppealRequest> request) async {
    return createAppeal(call, await request);
  }

  $async.Future<$45.CreateLikeResponse> createLike_Pre($grpc.ServiceCall call, $async.Future<$45.CreateLikeRequest> request) async {
    return createLike(call, await request);
  }

  $async.Future<$46.CreateSkipResponse> createSkip_Pre($grpc.ServiceCall call, $async.Future<$46.CreateSkipRequest> request) async {
    return createSkip(call, await request);
  }

  $async.Future<$47.GetLikesResponse> getLikes_Pre($grpc.ServiceCall call, $async.Future<$47.GetLikesRequest> request) async {
    return getLikes(call, await request);
  }

  $async.Future<$48.GetSkipsResponse> getSkips_Pre($grpc.ServiceCall call, $async.Future<$48.GetSkipsRequest> request) async {
    return getSkips(call, await request);
  }

  $async.Future<$49.DeleteSkipResponse> deleteSkip_Pre($grpc.ServiceCall call, $async.Future<$49.DeleteSkipRequest> request) async {
    return deleteSkip(call, await request);
  }

  $async.Future<$44.CreateAppealResponse> createAppeal($grpc.ServiceCall call, $44.CreateAppealRequest request);
  $async.Future<$45.CreateLikeResponse> createLike($grpc.ServiceCall call, $45.CreateLikeRequest request);
  $async.Future<$46.CreateSkipResponse> createSkip($grpc.ServiceCall call, $46.CreateSkipRequest request);
  $async.Future<$47.GetLikesResponse> getLikes($grpc.ServiceCall call, $47.GetLikesRequest request);
  $async.Future<$48.GetSkipsResponse> getSkips($grpc.ServiceCall call, $48.GetSkipsRequest request);
  $async.Future<$49.DeleteSkipResponse> deleteSkip($grpc.ServiceCall call, $49.DeleteSkipRequest request);
}
