//
//  Generated code. Do not modify.
//  source: econa/services/site/media/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "chunked_media_upload.pb.dart" as econaservicessitemediav1chunked_media_upload;

/// メディア機能を提供するサービスです。
abstract final class MediaService {
  /// Fully-qualified name of the MediaService service.
  static const name = 'econa.services.site.media.v1.MediaService';

  /// ChunkedMediaUpload:メディアを作成
  static const chunkedMediaUpload = connect.Spec(
    '/$name/ChunkedMediaUpload',
    connect.StreamType.client,
    econaservicessitemediav1chunked_media_upload.ChunkedMediaUploadRequest.new,
    econaservicessitemediav1chunked_media_upload.ChunkedMediaUploadResponse.new,
  );
}
