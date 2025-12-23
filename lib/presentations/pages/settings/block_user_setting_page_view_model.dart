import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/get_blocked_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/update_user_block.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/block.dart';
import 'package:econa_mobile_app/presentations/pages/settings/block_user_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'block_user_setting_page_view_model.g.dart';

@riverpod
class BlockUserSettingPageViewModel extends _$BlockUserSettingPageViewModel {
  @override
  Future<BlockUserSettingPageState> build() async {
    return _fetchBlockedUsers(cursorId: null);
  }

  final _limit = 50;

  Future<BlockUserSettingPageState> _fetchBlockedUsers({required String? cursorId}) async {
    final blockedUsersResponse = await ref.read(blockRepositoryProvider).getBlockedUsers(
      GetBlockedUsersRequest(
        cursor: PagerRequestCursor(
          cursorId: cursorId,
          limit: _limit,
        ),
      ),
    );

    final blockUsers = blockedUsersResponse.thumbnailUsers
        .map((user) => BlockUser(user: user, isBlocked: true))
        .toList();

    return BlockUserSettingPageState(
      users: blockUsers,
      nextCursorId: blockedUsersResponse.hasCursor()
          ? blockedUsersResponse.cursor.nextCursorId
          : null,
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
      final nextState = await _fetchBlockedUsers(cursorId: nextCursorId);
      final updatedUsers = [...currentState.users, ...nextState.users];
      state = AsyncData(
        currentState.copyWith(
          users: updatedUsers,
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

  Future<bool> updateUserBlocked(String userId,
      {required bool isBlocked}) async {
    try {
      await ref.read(blockRepositoryProvider).updateUserBlock(
        UpdateUserBlockRequest(
          toUserId: userId,
          block: isBlocked,
        ),
      );
      final currentState = await future;
      final updatedUsers = currentState.users.map((u) {
        if (u.user.userId == userId) {
          return u.copyWith(isBlocked: isBlocked);
        }
        return u;
      }).toList();
      state = AsyncData(currentState.copyWith(users: updatedUsers));

      return true;
    } catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.block,
      );
      final currentState = await future;
      state = AsyncData(currentState.copyWith(error: econaError));
      return false;
    }
  }

  void clearError() {
    final currentState = state.valueOrNull;
    if (currentState == null || currentState.error == null) return;
    state = AsyncData(currentState.copyWith(error: null));
  }
}
