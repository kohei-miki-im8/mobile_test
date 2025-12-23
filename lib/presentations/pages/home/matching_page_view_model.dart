import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/entities/user_status.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/unified_setting_key.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_state.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:econa_mobile_app/presentations/shared/tags/view_models/tag_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// マッチングページのViewModel
class MatchingPageViewModel extends AutoDisposeNotifier<MatchingPageState> {
  bool _isDisposed = false;

  @override
  MatchingPageState build() {
    _isDisposed = false;
    ref.onDispose(() {
      _isDisposed = true;
    });
    return const MatchingPageState();
  }

  /// 初期化処理
  Future<void> init(String toUserId) async {
    await Future.wait([
      getUserInfo(),
      getCommonTags(toUserId),
      getInitialMessage(),
    ]);
  }

  /// ユーザー情報を取得
  Future<void> getUserInfo() async {
    if (_isDisposed) return;
    state = state.copyWith(shouldShowChatInput: const AsyncValue.loading());

    try {
      // 並列でユーザー状態とプロフィールを取得
      final responses = await Future.wait([
        ref.read(userRepositoryProvider).getUserStatus(GetUserStatusRequest()),
        ref.read(profileRepositoryProvider).getProfile(GetProfileRequest()),
      ]);

      final userStatusResponse = responses[0] as GetUserStatusResponse;
      final profileResponse = responses[1] as GetProfileResponse;

      // エンティティを作成
      final myUserId = await ref.read(currentUserIdProvider.future);
      final userStatus = UserStatus.fromUserStatusResponse(userStatusResponse);
      final profile = Profile.fromProfileResponse(
        profileResponse,
        myUserId,
      );

      // ユーザー情報を取得
      final isIdentityVerified = userStatus.isIdentityVerified;
      final isSubscribed = userStatus.isSubscribed;
      final isMale = profile.isMale;
      final myBestImageUrl =
          profile.getBestImageUrl(ImageSize.largeThumbnailWebp) ?? '';

      // チャット入力欄の表示条件を判定
      final shouldShow = _shouldShowChatInput(
        isIdentityVerified,
        isMale,
        isSubscribed,
      );

      if (_isDisposed) {
        return;
      }
      state = state.copyWith(
        shouldShowChatInput: AsyncValue.data(shouldShow),
        myBestImageUrl: AsyncValue.data(myBestImageUrl),
        isUserMale: AsyncValue.data(isMale),
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.userInfoFetch,
      );
      if (!_isDisposed) {
        state = state.copyWith(
          shouldShowChatInput: AsyncValue.error(econaError, StackTrace.current),
          myBestImageUrl: AsyncValue.error(econaError, StackTrace.current),
          isUserMale: AsyncValue.error(econaError, StackTrace.current),
        );
      }
      throw econaError;
    }
  }

  /// 共通タグを取得
  Future<void> getCommonTags(String toUserId) async {
    if (_isDisposed) return;
    state = state.copyWith(commonTags: const AsyncValue.loading());
    try {
      final myUserId = await ref.read(currentUserIdProvider.future);

      // TagViewModelのgetCommonTagsメソッドを使用して共通タグを取得
      final commonTags = await ref
          .read(tagViewModelProvider.notifier)
          .getCommonTags(myUserId, toUserId);

      if (_isDisposed) {
        return;
      }

      state = state.copyWith(
        commonTags: AsyncValue.data(commonTags),
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.commonTagsFetch,
      );
      if (!_isDisposed) {
        state = state.copyWith(
          commonTags: AsyncValue.error(econaError, StackTrace.current),
        );
      }
      throw econaError;
    }
  }

  /// 初回メッセージを取得
  Future<void> getInitialMessage() async {
    if (_isDisposed) return;
    state = state.copyWith(initialMessage: const AsyncValue.loading());
    try {
      final response = await ref.read(userRepositoryProvider).getUserSettings(
            GetUserSettingsRequest(
              settingKeys: [
                UnifiedSettingKey.UNIFIED_SETTING_KEY_INITIAL_MESSAGE,
              ],
            ),
          );

      final initialMessage = response.settingKeyValuePairs
              .where(
                (pair) =>
                    pair.settingKey ==
                    UnifiedSettingKey.UNIFIED_SETTING_KEY_INITIAL_MESSAGE,
              )
              .firstOrNull
              ?.value ??
          '';
      if (_isDisposed) {
        return;
      }
      state = state.copyWith(
        initialMessage: AsyncValue.data(initialMessage),
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.initialMessageFetch,
      );
      if (!_isDisposed) {
        state = state.copyWith(
          initialMessage: AsyncValue.error(econaError, StackTrace.current),
        );
      }
      throw econaError;
    }
  }

  /// チャット入力欄の表示条件を判定
  /// 女性: 本人確認済み
  /// 男性: 本人確認済み && サブスクリプション加入済み
  bool _shouldShowChatInput(
    bool isIdentityVerified,
    bool isMale,
    bool isSubscribed,
  ) {
    if (!isIdentityVerified) {
      return false;
    }

    if (isMale) {
      // 男性の場合: 本人確認済み && サブスクリプション加入済み
      return isSubscribed;
    } else {
      // 女性の場合: 本人確認済みのみ
      return true;
    }
  }
}

final matchingPageViewModelProvider =
    AutoDisposeNotifierProvider<MatchingPageViewModel, MatchingPageState>(
  MatchingPageViewModel.new,
);
