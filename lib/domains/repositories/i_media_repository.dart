import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/media/v1/chunked_media_upload.pb.dart';


/// Media関連のRepositoryインターフェース
abstract class IMediaRepository {
  /// クライアントストリームでチャンクアップロードを行います
  Future<ChunkedMediaUploadResponse> chunkedMediaUpload(Stream<ChunkedMediaUploadRequest> input);
}
