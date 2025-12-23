import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart';
import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/entities/login_status.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart' as profile_entity;
import 'package:econa_mobile_app/domains/entities/profile_detail.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/message_content_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_greeting.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_reply.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_messages.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/purchase_force_read_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_pinned_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_user_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_topic.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/tag.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/chat_session_subscription_manager.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/chat/chat_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ChatViewModel
class ChatPageViewModel extends StateNotifier<ChatPageState> {
  ChatPageViewModel(this. chatRoomId, this.ref) : super(const ChatPageState()) {
    _initialize(chatRoomId: chatRoomId);
  }

  final Ref ref;
  final String chatRoomId;

  bool _isRevalidating = false;
  static const _pageLimit = 50;

  // 購読マネージャ
  ChatSessionSubscriptionManager<SubscribeChatSessionResponse>? _chatSessionManager;

  // タイムアウトタイマー管理
  Timer? _personaActionTimeoutTimer;
  Timer? _chatTopicsTimeoutTimer;

  @override
  void dispose() {
    _personaActionTimeoutTimer?.cancel();
    _chatTopicsTimeoutTimer?.cancel();
    super.dispose();
  }

  /// 初期化処理
  Future<void> _initialize({required String chatRoomId}) async {
    state = state.copyWith(isLoading: true);

    // AutoDisposeで遷移間で破棄されないよう維持
    final keepAliveLink = ref.keepAlive();
    ref.onDispose(() {
      unawaited(_chatSessionManager?.stop());
      keepAliveLink.close();
    });

    try {
      final response = await ref.watch(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(
            limit: _pageLimit,
          ),
        ),
      );

      // dateIntentionを取得
      final getDateIntentionResponse = await ref.watch(chatRepositoryProvider)
          .getDateIntention(GetDateIntentionRequest(chatRoomId: chatRoomId));

      final userStatesResponse = await ref.watch(userRepositoryProvider)
          .getUserStatus(GetUserStatusRequest());

      state = state.copyWith(
        chatMessages: response.chatMessages.map(ChatMessageEntity.fromProto).toList(),
        pinnedChatMessageId: response.pinnedChatMessageId,
        dateIntention: DateIntentionEntity.fromProto(
          getDateIntentionResponse.dateIntention,
        ),
        nextCursorId: response.cursor.hasNextCursorId() ? response.cursor.nextCursorId : null,
        readLastChatMessageId: response.readLastChatMessageId,
        userStatus: userStatesResponse.userStatus,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.chatMessageFetch,
      );
      state = state.copyWith(
        error: econaError,
      );
    }
    finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// isForceReadPurchasedを設定
  void setIsForceReadPurchased(bool value) {
    state = state.copyWith(isForceReadPurchased: value);
  }

  /// ユーザーステータスのみを最新化する
  Future<void> refreshUserStatus() async {
    try {
      final response = await ref.read(userRepositoryProvider)
          .getUserStatus(GetUserStatusRequest());
      state = state.copyWith(
        userStatus: response.userStatus,
      );
    } on Exception catch (_) {
      // ユーザーステータス更新失敗時は既存stateを維持して握りつぶす
    }
  }

  Future<void> setUserDetail({required ThumbnailUser user}) async {
    if (user.userId.isEmpty) {
      return;
    }

    try {
      // 相手ユーザーのプロフィール詳細を取得
      final response = await ref.read(profileRepositoryProvider).getProfile(
        GetProfileRequest(toUserId: user.userId),
      );

      // GetProfileResponse から UserDetail を組み立て（Profile + ProfileDetail 両方）
      final detail = UserDetail.fromProfileResponse(
        response,
        user.userId,
      );

      state = state.copyWith(
        userDetail: <UserDetail>[detail],
      );
    } on Exception catch(_) {
      // 取得失敗時は最低限 ThumbnailUser からの情報だけ入れておくフォールバック
      final profile = profile_entity.Profile.fromThumbnailUser(user);
      final fallback = UserDetail(
        profile: profile,
        profileDetail: null,
        matchingReason: null,
      );
      state = state.copyWith(
        userDetail: <UserDetail>[fallback],
      );
    }
  }

  /// プリフェッチ
  Future<void> prefetch({required String chatRoomId}) async {
    // 二重取得ガード
    if (state.chatMessages.isNotEmpty) return;

    try {
      final response = await ref.read(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(limit: _pageLimit),
        ),
      );
      state = state.copyWith(
        chatMessages: response.chatMessages.map(ChatMessageEntity.fromProto).toList(),
        pinnedChatMessageId: response.pinnedChatMessageId,
        nextCursorId: response.cursor.hasNextCursorId()
            ? response.cursor.nextCursorId
            : null,
      );
    } on Exception catch (_) {
      // プリフェッチ失敗は握りつぶす（入室後に通常取得へフォールバック）
    }
  }

  /// SWRでバックグラウンドで更新
  Future<void> _revalidate({required String chatRoomId}) async {
    if (_isRevalidating) return;
    _isRevalidating = true;
    try {
      final previousState = state;

      final response = await ref.read(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(
            limit: _pageLimit,
          ),
        ),
      );

      final oldMessages = state.chatMessages;
      final newMessages = response.chatMessages;

      // dateIntentionを取得
      final getDateIntentionResponse = await ref.watch(chatRepositoryProvider)
          .getDateIntention(GetDateIntentionRequest(chatRoomId: chatRoomId));

      final oldDateIntention = previousState.dateIntention;
      final newDateIntention = DateIntentionEntity.fromProto(
        getDateIntentionResponse.dateIntention,
      );

      final oldCursorId = previousState.nextCursorId;
      final newCursorId = response.cursor.hasNextCursorId()
          ? response.cursor.nextCursorId
          : null;

      if (listEquals(oldMessages, newMessages)
          && oldDateIntention == newDateIntention
          && oldCursorId == newCursorId
      ) {
        return;
      }

      state = state.copyWith(
        chatMessages: response.chatMessages.map(ChatMessageEntity.fromProto).toList(),
        pinnedChatMessageId: response.pinnedChatMessageId,
        dateIntention: DateIntentionEntity.fromProto(
          getDateIntentionResponse.dateIntention,
        ),
        nextCursorId: newCursorId,
      );
    } on Exception catch(_) {
      // バックグラウンド更新は握りつぶす
    } finally {
      _isRevalidating = false;
    }
  }

  /// 外部からチャットメッセージの更新を要求（入室時・再接続時など）
  Future<void> revalidate({required String chatRoomId}) async {
    await _revalidate(chatRoomId: chatRoomId);
  }

  /// 認証失効検知
  bool _isAuthError(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('401') || msg.contains('unauth');
  }

  /// 認証トークンを強制リフレッシュ（401時の再購読前）
  Future<void> _authRefreshForce() async {
    try {
      await ref.read(authRepositoryProvider).refreshToken();
    } on Exception catch (_) {
      // エラーを出さないため失敗は握りつぶす
    }
  }

  /// 端末がネットワークに接続されているかどうかの判断
  Future<bool> _isOnline() async {
    try {
      final List<ConnectivityResult> results = await Connectivity().checkConnectivity();
      return results.any((r) => r != ConnectivityResult.none);
    } catch (_) {
      return true;
    }
  }

  ///　エラーがネットワークによるものかどうかの判断
  bool _isNetworkUnreachable(Object? error) {
    final msg = error?.toString().toLowerCase() ?? '';
    return msg.contains('failed host lookup') || msg.contains('socketexception');
  }

  /// 話題生成
  Future<void> createChatTopics({required String chatRoomId}) async {
    // 既存のタイマーをキャンセル
    _chatTopicsTimeoutTimer?.cancel();

    //  全画面ローディングを避ける
    state = state.copyWith(
      isCreatingTopics: true,
    );

    // 30秒タイムアウトタイマーを開始
    _chatTopicsTimeoutTimer = Timer(const Duration(seconds: 30), () {
      if (state.isCreatingTopics) {
        clearCreateChatTopicsLoading();
      }
    });

    try {
      await ref.watch(chatRepositoryProvider).createChatTopics(
        CreateChatTopicsRequest(chatRoomId: chatRoomId),
      );
    } on Object catch (e) {
      _chatTopicsTimeoutTimer?.cancel();
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.chatTopicsCreate,
      );
      state = state.copyWith(
        error: econaError,
        isCreatingTopics: false,
      );
    }
  }

  /// なりきり挨拶生成
  Future<void> createPersonaGreeting({required String chatRoomId}) async {
    // 既存のタイマーをキャンセル
    _personaActionTimeoutTimer?.cancel();

    //  全画面ローディングを避ける
    state = state.copyWith(
      isCreatingPersonaAction: true,
    );

    // 30秒タイムアウトタイマーを開始
    _personaActionTimeoutTimer = Timer(const Duration(seconds: 30), () {
      if (state.isCreatingPersonaAction) {
        clearPersonaActionsLoading();
      }
    });

    try {
      await ref.watch(chatRepositoryProvider).createPersonaGreeting(
        CreatePersonaGreetingRequest(chatRoomId: chatRoomId),
      );
      AdjustEventTracker.trackPersonaGreetingOrReply();
    } on Object catch (e) {
      _personaActionTimeoutTimer?.cancel();
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.personaGreetingCreate,
      );
      state = state.copyWith(
        error: econaError,
        isCreatingPersonaAction: false,
      );
    }
  }

  /// なりきり返信生成
  Future<void> createPersonaReply({required String chatRoomId}) async {
    // 既存のタイマーをキャンセル
    _personaActionTimeoutTimer?.cancel();

    //  全画面ローディングを避ける
    state = state.copyWith(
      isCreatingPersonaAction: true,
    );

    // 30秒タイムアウトタイマーを開始
    _personaActionTimeoutTimer = Timer(const Duration(seconds: 30), () {
      if (state.isCreatingPersonaAction) {
        clearPersonaActionsLoading();
      }
    });

    try {
      await ref.watch(chatRepositoryProvider).createPersonaReply(
        CreatePersonaReplyRequest(chatRoomId: chatRoomId),
      );
      AdjustEventTracker.trackPersonaGreetingOrReply();
    } on Object catch (e) {
      _personaActionTimeoutTimer?.cancel();
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.personaReplyCreate,
      );
      state = state.copyWith(
        error: econaError,
        isCreatingPersonaAction: false,
      );
    }
  }

  /// 話題取得
  Future<void> getChatTopics({required String chatRoomId}) async {
    //  全画面ローディングを避ける
    state = state.copyWith(
      isFetchingTopics: true,
    );

    try {
      final response = await ref.watch(chatRepositoryProvider).getChatTopics(
        GetChatTopicsRequest(chatRoomId: chatRoomId),
      );

      state = state.copyWith(
        chatTopics: ChatTopicsEntity(
          items: response.chatTopics.map(ChatTopicEntity.fromProto).toList(),
        ),
      );

    } on Object catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.chatTopicsCreate,
      );
      state = state.copyWith(
        error: econaError,
      );
    }
    finally {
      state = state.copyWith(
        isFetchingTopics: false,
        // createChatTopics 成功フローでは Stream での反映を待つが、
        // 取得完了時点でUIブロックを解くために生成中フラグも解除する
        isCreatingTopics: false,
      );
    }
  }

  /// デート意向を取得
  Future<void> getDateIntention({required String chatRoomId}) async {
    //  全画面ローディングを避ける
    state = state.copyWith(
      isDateIntentionFetch: true,
    );

    try {
      final response = await ref.watch(chatRepositoryProvider).getDateIntention(
        GetDateIntentionRequest(chatRoomId: chatRoomId),
      );

      state = state.copyWith(
        dateIntention: DateIntentionEntity.fromProto(response.dateIntention),
      );

    } on Object catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.dateIntentionFetch,
      );
      state = state.copyWith(
        error: econaError,
      );
    }
    finally {
      state = state.copyWith(
        isDateIntentionFetch: false,
      );
    }
  }

  /// やりとりを取得
  Future<void> getMessages({required String chatRoomId}) async {
    state = state.copyWith(isFetchingChatMessages: true);

    final previousState = state;
    try {
      final response = await ref.watch(chatRepositoryProvider).getMessages(
        GetMessagesRequest(
          chatRoomId: chatRoomId,
          cursor: PagerRequestCursor(
            cursorId: state.nextCursorId,
            limit: _pageLimit,
          ),
        ),
      );

      final newMessages = <ChatMessageEntity>[
        ...previousState.chatMessages,
        ...response.chatMessages.map(ChatMessageEntity.fromProto),
      ];

      state = state.copyWith(
        chatMessages: newMessages,
        pinnedChatMessageId: response.pinnedChatMessageId,
        nextCursorId: response.cursor.nextCursorId,
      );
    } on Object catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.chatMessageFetch,
      );
      state = state.copyWith(
        error: econaError,
      );
    }
    finally {
      state = state.copyWith(isFetchingChatMessages: false);
    }
  }

  /// 既読をPublish（最新の相手メッセージIDまで既読にする）
  Future<void> publishMessageRead({
    required String publishedUserId,
    required String chatRoomId,
    required String chatMessageId,
  }) async {
    try {
      final req = PublishChatMessageRequest(
        chatRoomId: chatRoomId,
        chatMessage: ChatMessage(
          publishedUserId: publishedUserId,
          readLastChatMessageId: chatMessageId,
          contentType: MessageContentType.MESSAGE_CONTENT_TYPE_READ,
        ),
      );
      await ref.read(chatRepositoryProvider).publishChatMessage(req);
    } on Exception catch (_) {
      // 既読の反映失敗は握りつぶす
    }
  }

  /// 既読表示機能を購入（MP消費）
  Future<void> purchaseForceReadStatus({required String chatRoomId}) async {
    state = state.copyWith(error: null);
    try {
      await ref.read(chatRepositoryProvider).purchaseForceReadStatus(
        PurchaseForceReadStatusRequest(chatRoomId: chatRoomId),
      );
    } on Exception catch (e) {
      final EconaError econaError;
      if (e.toString().contains('already_exists') || e.toString().contains('already exists')) {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.forceReadPurchasedAlready,
        );
      } else if (e.toString().contains('insufficient points') || e.toString().contains('insufficient_points')) {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.lackOfMp,
        );
      } else {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.forceReadPurchased,
        );
      }
      state = state.copyWith(error: econaError);
    }
  }

  /// 既読状態を更新
  Future<void> reloadForceReadStatus({required String chatRoomId}) async {
    state = state.copyWith(error: null);
    try {
      final response = await ref.read(chatRepositoryProvider).getChatRooms(
        GetChatRoomsRequest(
          cursor: PagerRequestCursor(
            limit: _pageLimit,
          ),
        ),
      );

      final targetChatRoom = response.chatRooms.where(
            (r) => r.chatRoomId == chatRoomId,
      );

      final isForceReadPurchased = targetChatRoom.isNotEmpty &&
          targetChatRoom.first.isForceReadPurchased;

      state = state.copyWith(
        isForceReadPurchased: isForceReadPurchased,
      );
    } on Exception catch (_) {
      // エラーは表示しない
    }
    finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 送信前ガード判定結果
  Future<SentValidationResult> sentMessageValidationCheck({
    required String publishedUserId,
  }) async {
    try {
      final response = await ref.read(profileRepositoryProvider).getProfile(
        GetProfileRequest(),
      );

      final genderCode = response.profile.genderCode;

      final SubscriptionTier tier = await getSubscriptionTier(genderCode: genderCode);

      final isFreePlan =  switch (tier) {
        SubscriptionTier.SUBSCRIPTION_TIER_UNSPECIFIED
        || SubscriptionTier.SUBSCRIPTION_TIER_FREE => true,
        SubscriptionTier.SUBSCRIPTION_TIER_BASIC
        || SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM => false,
        SubscriptionTier() => true,
      };

      final hasOwnHistory = state.chatMessages
          .any((m) => m.publishedUserId == publishedUserId);

      if (isFreePlan && hasOwnHistory) {
        return SentValidationResult.requireSubscription;
      }

      return SentValidationResult.allowed;
    } on Exception catch (_) {
      return SentValidationResult.allowed;
    }
  }


  /// Stream購読
  Future<void> subscribeChatSession({required String chatRoomId}) async {
    _chatSessionManager = ChatSessionSubscriptionManager<SubscribeChatSessionResponse>(
      subscribe: () => ref.read(chatRepositoryProvider).subscribeChatSession(
        SubscribeChatSessionRequest(chatRoomId: chatRoomId),
      ),
      onEvent: (response) {
        final event = ChatSessionEventEntity.fromProto(response);
        ChatPageState newState = state.copyWith(
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

            // publishUserIdが自分のものでない場合は受信として扱う
            final myUserId = ref.read(authRepositoryProvider).userId;
            if (message.publishedUserId != myUserId) {
              AdjustEventTracker.trackMessageReceived();
              unawaited(
                publishMessageRead(
                  publishedUserId: myUserId!,
                  chatRoomId: chatRoomId,
                  chatMessageId: message.chatMessageId,
                ),
              );
            }
          },
          // 既読
          readLastChatMessageId: (String _) {
            newState = newState.copyWith(readLastChatMessageId: response.readLastChatMessageId);
          },
          // タイピング中
          typing: (bool _) {},
          // 編集メッセージ
          editingText: (String text) {
            // なりきりボタンのローディングを解除
            newState = newState.copyWith(
              isCreatingPersonaAction: false,
            );

            final myUserId = ref.read(authRepositoryProvider).userId;
            if (response.publishedUserId == myUserId) {
              ref.watch(econaChatInputViewModelProvider.notifier).setText(text);
            }
          },
          // 話題生成完了イベント
          editableChatTopics: (ChatTopics topics) {
            // タイマーをキャンセル
            _chatTopicsTimeoutTimer?.cancel();
            _chatTopicsTimeoutTimer = null;
            // 話題をstateに反映し、ローディングを解除
            newState = newState.copyWith(
              chatTopics: ChatTopicsEntity.fromProto(topics.chatTopics),
              isCreatingTopics: false,
            );
          },
          unknown: () {},
        );
        state = newState;
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
  Future<void> disconnectSession(PublishDisconnectChatSessionRequest request) async {
    try {
      // 先に購読を確実に止める
      await _chatSessionManager?.stop();
      _chatSessionManager = null;
      // Stream切断
      await ref.read(chatRepositoryProvider).publishDisconnectChatSession(request);
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

  /// デート意向更新
  Future<void> updateDateIntention({required String chatMessageId, required bool hasIntention}) async {
    try {
      final previousDateIntention = state.dateIntention;
      final updateDateIntention = previousDateIntention;

      state = state.copyWith(dateIntention: updateDateIntention);

      await ref.read(chatRepositoryProvider).updateDateIntention(
        UpdateDateIntentionRequest(
          chatMessageId: chatMessageId,
          hasDateIntention: hasIntention,
        ),
      );
    } on Exception catch (_) {
      // 楽観的更新のため握りつぶす
    }
  }

  /// メッセージのピン止めを更新
  Future<void> updatePinnedMessage({required String chatRoomId, String? chatMessageId}) async {
    // ローディングは出さない
    try {
      await ref.read(chatRepositoryProvider).updatePinnedChatMessage(
        UpdatePinnedChatMessageRequest(
          chatRoomId: chatRoomId,
          chatMessageId: chatMessageId,
        ),
      );

      state = state.copyWith(
        pinnedChatMessageId: chatMessageId,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.pinnedMessageUpdate,
      );
      state = state.copyWith(
        error: econaError,
      );
    }
  }

  /// エラー文字列をクリア（トースト表示後に呼び出し）
  void clearError() {
    state = state.copyWith(
      error: null,
    );
  }

  void clearPersonaActionsLoading() {
    _personaActionTimeoutTimer?.cancel();
    _personaActionTimeoutTimer = null;
    state = state.copyWith(
      isCreatingPersonaAction: false,
    );
  }

  void clearCreateChatTopicsLoading() {
    _chatTopicsTimeoutTimer?.cancel();
    _chatTopicsTimeoutTimer = null;
    state = state.copyWith(
      isCreatingTopics: false,
    );
  }

  void clearGetChatTopicsLoading() {
    state = state.copyWith(
      isFetchingTopics: false,
    );
  }
}

/// ハンドリング用の送信チェック結果
enum SentValidationResult {
  allowed,
  requireVerification,
  requireSubscription,
}

/// 共通タグ取得
class CommonTagsParams {
  const CommonTagsParams({required this.currentUserId, required this.toUserId});
  final String currentUserId;
  final String toUserId;
}

/// ユーザーのタグ名一覧
final userTagMapProvider = FutureProvider.family<Map<String, String>, String>((ref, userId) async {
  if (userId.isEmpty) return const <String, String>{};
  final repo = ref.watch(tagRepositoryProvider);
  final resp = await repo.getUserTags(GetUserTagsRequest(userId: userId));
  // id -> name
  return {
    for (final t in resp.userTags)
      if (t.tagId.isNotEmpty) t.tagId: t.tagName,
  };
});

/// 共通タグ名一覧（自分×相手）
final commonTagsProvider = FutureProvider.family<List<String>, (String currentUserId, String toUserId)>((ref, params) async {
  final (currentUserId, toUserId) = params;
  if (currentUserId.isEmpty || toUserId.isEmpty) return const <String>[];
  final selfMap = await ref.watch(userTagMapProvider(currentUserId).future);
  final toUserMap = await ref.watch(userTagMapProvider(toUserId).future);

  final selfIds = selfMap.keys.toSet();
  final toIds = toUserMap.keys.toSet();
  final commonIds = selfIds.intersection(toIds);

  // 名前は自分側の名称を優先、無ければ相手側、どちらも無ければID
  return commonIds
      .map((id) {
    final selfName = selfMap[id];
    if (selfName?.isNotEmpty ?? false) return selfName!;
    final toName = toUserMap[id];
    if (toName?.isNotEmpty ?? false) return toName!;
    // 名前が取得できない場合は表示しない
    return null;
  })
      .whereType<String>()
      .toList();
});

bool isReadMessage(ChatMessageEntity message, ChatPageState state) {
  final boundaryId = state.readLastChatMessageId;
  if (boundaryId == null || boundaryId.isEmpty) return false;

  final boundaryIdx = state.chatMessages.indexWhere((m) => m.chatMessageId == boundaryId);
  if (boundaryIdx >= 0) {
    // readLastChatMessageIdのメッセージのインデックスを見つける
    final messageIdx = state.chatMessages.indexWhere((m) => m.chatMessageId == message.chatMessageId);
    if (messageIdx < 0) {
      // メッセージが見つからない場合は未読扱い
      return false;
    }
    // boundaryIdxより後（インデックスが大きい）のメッセージは既読
    // chatMessagesは最新→過去の順なので、インデックスが大きいほど古いメッセージ
    return messageIdx >= boundaryIdx;
  }
  // 境界IDはあるが表示バッファ内に無い → すべて既読扱い
  return true;
}

/// Provider
final chatPageViewModelProvider = StateNotifierProvider.autoDispose
    .family<ChatPageViewModel, ChatPageState, String>((ref, chatRoomId) {
  return ChatPageViewModel(chatRoomId, ref);
});