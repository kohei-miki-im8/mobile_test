import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/my_page.dart' as entity;
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// マイページのViewModel
class MyPageViewModel extends StateNotifier<MyPageState> {
  MyPageViewModel(this.ref) : super(const MyPageState()) {
    initialFetchData();
  }

  final Ref ref;
  bool _isRevalidating = false;

  /// マイページのデータを一括取得
  Future<void> initialFetchData() async {
    // 既に読み込み中であれば追加ロードを抑止
    if (state.isLoading) return;
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final userRepository = ref.read(userRepositoryProvider);
      final profileRepository = ref.read(profileRepositoryProvider);

      final userStatusResponse = await userRepository.getUserStatus(GetUserStatusRequest());
      final userPointsResponse = await userRepository.getUserPoints(GetUserPointsRequest());
      final profileResponse = await profileRepository.getProfile(GetProfileRequest());
      final subscriptionTier = await getSubscriptionTier(genderCode: profileResponse.profile.genderCode);

      final myPage = entity.MyPageData.fromResponses(
        userStatusResponse: userStatusResponse,
        userPointsResponse: userPointsResponse,
        userProfileResponse: profileResponse,
        subscriptionTier: subscriptionTier,
      );

      state = state.copyWith(
        myPageData: myPage,
      );

    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.myPageFetch,
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

  /// SWR用: 画面のローディング/エラー状態を変えずに最新化のみ行う
  Future<void> revalidate() async {
    if (_isRevalidating) return;
    _isRevalidating = true;

    try {
      final userRepository = ref.read(userRepositoryProvider);
      final profileRepository = ref.read(profileRepositoryProvider);

      final userStatusResponse = await userRepository.getUserStatus(GetUserStatusRequest());
      final userPointsResponse = await userRepository.getUserPoints(GetUserPointsRequest());
      final profileResponse = await profileRepository.getProfile(GetProfileRequest());
      final subscriptionTier = await getSubscriptionTier(genderCode: profileResponse.profile.genderCode);

      final newMyPage = entity.MyPageData.fromResponses(
        userStatusResponse: userStatusResponse,
        userPointsResponse: userPointsResponse,
        userProfileResponse: profileResponse,
        subscriptionTier: subscriptionTier,
      );

      final oldMyPage = state.myPageData;

      if (oldMyPage != null && oldMyPage == newMyPage) {
        return;
      }

      state = state.copyWith(
        myPageData: newMyPage,
      );
    } on Exception catch (_) {
      // バックグラウンド更新失敗は握りつぶす
    } finally {
      _isRevalidating = false;
    }
  }
}

final myPageViewModelProvider =
StateNotifierProvider<MyPageViewModel, MyPageState>(
  MyPageViewModel.new,
);
