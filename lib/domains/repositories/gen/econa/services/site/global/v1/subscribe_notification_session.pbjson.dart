//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/subscribe_notification_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use subscribeNotificationSessionRequestDescriptor instead')
const SubscribeNotificationSessionRequest$json = {
  '1': 'SubscribeNotificationSessionRequest',
  '2': [
    {'1': 'last_notification_id', '3': 1, '4': 1, '5': 9, '10': 'lastNotificationId'},
  ],
};

/// Descriptor for `SubscribeNotificationSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeNotificationSessionRequestDescriptor = $convert.base64Decode(
    'CiNTdWJzY3JpYmVOb3RpZmljYXRpb25TZXNzaW9uUmVxdWVzdBIwChRsYXN0X25vdGlmaWNhdG'
    'lvbl9pZBgBIAEoCVISbGFzdE5vdGlmaWNhdGlvbklk');

@$core.Deprecated('Use subscribeNotificationSessionResponseDescriptor instead')
const SubscribeNotificationSessionResponse$json = {
  '1': 'SubscribeNotificationSessionResponse',
  '2': [
    {'1': 'initialized', '3': 1, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.SubscribeNotificationSessionResponse.InitializedEvent', '9': 0, '10': 'initialized'},
    {'1': 'notification_received', '3': 2, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.SubscribeNotificationSessionResponse.NotificationReceivedEvent', '9': 0, '10': 'notificationReceived'},
    {'1': 'unread_count_updated', '3': 3, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.SubscribeNotificationSessionResponse.UnreadCountUpdatedEvent', '9': 0, '10': 'unreadCountUpdated'},
    {'1': 'ping', '3': 4, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.SubscribeNotificationSessionResponse.PingEvent', '9': 0, '10': 'ping'},
    {'1': 'notification_suppressed', '3': 5, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.SubscribeNotificationSessionResponse.NotificationSuppressedEvent', '9': 0, '10': 'notificationSuppressed'},
    {'1': 'is_successful', '3': 10, '4': 1, '5': 8, '10': 'isSuccessful'},
  ],
  '3': [SubscribeNotificationSessionResponse_InitializedEvent$json, SubscribeNotificationSessionResponse_NotificationReceivedEvent$json, SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent$json, SubscribeNotificationSessionResponse_PingEvent$json, SubscribeNotificationSessionResponse_NotificationSuppressedEvent$json],
  '8': [
    {'1': 'event'},
  ],
};

@$core.Deprecated('Use subscribeNotificationSessionResponseDescriptor instead')
const SubscribeNotificationSessionResponse_InitializedEvent$json = {
  '1': 'InitializedEvent',
  '2': [
    {'1': 'unread_count', '3': 1, '4': 1, '5': 5, '10': 'unreadCount'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

@$core.Deprecated('Use subscribeNotificationSessionResponseDescriptor instead')
const SubscribeNotificationSessionResponse_NotificationReceivedEvent$json = {
  '1': 'NotificationReceivedEvent',
  '2': [
    {'1': 'notification', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.Notification', '10': 'notification'},
  ],
};

@$core.Deprecated('Use subscribeNotificationSessionResponseDescriptor instead')
const SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent$json = {
  '1': 'UnreadCountUpdatedEvent',
  '2': [
    {'1': 'unread_count', '3': 1, '4': 1, '5': 5, '10': 'unreadCount'},
  ],
};

@$core.Deprecated('Use subscribeNotificationSessionResponseDescriptor instead')
const SubscribeNotificationSessionResponse_PingEvent$json = {
  '1': 'PingEvent',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
  ],
};

@$core.Deprecated('Use subscribeNotificationSessionResponseDescriptor instead')
const SubscribeNotificationSessionResponse_NotificationSuppressedEvent$json = {
  '1': 'NotificationSuppressedEvent',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'blocked_user_id', '3': 2, '4': 1, '5': 9, '10': 'blockedUserId'},
    {'1': 'chat_room_id', '3': 3, '4': 1, '5': 9, '10': 'chatRoomId'},
    {'1': 'suppressed_at', '3': 4, '4': 1, '5': 9, '10': 'suppressedAt'},
  ],
};

/// Descriptor for `SubscribeNotificationSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeNotificationSessionResponseDescriptor = $convert.base64Decode(
    'CiRTdWJzY3JpYmVOb3RpZmljYXRpb25TZXNzaW9uUmVzcG9uc2USeAoLaW5pdGlhbGl6ZWQYAS'
    'ABKAsyVC5lY29uYS5zZXJ2aWNlcy5zaXRlLmdsb2JhbC52MS5TdWJzY3JpYmVOb3RpZmljYXRp'
    'b25TZXNzaW9uUmVzcG9uc2UuSW5pdGlhbGl6ZWRFdmVudEgAUgtpbml0aWFsaXplZBKUAQoVbm'
    '90aWZpY2F0aW9uX3JlY2VpdmVkGAIgASgLMl0uZWNvbmEuc2VydmljZXMuc2l0ZS5nbG9iYWwu'
    'djEuU3Vic2NyaWJlTm90aWZpY2F0aW9uU2Vzc2lvblJlc3BvbnNlLk5vdGlmaWNhdGlvblJlY2'
    'VpdmVkRXZlbnRIAFIUbm90aWZpY2F0aW9uUmVjZWl2ZWQSjwEKFHVucmVhZF9jb3VudF91cGRh'
    'dGVkGAMgASgLMlsuZWNvbmEuc2VydmljZXMuc2l0ZS5nbG9iYWwudjEuU3Vic2NyaWJlTm90aW'
    'ZpY2F0aW9uU2Vzc2lvblJlc3BvbnNlLlVucmVhZENvdW50VXBkYXRlZEV2ZW50SABSEnVucmVh'
    'ZENvdW50VXBkYXRlZBJjCgRwaW5nGAQgASgLMk0uZWNvbmEuc2VydmljZXMuc2l0ZS5nbG9iYW'
    'wudjEuU3Vic2NyaWJlTm90aWZpY2F0aW9uU2Vzc2lvblJlc3BvbnNlLlBpbmdFdmVudEgAUgRw'
    'aW5nEpoBChdub3RpZmljYXRpb25fc3VwcHJlc3NlZBgFIAEoCzJfLmVjb25hLnNlcnZpY2VzLn'
    'NpdGUuZ2xvYmFsLnYxLlN1YnNjcmliZU5vdGlmaWNhdGlvblNlc3Npb25SZXNwb25zZS5Ob3Rp'
    'ZmljYXRpb25TdXBwcmVzc2VkRXZlbnRIAFIWbm90aWZpY2F0aW9uU3VwcHJlc3NlZBIjCg1pc1'
    '9zdWNjZXNzZnVsGAogASgIUgxpc1N1Y2Nlc3NmdWwaVAoQSW5pdGlhbGl6ZWRFdmVudBIhCgx1'
    'bnJlYWRfY291bnQYASABKAVSC3VucmVhZENvdW50Eh0KCnNlc3Npb25faWQYAiABKAlSCXNlc3'
    'Npb25JZBpbChlOb3RpZmljYXRpb25SZWNlaXZlZEV2ZW50Ej4KDG5vdGlmaWNhdGlvbhgBIAEo'
    'CzIaLmVjb25hLnNoYXJlZC5Ob3RpZmljYXRpb25SDG5vdGlmaWNhdGlvbho8ChdVbnJlYWRDb3'
    'VudFVwZGF0ZWRFdmVudBIhCgx1bnJlYWRfY291bnQYASABKAVSC3VucmVhZENvdW50GikKCVBp'
    'bmdFdmVudBIcCgl0aW1lc3RhbXAYASABKANSCXRpbWVzdGFtcBqlAQobTm90aWZpY2F0aW9uU3'
    'VwcHJlc3NlZEV2ZW50EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBImCg9ibG9ja2VkX3VzZXJf'
    'aWQYAiABKAlSDWJsb2NrZWRVc2VySWQSIAoMY2hhdF9yb29tX2lkGAMgASgJUgpjaGF0Um9vbU'
    'lkEiMKDXN1cHByZXNzZWRfYXQYBCABKAlSDHN1cHByZXNzZWRBdEIHCgVldmVudA==');

