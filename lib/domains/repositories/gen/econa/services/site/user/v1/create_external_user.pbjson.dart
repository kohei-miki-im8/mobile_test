//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/create_external_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createExternalUserRequestDescriptor instead')
const CreateExternalUserRequest$json = {
  '1': 'CreateExternalUserRequest',
  '2': [
    {'1': 'external_service_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.ExternalServiceCode', '8': {}, '10': 'externalServiceCode'},
    {'1': 'external_unique_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'externalUniqueId'},
  ],
};

/// Descriptor for `CreateExternalUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createExternalUserRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVFeHRlcm5hbFVzZXJSZXF1ZXN0EmMKFWV4dGVybmFsX3NlcnZpY2VfY29kZRgBIA'
    'EoDjIgLmVjb25hLmVudW1zLkV4dGVybmFsU2VydmljZUNvZGVCDbpICsgBAYIBBBABIABSE2V4'
    'dGVybmFsU2VydmljZUNvZGUSOQoSZXh0ZXJuYWxfdW5pcXVlX2lkGAIgASgJQgu6SAjIAQFyAx'
    'iAAVIQZXh0ZXJuYWxVbmlxdWVJZA==');

@$core.Deprecated('Use createExternalUserResponseDescriptor instead')
const CreateExternalUserResponse$json = {
  '1': 'CreateExternalUserResponse',
  '2': [
    {'1': 'external_user_id', '3': 1, '4': 1, '5': 9, '10': 'externalUserId'},
  ],
};

/// Descriptor for `CreateExternalUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createExternalUserResponseDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVFeHRlcm5hbFVzZXJSZXNwb25zZRIoChBleHRlcm5hbF91c2VyX2lkGAEgASgJUg'
    '5leHRlcm5hbFVzZXJJZA==');

