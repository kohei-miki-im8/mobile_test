//
//  Generated code. Do not modify.
//  source: econa/services/site/media/v1/service.proto
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

import 'chunked_media_upload.pb.dart' as $50;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.media.v1.MediaService')
class MediaServiceClient extends $grpc.Client {
  static final _$chunkedMediaUpload = $grpc.ClientMethod<$50.ChunkedMediaUploadRequest, $50.ChunkedMediaUploadResponse>(
      '/econa.services.site.media.v1.MediaService/ChunkedMediaUpload',
      ($50.ChunkedMediaUploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $50.ChunkedMediaUploadResponse.fromBuffer(value));

  MediaServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$50.ChunkedMediaUploadResponse> chunkedMediaUpload($async.Stream<$50.ChunkedMediaUploadRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$chunkedMediaUpload, request, options: options).single;
  }
}

@$pb.GrpcServiceName('econa.services.site.media.v1.MediaService')
abstract class MediaServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.media.v1.MediaService';

  MediaServiceBase() {
    $addMethod($grpc.ServiceMethod<$50.ChunkedMediaUploadRequest, $50.ChunkedMediaUploadResponse>(
        'ChunkedMediaUpload',
        chunkedMediaUpload,
        true,
        false,
        ($core.List<$core.int> value) => $50.ChunkedMediaUploadRequest.fromBuffer(value),
        ($50.ChunkedMediaUploadResponse value) => value.writeToBuffer()));
  }

  $async.Future<$50.ChunkedMediaUploadResponse> chunkedMediaUpload($grpc.ServiceCall call, $async.Stream<$50.ChunkedMediaUploadRequest> request);
}
