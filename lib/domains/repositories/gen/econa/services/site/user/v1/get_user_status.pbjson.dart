//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserStatusRequestDescriptor instead')
const GetUserStatusRequest$json = {
  '1': 'GetUserStatusRequest',
};

/// Descriptor for `GetUserStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserStatusRequestDescriptor = $convert.base64Decode(
    'ChRHZXRVc2VyU3RhdHVzUmVxdWVzdA==');

@$core.Deprecated('Use getUserStatusResponseDescriptor instead')
const GetUserStatusResponse$json = {
  '1': 'GetUserStatusResponse',
  '2': [
    {'1': 'user_status', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.UserStatus', '10': 'userStatus'},
  ],
};

/// Descriptor for `GetUserStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserStatusResponseDescriptor = $convert.base64Decode(
    'ChVHZXRVc2VyU3RhdHVzUmVzcG9uc2USOQoLdXNlcl9zdGF0dXMYASABKAsyGC5lY29uYS5zaG'
    'FyZWQuVXNlclN0YXR1c1IKdXNlclN0YXR1cw==');

