import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_visible_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_chat_rooms_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hide_chat_rooms_setting_page_view_model.g.dart';

@riverpod
class HideChatRoomsSettingPageViewModel extends _$HideChatRoomsSettingPageViewModel {
  @override
  Future<HiddenChatRoomsSettingPageState> build() async {
    return _fetchHiddenChatRooms(cursorId: null);
  }

  final _limit = 50;

  Future<HiddenChatRoomsSettingPageState> _fetchHiddenChatRooms({required String? cursorId}) async {
    final response = await ref.read(chatRepositoryProvider).getChatRooms(
      GetChatRoomsRequest(
        cursor: PagerRequestCursor(
          cursorId: cursorId,
          limit: _limit,
        ),
      ),
    );

    final hiddenChats = response.chatRooms
        .where((room) => !room.isVisible)
        .map((room) => HideChatRoom(chatRoom: room, isHidden: true))
        .toList();

    return HiddenChatRoomsSettingPageState(
      chatRooms: hiddenChats,
      nextCursorId: response.hasCursor() ? response.cursor.nextCursorId : null,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(build);
  }

  Future<void> loadMore() async {
    final currentState = await future;
    final nextCursorId = currentState.nextCursorId;
    if (nextCursorId == null || nextCursorId.isEmpty) {
      return;
    }

    state = AsyncData(
      currentState.copyWith(isLoadingMore: true, error: null),
    );

    try {
      final nextState = await _fetchHiddenChatRooms(cursorId: nextCursorId);
      final updatedChats = [...currentState.chatRooms, ...nextState.chatRooms];
      state = AsyncData(
        currentState.copyWith(
          chatRooms: updatedChats,
          nextCursorId: nextState.nextCursorId,
          isLoadingMore: false,
        ),
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.unknown,
      );
      state = AsyncData(
        currentState.copyWith(
          isLoadingMore: false,
          error: econaError,
        ),
      );
      rethrow;
    }
  }

  Future<bool> updateChatHidden(String chatRoomId, {required bool isHidden}) async {
    try {
      await ref.read(chatRepositoryProvider).updateVisibleStatus(
        UpdateVisibleStatusRequest(
          chatRoomId: chatRoomId,
          isVisible: !isHidden,
        ),
      );
      final currentState = await future;
      final updatedChats = currentState.chatRooms.map((c) {
        if (c.chatRoom.chatRoomId == chatRoomId) {
          return c.copyWith(isHidden: isHidden);
        }
        return c;
      }).toList();
      state = AsyncData(currentState.copyWith(chatRooms: updatedChats));

      return true;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.hideFetch,
      );
      final currentState = await future;
      state = AsyncData(currentState.copyWith(error: econaError));

      return false;
    }
  }

  void clearError() {
    final current = state.valueOrNull;
    if (current == null || current.error == null) return;
    state = AsyncData(current.copyWith(error: null));
  }
}
