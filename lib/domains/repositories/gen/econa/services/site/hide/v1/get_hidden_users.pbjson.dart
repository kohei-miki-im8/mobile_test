//
//  Generated code. Do not modify.
//  source: econa/services/site/hide/v1/get_hidden_users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getHiddenUsersRequestDescriptor instead')
const GetHiddenUsersRequest$json = {
  '1': 'GetHiddenUsersRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetHiddenUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHiddenUsersRequestDescriptor = $convert.base64Decode(
    'ChVHZXRIaWRkZW5Vc2Vyc1JlcXVlc3QSJgoKdG9fdXNlcl9pZBgBIAEoCUIIukgFcgOwAQFSCH'
    'RvVXNlcklkEkAKBmN1cnNvchgPIAEoCzIgLmVjb25hLnNoYXJlZC5QYWdlclJlcXVlc3RDdXJz'
    'b3JCBrpIA8gBAVIGY3Vyc29y');

@$core.Deprecated('Use getHiddenUsersResponseDescriptor instead')
const GetHiddenUsersResponse$json = {
  '1': 'GetHiddenUsersResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetHiddenUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHiddenUsersResponseDescriptor = $convert.base64Decode(
    'ChZHZXRIaWRkZW5Vc2Vyc1Jlc3BvbnNlEkQKD3RodW1ibmFpbF91c2VycxgBIAMoCzIbLmVjb2'
    '5hLnNoYXJlZC5UaHVtYm5haWxVc2VyUg50aHVtYm5haWxVc2VycxI5CgZjdXJzb3IYDyABKAsy'
    'IS5lY29uYS5zaGFyZWQuUGFnZXJSZXNwb25zZUN1cnNvclIGY3Vyc29y');

