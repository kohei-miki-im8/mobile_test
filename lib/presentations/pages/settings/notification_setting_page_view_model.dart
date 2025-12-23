import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/notification_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notification_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/update_notification_settings.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/global.dart';
import 'package:econa_mobile_app/presentations/pages/settings/notification_setting_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_setting_page_view_model.g.dart';

@riverpod
class NotificationSettingPageViewModel extends _$NotificationSettingPageViewModel {
  @override
  Future<NotificationSettingPageState> build() async {
    final response = await ref.read(globalRepositoryProvider)
        .getNotificationSettings(GetNotificationSettingsRequest());

    final pushSettings = response.settings;
    final emailSettings = response.emailSettings;

    return NotificationSettingPageState(
      pushNoticeEnabled: pushSettings.enablePushNotification,
      pushNoticeLikeEnabled: pushSettings.enablePushLikeNotification,
      pushNoticeMatchEnabled: pushSettings.enablePushMatchNotification,
      pushNoticeMessageEnabled: pushSettings.enablePushMessageNotification,
      pushNoticeAnnouncementEnabled: pushSettings.enablePushAnnouncementNotification,
      email: emailSettings.email,
      emailLikeEnabled: emailSettings.enableEmailLikeNotification,
      emailMatchEnabled: emailSettings.enableEmailMatchNotification,
      emailMessageEnabled: emailSettings.enableEmailMessageNotification,
      emailAnnouncementEnabled: emailSettings.enableEmailAnnouncementNotification,
    );
  }

  Future<void> updateSetting(NotificationType key, bool isEnabled) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    state = AsyncData(_mapToState(currentState, key, isEnabled));

    try {
      await ref.read(globalRepositoryProvider).updateNotificationSettings(
        UpdateNotificationSettingsRequest(
          notificationType: key,
          notificationFlag: isEnabled,
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

  NotificationSettingPageState _mapToState(
    NotificationSettingPageState currentState,
    NotificationType type,
    bool isEnabled,
  ) {
    switch (type) {
      case NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE:
        return currentState.copyWith(pushNoticeEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_LIKE:
        return currentState.copyWith(pushNoticeLikeEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_MATCH:
        return currentState.copyWith(pushNoticeMatchEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_MESSAGE:
        return currentState.copyWith(pushNoticeMessageEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE_ANNOUNCEMENT:
        return currentState.copyWith(pushNoticeAnnouncementEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_LIKE:
        return currentState.copyWith(emailLikeEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_MATCH:
        return currentState.copyWith(emailMatchEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_MESSAGE:
        return currentState.copyWith(emailMessageEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE_ANNOUNCEMENT:
        return currentState.copyWith(emailAnnouncementEnabled: isEnabled);
      case NotificationType.NOTIFICATION_TYPE_EMAIL_NOTICE:
      case NotificationType.NOTIFICATION_TYPE_PROFILE_INTRODUCTORY_APPROVAL:
      case NotificationType.NOTIFICATION_TYPE_PROFILE_NICKNAME_APPROVAL:
      case NotificationType.NOTIFICATION_TYPE_PROFILE_PHOTO_APPROVAL:
      case NotificationType.NOTIFICATION_TYPE_UNSPECIFIED:
        return currentState;
    }
    return currentState;
  }

  void clearError() {
    final current = state.valueOrNull;
    if (current == null || current.error == null) return;
    state = AsyncData(current.copyWith(error: null));
  }
}
