import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/chat_session_publish_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart';
import 'package:flutter/foundation.dart';

@immutable
class SimulationChatState {
  const SimulationChatState({
    this.simulatorChatRoom,
    this.chatMessages = const <ChatMessageEntity>[],
    this.nextCursorId = '',
    this.userId,
    this.publishChatMessageId,
    this.subscribeChatSessionPublishedUserId,
    this.subscribeChatSessionPublishType,
    this.isReconnecting = false,
    this.isLoading = false,
    this.error,
  });

  final SimulatorChatRoom? simulatorChatRoom;
  final List<ChatMessageEntity> chatMessages;
  final String nextCursorId;
  final String? userId;
  final String? publishChatMessageId;
  final String? subscribeChatSessionPublishedUserId;
  final ChatSessionPublishType? subscribeChatSessionPublishType;
  final bool isReconnecting;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  SimulationChatState copyWith({
    SimulatorChatRoom? simulatorChatRoom,
    List<ChatMessageEntity>? chatMessages,
    String? nextCursorId,
    String? userId,
    String? publishChatMessageId,
    String? subscribeChatSessionPublishedUserId,
    ChatSessionPublishType? subscribeChatSessionPublishType,
    bool? isReconnecting,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return SimulationChatState(
      simulatorChatRoom: simulatorChatRoom ?? this.simulatorChatRoom,
      chatMessages: chatMessages ?? this.chatMessages,
      nextCursorId: nextCursorId ?? this.nextCursorId,
      userId: userId ?? this.userId,
      publishChatMessageId: publishChatMessageId ?? this.publishChatMessageId,
      subscribeChatSessionPublishedUserId: subscribeChatSessionPublishedUserId ?? this.subscribeChatSessionPublishedUserId,
      subscribeChatSessionPublishType: subscribeChatSessionPublishType ?? this.subscribeChatSessionPublishType,
      isReconnecting: isReconnecting ?? this.isReconnecting,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}