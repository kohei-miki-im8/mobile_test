//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_point_history.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserPointHistoryRequestDescriptor instead')
const GetUserPointHistoryRequest$json = {
  '1': 'GetUserPointHistoryRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetUserPointHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPointHistoryRequestDescriptor = $convert.base64Decode(
    'ChpHZXRVc2VyUG9pbnRIaXN0b3J5UmVxdWVzdBJACgZjdXJzb3IYDyABKAsyIC5lY29uYS5zaG'
    'FyZWQuUGFnZXJSZXF1ZXN0Q3Vyc29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getUserPointHistoryResponseDescriptor instead')
const GetUserPointHistoryResponse$json = {
  '1': 'GetUserPointHistoryResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.econa.services.site.user.v1.PointHistoryItem', '10': 'items'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetUserPointHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPointHistoryResponseDescriptor = $convert.base64Decode(
    'ChtHZXRVc2VyUG9pbnRIaXN0b3J5UmVzcG9uc2USQwoFaXRlbXMYASADKAsyLS5lY29uYS5zZX'
    'J2aWNlcy5zaXRlLnVzZXIudjEuUG9pbnRIaXN0b3J5SXRlbVIFaXRlbXMSOQoGY3Vyc29yGA8g'
    'ASgLMiEuZWNvbmEuc2hhcmVkLlBhZ2VyUmVzcG9uc2VDdXJzb3JSBmN1cnNvcg==');

@$core.Deprecated('Use pointHistoryItemDescriptor instead')
const PointHistoryItem$json = {
  '1': 'PointHistoryItem',
  '2': [
    {'1': 'user_point_log_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userPointLogId'},
    {'1': 'point_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.PointType', '8': {}, '10': 'pointType'},
    {'1': 'is_free', '3': 3, '4': 1, '5': 8, '10': 'isFree'},
    {'1': 'amount', '3': 4, '4': 1, '5': 5, '10': 'amount'},
    {'1': 'transaction_reason', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'transactionReason'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'createdAt'},
    {'1': 'expires_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
    {'1': 'original_log_id', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'originalLogId'},
  ],
};

/// Descriptor for `PointHistoryItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointHistoryItemDescriptor = $convert.base64Decode(
    'ChBQb2ludEhpc3RvcnlJdGVtEjMKEXVzZXJfcG9pbnRfbG9nX2lkGAEgASgJQgi6SAVyA7ABAV'
    'IOdXNlclBvaW50TG9nSWQSQQoKcG9pbnRfdHlwZRgCIAEoDjIWLmVjb25hLmVudW1zLlBvaW50'
    'VHlwZUIKukgHggEEEAEgAFIJcG9pbnRUeXBlEhcKB2lzX2ZyZWUYAyABKAhSBmlzRnJlZRIWCg'
    'ZhbW91bnQYBCABKAVSBmFtb3VudBI2ChJ0cmFuc2FjdGlvbl9yZWFzb24YBSABKAlCB7pIBHIC'
    'GApSEXRyYW5zYWN0aW9uUmVhc29uEkEKCmNyZWF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wQga6SAPIAQFSCWNyZWF0ZWRBdBI5CgpleHBpcmVzX2F0GAcgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJZXhwaXJlc0F0EjAKD29yaWdpbmFsX2xvZ19pZB'
    'gIIAEoCUIIukgFcgOwAQFSDW9yaWdpbmFsTG9nSWQ=');

