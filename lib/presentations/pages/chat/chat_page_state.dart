import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/chat.dart'
    show ChatMessageEntity, ChatTopicsEntity, DateIntentionEntity;
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/chat_session_publish_type.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/provider_interface.dart';

/// Chatページ用の状態（API応答を薄くラップするUI用のステート）
class ChatPageState implements UserDetailsProvider {
  const ChatPageState({
    // メッセージ関連
    this.chatMessages = const <ChatMessageEntity>[],
    this.pinnedChatMessageId,
    this.nextCursorId,
    // 話題
    this.chatTopics = const ChatTopicsEntity(),
    // デート意向
    this.dateIntention,
    this.toUserDateIntention,
    // 送受信・Stream関連
    this.publishChatMessageId,
    this.subscribeChatSessionPublishedUserId,
    this.subscribeChatSessionPublishType,
    // 既読
    this.isForceReadPurchased = false,
    this.readLastChatMessageId,
    // ユーザー情報関連
    this.userStatus,
    this.userDetail = const [],
    // 画面状態（フラグ）
    this.isReconnecting = false,
    this.isFetchingChatMessages = false,
    this.isCreatingTopics = false,
    this.isFetchingTopics = false,
    this.isCreatingPersonaAction = false,
    this.isDateIntentionFetch = false,
    this.isLoading = false,
    // エラー
    this.error,
  });

  // メッセージ関連
  final List<ChatMessageEntity> chatMessages;
  final String? pinnedChatMessageId;
  final String? nextCursorId;
  // 話題
  final ChatTopicsEntity chatTopics;
  // デート意向
  final DateIntentionEntity? dateIntention;
  final DateIntentionEntity? toUserDateIntention;
  // 送受信・Stream関連
  final ChatSessionPublishType? subscribeChatSessionPublishType;
  final String? publishChatMessageId;
  final String? subscribeChatSessionPublishedUserId;
  // 既読
  final bool isForceReadPurchased;
  final String? readLastChatMessageId;
  // ユーザー情報関連
  final UserStatus? userStatus;
  final List<UserDetail> userDetail;
  // 画面状態（フラグ）
  final bool isReconnecting;
  final bool isFetchingChatMessages;
  final bool isCreatingTopics;
  final bool isFetchingTopics;
  final bool isCreatingPersonaAction;
  final bool isDateIntentionFetch;
  final bool isLoading;
  // エラー
  final EconaError? error;

  static const _unset = Object();

  @override
  List<UserDetail> get userDetails => userDetail;

  ChatPageState copyWith({
    // メッセージ関連
    List<ChatMessageEntity>? chatMessages,
    Object? pinnedChatMessageId = _unset,
    Object? nextCursorId = _unset,
    // 話題
    ChatTopicsEntity? chatTopics,
    // デート意向
    DateIntentionEntity? dateIntention,
    DateIntentionEntity? toUserDateIntention,
    // 送受信・Stream関連
    String? publishChatMessageId,
    String? subscribeChatSessionPublishedUserId,
    ChatSessionPublishType? subscribeChatSessionPublishType,
    // 既読
    bool? isForceReadPurchased,
    String? readLastChatMessageId,
    // ユーザー情報関連
    UserStatus? userStatus,
    List<UserDetail>? userDetail,
    // 画面状態（フラグ）
    bool? isReconnecting,
    bool? isFetchingChatMessages,
    bool? isCreatingTopics,
    bool? isFetchingTopics,
    bool? isCreatingPersonaAction,
    bool? isDateIntentionFetch,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newPinnedMessageId = identical(pinnedChatMessageId, _unset)
        ? this.pinnedChatMessageId
        : pinnedChatMessageId as String?;

    final newNextCursorId = identical(nextCursorId, _unset)
        ? this.nextCursorId
        : nextCursorId as String?;

    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return ChatPageState(
      // メッセージ関連
      chatMessages: chatMessages ?? this.chatMessages,
      pinnedChatMessageId: newPinnedMessageId,
      nextCursorId: newNextCursorId,
      // 話題
      chatTopics: chatTopics ?? this.chatTopics,
      // デート意向
      dateIntention: dateIntention ?? this.dateIntention,
      toUserDateIntention: toUserDateIntention ?? this.toUserDateIntention,
      // 送受信・Stream関連
      subscribeChatSessionPublishType: subscribeChatSessionPublishType
          ?? this.subscribeChatSessionPublishType,
      publishChatMessageId: publishChatMessageId ?? this.publishChatMessageId,
      subscribeChatSessionPublishedUserId: subscribeChatSessionPublishedUserId
          ?? this.subscribeChatSessionPublishedUserId,
      isForceReadPurchased: isForceReadPurchased?? this.isForceReadPurchased,
      readLastChatMessageId: readLastChatMessageId ?? this.readLastChatMessageId,
      // ユーザー情報関連
      userStatus: userStatus ?? this.userStatus,
      userDetail: userDetail ?? this.userDetail,
      // 画面状態（フラグ）
      isReconnecting: isReconnecting ?? this.isReconnecting,
      isFetchingChatMessages: isFetchingChatMessages ?? this.isFetchingChatMessages,
      isCreatingTopics: isCreatingTopics ?? this.isCreatingTopics,
      isFetchingTopics: isFetchingTopics ?? this.isFetchingTopics,
      isCreatingPersonaAction: isCreatingPersonaAction ?? this.isCreatingPersonaAction,
      isDateIntentionFetch: isDateIntentionFetch ?? this.isDateIntentionFetch,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}