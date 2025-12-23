//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "chunked_voice_upload.pb.dart" as econaservicessitevoicev1chunked_voice_upload;
import "service.connect.spec.dart" as specs;
import "get_voice.pb.dart" as econaservicessitevoicev1get_voice;
import "delete_voice.pb.dart" as econaservicessitevoicev1delete_voice;

/// 音声機能を提供するサービスです。
extension type VoiceServiceClient (connect.Transport _transport) {
  /// ChunkedVoiceUpload:音声を作成
  Future<econaservicessitevoicev1chunked_voice_upload.ChunkedVoiceUploadResponse> chunkedVoiceUpload(
    Stream<econaservicessitevoicev1chunked_voice_upload.ChunkedVoiceUploadRequest> input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).client(
      specs.VoiceService.chunkedVoiceUpload,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetVoice:音声を取得
  Future<econaservicessitevoicev1get_voice.GetVoiceResponse> getVoice(
    econaservicessitevoicev1get_voice.GetVoiceRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.VoiceService.getVoice,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// DeleteVoice:音声を削除
  Future<econaservicessitevoicev1delete_voice.DeleteVoiceResponse> deleteVoice(
    econaservicessitevoicev1delete_voice.DeleteVoiceRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.VoiceService.deleteVoice,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
