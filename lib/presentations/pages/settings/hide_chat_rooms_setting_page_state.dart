import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';

/// ページ内での状態変化を管理するためのチャットルームデータクラス
class HideChatRoom {
  const HideChatRoom({
    required this.chatRoom,
    required this.isHidden,
  });

  final ChatRoom chatRoom;
  final bool isHidden; // このページ内での一時的な非表示状態

  HideChatRoom copyWith({
    ChatRoom? chatRoom,
    bool? isHidden,
  }) {
    return HideChatRoom(
      chatRoom: chatRoom ?? this.chatRoom,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}

class HiddenChatRoomsSettingPageState {
  const HiddenChatRoomsSettingPageState({
    this.chatRooms = const [],
    this.nextCursorId,
    this.isLoadingMore = false,
    this.error,
  });

  final List<HideChatRoom> chatRooms;
  final String? nextCursorId;
  final bool isLoadingMore;
  final EconaError? error;

  static const _unset = Object();

  HiddenChatRoomsSettingPageState copyWith({
    List<HideChatRoom>? chatRooms,
    Object? nextCursorId = _unset,
    bool? isLoadingMore,
    Object? error = _unset,
  }) {
    final newNextCursorId = identical(nextCursorId, _unset)
        ? this.nextCursorId
        : nextCursorId as String?;

    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return HiddenChatRoomsSettingPageState(
      chatRooms: chatRooms ?? this.chatRooms,
      nextCursorId: newNextCursorId,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: newError,
    );
  }
}
