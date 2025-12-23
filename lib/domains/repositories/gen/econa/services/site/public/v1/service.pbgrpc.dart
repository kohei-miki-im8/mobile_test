//
//  Generated code. Do not modify.
//  source: econa/services/site/public/v1/service.proto
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

import 'get_server_info.pb.dart' as $63;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.public.v1.PublicService')
class PublicServiceClient extends $grpc.Client {
  static final _$getServerInfo = $grpc.ClientMethod<$63.GetServerInfoRequest, $63.GetServerInfoResponse>(
      '/econa.services.site.public.v1.PublicService/GetServerInfo',
      ($63.GetServerInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $63.GetServerInfoResponse.fromBuffer(value));

  PublicServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$63.GetServerInfoResponse> getServerInfo($63.GetServerInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getServerInfo, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.public.v1.PublicService')
abstract class PublicServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.public.v1.PublicService';

  PublicServiceBase() {
    $addMethod($grpc.ServiceMethod<$63.GetServerInfoRequest, $63.GetServerInfoResponse>(
        'GetServerInfo',
        getServerInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $63.GetServerInfoRequest.fromBuffer(value),
        ($63.GetServerInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$63.GetServerInfoResponse> getServerInfo_Pre($grpc.ServiceCall call, $async.Future<$63.GetServerInfoRequest> request) async {
    return getServerInfo(call, await request);
  }

  $async.Future<$63.GetServerInfoResponse> getServerInfo($grpc.ServiceCall call, $63.GetServerInfoRequest request);
}
