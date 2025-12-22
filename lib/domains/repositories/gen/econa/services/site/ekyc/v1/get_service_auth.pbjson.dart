//
//  Generated code. Do not modify.
//  source: econa/services/site/ekyc/v1/get_service_auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getServiceAuthRequestDescriptor instead')
const GetServiceAuthRequest$json = {
  '1': 'GetServiceAuthRequest',
};

/// Descriptor for `GetServiceAuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getServiceAuthRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTZXJ2aWNlQXV0aFJlcXVlc3Q=');

@$core.Deprecated('Use getServiceAuthResponseDescriptor instead')
const GetServiceAuthResponse$json = {
  '1': 'GetServiceAuthResponse',
  '2': [
    {'1': 'access_token', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'accessToken'},
    {'1': 'error_code', '3': 2, '4': 1, '5': 9, '10': 'errorCode'},
    {'1': 'is_already_verified', '3': 3, '4': 1, '5': 8, '10': 'isAlreadyVerified'},
    {'1': 'ekyc_status', '3': 4, '4': 1, '5': 9, '10': 'ekycStatus'},
    {'1': 'failure_reason', '3': 5, '4': 1, '5': 9, '10': 'failureReason'},
  ],
};

/// Descriptor for `GetServiceAuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getServiceAuthResponseDescriptor = $convert.base64Decode(
    'ChZHZXRTZXJ2aWNlQXV0aFJlc3BvbnNlEioKDGFjY2Vzc190b2tlbhgBIAEoCUIHukgEcgIQAV'
    'ILYWNjZXNzVG9rZW4SHQoKZXJyb3JfY29kZRgCIAEoCVIJZXJyb3JDb2RlEi4KE2lzX2FscmVh'
    'ZHlfdmVyaWZpZWQYAyABKAhSEWlzQWxyZWFkeVZlcmlmaWVkEh8KC2VreWNfc3RhdHVzGAQgAS'
    'gJUgpla3ljU3RhdHVzEiUKDmZhaWx1cmVfcmVhc29uGAUgASgJUg1mYWlsdXJlUmVhc29u');

