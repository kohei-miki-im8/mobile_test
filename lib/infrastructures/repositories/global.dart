import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_announcements.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notification_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/get_notifications.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/mark_notifications_as_read.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/publish_notification.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/subscribe_notification_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/global/v1/update_notification_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/i_global_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global.g.dart';

class GlobalRepository implements IGlobalRepository {
  GlobalRepository(this._apiClient) {
    _client = _apiClient.createClient(GlobalServiceClient.new);
  }

  final ApiClient _apiClient;
  late final GlobalServiceClient _client;

  @override
  Future<GetAnnouncementsResponse> getAnnouncements(
      GetAnnouncementsRequest request) async {
    try {
      final result = await _apiClient.call<GetAnnouncementsResponse>(
        client: _client,
        method: ApiMethodUnary.getAnnouncements,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get Announcements: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get Announcements: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get Announcements: $e');
    }
  }

  @override
  Future<GetNotificationsResponse> getNotifications(
      GetNotificationsRequest request) async {
    try {
      final result = await _apiClient.call<GetNotificationsResponse>(
        client: _client,
        method: ApiMethodUnary.getNotifications,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get Notifications: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get Notifications: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get Notifications: $e');
    }
  }

  @override
  Future<GetNotificationSettingsResponse> getNotificationSettings(
      GetNotificationSettingsRequest request) async {
    try {
      final result = await _apiClient.call<GetNotificationSettingsResponse>(
        client: _client,
        method: ApiMethodUnary.getNotificationSettings,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get NotificationSettings: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get NotificationSettings: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get NotificationSettings: $e');
    }
  }

  @override
  Future<MarkNotificationsAsReadResponse> markNotificationsAsRead(
      MarkNotificationsAsReadRequest request) async {
    try {
      final result = await _apiClient.call<MarkNotificationsAsReadResponse>(
        client: _client,
        method: ApiMethodUnary.markNotificationsAsRead,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed mark NotificationsAsRead: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed mark NotificationsAsRead: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed mark NotificationsAsRead: $e');
    }
  }

  @override
  Future<PublishNotificationResponse> publishNotification(
      PublishNotificationRequest request) async {
    try {
      final result = await _apiClient.call<PublishNotificationResponse>(
        client: _client,
        method: ApiMethodUnary.publishNotification,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed publish Notification: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed publish Notification: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed publish Notification: $e');
    }
  }

  @override
  Stream<SubscribeNotificationSessionResponse> subscribeNotificationSession(
      SubscribeNotificationSessionRequest request) {
    return _apiClient.callStream<SubscribeNotificationSessionResponse>(
      client: _client,
      method: ApiMethodStream.subscribeNotificationSession,
      request: request,
    ).asyncMap((result) {
      if (result.error != null) {
        throw Exception('failed subscribe NotificationSession: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed subscribe NotificationSession: response data is null'));
    });
  }

  @override
  Future<UpdateNotificationSettingsResponse> updateNotificationSettings(
      UpdateNotificationSettingsRequest request) async {
    try {
      final result = await _apiClient.call<UpdateNotificationSettingsResponse>(
        client: _client,
        method: ApiMethodUnary.updateNotificationSettings,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update NotificationSettings: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update NotificationSettings: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update NotificationSettings: $e');
    }
  }
}

@riverpod
IGlobalRepository globalRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return GlobalRepository(apiClient);
}
