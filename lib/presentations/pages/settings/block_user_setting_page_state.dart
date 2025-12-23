import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';

/// ページ内での状態変化を管理するためのユーザーデータクラス
class BlockUser {
  const BlockUser({
    required this.user,
    required this.isBlocked,
  });

  final ThumbnailUser user;
  final bool isBlocked;

  BlockUser copyWith({
    ThumbnailUser? user,
    bool? isBlocked,
  }) {
    return BlockUser(
      user: user ?? this.user,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }
}

class BlockUserSettingPageState {
  const BlockUserSettingPageState({
    this.users = const [],
    this.nextCursorId,
    this.isLoadingMore = false,
    this.error,
  });

  final List<BlockUser> users;
  final String? nextCursorId;
  final bool isLoadingMore;
  final EconaError? error;

  static const _unset = Object();

  BlockUserSettingPageState copyWith({
    List<BlockUser>? users,
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

    return BlockUserSettingPageState(
      users: users ?? this.users,
      nextCursorId: newNextCursorId,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: newError,
    );
  }
}
