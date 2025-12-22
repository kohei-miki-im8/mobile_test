//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/service.proto
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

import 'chunked_voice_upload.pb.dart' as $105;
import 'delete_voice.pb.dart' as $107;
import 'get_voice.pb.dart' as $106;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.voice.v1.VoiceService')
class VoiceServiceClient extends $grpc.Client {
  static final _$chunkedVoiceUpload = $grpc.ClientMethod<$105.ChunkedVoiceUploadRequest, $105.ChunkedVoiceUploadResponse>(
      '/econa.services.site.voice.v1.VoiceService/ChunkedVoiceUpload',
      ($105.ChunkedVoiceUploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $105.ChunkedVoiceUploadResponse.fromBuffer(value));
  static final _$getVoice = $grpc.ClientMethod<$106.GetVoiceRequest, $106.GetVoiceResponse>(
      '/econa.services.site.voice.v1.VoiceService/GetVoice',
      ($106.GetVoiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $106.GetVoiceResponse.fromBuffer(value));
  static final _$deleteVoice = $grpc.ClientMethod<$107.DeleteVoiceRequest, $107.DeleteVoiceResponse>(
      '/econa.services.site.voice.v1.VoiceService/DeleteVoice',
      ($107.DeleteVoiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $107.DeleteVoiceResponse.fromBuffer(value));

  VoiceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$105.ChunkedVoiceUploadResponse> chunkedVoiceUpload($async.Stream<$105.ChunkedVoiceUploadRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$chunkedVoiceUpload, request, options: options).single;
  }

  $grpc.ResponseFuture<$106.GetVoiceResponse> getVoice($106.GetVoiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getVoice, request, options: options);
  }

  $grpc.ResponseFuture<$107.DeleteVoiceResponse> deleteVoice($107.DeleteVoiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteVoice, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.voice.v1.VoiceService')
abstract class VoiceServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.voice.v1.VoiceService';

  VoiceServiceBase() {
    $addMethod($grpc.ServiceMethod<$105.ChunkedVoiceUploadRequest, $105.ChunkedVoiceUploadResponse>(
        'ChunkedVoiceUpload',
        chunkedVoiceUpload,
        true,
        false,
        ($core.List<$core.int> value) => $105.ChunkedVoiceUploadRequest.fromBuffer(value),
        ($105.ChunkedVoiceUploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$106.GetVoiceRequest, $106.GetVoiceResponse>(
        'GetVoice',
        getVoice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $106.GetVoiceRequest.fromBuffer(value),
        ($106.GetVoiceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$107.DeleteVoiceRequest, $107.DeleteVoiceResponse>(
        'DeleteVoice',
        deleteVoice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $107.DeleteVoiceRequest.fromBuffer(value),
        ($107.DeleteVoiceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$106.GetVoiceResponse> getVoice_Pre($grpc.ServiceCall call, $async.Future<$106.GetVoiceRequest> request) async {
    return getVoice(call, await request);
  }

  $async.Future<$107.DeleteVoiceResponse> deleteVoice_Pre($grpc.ServiceCall call, $async.Future<$107.DeleteVoiceRequest> request) async {
    return deleteVoice(call, await request);
  }

  $async.Future<$105.ChunkedVoiceUploadResponse> chunkedVoiceUpload($grpc.ServiceCall call, $async.Stream<$105.ChunkedVoiceUploadRequest> request);
  $async.Future<$106.GetVoiceResponse> getVoice($grpc.ServiceCall call, $106.GetVoiceRequest request);
  $async.Future<$107.DeleteVoiceResponse> deleteVoice($grpc.ServiceCall call, $107.DeleteVoiceRequest request);
}
