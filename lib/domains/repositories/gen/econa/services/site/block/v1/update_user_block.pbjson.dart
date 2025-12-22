//
//  Generated code. Do not modify.
//  source: econa/services/site/block/v1/update_user_block.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateUserBlockRequestDescriptor instead')
const UpdateUserBlockRequest$json = {
  '1': 'UpdateUserBlockRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'block', '3': 2, '4': 1, '5': 8, '10': 'block'},
  ],
};

/// Descriptor for `UpdateUserBlockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserBlockRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVVc2VyQmxvY2tSZXF1ZXN0EiYKCnRvX3VzZXJfaWQYASABKAlCCLpIBXIDsAEBUg'
    'h0b1VzZXJJZBIUCgVibG9jaxgCIAEoCFIFYmxvY2s=');

@$core.Deprecated('Use updateUserBlockResponseDescriptor instead')
const UpdateUserBlockResponse$json = {
  '1': 'UpdateUserBlockResponse',
};

/// Descriptor for `UpdateUserBlockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserBlockResponseDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVVc2VyQmxvY2tSZXNwb25zZQ==');

