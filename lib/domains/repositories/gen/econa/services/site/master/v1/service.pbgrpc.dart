//
//  Generated code. Do not modify.
//  source: econa/services/site/master/v1/service.proto
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

import 'get_regions.pb.dart' as $43;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.master.v1.MasterService')
class MasterServiceClient extends $grpc.Client {
  static final _$getRegions = $grpc.ClientMethod<$43.GetRegionsRequest, $43.GetRegionsResponse>(
      '/econa.services.site.master.v1.MasterService/GetRegions',
      ($43.GetRegionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $43.GetRegionsResponse.fromBuffer(value));

  MasterServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$43.GetRegionsResponse> getRegions($43.GetRegionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRegions, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.master.v1.MasterService')
abstract class MasterServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.master.v1.MasterService';

  MasterServiceBase() {
    $addMethod($grpc.ServiceMethod<$43.GetRegionsRequest, $43.GetRegionsResponse>(
        'GetRegions',
        getRegions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $43.GetRegionsRequest.fromBuffer(value),
        ($43.GetRegionsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$43.GetRegionsResponse> getRegions_Pre($grpc.ServiceCall call, $async.Future<$43.GetRegionsRequest> request) async {
    return getRegions(call, await request);
  }

  $async.Future<$43.GetRegionsResponse> getRegions($grpc.ServiceCall call, $43.GetRegionsRequest request);
}
