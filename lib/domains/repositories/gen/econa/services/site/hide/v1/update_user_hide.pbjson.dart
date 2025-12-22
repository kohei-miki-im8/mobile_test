//
//  Generated code. Do not modify.
//  source: econa/services/site/hide/v1/update_user_hide.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateUserHideRequestDescriptor instead')
const UpdateUserHideRequest$json = {
  '1': 'UpdateUserHideRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'hide', '3': 2, '4': 1, '5': 8, '10': 'hide'},
  ],
};

/// Descriptor for `UpdateUserHideRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserHideRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVVc2VySGlkZVJlcXVlc3QSJgoKdG9fdXNlcl9pZBgBIAEoCUIIukgFcgOwAQFSCH'
    'RvVXNlcklkEhIKBGhpZGUYAiABKAhSBGhpZGU=');

@$core.Deprecated('Use updateUserHideResponseDescriptor instead')
const UpdateUserHideResponse$json = {
  '1': 'UpdateUserHideResponse',
};

/// Descriptor for `UpdateUserHideResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserHideResponseDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVVc2VySGlkZVJlc3BvbnNl');

