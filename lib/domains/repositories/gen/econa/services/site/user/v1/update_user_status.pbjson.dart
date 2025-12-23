//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/update_user_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateUserStatusRequestDescriptor instead')
const UpdateUserStatusRequest$json = {
  '1': 'UpdateUserStatusRequest',
  '2': [
    {'1': 'account_status_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.AccountStatusCode', '9': 0, '10': 'accountStatusCode'},
    {'1': 'certificate_level_code', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.CertificateLevelCode', '9': 0, '10': 'certificateLevelCode'},
  ],
  '8': [
    {'1': 'status', '2': {}},
  ],
};

/// Descriptor for `UpdateUserStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserStatusRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVVc2VyU3RhdHVzUmVxdWVzdBJQChNhY2NvdW50X3N0YXR1c19jb2RlGAEgASgOMh'
    '4uZWNvbmEuZW51bXMuQWNjb3VudFN0YXR1c0NvZGVIAFIRYWNjb3VudFN0YXR1c0NvZGUSWQoW'
    'Y2VydGlmaWNhdGVfbGV2ZWxfY29kZRgCIAEoDjIhLmVjb25hLmVudW1zLkNlcnRpZmljYXRlTG'
    'V2ZWxDb2RlSABSFGNlcnRpZmljYXRlTGV2ZWxDb2RlQg8KBnN0YXR1cxIFukgCCAE=');

@$core.Deprecated('Use updateUserStatusResponseDescriptor instead')
const UpdateUserStatusResponse$json = {
  '1': 'UpdateUserStatusResponse',
};

/// Descriptor for `UpdateUserStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserStatusResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVVc2VyU3RhdHVzUmVzcG9uc2U=');

