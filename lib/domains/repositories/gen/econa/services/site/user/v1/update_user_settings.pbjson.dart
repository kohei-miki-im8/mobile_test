//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/update_user_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateUserSettingsRequestDescriptor instead')
const UpdateUserSettingsRequest$json = {
  '1': 'UpdateUserSettingsRequest',
  '2': [
    {'1': 'setting_key', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.UnifiedSettingKey', '8': {}, '10': 'settingKey'},
    {'1': 'value', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'value'},
    {'1': 'flag', '3': 4, '4': 1, '5': 8, '9': 0, '10': 'flag'},
  ],
  '8': [
    {'1': 'value_content', '2': {}},
  ],
};

/// Descriptor for `UpdateUserSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserSettingsRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVVc2VyU2V0dGluZ3NSZXF1ZXN0EksKC3NldHRpbmdfa2V5GAEgASgOMh4uZWNvbm'
    'EuZW51bXMuVW5pZmllZFNldHRpbmdLZXlCCrpIB4IBBBABIABSCnNldHRpbmdLZXkSFgoFdmFs'
    'dWUYAyABKAlIAFIFdmFsdWUSFAoEZmxhZxgEIAEoCEgAUgRmbGFnQhYKDXZhbHVlX2NvbnRlbn'
    'QSBbpIAggB');

@$core.Deprecated('Use updateUserSettingsResponseDescriptor instead')
const UpdateUserSettingsResponse$json = {
  '1': 'UpdateUserSettingsResponse',
};

/// Descriptor for `UpdateUserSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserSettingsResponseDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVVc2VyU2V0dGluZ3NSZXNwb25zZQ==');

