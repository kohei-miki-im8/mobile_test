//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "chunked_voice_upload.pb.dart" as econaservicessitevoicev1chunked_voice_upload;
import "get_voice.pb.dart" as econaservicessitevoicev1get_voice;
import "delete_voice.pb.dart" as econaservicessitevoicev1delete_voice;

/// 音声機能を提供するサービスです。
abstract final class VoiceService {
  /// Fully-qualified name of the VoiceService service.
  static const name = 'econa.services.site.voice.v1.VoiceService';

  /// ChunkedVoiceUpload:音声を作成
  static const chunkedVoiceUpload = connect.Spec(
    '/$name/ChunkedVoiceUpload',
    connect.StreamType.client,
    econaservicessitevoicev1chunked_voice_upload.ChunkedVoiceUploadRequest.new,
    econaservicessitevoicev1chunked_voice_upload.ChunkedVoiceUploadResponse.new,
  );

  /// GetVoice:音声を取得
  static const getVoice = connect.Spec(
    '/$name/GetVoice',
    connect.StreamType.unary,
    econaservicessitevoicev1get_voice.GetVoiceRequest.new,
    econaservicessitevoicev1get_voice.GetVoiceResponse.new,
  );

  /// DeleteVoice:音声を削除
  static const deleteVoice = connect.Spec(
    '/$name/DeleteVoice',
    connect.StreamType.unary,
    econaservicessitevoicev1delete_voice.DeleteVoiceRequest.new,
    econaservicessitevoicev1delete_voice.DeleteVoiceResponse.new,
  );
}
