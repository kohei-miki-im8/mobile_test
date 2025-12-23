import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pb.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'chat_input_config.freezed.dart';

/// チャット入力の設定を表すエンティティ
@freezed
abstract class ChatInputConfig with _$ChatInputConfig {
  /// チャットページ用の設定
  const factory ChatInputConfig.chat({
    required String userId,
    required String chatRoomId,
    String? hintText,
    @Default(<Widget>[]) List<Widget> chatActions,
    Future<void> Function()? onSend,
  }) = ChatInputConfigChat;

  /// 質問ページ用の設定
  const factory ChatInputConfig.question({
    String? toUserId,
    String? userQuestionId,
    String? questionId,
    QuestionPhase? initialPhase,
  }) = ChatInputConfigQuestion;

  /// その他のページ用の設定（counseling, simulation, matching）
  const factory ChatInputConfig.simple({
    required String userId,
    required String chatRoomId,
    required AiAgentCode aiAgentCode,
    String? hintText,
    String? initialMessage,
    Future<void> Function(String text, {XFile? photo})? onSend,
    VoidCallback? onSendSuccess,
  }) = ChatInputConfigSimple;
}

