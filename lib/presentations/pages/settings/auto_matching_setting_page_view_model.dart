import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/unified_setting_key.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/pages/settings/auto_matching_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auto_matching_setting_page_view_model.g.dart';

@riverpod
class AutoMatchingSettingPageViewModel extends _$AutoMatchingSettingPageViewModel {
  @override
  Future<AutoMatchingSettingPageState> build() async {
    final response = await ref.read(userRepositoryProvider).getUserSettings(
      GetUserSettingsRequest(
        settingKeys: [
          UnifiedSettingKey.UNIFIED_SETTING_KEY_AUTO_MATCHING,
        ],
      ),
    );

    final enableAutoMatching =
        response.settingKeyValuePairs.isNotEmpty &&
        response.settingKeyValuePairs.first.flag;

    return AutoMatchingSettingPageState(
      enableAutoMatching: enableAutoMatching,
    );
  }


  Future<void> updateAutoMatching({required bool isEnabled}) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    // 楽観更新
    state = AsyncData(currentState.copyWith(enableAutoMatching: isEnabled));

    try {
      await ref.read(userRepositoryProvider).updateUserSettings(
        UpdateUserSettingsRequest(
          settingKey: UnifiedSettingKey.UNIFIED_SETTING_KEY_AUTO_MATCHING,
          flag: isEnabled,
        ),
      );
    } catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.configuration,
      );
      state = AsyncData(
        currentState.copyWith(error: econaError),
      );
      rethrow;
    }
  }

  void clearError() {
    final currentState = state.valueOrNull;
    if (currentState == null || currentState.error == null) return;
    state = AsyncData(currentState.copyWith(error: null));
  }
}
