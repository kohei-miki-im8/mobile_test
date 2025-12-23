// lib/infrastructures/repositories/media.dart
import 'dart:async';

import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/media/v1/chunked_media_upload.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/media/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/i_media_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media.g.dart';

class MediaRepository implements IMediaRepository {
  MediaRepository(this._apiClient) {
    _client = _apiClient.createClient(MediaServiceClient.new);
  }

  final ApiClient _apiClient;
  late final MediaServiceClient _client;

  @override
  Future<ChunkedMediaUploadResponse> chunkedMediaUpload(
    Stream<ChunkedMediaUploadRequest> request,
  ) async {
    try {
      final result = await _apiClient.callClientStream<ChunkedMediaUploadResponse>(
        client: _client,
        method: ApiMethodClientStream.chunkedMediaUpload,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed upload media: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed upload media: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed upload media: $e');
    }
  }
}

@riverpod
MediaRepository mediaRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MediaRepository(apiClient);
}
