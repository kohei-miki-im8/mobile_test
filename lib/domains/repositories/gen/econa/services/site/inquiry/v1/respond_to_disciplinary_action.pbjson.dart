//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/respond_to_disciplinary_action.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use respondToDisciplinaryActionRequestDescriptor instead')
const RespondToDisciplinaryActionRequest$json = {
  '1': 'RespondToDisciplinaryActionRequest',
  '2': [
    {'1': 'user_disciplinary_log_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userDisciplinaryLogId'},
    {'1': 'is_agreed', '3': 2, '4': 1, '5': 8, '10': 'isAgreed'},
  ],
};

/// Descriptor for `RespondToDisciplinaryActionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respondToDisciplinaryActionRequestDescriptor = $convert.base64Decode(
    'CiJSZXNwb25kVG9EaXNjaXBsaW5hcnlBY3Rpb25SZXF1ZXN0EkEKGHVzZXJfZGlzY2lwbGluYX'
    'J5X2xvZ19pZBgBIAEoCUIIukgFcgOwAQFSFXVzZXJEaXNjaXBsaW5hcnlMb2dJZBIbCglpc19h'
    'Z3JlZWQYAiABKAhSCGlzQWdyZWVk');

@$core.Deprecated('Use respondToDisciplinaryActionResponseDescriptor instead')
const RespondToDisciplinaryActionResponse$json = {
  '1': 'RespondToDisciplinaryActionResponse',
  '2': [
    {'1': 'updated_at', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `RespondToDisciplinaryActionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List respondToDisciplinaryActionResponseDescriptor = $convert.base64Decode(
    'CiNSZXNwb25kVG9EaXNjaXBsaW5hcnlBY3Rpb25SZXNwb25zZRI5Cgp1cGRhdGVkX2F0GAEgAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0');

