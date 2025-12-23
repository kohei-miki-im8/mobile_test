import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/my_page.dart';

/// マイページの状態
class MyPageState {
  const MyPageState({
    this.myPageData,
    this.isLoading = false,
    this.error,
  });

  /// 集約済みドメインエンティティ
  final MyPageData? myPageData;

  /// ローディングフラグ
  final bool isLoading;

  /// エラーメッセージ
  final EconaError? error;

  static const _unset = Object();

  MyPageState copyWith({
    MyPageData? myPageData,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return MyPageState(
      myPageData: myPageData ?? this.myPageData,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}



