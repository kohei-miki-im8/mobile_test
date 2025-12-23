import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/unified_setting_key.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/presentations/pages/settings/first_message_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'first_message_setting_page_view_model.g.dart';

@riverpod
class FirstMessageSettingPageViewModel
    extends _$FirstMessageSettingPageViewModel {
  @override
  Future<FirstMessageSettingPageState> build() async {
    final response = await ref.read(userRepositoryProvider).getUserSettings(
      GetUserSettingsRequest(
        settingKeys: [
          UnifiedSettingKey.UNIFIED_SETTING_KEY_INITIAL_MESSAGE,
          UnifiedSettingKey.UNIFIED_SETTING_KEY_IS_PERSONA_GREETING_DEFAULT,
        ],
      ),
    );

    final settingMap = {
      for (final pair in response.settingKeyValuePairs) pair.settingKey: pair,
    };

    final greeting =
        settingMap[UnifiedSettingKey.UNIFIED_SETTING_KEY_INITIAL_MESSAGE]?.value
            ?? '';
    final isPersonaGreetingDefault = settingMap[UnifiedSettingKey
        .UNIFIED_SETTING_KEY_IS_PERSONA_GREETING_DEFAULT]?.flag
        ?? false;

    return FirstMessageSettingPageState(
      greeting: greeting,
      isPersonaGreetingDefault: isPersonaGreetingDefault,
    );
  }

  Future<void> updateGreeting(String newGreeting) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(currentState.copyWith(greeting: newGreeting));

    try {
      await ref.read(userRepositoryProvider).updateUserSettings(
        UpdateUserSettingsRequest(
          settingKey: UnifiedSettingKey.UNIFIED_SETTING_KEY_INITIAL_MESSAGE,
          value: newGreeting,
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

  Future<void> updatePersonaGreetingDefault(bool isEnabled) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(
      currentState.copyWith(isPersonaGreetingDefault: isEnabled, error: null),
    );

    try {
      await ref.read(userRepositoryProvider).updateUserSettings(
        UpdateUserSettingsRequest(
          settingKey: UnifiedSettingKey.UNIFIED_SETTING_KEY_IS_PERSONA_GREETING_DEFAULT,
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
