//
//  Generated code. Do not modify.
//  source: econa/services/site/block/v1/get_blocked_users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getBlockedUsersRequestDescriptor instead')
const GetBlockedUsersRequest$json = {
  '1': 'GetBlockedUsersRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetBlockedUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockedUsersRequestDescriptor = $convert.base64Decode(
    'ChZHZXRCbG9ja2VkVXNlcnNSZXF1ZXN0EiYKCnRvX3VzZXJfaWQYASABKAlCCLpIBXIDsAEBUg'
    'h0b1VzZXJJZBJACgZjdXJzb3IYDyABKAsyIC5lY29uYS5zaGFyZWQuUGFnZXJSZXF1ZXN0Q3Vy'
    'c29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getBlockedUsersResponseDescriptor instead')
const GetBlockedUsersResponse$json = {
  '1': 'GetBlockedUsersResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetBlockedUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockedUsersResponseDescriptor = $convert.base64Decode(
    'ChdHZXRCbG9ja2VkVXNlcnNSZXNwb25zZRJECg90aHVtYm5haWxfdXNlcnMYASADKAsyGy5lY2'
    '9uYS5zaGFyZWQuVGh1bWJuYWlsVXNlclIOdGh1bWJuYWlsVXNlcnMSOQoGY3Vyc29yGA8gASgL'
    'MiEuZWNvbmEuc2hhcmVkLlBhZ2VyUmVzcG9uc2VDdXJzb3JSBmN1cnNvcg==');

