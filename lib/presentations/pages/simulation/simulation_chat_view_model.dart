import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_messages.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_simulator_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_topic.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/chat_session_subscription_manager.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_chat_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimulationChatViewModel extends StateNotifier<SimulationChatState> {
  bool _disposed = false;

  /// シミュレーションチャットの状態管理と購読制御を行うViewModel。
  SimulationChatViewModel(this.ref, this.chatRoomId) : super(const SimulationChatState()) {
    ref.onDispose(() {
      _disposed = true;
      unawaited(_chatSessionManager?.stop());
    });
  }

  final Ref ref;
  final String chatRoomId;

  bool _isRevalidating = false;
  static const _pageLimit = 50;

  ChatSessionSubscriptionManager<SubscribeChatSessionResponse>? _chatSessionManager;

  Future<void> initialize() async {
    try {
      state = state.copyWith(isLoading: true);
      final userStatusResponse = await ref.read(userRepositoryProvider)
          .getUserStatus(GetUserStatusRequest());

      final response = await ref.read(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(
            cursorId: null,
            limit: _pageLimit,
          ),
        ),
      );

      state = state.copyWith(
        chatMessages: response.chatMessages.map(ChatMessageEntity.fromProto).toList(),
        nextCursorId: response.cursor.nextCursorId,
        userId: userStatusResponse.userStatus.userId,
      );
    } on Object catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.simulatorChatMessageFetch,
      );
      state = state.copyWith(error: econaError);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> fetchMessage({String? nextCursorId}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await ref.read(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(
            cursorId: nextCursorId,
            limit: _pageLimit,
          ),
        ),
      );

      state = state.copyWith(
        chatMessages: response.chatMessages.map(ChatMessageEntity.fromProto).toList(),
        nextCursorId: response.cursor.nextCursorId,
      );
    } on Object catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.simulatorChatMessageFetch,
      );
      state = state.copyWith(error: econaError);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// チャットセッションのStream購読を開始
  Future<void> subscribeChatSession({required String chatRoomId}) async {
    _chatSessionManager = ChatSessionSubscriptionManager<SubscribeChatSessionResponse>(
      subscribe: () => ref.read(chatRepositoryProvider).subscribeChatSession(
        SubscribeChatSessionRequest(chatRoomId: chatRoomId),
      ),
      onEvent: (response) {
        try {
          // dispose 済みなら即 return
          if (_disposed) {
            return;
          }

          final event = ChatSessionEventEntity.fromProto(response);
          SimulationChatState newState = state.copyWith(
            subscribeChatSessionPublishedUserId: response.publishedUserId,
            subscribeChatSessionPublishType: response.publishType,
          );
          event.fold(
            // メッセージ受信
            message: (ChatMessageEntity _) {
              final message = ChatMessageEntity.fromProto(response.chatMessage);
              final currentMessages = state.chatMessages;
              final existingIndex = currentMessages.indexWhere(
                    (m) => m.chatMessageId == message.chatMessageId,
              );

              if (existingIndex > -1) {
                // 重複している場合は差し替える
                final replacedMessage = List<ChatMessageEntity>.from(currentMessages);
                replacedMessage[existingIndex] = message;
                newState = newState.copyWith(chatMessages: replacedMessage);
              } else {
                // メッセージ追加
                newState = newState.copyWith(
                  chatMessages: [message, ...currentMessages],
                );
              }
            },
            // 既読
            readLastChatMessageId: (String id) {},
            // タイピング中
            typing: (bool _) {},
            // 編集メッセージ
            editingText: (String text) {},
            editableChatTopics: (ChatTopics topics) {},
            unknown: () {},
          );
          state = newState;
        } on StateError {
        } catch (_) {

        }
      },
      revalidateOnce: () => revalidate(chatRoomId: chatRoomId),
      isOnline: _isOnline,
      isNetworkUnreachable: _isNetworkUnreachable,
      isAuthError: _isAuthError,
      attemptAuthRefresh: _authRefreshForce,
      maxAttempts: 10,
      baseDelay: const Duration(seconds: 1),
      onNetworkError: (Object error) {
        // アプリがフォアグラウンドのときだけネットワークエラーを state に反映する
        final lifecycleState = WidgetsBinding.instance.lifecycleState;
        final isForeground =
            lifecycleState == null || lifecycleState == AppLifecycleState.resumed;
        if (!isForeground) {
          // バックグラウンド中に起きたネットワークエラーは無視（UIには出さない）
          return;
        }

        final econaError = EconaError(
          cause: EconaErrorCause.network,
          operation: EconaErrorOperation.sessionConnect, // 接続エラー用に流用
          message: 'ネットワークに接続できません。通信環境をご確認ください。',
          originalError: error,
        );

        state = state.copyWith(
          error: econaError,
        );
      },
    );
    await _chatSessionManager!.start();
  }

  /// Stream切断
  Future<void> disconnectSession({required String chatRoomId}) async {
    try {
      // 先に購読を確実に止める
      await _chatSessionManager?.stop();
      _chatSessionManager = null;
      // Stream切断
      await ref.read(chatRepositoryProvider).publishDisconnectChatSession(
        PublishDisconnectChatSessionRequest(
          chatRoomId: chatRoomId,
        ),
      );
      state = state.copyWith(
        isReconnecting: false,
      );
    } on Exception catch (_) {
      // エラーは握りつぶす
    }
  }

  /// バックグラウンドからの復帰等のStream再接続
  void reconnectOnResume({required String chatRoomId}) {
    // 簡素化段階ではそのまま再購読のみ
    subscribeChatSession(chatRoomId: chatRoomId);
  }

  /// ユーザー操作による手動再接続（即時1回トライ、失敗時は諦めてエラー）
  void manualReconnect({required String chatRoomId}) {
    // 簡素化段階ではフラグ操作せず再購読のみ
    subscribeChatSession(chatRoomId: chatRoomId);
  }

  /// 認証トークンを強制リフレッシュ（401時の再購読前）
  Future<void> _authRefreshForce() async {
    try {
      await ref.read(authRepositoryProvider).refreshToken();
    } on Exception catch (_) {
      // エラーを出さないため失敗は握りつぶす
    }
  }

  /// エラー文字列をクリア
  void clearError() {
    if (state.error == null) return;
    state = state.copyWith(error: null);
  }

  /// 外部からチャットメッセージの更新を要求（入室時・再接続時など）
  Future<void> revalidate({required String chatRoomId}) async {
    await _revalidate(chatRoomId: chatRoomId);
  }

  Future<void> _revalidate({required String chatRoomId}) async {
    // dispose済みなら即 return
    if (_disposed) {
      return;
    }

    if (_isRevalidating) return;
    _isRevalidating = true;
    try {
      final previousState = state;

      final response = await ref.watch(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(
            limit: _pageLimit,
          ),
        ),
      );

      // dispose済みなら即 return
      if (_disposed) {
        return;
      }

      final oldMessages = state.chatMessages;
      final newMessages = response.chatMessages;

      final oldCursorId = previousState.nextCursorId;
      final newCursorId = response.cursor.hasNextCursorId()
          ? response.cursor.nextCursorId
          : null;

      if (listEquals(oldMessages, newMessages) && oldCursorId == newCursorId) {
        return;
      }

      // dispose済みなら即 return
      if (_disposed) {
        return;
      }

      state = state.copyWith(
        chatMessages: response.chatMessages.map(ChatMessageEntity.fromProto).toList(),
        nextCursorId: newCursorId,
      );
    } on Exception catch(_) {
      // バックグラウンド更新は握りつぶす
    } finally {
      _isRevalidating = false;
    }
  }

  /// シミュレーションチャットルーム退出
  Future<void> leaveSimulationChatRoom({required String chatRoomId}) async {
    try {
      await ref.read(chatRepositoryProvider).leaveSimulatorChatRoom(
        LeaveSimulatorChatRoomRequest(
          chatRoomId: chatRoomId,
        ),
      );
    } on Exception catch (_) {
      // エラーは見せないため握りつぶす
    }
  }

  bool _isAuthError(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('401') || msg.contains('unauth');
  }

  Future<bool> _isOnline() async {
    try {
      final List<ConnectivityResult> results = await Connectivity().checkConnectivity();
      return results.any((r) => r != ConnectivityResult.none);
    } catch (_) {
      return true;
    }
  }

  bool _isNetworkUnreachable(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('failed host lookup') || msg.contains('socketexception');
  }

  void setSimulatorChatRoom({required SimulatorChatRoom simulatorChatRoom}) {
    state = state.copyWith(simulatorChatRoom: simulatorChatRoom);
  }

}

final simulationChatViewModelProvider = AutoDisposeStateNotifierProvider.family<SimulationChatViewModel, SimulationChatState, String>(
  SimulationChatViewModel.new,
);
