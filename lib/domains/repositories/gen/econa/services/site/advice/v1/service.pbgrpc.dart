//
//  Generated code. Do not modify.
//  source: econa/services/site/advice/v1/service.proto
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

import 'get_approach_analysis.pb.dart' as $0;
import 'get_ideal.pb.dart' as $1;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.advice.v1.AdviceService')
class AdviceServiceClient extends $grpc.Client {
  static final _$getApproachAnalysis = $grpc.ClientMethod<$0.GetApproachAnalysisRequest, $0.GetApproachAnalysisResponse>(
      '/econa.services.site.advice.v1.AdviceService/GetApproachAnalysis',
      ($0.GetApproachAnalysisRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetApproachAnalysisResponse.fromBuffer(value));
  static final _$getIdeal = $grpc.ClientMethod<$1.GetIdealRequest, $1.GetIdealResponse>(
      '/econa.services.site.advice.v1.AdviceService/GetIdeal',
      ($1.GetIdealRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.GetIdealResponse.fromBuffer(value));

  AdviceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetApproachAnalysisResponse> getApproachAnalysis($0.GetApproachAnalysisRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getApproachAnalysis, request, options: options);
  }

  $grpc.ResponseFuture<$1.GetIdealResponse> getIdeal($1.GetIdealRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getIdeal, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.advice.v1.AdviceService')
abstract class AdviceServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.advice.v1.AdviceService';

  AdviceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetApproachAnalysisRequest, $0.GetApproachAnalysisResponse>(
        'GetApproachAnalysis',
        getApproachAnalysis_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetApproachAnalysisRequest.fromBuffer(value),
        ($0.GetApproachAnalysisResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.GetIdealRequest, $1.GetIdealResponse>(
        'GetIdeal',
        getIdeal_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.GetIdealRequest.fromBuffer(value),
        ($1.GetIdealResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetApproachAnalysisResponse> getApproachAnalysis_Pre($grpc.ServiceCall call, $async.Future<$0.GetApproachAnalysisRequest> request) async {
    return getApproachAnalysis(call, await request);
  }

  $async.Future<$1.GetIdealResponse> getIdeal_Pre($grpc.ServiceCall call, $async.Future<$1.GetIdealRequest> request) async {
    return getIdeal(call, await request);
  }

  $async.Future<$0.GetApproachAnalysisResponse> getApproachAnalysis($grpc.ServiceCall call, $0.GetApproachAnalysisRequest request);
  $async.Future<$1.GetIdealResponse> getIdeal($grpc.ServiceCall call, $1.GetIdealRequest request);
}
