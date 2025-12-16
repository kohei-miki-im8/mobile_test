import 'package:econa_mobile_app/domains/entities/chat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counseling.freezed.dart';

enum CounselingStatus {
  preparing,    // 部屋作成直後/最初の質問待ち
  inProgress,   // 質問応答中
  finished,     // 終了
}

@freezed
abstract class CounselingSession with _$CounselingSession {
  const factory CounselingSession({
    required String chatRoomId,
    required CounselingStatus status,
    ChatMessageEntity? lastAiMessage,
    DateTime? startedAt,
    DateTime? finishedAt,
  }) = _CounselingSession;

  const CounselingSession._();

  bool get isFinished => status == CounselingStatus.finished;
  bool get isPreparing => status == CounselingStatus.preparing;
}