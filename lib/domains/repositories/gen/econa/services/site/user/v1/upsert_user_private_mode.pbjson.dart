//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/upsert_user_private_mode.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use upsertUserPrivateModeRequestDescriptor instead')
const UpsertUserPrivateModeRequest$json = {
  '1': 'UpsertUserPrivateModeRequest',
  '2': [
    {'1': 'service_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.ServiceCode', '8': {}, '9': 0, '10': 'serviceCode'},
    {'1': 'enable', '3': 2, '4': 1, '5': 8, '9': 0, '10': 'enable'},
  ],
  '8': [
    {'1': 'request', '2': {}},
  ],
};

/// Descriptor for `UpsertUserPrivateModeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertUserPrivateModeRequestDescriptor = $convert.base64Decode(
    'ChxVcHNlcnRVc2VyUHJpdmF0ZU1vZGVSZXF1ZXN0Ek8KDHNlcnZpY2VfY29kZRgBIAEoDjIYLm'
    'Vjb25hLmVudW1zLlNlcnZpY2VDb2RlQhC6SA2CAQoQARhpGGoYayAASABSC3NlcnZpY2VDb2Rl'
    'EhgKBmVuYWJsZRgCIAEoCEgAUgZlbmFibGVCEAoHcmVxdWVzdBIFukgCCAE=');

@$core.Deprecated('Use upsertUserPrivateModeResponseDescriptor instead')
const UpsertUserPrivateModeResponse$json = {
  '1': 'UpsertUserPrivateModeResponse',
  '2': [
    {'1': 'expires_at', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
  ],
};

/// Descriptor for `UpsertUserPrivateModeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upsertUserPrivateModeResponseDescriptor = $convert.base64Decode(
    'Ch1VcHNlcnRVc2VyUHJpdmF0ZU1vZGVSZXNwb25zZRI5CgpleHBpcmVzX2F0GAEgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJZXhwaXJlc0F0');

