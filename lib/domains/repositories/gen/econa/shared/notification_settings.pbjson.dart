//
//  Generated code. Do not modify.
//  source: econa/shared/notification_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use notificationSettingsDescriptor instead')
const NotificationSettings$json = {
  '1': 'NotificationSettings',
  '2': [
    {'1': 'enable_push_notification', '3': 1, '4': 1, '5': 8, '10': 'enablePushNotification'},
    {'1': 'enable_push_like_notification', '3': 2, '4': 1, '5': 8, '10': 'enablePushLikeNotification'},
    {'1': 'enable_push_match_notification', '3': 3, '4': 1, '5': 8, '10': 'enablePushMatchNotification'},
    {'1': 'enable_push_message_notification', '3': 4, '4': 1, '5': 8, '10': 'enablePushMessageNotification'},
    {'1': 'enable_push_announcement_notification', '3': 5, '4': 1, '5': 8, '10': 'enablePushAnnouncementNotification'},
  ],
};

/// Descriptor for `NotificationSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationSettingsDescriptor = $convert.base64Decode(
    'ChROb3RpZmljYXRpb25TZXR0aW5ncxI4ChhlbmFibGVfcHVzaF9ub3RpZmljYXRpb24YASABKA'
    'hSFmVuYWJsZVB1c2hOb3RpZmljYXRpb24SQQodZW5hYmxlX3B1c2hfbGlrZV9ub3RpZmljYXRp'
    'b24YAiABKAhSGmVuYWJsZVB1c2hMaWtlTm90aWZpY2F0aW9uEkMKHmVuYWJsZV9wdXNoX21hdG'
    'NoX25vdGlmaWNhdGlvbhgDIAEoCFIbZW5hYmxlUHVzaE1hdGNoTm90aWZpY2F0aW9uEkcKIGVu'
    'YWJsZV9wdXNoX21lc3NhZ2Vfbm90aWZpY2F0aW9uGAQgASgIUh1lbmFibGVQdXNoTWVzc2FnZU'
    '5vdGlmaWNhdGlvbhJRCiVlbmFibGVfcHVzaF9hbm5vdW5jZW1lbnRfbm90aWZpY2F0aW9uGAUg'
    'ASgIUiJlbmFibGVQdXNoQW5ub3VuY2VtZW50Tm90aWZpY2F0aW9u');

@$core.Deprecated('Use emailNotificationSettingsDescriptor instead')
const EmailNotificationSettings$json = {
  '1': 'EmailNotificationSettings',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'enable_email_like_notification', '3': 2, '4': 1, '5': 8, '10': 'enableEmailLikeNotification'},
    {'1': 'enable_email_match_notification', '3': 3, '4': 1, '5': 8, '10': 'enableEmailMatchNotification'},
    {'1': 'enable_email_message_notification', '3': 4, '4': 1, '5': 8, '10': 'enableEmailMessageNotification'},
    {'1': 'enable_email_announcement_notification', '3': 5, '4': 1, '5': 8, '10': 'enableEmailAnnouncementNotification'},
  ],
};

/// Descriptor for `EmailNotificationSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emailNotificationSettingsDescriptor = $convert.base64Decode(
    'ChlFbWFpbE5vdGlmaWNhdGlvblNldHRpbmdzEhQKBWVtYWlsGAEgASgJUgVlbWFpbBJDCh5lbm'
    'FibGVfZW1haWxfbGlrZV9ub3RpZmljYXRpb24YAiABKAhSG2VuYWJsZUVtYWlsTGlrZU5vdGlm'
    'aWNhdGlvbhJFCh9lbmFibGVfZW1haWxfbWF0Y2hfbm90aWZpY2F0aW9uGAMgASgIUhxlbmFibG'
    'VFbWFpbE1hdGNoTm90aWZpY2F0aW9uEkkKIWVuYWJsZV9lbWFpbF9tZXNzYWdlX25vdGlmaWNh'
    'dGlvbhgEIAEoCFIeZW5hYmxlRW1haWxNZXNzYWdlTm90aWZpY2F0aW9uElMKJmVuYWJsZV9lbW'
    'FpbF9hbm5vdW5jZW1lbnRfbm90aWZpY2F0aW9uGAUgASgIUiNlbmFibGVFbWFpbEFubm91bmNl'
    'bWVudE5vdGlmaWNhdGlvbg==');

