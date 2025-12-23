import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/subscription_status.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/current_plan_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 現在のプランページのViewModel
class CurrentPlanPageViewModel extends StateNotifier<CurrentPlanPageState> {
  CurrentPlanPageViewModel(this.ref) : super(const CurrentPlanPageState()) {
    initialFetchData();
  }

  final Ref ref;
  bool _isRevalidating = false;

  /// 初回データロード
  Future<void> initialFetchData() async {
    // 既に読み込み中であれば追加ロードを抑止
    if (state.isLoading) return;
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final userRepo = ref.read(userRepositoryProvider);
      final profileRepo = ref.read(profileRepositoryProvider);

      // プロフィールとユーザーステータスを並列取得
      final results = await Future.wait([
        profileRepo.getProfile(GetProfileRequest()),
        userRepo.getUserStatus(GetUserStatusRequest()),
      ]);

      final profileResponse = results[0] as GetProfileResponse;
      final userStatusResponse = results[1] as GetUserStatusResponse;
      final profile = profileResponse.profile;
      final userStatus = userStatusResponse.userStatus;

      // RevenueCatから最新のサブスクリプション情報を取得
      // 常にgetSubscriptionTierを使用して最新情報を取得
      final genderCode = profile.genderCode;
      final subscriptionTier = await getSubscriptionTier(genderCode: genderCode);
      final plan = SubscriptionPlan.fromSubscriptionTier(subscriptionTier);

      // 有効期限を取得
      final remainingDays = await RevenueCatService.getRemainingDays();

      state = state.copyWith(
        subscriptionStatus: SubscriptionStatus(
          plan: plan,
          remainingDays: remainingDays,
          gender: genderCode,
        ),
      );
    } catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.subscriptionPlanFetch,
      );
      state = state.copyWith(
        subscriptionStatus: const SubscriptionStatus(
          plan: SubscriptionPlan.unspecified,
          remainingDays: 0,
          gender: GenderCode.GENDER_CODE_UNSPECIFIED,
        ),
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
      final userRepo = ref.read(userRepositoryProvider);
      final profileRepo = ref.read(profileRepositoryProvider);

      final results = await Future.wait([
        profileRepo.getProfile(GetProfileRequest()),
        userRepo.getUserStatus(GetUserStatusRequest()),
      ]);

      final profileResponse = results[0] as GetProfileResponse;
      final userStatusResponse = results[1] as GetUserStatusResponse;
      final profile = profileResponse.profile;

      // 常にgetSubscriptionTierを使用して最新情報を取得
      final genderCode = profile.genderCode;
      final subscriptionTier = await getSubscriptionTier(genderCode: genderCode);
      final plan = SubscriptionPlan.fromSubscriptionTier(subscriptionTier);

      // 有効期限を取得
      final remainingDays = await RevenueCatService.getRemainingDays();

      final newSubscriptionStatus = SubscriptionStatus(
        plan: plan,
        remainingDays: remainingDays,
        gender: genderCode,
      );

      final oldSubscriptionStatus = state.subscriptionStatus;

      if (oldSubscriptionStatus != null &&
          oldSubscriptionStatus.plan == newSubscriptionStatus.plan &&
          oldSubscriptionStatus.remainingDays == newSubscriptionStatus.remainingDays) {
        return;
      }

      state = state.copyWith(
        subscriptionStatus: newSubscriptionStatus,
      );
    } catch (_) {
      // バックグラウンド更新失敗は握りつぶす
    } finally {
      _isRevalidating = false;
    }
  }

  /// エラーをクリア
  void clearError() {
    state = state.copyWith(error: null);
  }
}

final currentPlanPageViewModelProvider =
StateNotifierProvider<CurrentPlanPageViewModel, CurrentPlanPageState>(
  CurrentPlanPageViewModel.new,
);