import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/unified_setting_key.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/pages/settings/like_receive_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_receive_setting_page_view_model.g.dart';

@riverpod
class LikeReceiveSettingPageViewModel extends _$LikeReceiveSettingPageViewModel {
  @override
  Future<LikeReceiveSettingPageState> build() async {
    final response = await ref.read(userRepositoryProvider).getUserSettings(
      GetUserSettingsRequest(
        settingKeys: [
          UnifiedSettingKey.UNIFIED_SETTING_KEY_LIKE_RECEIVE_LIMIT,
        ],
      ),
    );

    final String likeReceiveLimit;
    final value = response.settingKeyValuePairs.first.value;
    if (value == 'unlimited') {
      likeReceiveLimit = '無制限';
    } else {
      likeReceiveLimit = value;
    }

    return LikeReceiveSettingPageState(
      likeReceiveLimitLabel: likeReceiveLimit,
    );
  }

  Future<void> updateLikeReceiveLimit(String newValue) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(
      currentState.copyWith(likeReceiveLimitLabel: newValue, error: null),
    );

    try {
      await ref.read(userRepositoryProvider).updateUserSettings(
        UpdateUserSettingsRequest(
          settingKey: UnifiedSettingKey.UNIFIED_SETTING_KEY_LIKE_RECEIVE_LIMIT,
          value: newValue,
        ),
      );
    } catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.configuration,
      );
      state = AsyncData(currentState.copyWith(error: econaError));
      rethrow;
    }
  }

  void clearError() {
    final currentState = state.valueOrNull;
    if (currentState == null || currentState.error == null) return;
    state = AsyncData(currentState.copyWith(error: null));
  }
}
