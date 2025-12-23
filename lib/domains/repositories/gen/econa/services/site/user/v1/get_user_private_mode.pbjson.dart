//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_private_mode.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserPrivateModeRequestDescriptor instead')
const GetUserPrivateModeRequest$json = {
  '1': 'GetUserPrivateModeRequest',
};

/// Descriptor for `GetUserPrivateModeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPrivateModeRequestDescriptor = $convert.base64Decode(
    'ChlHZXRVc2VyUHJpdmF0ZU1vZGVSZXF1ZXN0');

@$core.Deprecated('Use getUserPrivateModeResponseDescriptor instead')
const GetUserPrivateModeResponse$json = {
  '1': 'GetUserPrivateModeResponse',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'expires_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
  ],
};

/// Descriptor for `GetUserPrivateModeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPrivateModeResponseDescriptor = $convert.base64Decode(
    'ChpHZXRVc2VyUHJpdmF0ZU1vZGVSZXNwb25zZRIYCgdlbmFibGVkGAEgASgIUgdlbmFibGVkEj'
    'kKCmV4cGlyZXNfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglleHBpcmVz'
    'QXQ=');

