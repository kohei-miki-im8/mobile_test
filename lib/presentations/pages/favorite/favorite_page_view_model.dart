import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/favorite_user.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/get_favorite_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_like.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/favorite.dart';
import 'package:econa_mobile_app/infrastructures/repositories/matching.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/like_event_service.dart';
import 'package:econa_mobile_app/presentations/pages/favorite/favorite_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_state.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// お気に入りページのメインViewModel
class FavoritePageViewModel extends StateNotifier<FavoritePageState> {
  FavoritePageViewModel(this.ref) : super(const FavoritePageState()) {
    initialFetchData();
  }

  final Ref ref;
  bool _isRevalidating = false;

  static const _pageLimit = 50;

  /// 初期データを取得
  Future<void> initialFetchData() async {
    state = state.copyWith(
      isLoading: true,
      nextCursorId: null,
      error: null,
    );

    try {
      /// お気に入りユーザーを取得
      final request = GetFavoriteUsersRequest(
        cursor: PagerRequestCursor(
          limit: _pageLimit,
        ),
      );

      final response = await ref
          .read(favoriteRepositoryProvider)
          .getFavoriteUsersRawData(request);

      final favoriteUsers = response.thumbnailUsers
          .map(FavoriteUser.fromResponse)
          .toList(growable: false);

      state = state.copyWith(
        favoriteUsers: favoriteUsers,
        nextCursorId: response.cursor.hasNextCursorId()
            ? response.cursor.nextCursorId
            : null,
        isLoading: false,
        error: null,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.favoriteUsersFetch,
      );
      state = state.copyWith(
        error: econaError,
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  /// 追加ロード
  Future<void> loadMoreFavoriteUsers(String? cursorId) async {
    // 初回ロード中やフッター連打抑止
    if (state.isLoading || state.isLoadingMore) return;

    // リフレッシュ
    if (cursorId == null) {
      return initialFetchData();
    }

    // 不整合防止：UIのcursorとstateのcursorが異なる場合はスキップ
    if (state.nextCursorId == null || state.nextCursorId != cursorId) {
      return;
    }

    state = state.copyWith(isLoadingMore: true);
    try {
      final response = await ref
          .read(favoriteRepositoryProvider)
          .getFavoriteUsersRawData(
            GetFavoriteUsersRequest(
              cursor: PagerRequestCursor(cursorId: cursorId, limit: _pageLimit),
            ),
          );
      final addFavoriteUsers = response.thumbnailUsers
          .map(FavoriteUser.fromResponse)
          .toList(growable: false);

      state = state.copyWith(
        favoriteUsers: [...state.favoriteUsers, ...addFavoriteUsers],
        nextCursorId: response.cursor.hasNextCursorId()
            ? response.cursor.nextCursorId
            : null,
        isLoadingMore: false,
        error: null,
      );
    } on Exception {
      rethrow;
    } finally {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  /// お気に入りユーザーを再取得
  Future<void> refreshFavoriteUsers() async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      final request = GetFavoriteUsersRequest(
        cursor: PagerRequestCursor(
          cursorId: null,
          limit: 100,
        ),
      );
      final users =
          await ref.read(favoriteRepositoryProvider).getFavoriteUsers(request);

      state = state.copyWith(
        favoriteUsers: users,
        isLoading: false,
        error: null,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.favoriteUsersFetch,
      );
      state = state.copyWith(
        isLoading: false,
        error: econaError,
      );
    }
  }

  /// お気に入り状態を更新
  Future<void> updateFavoriteStatus(
      {required String userId, required bool isFavorite}) async {
    final previousFavoriteUsers = state.favoriteUsers;

    final updatedUsers = previousFavoriteUsers
        .map((user) =>
            user.id == userId ? user.copyWith(isFavorite: isFavorite) : user)
        .toList(growable: false);

    state = state.copyWith(
      favoriteUsers: updatedUsers,
      error: null,
    );

    try {
      final request = UpdateUserFavoriteRequest(
        toUserId: userId,
        favorite: isFavorite,
      );
      await ref.read(favoriteRepositoryProvider).updateUserFavorite(request);
    } on Exception {
      // ロールバックのみ。ページ全体のerrorは設定しない
      state = state.copyWith(
        favoriteUsers: previousFavoriteUsers,
      );
      rethrow;
    }
  }

  /// いいねを送信
  Future<Matching?> sendLike({
    required FavoriteUser toUser,
    String? superLikeMessage,
  }) async {
    final previousFavoriteUsers = state.favoriteUsers;
    final updatedUsers = previousFavoriteUsers
        .map((u) => u.id == toUser.id ? u.copyWith(isLiked: true) : u)
        .toList(growable: false);
    state = state.copyWith(favoriteUsers: updatedUsers);

    try {
      final fromUserId = await ref.read(currentUserIdProvider.future);
      final response = await ref.read(matchingRepositoryProvider).createLike(
            CreateLikeRequest(
              toUserId: toUser.id,
              superLikeMessage: superLikeMessage,
            ),
          );

      AdjustEventTracker.trackLike();
      if (!response.hasChatRoomId()) {
        return null;
      }
      // Push 通知用のいいねイベントを記録（失敗してもアプリの挙動には影響させない）
      // fire-and-forget でよいため、await はしない
      // ignore: discarded_futures
      await LikeEventService.logLikeEvent(
        fromUserId: fromUserId,
        toUserId: toUser.id,
      );
      AdjustEventTracker.trackMatching();
      return Matching(
        chatRoomId: response.chatRoomId,
        myUserId: fromUserId,
        toUserId: toUser.id,
        toUserBestImageUrl:
            toUser.getBestImageUrl(ImageSize.largeThumbnailWebp) ?? '',
        isToUserMale: toUser.isMale,
      );
    } on Exception {
      state = state.copyWith(
        favoriteUsers: previousFavoriteUsers,
      );
      rethrow;
    }
  }

  /// SWRでバックグラウンドで更新
  Future<void> revalidate() async {
    if (_isRevalidating) return;
    _isRevalidating = true;
    try {
      final oldState = state;

      final response =
          await ref.read(favoriteRepositoryProvider).getFavoriteUsersRawData(
                GetFavoriteUsersRequest(
                  cursor: PagerRequestCursor(
                    cursorId: null,
                    limit: 100,
                  ),
                ),
              );

      final oldFavoriteUsers = oldState.favoriteUsers;
      final newFavoriteUsers = response.thumbnailUsers
          .map(FavoriteUser.fromResponse)
          .toList(growable: false);

      final oldCursorId = oldState.nextCursorId;
      final newCursorId = response.cursor.hasNextCursorId()
          ? response.cursor.nextCursorId
          : null;

      if (listEquals(oldFavoriteUsers, newFavoriteUsers) &&
          oldCursorId == newCursorId) {
        return;
      }

      state = state.copyWith(
        favoriteUsers: newFavoriteUsers,
        nextCursorId: newCursorId,
      );
    } on Exception catch (_) {
      // バックグラウンド更新は握りつぶす
    } finally {
      _isRevalidating = false;
    }
  }
}

final favoritePageViewModelProvider =
    StateNotifierProvider<FavoritePageViewModel, FavoritePageState>(
  FavoritePageViewModel.new,
);
