//
//  Generated code. Do not modify.
//  source: econa/services/site/favorite/v1/update_user_favorite.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateUserFavoriteRequestDescriptor instead')
const UpdateUserFavoriteRequest$json = {
  '1': 'UpdateUserFavoriteRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'favorite', '3': 2, '4': 1, '5': 8, '10': 'favorite'},
  ],
};

/// Descriptor for `UpdateUserFavoriteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserFavoriteRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVVc2VyRmF2b3JpdGVSZXF1ZXN0EiYKCnRvX3VzZXJfaWQYASABKAlCCLpIBXIDsA'
    'EBUgh0b1VzZXJJZBIaCghmYXZvcml0ZRgCIAEoCFIIZmF2b3JpdGU=');

@$core.Deprecated('Use updateUserFavoriteResponseDescriptor instead')
const UpdateUserFavoriteResponse$json = {
  '1': 'UpdateUserFavoriteResponse',
};

/// Descriptor for `UpdateUserFavoriteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserFavoriteResponseDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVVc2VyRmF2b3JpdGVSZXNwb25zZQ==');

