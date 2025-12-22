//
//  Generated code. Do not modify.
//  source: econa/services/site/profile/v1/create_profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createProfileRequestDescriptor instead')
const CreateProfileRequest$json = {
  '1': 'CreateProfileRequest',
  '2': [
    {'1': 'gender_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.GenderCode', '8': {}, '10': 'genderCode'},
    {'1': 'updatable_profile', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.UpdatableProfile', '8': {}, '10': 'updatableProfile'},
  ],
};

/// Descriptor for `CreateProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProfileRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQcm9maWxlUmVxdWVzdBJHCgtnZW5kZXJfY29kZRgBIAEoDjIXLmVjb25hLmVudW'
    '1zLkdlbmRlckNvZGVCDbpICsgBAYIBBBABIABSCmdlbmRlckNvZGUSUwoRdXBkYXRhYmxlX3By'
    'b2ZpbGUYAiABKAsyHi5lY29uYS5zaGFyZWQuVXBkYXRhYmxlUHJvZmlsZUIGukgDyAEBUhB1cG'
    'RhdGFibGVQcm9maWxl');

@$core.Deprecated('Use createProfileResponseDescriptor instead')
const CreateProfileResponse$json = {
  '1': 'CreateProfileResponse',
};

/// Descriptor for `CreateProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createProfileResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQcm9maWxlUmVzcG9uc2U=');

