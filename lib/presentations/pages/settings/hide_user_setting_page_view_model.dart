import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/get_hidden_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/update_user_hide.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/hide.dart';
import 'package:econa_mobile_app/presentations/pages/settings/hide_user_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hide_user_setting_page_view_model.g.dart';

@riverpod
class HideUserSettingPageViewModel extends _$HideUserSettingPageViewModel {
  @override
  Future<HideUserSettingPageState> build() async {
    return _fetchUsers(cursorId: null);
  }

  final _limit = 50;

  Future<HideUserSettingPageState> _fetchUsers({required String? cursorId}) async {
    final response = await ref.read(hideRepositoryProvider).getHiddenUsers(
      GetHiddenUsersRequest(
        cursor: PagerRequestCursor(
          cursorId: cursorId,
          limit: _limit,
        ),
      ),
    );

    final hideUsers = response.thumbnailUsers
        .map((user) => HideUser(user: user, isHidden: true))
        .toList();

    return HideUserSettingPageState(
      users: hideUsers,
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
      final nextState = await _fetchUsers(cursorId: nextCursorId);
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

  Future<bool> updateUserHidden(String userId, {required bool isHidden}) async {
    try {
      await ref.read(hideRepositoryProvider).updateUserHide(
        UpdateUserHideRequest(toUserId: userId, hide: isHidden),
      );

      final currentState = await future;
      final updatedUsers = currentState.users.map((u) {
        if (u.user.userId == userId) {
          return u.copyWith(isHidden: isHidden);
        }
        return u;
      }).toList();
      state = AsyncData(currentState.copyWith(users: updatedUsers));

      return true;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.hide,
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
