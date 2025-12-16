import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/favorite_user.dart';
import 'package:econa_mobile_app/domains/entities/like.dart';

/// お気に入りページの状態
class FavoritePageState {
  const FavoritePageState({
    this.favoriteUsers = const <FavoriteUser>[],
    this.isLoadingMore = false,
    this.nextCursorId,
    this.isLoading = true,
    this.error,
  });

  /// お気に入りユーザーリスト
  final List<FavoriteUser> favoriteUsers;

  /// 追加ロード中か
  final bool isLoadingMore;

  /// 次ページ取得用カーソル
  final String? nextCursorId;

  /// ロード中か
  final bool isLoading;

  /// エラーメッセージ
  final EconaError? error;

  static const _unset = Object();

  FavoritePageState copyWith({
    List<FavoriteUser>? favoriteUsers,
    bool? isLoadingMore,
    Object? nextCursorId = _unset,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newNextCursorId = identical(nextCursorId, _unset)
        ? this.nextCursorId
        : nextCursorId as String?;

    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return FavoritePageState(
      favoriteUsers: favoriteUsers ?? this.favoriteUsers,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      nextCursorId: newNextCursorId,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}


