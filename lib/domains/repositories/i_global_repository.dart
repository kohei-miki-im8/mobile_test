import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_announcements.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notification_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notifications.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/mark_notifications_as_read.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/publish_notification.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/subscribe_notification_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/update_notification_settings.pb.dart';

abstract class IGlobalRepository {
  Future<GetAnnouncementsResponse> getAnnouncements(
      GetAnnouncementsRequest request);
  Future<GetNotificationsResponse> getNotifications(
      GetNotificationsRequest request);
  Future<GetNotificationSettingsResponse> getNotificationSettings(
      GetNotificationSettingsRequest request);
  Future<MarkNotificationsAsReadResponse> markNotificationsAsRead(
      MarkNotificationsAsReadRequest request);
  Future<PublishNotificationResponse> publishNotification(
      PublishNotificationRequest request);
  Stream<SubscribeNotificationSessionResponse> subscribeNotificationSession(
      SubscribeNotificationSessionRequest request);
  Future<UpdateNotificationSettingsResponse> updateNotificationSettings(
      UpdateNotificationSettingsRequest request);
}
