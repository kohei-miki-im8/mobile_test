//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/get_recommendation_users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getRecommendationUsersRequestDescriptor instead')
const GetRecommendationUsersRequest$json = {
  '1': 'GetRecommendationUsersRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetRecommendationUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecommendationUsersRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRSZWNvbW1lbmRhdGlvblVzZXJzUmVxdWVzdBJACgZjdXJzb3IYDyABKAsyIC5lY29uYS'
    '5zaGFyZWQuUGFnZXJSZXF1ZXN0Q3Vyc29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getRecommendationUsersResponseDescriptor instead')
const GetRecommendationUsersResponse$json = {
  '1': 'GetRecommendationUsersResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetRecommendationUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRecommendationUsersResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRSZWNvbW1lbmRhdGlvblVzZXJzUmVzcG9uc2USRAoPdGh1bWJuYWlsX3VzZXJzGAEgAy'
    'gLMhsuZWNvbmEuc2hhcmVkLlRodW1ibmFpbFVzZXJSDnRodW1ibmFpbFVzZXJzEjkKBmN1cnNv'
    'chgPIAEoCzIhLmVjb25hLnNoYXJlZC5QYWdlclJlc3BvbnNlQ3Vyc29yUgZjdXJzb3I=');

