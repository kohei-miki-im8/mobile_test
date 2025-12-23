//
//  Generated code. Do not modify.
//  source: econa/services/site/profile/v1/update_profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateProfileRequestDescriptor instead')
const UpdateProfileRequest$json = {
  '1': 'UpdateProfileRequest',
  '2': [
    {'1': 'updatable_profile', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.UpdatableProfile', '9': 0, '10': 'updatableProfile'},
    {'1': 'optional_profile', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.OptionalProfile', '9': 0, '10': 'optionalProfile'},
  ],
  '8': [
    {'1': 'profile', '2': {}},
  ],
};

/// Descriptor for `UpdateProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9maWxlUmVxdWVzdBJNChF1cGRhdGFibGVfcHJvZmlsZRgBIAEoCzIeLmVjb2'
    '5hLnNoYXJlZC5VcGRhdGFibGVQcm9maWxlSABSEHVwZGF0YWJsZVByb2ZpbGUSSgoQb3B0aW9u'
    'YWxfcHJvZmlsZRgCIAEoCzIdLmVjb25hLnNoYXJlZC5PcHRpb25hbFByb2ZpbGVIAFIPb3B0aW'
    '9uYWxQcm9maWxlQhAKB3Byb2ZpbGUSBbpIAggB');

@$core.Deprecated('Use updateProfileResponseDescriptor instead')
const UpdateProfileResponse$json = {
  '1': 'UpdateProfileResponse',
};

/// Descriptor for `UpdateProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQcm9maWxlUmVzcG9uc2U=');

