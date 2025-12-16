import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';

class ChatRoomPageState {
  const ChatRoomPageState({
    this.isLoading = false,
    this.chatRooms = const [],
    this.scheduledChatRooms = const [],
    this.chatRoomsCursor,
    this.scheduledChatRoomsCursor,
    this.isLoadingMoreChatRooms = false,
    this.isLoadingMoreScheduledChatRooms = false,
    this.isNavigating = false,
    this.isSubscribed = false,
    this.error,
  });

  /// 画面全体の読み込み状態
  final bool isLoading;

  /// チャットルーム一覧
  final List<ChatRoom> chatRooms;

  /// スケジュールされたチャットルーム一覧
  final List<ScheduledChatRoom> scheduledChatRooms;

  /// チャットルームのカーソル
  final PagerResponseCursor? chatRoomsCursor;

  /// スケジュールされたチャットルームのカーソル
  final PagerResponseCursor? scheduledChatRoomsCursor;

  /// 追加読み込み中フラグ（通常チャットルーム）
  final bool isLoadingMoreChatRooms;

  /// 追加読み込み中フラグ（スケジュール済みチャットルーム）
  final bool isLoadingMoreScheduledChatRooms;

  /// ナビゲーション処理中フラグ（ナビゲーション処理中はタップイベントを吸収する）
  final bool isNavigating;

  /// プラン加入中フラグ
  final bool isSubscribed;

  /// エラー
  final EconaError? error;

  static const _unset = Object();

  ChatRoomPageState copyWith({
    bool? isLoading,
    List<ChatRoom>? chatRooms,
    List<ScheduledChatRoom>? scheduledChatRooms,
    PagerResponseCursor? chatRoomsCursor,
    PagerResponseCursor? scheduledChatRoomsCursor,
    bool? isLoadingMoreChatRooms,
    bool? isLoadingMoreScheduledChatRooms,
    bool? isNavigating,
    bool? isSubscribed,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset) ? this.error : error as EconaError?;

    return ChatRoomPageState(
      isLoading: isLoading ?? this.isLoading,
      chatRooms: chatRooms ?? this.chatRooms,
      scheduledChatRooms: scheduledChatRooms ?? this.scheduledChatRooms,
      chatRoomsCursor: chatRoomsCursor ?? this.chatRoomsCursor,
      scheduledChatRoomsCursor:
          scheduledChatRoomsCursor ?? this.scheduledChatRoomsCursor,
      isLoadingMoreChatRooms:
          isLoadingMoreChatRooms ?? this.isLoadingMoreChatRooms,
      isLoadingMoreScheduledChatRooms: isLoadingMoreScheduledChatRooms ??
          this.isLoadingMoreScheduledChatRooms,
      isNavigating: isNavigating ?? this.isNavigating,
      isSubscribed: isSubscribed ?? this.isSubscribed,
      error: newError,
    );
  }
}
