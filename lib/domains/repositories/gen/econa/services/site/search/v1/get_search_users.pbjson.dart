//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/get_search_users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getSearchUsersRequestDescriptor instead')
const GetSearchUsersRequest$json = {
  '1': 'GetSearchUsersRequest',
  '2': [
    {'1': 'user_search_conditions', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.UserSearchConditions', '8': {}, '10': 'userSearchConditions'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetSearchUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSearchUsersRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTZWFyY2hVc2Vyc1JlcXVlc3QSYAoWdXNlcl9zZWFyY2hfY29uZGl0aW9ucxgBIAEoCz'
    'IiLmVjb25hLnNoYXJlZC5Vc2VyU2VhcmNoQ29uZGl0aW9uc0IGukgDyAEBUhR1c2VyU2VhcmNo'
    'Q29uZGl0aW9ucxJACgZjdXJzb3IYDyABKAsyIC5lY29uYS5zaGFyZWQuUGFnZXJSZXF1ZXN0Q3'
    'Vyc29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getSearchUsersResponseDescriptor instead')
const GetSearchUsersResponse$json = {
  '1': 'GetSearchUsersResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetSearchUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSearchUsersResponseDescriptor = $convert.base64Decode(
    'ChZHZXRTZWFyY2hVc2Vyc1Jlc3BvbnNlEkQKD3RodW1ibmFpbF91c2VycxgBIAMoCzIbLmVjb2'
    '5hLnNoYXJlZC5UaHVtYm5haWxVc2VyUg50aHVtYm5haWxVc2VycxI5CgZjdXJzb3IYDyABKAsy'
    'IS5lY29uYS5zaGFyZWQuUGFnZXJSZXNwb25zZUN1cnNvclIGY3Vyc29y');

