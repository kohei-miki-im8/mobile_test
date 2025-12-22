//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_external_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getExternalUserRequestDescriptor instead')
const GetExternalUserRequest$json = {
  '1': 'GetExternalUserRequest',
  '2': [
    {'1': 'external_service_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.ExternalServiceCode', '8': {}, '10': 'externalServiceCode'},
  ],
};

/// Descriptor for `GetExternalUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExternalUserRequestDescriptor = $convert.base64Decode(
    'ChZHZXRFeHRlcm5hbFVzZXJSZXF1ZXN0EmAKFWV4dGVybmFsX3NlcnZpY2VfY29kZRgBIAEoDj'
    'IgLmVjb25hLmVudW1zLkV4dGVybmFsU2VydmljZUNvZGVCCrpIB4IBBBABIABSE2V4dGVybmFs'
    'U2VydmljZUNvZGU=');

@$core.Deprecated('Use getExternalUserResponseDescriptor instead')
const GetExternalUserResponse$json = {
  '1': 'GetExternalUserResponse',
  '2': [
    {'1': 'external_user_id', '3': 1, '4': 1, '5': 9, '10': 'externalUserId'},
    {'1': 'external_unique_id', '3': 2, '4': 1, '5': 9, '10': 'externalUniqueId'},
  ],
};

/// Descriptor for `GetExternalUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getExternalUserResponseDescriptor = $convert.base64Decode(
    'ChdHZXRFeHRlcm5hbFVzZXJSZXNwb25zZRIoChBleHRlcm5hbF91c2VyX2lkGAEgASgJUg5leH'
    'Rlcm5hbFVzZXJJZBIsChJleHRlcm5hbF91bmlxdWVfaWQYAiABKAlSEGV4dGVybmFsVW5pcXVl'
    'SWQ=');

