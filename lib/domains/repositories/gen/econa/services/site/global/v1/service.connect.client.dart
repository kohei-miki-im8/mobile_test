//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_notifications.pb.dart" as econaservicessiteglobalv1get_notifications;
import "service.connect.spec.dart" as specs;
import "mark_notifications_as_read.pb.dart" as econaservicessiteglobalv1mark_notifications_as_read;
import "get_notification_settings.pb.dart" as econaservicessiteglobalv1get_notification_settings;
import "update_notification_settings.pb.dart" as econaservicessiteglobalv1update_notification_settings;
import "get_announcements.pb.dart" as econaservicessiteglobalv1get_announcements;
import "publish_notification.pb.dart" as econaservicessiteglobalv1publish_notification;
import "subscribe_notification_session.pb.dart" as econaservicessiteglobalv1subscribe_notification_session;

/// グローバル機能を提供するサービスです。
extension type GlobalServiceClient (connect.Transport _transport) {
  /// GetNotifications:通知一覧取得
  Future<econaservicessiteglobalv1get_notifications.GetNotificationsResponse> getNotifications(
    econaservicessiteglobalv1get_notifications.GetNotificationsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GlobalService.getNotifications,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// MarkNotificationsAsRead:通知既読更新
  Future<econaservicessiteglobalv1mark_notifications_as_read.MarkNotificationsAsReadResponse> markNotificationsAsRead(
    econaservicessiteglobalv1mark_notifications_as_read.MarkNotificationsAsReadRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GlobalService.markNotificationsAsRead,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetNotificationSettings:通知設定取得
  Future<econaservicessiteglobalv1get_notification_settings.GetNotificationSettingsResponse> getNotificationSettings(
    econaservicessiteglobalv1get_notification_settings.GetNotificationSettingsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GlobalService.getNotificationSettings,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateNotificationSettings:通知設定更新
  Future<econaservicessiteglobalv1update_notification_settings.UpdateNotificationSettingsResponse> updateNotificationSettings(
    econaservicessiteglobalv1update_notification_settings.UpdateNotificationSettingsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GlobalService.updateNotificationSettings,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetAnnouncements:お知らせ一覧取得
  Future<econaservicessiteglobalv1get_announcements.GetAnnouncementsResponse> getAnnouncements(
    econaservicessiteglobalv1get_announcements.GetAnnouncementsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GlobalService.getAnnouncements,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// PublishNotification:通知送信（内部API）
  Future<econaservicessiteglobalv1publish_notification.PublishNotificationResponse> publishNotification(
    econaservicessiteglobalv1publish_notification.PublishNotificationRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GlobalService.publishNotification,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// SubscribeNotificationSession:通知セッション購読
  Stream<econaservicessiteglobalv1subscribe_notification_session.SubscribeNotificationSessionResponse> subscribeNotificationSession(
    econaservicessiteglobalv1subscribe_notification_session.SubscribeNotificationSessionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.GlobalService.subscribeNotificationSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
