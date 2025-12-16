import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart'
    show ChatMessageContentEntityExt, ChatMessageEntity, ChatSessionEventEntity, ChatSessionEventEntityExt;
import 'package:econa_mobile_app/domains/entities/counseling.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/messenger_status_badge.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_messages.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_topic.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/google/protobuf/timestamp.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/chat_session_subscription_manager.dart';
import 'package:econa_mobile_app/presentations/pages/counseling/counseling_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounselingPageViewModel extends StateNotifier<CounselingPageState> {
  CounselingPageViewModel(this.ref) : super(const CounselingPageState()) {
    ref.onDispose(() => _chatSessionManager?.stop());
    Future.microtask(initialize);
  }

  final Ref ref;

  ChatSessionSubscriptionManager<SubscribeChatSessionResponse>? _chatSessionManager;

  Future<void> initialize() async {
    if(!mounted) return;
    state = state.copyWith(isLoading: true);

    try {
      final userRepo = ref.read(userRepositoryProvider);
      final profileRepo = ref.read(profileRepositoryProvider);
      final chatRepo = ref.read(chatRepositoryProvider);

      // ユーザー情報・プロフィール・既存カウンセリングルームをまとめて取得
      final results = await Future.wait([
        userRepo.getUserStatus(GetUserStatusRequest()),
        profileRepo.getProfile(GetProfileRequest()),
        chatRepo.getCounselingChatRoom(GetCounselingChatRoomRequest()),
      ]);

      final userStatesResponse = results[0] as GetUserStatusResponse;
      final userProfileResponse = results[1] as GetProfileResponse;
      final counselingRoomResponse = results[2] as GetCounselingChatRoomResponse;

      if(!mounted) return;
      state = state.copyWith(
        userStatus: userStatesResponse.userStatus,
        profile: userProfileResponse.profile,
      );

      if (counselingRoomResponse.hasChatRoom()) {
        final chatRoom = counselingRoomResponse.chatRoom;

        // セッションを作成（ステータスは inProgress でよいならこれでOK）
        final session = CounselingSession(
          chatRoomId: chatRoom.chatRoomId,
          status: CounselingStatus.inProgress,
          startedAt: DateTime.now(), // 必要ならサーバー側の createdAt などに合わせても良い
        );

        state = state.copyWith(
          chatRoom: chatRoom,
          session: session,
        );

        // 既存のメッセージを取得して lastAiMessage を埋める
        await _fetchInitialMessages(chatRoom.chatRoomId);

        // リアルタイム購読も開始（途中戻りでも継続してチャットできるように）
        await _subscribeChatSession(chatRoom.chatRoomId);
      }

    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.userStatusFetch,
      );
      if(!mounted) return;
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      if(!mounted) return;
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> _fetchInitialMessages(String chatRoomId) async {
    if (!mounted) return;
    state = state.copyWith(isFetchingMessages: true);

    try {
      final repo = ref.read(chatRepositoryProvider);
      final res = await repo.getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(limit: 50),
        ),
      );

      if (!mounted) return;
      final aiMessages = res.chatMessages
          .map(ChatMessageEntity.fromProto)
          .where((m) => m.publishedUserId.isEmpty)
          .toList();

      final session = state.session;
      if (session != null && aiMessages.isNotEmpty) {
        if (!mounted) return;

        final latestAi = aiMessages.first;
        state = state.copyWith(
          session: session.copyWith(lastAiMessage: latestAi),
        );
      }
    } catch (e) {
      if (!mounted) return;
      final econaError = EconaError.fromException(
        e as Exception,
        operation: EconaErrorOperation.counselingMessageFetch,
      );
      state = state.copyWith(error: econaError);
    } finally {
      if (!mounted) return;
      state = state.copyWith(isFetchingMessages: false);
    }
  }

  Future<void> startCounseling() async {
    state = state.copyWith(isCreatingRoom: true);

    final ChatRoom chatRoom;

    try {
      // ChatRoom取得
      final getResponse = await ref.read(chatRepositoryProvider).getCounselingChatRoom(
        GetCounselingChatRoomRequest(),
      );

      if(getResponse.hasChatRoom()) {
        chatRoom = getResponse.chatRoom;
      } else {
        // ChatRoom作成
        await ref.read(chatRepositoryProvider).createChatRoom(
          CreateChatRoomRequest(
            toUserId: state.userStatus!.userId,
            aiAgentCode: AiAgentCode.AI_AGENT_CODE_AI_COUNSELOR,
          ),
        );

        final getRes = await ref.read(chatRepositoryProvider).getCounselingChatRoom(
          GetCounselingChatRoomRequest(),
        );

        if (!getRes.hasChatRoom()) {
          throw Exception('ChatRoomの作成後の取得に失敗しました');
        }

        chatRoom = getRes.chatRoom;
      }

      // セッション購読開始
      final session = CounselingSession(
        chatRoomId: chatRoom.chatRoomId,
        status: CounselingStatus.inProgress,
        startedAt: DateTime.now(),
      );

      state = state.copyWith(
        chatRoom: chatRoom,
        session: session,
        isCreatingRoom: false,
      );

      await _subscribeChatSession(chatRoom.chatRoomId);

    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.counselingStart,
      );
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      state = state.copyWith(isCreatingRoom: false);
    }
  }

  void setSendingMessage({required bool isPublishing}) {
    state = state.copyWith(isPublishing: isPublishing);
  }

  Future<void> leaveCounselingChatRoom({required String chatRoomId}) async {
    try {
      await ref.read(chatRepositoryProvider).leaveCounselingChatRoom(
        LeaveCounselingChatRoomRequest(
          chatRoomId: chatRoomId,
        ),
      );
    } on Exception catch (_) {
      // エラーは見せないため握りつぶす
    }
  }

  Future<void> disconnectSession({required String chatRoomId}) async {
    try {
      // 先に購読を確実に止める
      await _chatSessionManager?.stop();
      _chatSessionManager = null;
      // Stream切断
      await ref.read(chatRepositoryProvider).publishDisconnectChatSession(
          PublishDisconnectChatSessionRequest(chatRoomId: chatRoomId)
      );
      if (!mounted) return;
      state = state.copyWith(
        isReconnecting: false,
      );
    } on Exception catch (_) {
      // エラーは握りつぶす
    }
  }

  Future<void> _subscribeChatSession(String chatRoomId) async {
    state = state.copyWith(isSubscribing: true);

    _chatSessionManager = ChatSessionSubscriptionManager<SubscribeChatSessionResponse>(
      subscribe: () => ref.read(chatRepositoryProvider).subscribeChatSession(
        SubscribeChatSessionRequest(chatRoomId: chatRoomId),
      ),
      onEvent: (response) {
        ChatSessionEventEntity.fromProto(response)
            .fold(
          message: (msg) {
            final incoming = ChatMessageEntity.fromProto(response.chatMessage);

            if (incoming.content.isAiAgent) {
              state = state.copyWith(isPublishing: false);

              final session = state.session;
              if (session != null) {
                state = state.copyWith(
                  session: session.copyWith(lastAiMessage: incoming),
                );

                // AiAgentMessageContent の終了フラグで終了検出
                final isFinished = response.chatMessage.hasAiAgent()
                    && response.chatMessage.aiAgent.isFinished;
                if (isFinished && session.status != CounselingStatus.finished) {
                  state = state.copyWith(
                    session: session.copyWith(
                      status: CounselingStatus.finished,
                      finishedAt: DateTime.now(),
                    ),
                  );
                }
              }
            }
          },
          readLastChatMessageId: (_) {},
          typing: (_) {},
          editingText: (_) {},
          editableChatTopics: (ChatTopics topics) {},
          unknown: () {},
        );
      },
      revalidateOnce: () => _revalidateOnce(chatRoomId),
      isOnline: _isOnline,
      isNetworkUnreachable: _isNetworkUnreachable,
      isAuthError: _isAuthError,
      attemptAuthRefresh: _authRefreshForce,
      maxAttempts: 10,
      baseDelay: const Duration(seconds: 1),
      onNetworkError: (error) {
        state = state.copyWith(
          isSubscribing: false,
          error: '$error',
        );
      },
    );

    await _chatSessionManager!.start();
    state = state.copyWith(isSubscribing: false);
  }

  Future<void> ensureSubscribed() async {
    final s = state.session;
    if (s == null) return;

    // 二重購読ガード
    if (_chatSessionManager != null) return;
    await _subscribeChatSession(s.chatRoomId);
  }

  Future<void> reconnectOnResume() async {
    _chatSessionManager?.onResume();
  }

  Future<void> _revalidateOnce(String chatRoomId) async {
    await _fetchInitialMessages(chatRoomId);
  }

  bool _isAuthError(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('401') || msg.contains('unauth');
  }

  Future<void> _authRefreshForce() async {
    try {
      await ref.read(authRepositoryProvider).refreshToken();
    } on Exception catch (_) {
      // エラーを出さないため失敗は握りつぶす
    }
  }

  Future<bool> _isOnline() async {
    try {
      final results = await Connectivity().checkConnectivity();
      return results.any((r) => r != ConnectivityResult.none);
    } on Exception catch (_) {
      return true;
    }
  }

  bool _isNetworkUnreachable(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('failed host lookup') || msg.contains('socketexception');
  }

  void clearError() {
    state = state.copyWith(error: null);
  }
}

final counselingPageViewModelProvider =
StateNotifierProvider.autoDispose<CounselingPageViewModel, CounselingPageState>(
  CounselingPageViewModel.new,
);