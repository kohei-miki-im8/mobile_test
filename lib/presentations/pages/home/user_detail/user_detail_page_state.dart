import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:flutter/foundation.dart';

/// ユーザー詳細ページの状態を管理するクラス
@immutable
class UserDetailPageState {
  const UserDetailPageState({
    this.userDetail,
    this.isLoading = false,
    this.error,
  });

  /// 表示中のユーザー
  final UserDetail? userDetail;

  /// ローディング状態
  final bool isLoading;

  /// エラー情報
  final EconaError? error;

  /// コピーメソッド
  UserDetailPageState copyWith({
    UserDetail? userDetail,
    bool? isLoading,
  }) {
    return UserDetailPageState(
      userDetail: userDetail ?? this.userDetail,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  /// エラーを設定する
  UserDetailPageState setError(EconaError error) {
    return UserDetailPageState(
      userDetail: userDetail,
      isLoading: isLoading,
      error: error,
    );
  }

  /// エラーをクリアする
  UserDetailPageState clearError() {
    return UserDetailPageState(
      userDetail: userDetail,
      isLoading: isLoading,
      error: null,
    );
  }

  /// ユーザーが設定されているかどうか
  bool get hasUser => userDetail != null;

  /// エラーが発生しているかどうか
  bool get hasError => error != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserDetailPageState &&
        other.userDetail == userDetail &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  @override
  int get hashCode {
    return Object.hash(
      userDetail,
      isLoading,
      error,
    );
  }

  @override
  String toString() {
    return 'UserDetailPageState('
        'userDetail: $userDetail, '
        'isLoading: $isLoading, '
        'error: $error)';
  }
}
