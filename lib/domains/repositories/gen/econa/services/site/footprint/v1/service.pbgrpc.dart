//
//  Generated code. Do not modify.
//  source: econa/services/site/footprint/v1/service.proto
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

import 'get_footprints.pb.dart' as $29;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.footprint.v1.FootprintService')
class FootprintServiceClient extends $grpc.Client {
  static final _$getFootprints = $grpc.ClientMethod<$29.GetFootprintsRequest, $29.GetFootprintsResponse>(
      '/econa.services.site.footprint.v1.FootprintService/GetFootprints',
      ($29.GetFootprintsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $29.GetFootprintsResponse.fromBuffer(value));

  FootprintServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$29.GetFootprintsResponse> getFootprints($29.GetFootprintsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFootprints, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.footprint.v1.FootprintService')
abstract class FootprintServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.footprint.v1.FootprintService';

  FootprintServiceBase() {
    $addMethod($grpc.ServiceMethod<$29.GetFootprintsRequest, $29.GetFootprintsResponse>(
        'GetFootprints',
        getFootprints_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $29.GetFootprintsRequest.fromBuffer(value),
        ($29.GetFootprintsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$29.GetFootprintsResponse> getFootprints_Pre($grpc.ServiceCall call, $async.Future<$29.GetFootprintsRequest> request) async {
    return getFootprints(call, await request);
  }

  $async.Future<$29.GetFootprintsResponse> getFootprints($grpc.ServiceCall call, $29.GetFootprintsRequest request);
}
