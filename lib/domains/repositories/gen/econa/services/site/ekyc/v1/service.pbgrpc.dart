//
//  Generated code. Do not modify.
//  source: econa/services/site/ekyc/v1/service.proto
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

import 'get_service_auth.pb.dart' as $26;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.ekyc.v1.EKYCService')
class EKYCServiceClient extends $grpc.Client {
  static final _$getServiceAuth = $grpc.ClientMethod<$26.GetServiceAuthRequest, $26.GetServiceAuthResponse>(
      '/econa.services.site.ekyc.v1.EKYCService/GetServiceAuth',
      ($26.GetServiceAuthRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $26.GetServiceAuthResponse.fromBuffer(value));

  EKYCServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$26.GetServiceAuthResponse> getServiceAuth($26.GetServiceAuthRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getServiceAuth, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.ekyc.v1.EKYCService')
abstract class EKYCServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.ekyc.v1.EKYCService';

  EKYCServiceBase() {
    $addMethod($grpc.ServiceMethod<$26.GetServiceAuthRequest, $26.GetServiceAuthResponse>(
        'GetServiceAuth',
        getServiceAuth_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $26.GetServiceAuthRequest.fromBuffer(value),
        ($26.GetServiceAuthResponse value) => value.writeToBuffer()));
  }

  $async.Future<$26.GetServiceAuthResponse> getServiceAuth_Pre($grpc.ServiceCall call, $async.Future<$26.GetServiceAuthRequest> request) async {
    return getServiceAuth(call, await request);
  }

  $async.Future<$26.GetServiceAuthResponse> getServiceAuth($grpc.ServiceCall call, $26.GetServiceAuthRequest request);
}
