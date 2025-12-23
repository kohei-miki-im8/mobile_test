//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/mark_notifications_as_read.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use markNotificationsAsReadRequestDescriptor instead')
const MarkNotificationsAsReadRequest$json = {
  '1': 'MarkNotificationsAsReadRequest',
  '2': [
    {'1': 'notification_ids', '3': 1, '4': 3, '5': 9, '8': {}, '10': 'notificationIds'},
  ],
};

/// Descriptor for `MarkNotificationsAsReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markNotificationsAsReadRequestDescriptor = $convert.base64Decode(
    'Ch5NYXJrTm90aWZpY2F0aW9uc0FzUmVhZFJlcXVlc3QSPAoQbm90aWZpY2F0aW9uX2lkcxgBIA'
    'MoCUIRukgOkgELCAEQZCIFcgOwAQFSD25vdGlmaWNhdGlvbklkcw==');

@$core.Deprecated('Use markNotificationsAsReadResponseDescriptor instead')
const MarkNotificationsAsReadResponse$json = {
  '1': 'MarkNotificationsAsReadResponse',
  '2': [
    {'1': 'updated_count', '3': 1, '4': 1, '5': 5, '10': 'updatedCount'},
  ],
};

/// Descriptor for `MarkNotificationsAsReadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List markNotificationsAsReadResponseDescriptor = $convert.base64Decode(
    'Ch9NYXJrTm90aWZpY2F0aW9uc0FzUmVhZFJlc3BvbnNlEiMKDXVwZGF0ZWRfY291bnQYASABKA'
    'VSDHVwZGF0ZWRDb3VudA==');

