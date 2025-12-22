//
//  Generated code. Do not modify.
//  source: econa/services/site/karte/v1/service.proto
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

import 'get_karte.pb.dart' as $42;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.karte.v1.KarteService')
class KarteServiceClient extends $grpc.Client {
  static final _$getKarte = $grpc.ClientMethod<$42.GetKarteRequest, $42.GetKarteResponse>(
      '/econa.services.site.karte.v1.KarteService/GetKarte',
      ($42.GetKarteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $42.GetKarteResponse.fromBuffer(value));

  KarteServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$42.GetKarteResponse> getKarte($42.GetKarteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getKarte, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.karte.v1.KarteService')
abstract class KarteServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.karte.v1.KarteService';

  KarteServiceBase() {
    $addMethod($grpc.ServiceMethod<$42.GetKarteRequest, $42.GetKarteResponse>(
        'GetKarte',
        getKarte_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $42.GetKarteRequest.fromBuffer(value),
        ($42.GetKarteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$42.GetKarteResponse> getKarte_Pre($grpc.ServiceCall call, $async.Future<$42.GetKarteRequest> request) async {
    return getKarte(call, await request);
  }

  $async.Future<$42.GetKarteResponse> getKarte($grpc.ServiceCall call, $42.GetKarteRequest request);
}
