import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/footprint.dart' as entity;
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/favorite.dart';
import 'package:econa_mobile_app/presentations/pages/footprint/footprint_page_state.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/footprint/v1/get_footprints.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/footprint.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FootprintPageViewModel extends StateNotifier<FootprintPageState> {
  FootprintPageViewModel(this.ref) : super(const FootprintPageState()) {
    // 画面遷移時に確実に初回ロードを行う
    loadMore(null);
  }

  final Ref ref;

  /// 足あと一覧を取得
  Future<void> loadMore(String? cursorId) async {
    try {
      if (cursorId == state.cursorId && cursorId != null) {
        return;
      }
      state = state.copyWith(isLoading: true, error: null);
      final repo = ref.read(footprintRepositoryProvider);
      final res = await repo.getFootprints(
        GetFootprintsRequest(
          cursor: (cursorId != null)
              ? (PagerRequestCursor(cursorId: cursorId, limit: 20))
              : PagerRequestCursor(limit: 20),
        ),
      );

      final users = res.thumbnailUsers;
      final newItems =
          users.map<entity.Footprint>(_convert)
          .toList(growable: false);
      final newDates =
          users.map<String>(_extractDisplayDate)
          .toList(growable: false);

      state = state.copyWith(
        isLoading: false,
        items: [...state.items, ...newItems],
        displayDates: [...state.displayDates, ...newDates],
        cursorId: res.cursor.hasNextCursorId() ? res.cursor.nextCursorId : null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  /// ThumbnailUserをドメインエンティティ(Footprint)に変換
  entity.Footprint _convert(ThumbnailUser u) => entity.Footprint.fromProto(u);

  /// 表示用日付を抽出
  String _extractDisplayDate(ThumbnailUser u) {
    DateTime? dt;
    if (u.hasLike() && u.like.hasCreatedAt()) {
      dt = u.like.createdAt.toDateTime().toLocal();
    } else if (u.hasLastActivityAt()) {
      dt = u.lastActivityAt.toDateTime().toLocal();
    }
    if (dt == null) return '';
    const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
    final w = weekdays[(dt.weekday - 1) % 7];
    return '${dt.month}月${dt.day}日（$w）';
  }

  Future<void> updateFavorite({required String userId, required bool favorite}) async {
    try {
      final repo = ref.read(favoriteRepositoryProvider);
      await repo.updateUserFavorite(UpdateUserFavoriteRequest(
        toUserId: userId,
        favorite: favorite,
      ));
      final updatedFavoriteUserIds = Set<String>.from(state.favoriteUserIds);
      if (favorite) {
        updatedFavoriteUserIds.add(userId);
      } else {
        updatedFavoriteUserIds.remove(userId);
      }
      state = state.copyWith(favoriteUserIds: updatedFavoriteUserIds);
    } catch (e) {
      state = state.copyWith(
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }
}

final footprintPageViewModelProvider =
    StateNotifierProvider<FootprintPageViewModel, FootprintPageState>(
  FootprintPageViewModel.new,
);
