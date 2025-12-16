import 'package:econa_mobile_app/core/errors/econa_error.dart';

class NotificationSettingPageState {
  const NotificationSettingPageState({
    this.pushNoticeEnabled = true,
    this.pushNoticeLikeEnabled = true,
    this.pushNoticeMatchEnabled = false,
    this.pushNoticeMessageEnabled = true,
    this.pushNoticeAnnouncementEnabled = true,
    this.email = '',
    this.emailLikeEnabled = true,
    this.emailMatchEnabled = false,
    this.emailMessageEnabled = true,
    this.emailAnnouncementEnabled = true,
    this.error,
  });

  final bool pushNoticeEnabled;
  final bool pushNoticeLikeEnabled;
  final bool pushNoticeMatchEnabled;
  final bool pushNoticeMessageEnabled;
  final bool pushNoticeAnnouncementEnabled;
  final String email;
  final bool emailLikeEnabled;
  final bool emailMatchEnabled;
  final bool emailMessageEnabled;
  final bool emailAnnouncementEnabled;
  final EconaError? error;

  static const _unset = Object();

  NotificationSettingPageState copyWith({
    bool? pushNoticeEnabled,
    bool? pushNoticeLikeEnabled,
    bool? pushNoticeMatchEnabled,
    bool? pushNoticeMessageEnabled,
    bool? pushNoticeAnnouncementEnabled,
    String? email,
    bool? emailLikeEnabled,
    bool? emailMatchEnabled,
    bool? emailMessageEnabled,
    bool? emailAnnouncementEnabled,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
    ? this.error
    : error as EconaError?;

    return NotificationSettingPageState(
      pushNoticeEnabled: pushNoticeEnabled ?? this.pushNoticeEnabled,
      pushNoticeLikeEnabled:
          pushNoticeLikeEnabled ?? this.pushNoticeLikeEnabled,
      pushNoticeMatchEnabled:
          pushNoticeMatchEnabled ?? this.pushNoticeMatchEnabled,
      pushNoticeMessageEnabled:
          pushNoticeMessageEnabled ?? this.pushNoticeMessageEnabled,
      pushNoticeAnnouncementEnabled:
          pushNoticeAnnouncementEnabled ?? this.pushNoticeAnnouncementEnabled,
      email: email ?? this.email,
      emailLikeEnabled: emailLikeEnabled ?? this.emailLikeEnabled,
      emailMatchEnabled: emailMatchEnabled ?? this.emailMatchEnabled,
      emailMessageEnabled: emailMessageEnabled ?? this.emailMessageEnabled,
      emailAnnouncementEnabled:
          emailAnnouncementEnabled ?? this.emailAnnouncementEnabled,
      error: newError,

    );
  }
}
