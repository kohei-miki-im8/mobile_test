//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'get_announcements.pb.dart' as $34;
import 'get_notification_settings.pb.dart' as $32;
import 'get_notifications.pb.dart' as $30;
import 'mark_notifications_as_read.pb.dart' as $31;
import 'publish_notification.pb.dart' as $35;
import 'subscribe_notification_session.pb.dart' as $36;
import 'update_notification_settings.pb.dart' as $33;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.global.v1.GlobalService')
class GlobalServiceClient extends $grpc.Client {
  static final _$getNotifications = $grpc.ClientMethod<$30.GetNotificationsRequest, $30.GetNotificationsResponse>(
      '/econa.services.site.global.v1.GlobalService/GetNotifications',
      ($30.GetNotificationsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $30.GetNotificationsResponse.fromBuffer(value));
  static final _$markNotificationsAsRead = $grpc.ClientMethod<$31.MarkNotificationsAsReadRequest, $31.MarkNotificationsAsReadResponse>(
      '/econa.services.site.global.v1.GlobalService/MarkNotificationsAsRead',
      ($31.MarkNotificationsAsReadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $31.MarkNotificationsAsReadResponse.fromBuffer(value));
  static final _$getNotificationSettings = $grpc.ClientMethod<$32.GetNotificationSettingsRequest, $32.GetNotificationSettingsResponse>(
      '/econa.services.site.global.v1.GlobalService/GetNotificationSettings',
      ($32.GetNotificationSettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $32.GetNotificationSettingsResponse.fromBuffer(value));
  static final _$updateNotificationSettings = $grpc.ClientMethod<$33.UpdateNotificationSettingsRequest, $33.UpdateNotificationSettingsResponse>(
      '/econa.services.site.global.v1.GlobalService/UpdateNotificationSettings',
      ($33.UpdateNotificationSettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $33.UpdateNotificationSettingsResponse.fromBuffer(value));
  static final _$getAnnouncements = $grpc.ClientMethod<$34.GetAnnouncementsRequest, $34.GetAnnouncementsResponse>(
      '/econa.services.site.global.v1.GlobalService/GetAnnouncements',
      ($34.GetAnnouncementsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $34.GetAnnouncementsResponse.fromBuffer(value));
  static final _$publishNotification = $grpc.ClientMethod<$35.PublishNotificationRequest, $35.PublishNotificationResponse>(
      '/econa.services.site.global.v1.GlobalService/PublishNotification',
      ($35.PublishNotificationRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $35.PublishNotificationResponse.fromBuffer(value));
  static final _$subscribeNotificationSession = $grpc.ClientMethod<$36.SubscribeNotificationSessionRequest, $36.SubscribeNotificationSessionResponse>(
      '/econa.services.site.global.v1.GlobalService/SubscribeNotificationSession',
      ($36.SubscribeNotificationSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $36.SubscribeNotificationSessionResponse.fromBuffer(value));

  GlobalServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$30.GetNotificationsResponse> getNotifications($30.GetNotificationsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNotifications, request, options: options);
  }

  $grpc.ResponseFuture<$31.MarkNotificationsAsReadResponse> markNotificationsAsRead($31.MarkNotificationsAsReadRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$markNotificationsAsRead, request, options: options);
  }

  $grpc.ResponseFuture<$32.GetNotificationSettingsResponse> getNotificationSettings($32.GetNotificationSettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getNotificationSettings, request, options: options);
  }

  $grpc.ResponseFuture<$33.UpdateNotificationSettingsResponse> updateNotificationSettings($33.UpdateNotificationSettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateNotificationSettings, request, options: options);
  }

  $grpc.ResponseFuture<$34.GetAnnouncementsResponse> getAnnouncements($34.GetAnnouncementsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAnnouncements, request, options: options);
  }

  $grpc.ResponseFuture<$35.PublishNotificationResponse> publishNotification($35.PublishNotificationRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$publishNotification, request, options: options);
  }

  $grpc.ResponseStream<$36.SubscribeNotificationSessionResponse> subscribeNotificationSession($36.SubscribeNotificationSessionRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeNotificationSession, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.global.v1.GlobalService')
abstract class GlobalServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.global.v1.GlobalService';

  GlobalServiceBase() {
    $addMethod($grpc.ServiceMethod<$30.GetNotificationsRequest, $30.GetNotificationsResponse>(
        'GetNotifications',
        getNotifications_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $30.GetNotificationsRequest.fromBuffer(value),
        ($30.GetNotificationsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$31.MarkNotificationsAsReadRequest, $31.MarkNotificationsAsReadResponse>(
        'MarkNotificationsAsRead',
        markNotificationsAsRead_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $31.MarkNotificationsAsReadRequest.fromBuffer(value),
        ($31.MarkNotificationsAsReadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$32.GetNotificationSettingsRequest, $32.GetNotificationSettingsResponse>(
        'GetNotificationSettings',
        getNotificationSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $32.GetNotificationSettingsRequest.fromBuffer(value),
        ($32.GetNotificationSettingsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$33.UpdateNotificationSettingsRequest, $33.UpdateNotificationSettingsResponse>(
        'UpdateNotificationSettings',
        updateNotificationSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $33.UpdateNotificationSettingsRequest.fromBuffer(value),
        ($33.UpdateNotificationSettingsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$34.GetAnnouncementsRequest, $34.GetAnnouncementsResponse>(
        'GetAnnouncements',
        getAnnouncements_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $34.GetAnnouncementsRequest.fromBuffer(value),
        ($34.GetAnnouncementsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$35.PublishNotificationRequest, $35.PublishNotificationResponse>(
        'PublishNotification',
        publishNotification_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $35.PublishNotificationRequest.fromBuffer(value),
        ($35.PublishNotificationResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$36.SubscribeNotificationSessionRequest, $36.SubscribeNotificationSessionResponse>(
        'SubscribeNotificationSession',
        subscribeNotificationSession_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $36.SubscribeNotificationSessionRequest.fromBuffer(value),
        ($36.SubscribeNotificationSessionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$30.GetNotificationsResponse> getNotifications_Pre($grpc.ServiceCall call, $async.Future<$30.GetNotificationsRequest> request) async {
    return getNotifications(call, await request);
  }

  $async.Future<$31.MarkNotificationsAsReadResponse> markNotificationsAsRead_Pre($grpc.ServiceCall call, $async.Future<$31.MarkNotificationsAsReadRequest> request) async {
    return markNotificationsAsRead(call, await request);
  }

  $async.Future<$32.GetNotificationSettingsResponse> getNotificationSettings_Pre($grpc.ServiceCall call, $async.Future<$32.GetNotificationSettingsRequest> request) async {
    return getNotificationSettings(call, await request);
  }

  $async.Future<$33.UpdateNotificationSettingsResponse> updateNotificationSettings_Pre($grpc.ServiceCall call, $async.Future<$33.UpdateNotificationSettingsRequest> request) async {
    return updateNotificationSettings(call, await request);
  }

  $async.Future<$34.GetAnnouncementsResponse> getAnnouncements_Pre($grpc.ServiceCall call, $async.Future<$34.GetAnnouncementsRequest> request) async {
    return getAnnouncements(call, await request);
  }

  $async.Future<$35.PublishNotificationResponse> publishNotification_Pre($grpc.ServiceCall call, $async.Future<$35.PublishNotificationRequest> request) async {
    return publishNotification(call, await request);
  }

  $async.Stream<$36.SubscribeNotificationSessionResponse> subscribeNotificationSession_Pre($grpc.ServiceCall call, $async.Future<$36.SubscribeNotificationSessionRequest> request) async* {
    yield* subscribeNotificationSession(call, await request);
  }

  $async.Future<$30.GetNotificationsResponse> getNotifications($grpc.ServiceCall call, $30.GetNotificationsRequest request);
  $async.Future<$31.MarkNotificationsAsReadResponse> markNotificationsAsRead($grpc.ServiceCall call, $31.MarkNotificationsAsReadRequest request);
  $async.Future<$32.GetNotificationSettingsResponse> getNotificationSettings($grpc.ServiceCall call, $32.GetNotificationSettingsRequest request);
  $async.Future<$33.UpdateNotificationSettingsResponse> updateNotificationSettings($grpc.ServiceCall call, $33.UpdateNotificationSettingsRequest request);
  $async.Future<$34.GetAnnouncementsResponse> getAnnouncements($grpc.ServiceCall call, $34.GetAnnouncementsRequest request);
  $async.Future<$35.PublishNotificationResponse> publishNotification($grpc.ServiceCall call, $35.PublishNotificationRequest request);
  $async.Stream<$36.SubscribeNotificationSessionResponse> subscribeNotificationSession($grpc.ServiceCall call, $36.SubscribeNotificationSessionRequest request);
}
