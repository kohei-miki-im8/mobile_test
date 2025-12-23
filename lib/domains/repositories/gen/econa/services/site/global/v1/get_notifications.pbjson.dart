//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/get_notifications.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getNotificationsRequestDescriptor instead')
const GetNotificationsRequest$json = {
  '1': 'GetNotificationsRequest',
  '2': [
    {'1': 'notification_type', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.NotificationType', '8': {}, '10': 'notificationType'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetNotificationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationsRequestDescriptor = $convert.base64Decode(
    'ChdHZXROb3RpZmljYXRpb25zUmVxdWVzdBJWChFub3RpZmljYXRpb25fdHlwZRgBIAEoDjIdLm'
    'Vjb25hLmVudW1zLk5vdGlmaWNhdGlvblR5cGVCCrpIB4IBBBABIABSEG5vdGlmaWNhdGlvblR5'
    'cGUSQAoGY3Vyc29yGA8gASgLMiAuZWNvbmEuc2hhcmVkLlBhZ2VyUmVxdWVzdEN1cnNvckIGuk'
    'gDyAEBUgZjdXJzb3I=');

@$core.Deprecated('Use getNotificationsResponseDescriptor instead')
const GetNotificationsResponse$json = {
  '1': 'GetNotificationsResponse',
  '2': [
    {'1': 'notifications', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.Notification', '10': 'notifications'},
    {'1': 'unread_count', '3': 2, '4': 1, '5': 5, '10': 'unreadCount'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetNotificationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNotificationsResponseDescriptor = $convert.base64Decode(
    'ChhHZXROb3RpZmljYXRpb25zUmVzcG9uc2USQAoNbm90aWZpY2F0aW9ucxgBIAMoCzIaLmVjb2'
    '5hLnNoYXJlZC5Ob3RpZmljYXRpb25SDW5vdGlmaWNhdGlvbnMSIQoMdW5yZWFkX2NvdW50GAIg'
    'ASgFUgt1bnJlYWRDb3VudBI5CgZjdXJzb3IYDyABKAsyIS5lY29uYS5zaGFyZWQuUGFnZXJSZX'
    'Nwb25zZUN1cnNvclIGY3Vyc29y');

