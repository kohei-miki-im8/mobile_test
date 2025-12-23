import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';

/// ページ内での状態変化を管理するためのユーザーデータクラス
class HideUser {
  const HideUser({
    required this.user,
    required this.isHidden,
  });

  final ThumbnailUser user;
  final bool isHidden; // このページ内での一時的な非表示状態

  HideUser copyWith({
    ThumbnailUser? user,
    bool? isHidden,
  }) {
    return HideUser(
      user: user ?? this.user,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}

class HideUserSettingPageState {
  const HideUserSettingPageState({
    this.users = const [],
    this.nextCursorId,
    this.isLoadingMore = false,
    this.error,
  });

  final List<HideUser> users;
  final String? nextCursorId;
  final bool isLoadingMore;
  final EconaError? error;

  static const _unset = Object();

  HideUserSettingPageState copyWith({
    List<HideUser>? users,
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

    return HideUserSettingPageState(
      users: users ?? this.users,
      nextCursorId: newNextCursorId,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      error: newError,
    );
  }
}
