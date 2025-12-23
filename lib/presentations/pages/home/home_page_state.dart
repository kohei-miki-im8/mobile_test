import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/provider_interface.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

/// ホームページの状態を表すクラス
/// 型安全と明示的nullセットを両立するためにfreezedを使用
@freezed
abstract class HomePageState
    with _$HomePageState
    implements UserDetailsProvider {
  const factory HomePageState({
    /// プロフィールデータ一覧
    @Default([]) List<Profile> profiles,

    /// ユーザー詳細データ一覧（UserDetailPageで使用）
    @Default([]) List<UserDetail> userDetails,

    /// 読み込み中フラグ
    @Default(true) bool isLoading,

    /// エラー情報
    EconaError? error,

    /// おすすめユーザーの次のカーソルID
    String? nextCursorId,

    /// スキップされたユーザーIDのセット
    @Default(<String>{}) Set<String> skippedUserIds,
  }) = _HomePageState;

  const HomePageState._();
}
