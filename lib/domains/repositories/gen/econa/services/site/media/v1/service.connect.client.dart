//
//  Generated code. Do not modify.
//  source: econa/services/site/media/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "chunked_media_upload.pb.dart" as econaservicessitemediav1chunked_media_upload;
import "service.connect.spec.dart" as specs;

/// メディア機能を提供するサービスです。
extension type MediaServiceClient (connect.Transport _transport) {
  /// ChunkedMediaUpload:メディアを作成
  Future<econaservicessitemediav1chunked_media_upload.ChunkedMediaUploadResponse> chunkedMediaUpload(
    Stream<econaservicessitemediav1chunked_media_upload.ChunkedMediaUploadRequest> input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).client(
      specs.MediaService.chunkedMediaUpload,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
