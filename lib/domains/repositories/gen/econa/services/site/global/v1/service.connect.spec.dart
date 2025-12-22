//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_notifications.pb.dart" as econaservicessiteglobalv1get_notifications;
import "mark_notifications_as_read.pb.dart" as econaservicessiteglobalv1mark_notifications_as_read;
import "get_notification_settings.pb.dart" as econaservicessiteglobalv1get_notification_settings;
import "update_notification_settings.pb.dart" as econaservicessiteglobalv1update_notification_settings;
import "get_announcements.pb.dart" as econaservicessiteglobalv1get_announcements;
import "publish_notification.pb.dart" as econaservicessiteglobalv1publish_notification;
import "subscribe_notification_session.pb.dart" as econaservicessiteglobalv1subscribe_notification_session;

/// グローバル機能を提供するサービスです。
abstract final class GlobalService {
  /// Fully-qualified name of the GlobalService service.
  static const name = 'econa.services.site.global.v1.GlobalService';

  /// GetNotifications:通知一覧取得
  static const getNotifications = connect.Spec(
    '/$name/GetNotifications',
    connect.StreamType.unary,
    econaservicessiteglobalv1get_notifications.GetNotificationsRequest.new,
    econaservicessiteglobalv1get_notifications.GetNotificationsResponse.new,
  );

  /// MarkNotificationsAsRead:通知既読更新
  static const markNotificationsAsRead = connect.Spec(
    '/$name/MarkNotificationsAsRead',
    connect.StreamType.unary,
    econaservicessiteglobalv1mark_notifications_as_read.MarkNotificationsAsReadRequest.new,
    econaservicessiteglobalv1mark_notifications_as_read.MarkNotificationsAsReadResponse.new,
  );

  /// GetNotificationSettings:通知設定取得
  static const getNotificationSettings = connect.Spec(
    '/$name/GetNotificationSettings',
    connect.StreamType.unary,
    econaservicessiteglobalv1get_notification_settings.GetNotificationSettingsRequest.new,
    econaservicessiteglobalv1get_notification_settings.GetNotificationSettingsResponse.new,
  );

  /// UpdateNotificationSettings:通知設定更新
  static const updateNotificationSettings = connect.Spec(
    '/$name/UpdateNotificationSettings',
    connect.StreamType.unary,
    econaservicessiteglobalv1update_notification_settings.UpdateNotificationSettingsRequest.new,
    econaservicessiteglobalv1update_notification_settings.UpdateNotificationSettingsResponse.new,
  );

  /// GetAnnouncements:お知らせ一覧取得
  static const getAnnouncements = connect.Spec(
    '/$name/GetAnnouncements',
    connect.StreamType.unary,
    econaservicessiteglobalv1get_announcements.GetAnnouncementsRequest.new,
    econaservicessiteglobalv1get_announcements.GetAnnouncementsResponse.new,
  );

  /// PublishNotification:通知送信（内部API）
  static const publishNotification = connect.Spec(
    '/$name/PublishNotification',
    connect.StreamType.unary,
    econaservicessiteglobalv1publish_notification.PublishNotificationRequest.new,
    econaservicessiteglobalv1publish_notification.PublishNotificationResponse.new,
  );

  /// SubscribeNotificationSession:通知セッション購読
  static const subscribeNotificationSession = connect.Spec(
    '/$name/SubscribeNotificationSession',
    connect.StreamType.server,
    econaservicessiteglobalv1subscribe_notification_session.SubscribeNotificationSessionRequest.new,
    econaservicessiteglobalv1subscribe_notification_session.SubscribeNotificationSessionResponse.new,
  );
}
