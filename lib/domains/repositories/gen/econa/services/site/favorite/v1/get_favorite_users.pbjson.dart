//
//  Generated code. Do not modify.
//  source: econa/services/site/favorite/v1/get_favorite_users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getFavoriteUsersRequestDescriptor instead')
const GetFavoriteUsersRequest$json = {
  '1': 'GetFavoriteUsersRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetFavoriteUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFavoriteUsersRequestDescriptor = $convert.base64Decode(
    'ChdHZXRGYXZvcml0ZVVzZXJzUmVxdWVzdBJACgZjdXJzb3IYDyABKAsyIC5lY29uYS5zaGFyZW'
    'QuUGFnZXJSZXF1ZXN0Q3Vyc29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getFavoriteUsersResponseDescriptor instead')
const GetFavoriteUsersResponse$json = {
  '1': 'GetFavoriteUsersResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetFavoriteUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFavoriteUsersResponseDescriptor = $convert.base64Decode(
    'ChhHZXRGYXZvcml0ZVVzZXJzUmVzcG9uc2USRAoPdGh1bWJuYWlsX3VzZXJzGAEgAygLMhsuZW'
    'NvbmEuc2hhcmVkLlRodW1ibmFpbFVzZXJSDnRodW1ibmFpbFVzZXJzEjkKBmN1cnNvchgPIAEo'
    'CzIhLmVjb25hLnNoYXJlZC5QYWdlclJlc3BvbnNlQ3Vyc29yUgZjdXJzb3I=');

