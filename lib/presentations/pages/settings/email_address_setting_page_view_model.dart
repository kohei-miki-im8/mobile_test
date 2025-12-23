import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/infrastructures/repositories/global.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/notification_type.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notification_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/update_notification_settings.pb.dart';
import 'package:econa_mobile_app/presentations/pages/settings/email_address_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_address_setting_page_view_model.g.dart';

@riverpod
class EmailAddressSettingPageViewModel extends _$EmailAddressSettingPageViewModel {
  @override
  Future<EmailAddressSettingPageState> build() async {
    final response = await ref.read(globalRepositoryProvider)
        .getNotificationSettings(GetNotificationSettingsRequest());

    return EmailAddressSettingPageState(
      eMailAddress: response.emailSettings.email,
    );
  }

  Future<void> updateEmail(String email) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(currentState.copyWith(eMailAddress: email, error: null));

    try {
      await ref.read(globalRepositoryProvider).updateNotificationSettings(
        UpdateNotificationSettingsRequest(
          notificationType: NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE,
          email: email,
        ),
      );
    } catch (e) {
      // ロールバック＋エラー保持
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
