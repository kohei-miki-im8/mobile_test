//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/update_notification_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateNotificationSettingsRequestDescriptor instead')
const UpdateNotificationSettingsRequest$json = {
  '1': 'UpdateNotificationSettingsRequest',
  '2': [
    {'1': 'notification_type', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.NotificationType', '8': {}, '10': 'notificationType'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '8': {}, '9': 0, '10': 'email'},
    {'1': 'notification_flag', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'notificationFlag'},
  ],
  '7': {},
  '8': [
    {'1': 'value', '2': {}},
  ],
};

/// Descriptor for `UpdateNotificationSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotificationSettingsRequestDescriptor = $convert.base64Decode(
    'CiFVcGRhdGVOb3RpZmljYXRpb25TZXR0aW5nc1JlcXVlc3QSVgoRbm90aWZpY2F0aW9uX3R5cG'
    'UYASABKA4yHS5lY29uYS5lbnVtcy5Ob3RpZmljYXRpb25UeXBlQgq6SAeCAQQQASAAUhBub3Rp'
    'ZmljYXRpb25UeXBlEiIKBWVtYWlsGAIgASgJQgq6SAdyBRjAAmABSABSBWVtYWlsEi0KEW5vdG'
    'lmaWNhdGlvbl9mbGFnGAMgASgISABSEG5vdGlmaWNhdGlvbkZsYWc62QG6SNUBGtIBCi9ub3Rp'
    'ZmljYXRpb24uc2V0dGluZ3MucHJvZmlsZV9hcHByb3ZhbC5yZXF1aXJlZBI544OX44Ot44OV44'
    'Kj44O844Or5a+p5p+76YCa55+l44Gv54Sh5Yq55YyW44Gn44GN44G+44Gb44KTGmQhKHRoaXMu'
    'bm90aWZpY2F0aW9uX3R5cGUgaW4gWzExLCAxMiwgMTNdKSB8fCAoaGFzKHRoaXMubm90aWZpY2'
    'F0aW9uX2ZsYWcpICYmIHRoaXMubm90aWZpY2F0aW9uX2ZsYWcpQg4KBXZhbHVlEgW6SAIIAQ==');

@$core.Deprecated('Use updateNotificationSettingsResponseDescriptor instead')
const UpdateNotificationSettingsResponse$json = {
  '1': 'UpdateNotificationSettingsResponse',
};

/// Descriptor for `UpdateNotificationSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNotificationSettingsResponseDescriptor = $convert.base64Decode(
    'CiJVcGRhdGVOb3RpZmljYXRpb25TZXR0aW5nc1Jlc3BvbnNl');

