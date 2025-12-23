import 'dart:async';

import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_messages.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/presentations/services/chat_session/chat_session_params.dart';
import 'package:econa_mobile_app/presentations/services/chat_session/chat_session_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatSessionViewModel extends StateNotifier<ChatSessionState> {
  ChatSessionViewModel(this.ref, this.params) : super(const ChatSessionState());

  final Ref ref;
  final ChatSessionParams params;
  StreamSubscription? _subscription;

  Future<void> fetchInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      if (params.chatRoomId == '00000000-0000-0000-0000-000000000000') {
        final createReq = CreateChatRoomRequest(
          toUserId: params.toUserId ?? '',
          aiAgentCode: AiAgentCode.AI_AGENT_CODE_CHAT_SIMULATOR,
          anonymizeDummyNickname: params.anonymizeDummyNickname ?? '',
          dummyPhotoId: params.dummyPhotoId ?? '',
        );
        final created = await ref.read(chatRepositoryProvider).createChatRoom(createReq);
        final res = await ref.read(chatRepositoryProvider).getMessages(
          GetMessagesRequest(
            chatRoomId: created.chatRoomId,
            cursor: PagerRequestCursor(limit: 10),
          ),
        );
        state = state.copyWith(
          messages: res.chatMessages,
          latestCursorId: res.cursor.nextCursorId,
          isLoading: false,
        );
        return;
      }
      final res = await ref.read(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: params.chatRoomId,
          cursor: PagerRequestCursor(limit: 10),
        ),
      );
      state = state.copyWith(
        messages: res.chatMessages,
        latestCursorId: res.cursor.nextCursorId,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> subscribe() async {
    await _subscription?.cancel();
    state = state.copyWith(isSubscribing: true);
    _subscription = ref
        .read(chatRepositoryProvider)
        .subscribeChatSession(SubscribeChatSessionRequest(chatRoomId: params.chatRoomId))
        .listen((event) {
      if (event.hasChatMessage()) {
        final updated = List.of(state.messages)..insert(0, event.chatMessage);
        state = state.copyWith(messages: updated);
      }
    }, onError: (e) {
      state = state.copyWith(isSubscribing: false, error: e.toString());
    });
  }

  Future<void> reconnectOnResume() async {
    await subscribe();
  }

  Future<void> getMore(String cursorId) async {
    if (cursorId.isEmpty) return;
    try {
      final res = await ref.read(chatRepositoryProvider).getMessages(
            GetMessagesRequest(
              chatRoomId: params.chatRoomId,
              cursor: PagerRequestCursor(cursorId: cursorId, limit: 10),
            ),
          );
      final merged = List.of(state.messages)..addAll(res.chatMessages);
      state = state.copyWith(messages: merged, latestCursorId: res.cursor.nextCursorId);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> publish(PublishChatMessageRequest request) async {
    await ref.read(chatRepositoryProvider).publishChatMessage(request);
  }
}

final chatSessionProvider = StateNotifierProvider.family<ChatSessionViewModel, ChatSessionState, ChatSessionParams>(
  ChatSessionViewModel.new,
);


