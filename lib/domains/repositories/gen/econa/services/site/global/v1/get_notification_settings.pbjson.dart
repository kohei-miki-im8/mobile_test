//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/get_notification_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getNotificationSettingsRequestDescriptor instead')
const GetNotificationSettingsRequest$json = {
  '1': 'GetNotificationSettingsRequest',
};

/// Descriptor for `GetNotificationSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationSettingsRequestDescriptor = $convert.base64Decode(
    'Ch5HZXROb3RpZmljYXRpb25TZXR0aW5nc1JlcXVlc3Q=');

@$core.Deprecated('Use getNotificationSettingsResponseDescriptor instead')
const GetNotificationSettingsResponse$json = {
  '1': 'GetNotificationSettingsResponse',
  '2': [
    {'1': 'settings', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.NotificationSettings', '10': 'settings'},
    {'1': 'email_settings', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.EmailNotificationSettings', '10': 'emailSettings'},
  ],
};

/// Descriptor for `GetNotificationSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationSettingsResponseDescriptor = $convert.base64Decode(
    'Ch9HZXROb3RpZmljYXRpb25TZXR0aW5nc1Jlc3BvbnNlEj4KCHNldHRpbmdzGAEgASgLMiIuZW'
    'NvbmEuc2hhcmVkLk5vdGlmaWNhdGlvblNldHRpbmdzUghzZXR0aW5ncxJOCg5lbWFpbF9zZXR0'
    'aW5ncxgCIAEoCzInLmVjb25hLnNoYXJlZC5FbWFpbE5vdGlmaWNhdGlvblNldHRpbmdzUg1lbW'
    'FpbFNldHRpbmdz');

