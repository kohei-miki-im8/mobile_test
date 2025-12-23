import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_message.pb.dart';
import 'package:flutter/foundation.dart';

@immutable
class ChatSessionState {
  const ChatSessionState({
    this.messages = const <ChatMessage>[],
    this.latestCursorId = '',
    this.isSubscribing = false,
    this.isLoading = false,
    this.error,
  });

  final List<ChatMessage> messages;
  final String latestCursorId;
  final bool isSubscribing;
  final bool isLoading;
  final String? error;

  ChatSessionState copyWith({
    List<ChatMessage>? messages,
    String? latestCursorId,
    bool? isSubscribing,
    bool? isLoading,
    String? error,
  }) {
    return ChatSessionState(
      messages: messages ?? this.messages,
      latestCursorId: latestCursorId ?? this.latestCursorId,
      isSubscribing: isSubscribing ?? this.isSubscribing,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}


