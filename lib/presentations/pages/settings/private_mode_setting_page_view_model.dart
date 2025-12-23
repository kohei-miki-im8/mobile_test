import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/unified_setting_key.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/presentations/pages/settings/private_mode_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'private_mode_setting_page_view_model.g.dart';

@riverpod
class PrivateModeSettingPageViewModel extends _$PrivateModeSettingPageViewModel {
  @override
  Future<PrivateModeSettingPageState> build() async {
    final response = await ref.read(userRepositoryProvider).getUserSettings(
      GetUserSettingsRequest(
        settingKeys: [
          UnifiedSettingKey.UNIFIED_SETTING_KEY_PRIVATE_MODE,
        ],
      ),
    );

    final isEnabled =
        response.settingKeyValuePairs.isNotEmpty &&
        response.settingKeyValuePairs.first.flag;

    return PrivateModeSettingPageState(enablePrivateMode: isEnabled);
  }

  Future<void> updatePrivateMode(bool isEnabled) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(
      currentState.copyWith(
        enablePrivateMode: isEnabled,
        error: null,
      ),
    );

    try {
      await ref.read(userRepositoryProvider).updateUserSettings(
        UpdateUserSettingsRequest(
          settingKey: UnifiedSettingKey.UNIFIED_SETTING_KEY_PRIVATE_MODE,
          flag: isEnabled,
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
    final current = state.valueOrNull;
    if (current == null || current.error == null) return;
    state = AsyncData(current.copyWith(error: null));
  }
}
