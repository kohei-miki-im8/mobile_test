//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserSettingsRequestDescriptor instead')
const GetUserSettingsRequest$json = {
  '1': 'GetUserSettingsRequest',
  '2': [
    {'1': 'setting_keys', '3': 1, '4': 3, '5': 14, '6': '.econa.enums.UnifiedSettingKey', '8': {}, '10': 'settingKeys'},
  ],
};

/// Descriptor for `GetUserSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserSettingsRequestDescriptor = $convert.base64Decode(
    'ChZHZXRVc2VyU2V0dGluZ3NSZXF1ZXN0ElQKDHNldHRpbmdfa2V5cxgBIAMoDjIeLmVjb25hLm'
    'VudW1zLlVuaWZpZWRTZXR0aW5nS2V5QhG6SA6SAQsIASIHggEEEAEgAFILc2V0dGluZ0tleXM=');

@$core.Deprecated('Use getUserSettingsResponseDescriptor instead')
const GetUserSettingsResponse$json = {
  '1': 'GetUserSettingsResponse',
  '2': [
    {'1': 'setting_key_value_pairs', '3': 1, '4': 3, '5': 11, '6': '.econa.services.site.user.v1.GetUserSettingsResponse.UnifiedSettingKeyValuePair', '10': 'settingKeyValuePairs'},
  ],
  '3': [GetUserSettingsResponse_UnifiedSettingKeyValuePair$json],
};

@$core.Deprecated('Use getUserSettingsResponseDescriptor instead')
const GetUserSettingsResponse_UnifiedSettingKeyValuePair$json = {
  '1': 'UnifiedSettingKeyValuePair',
  '2': [
    {'1': 'setting_key', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.UnifiedSettingKey', '8': {}, '10': 'settingKey'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'value'},
    {'1': 'flag', '3': 3, '4': 1, '5': 8, '9': 0, '10': 'flag'},
  ],
  '8': [
    {'1': 'value_content', '2': {}},
  ],
};

/// Descriptor for `GetUserSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserSettingsResponseDescriptor = $convert.base64Decode(
    'ChdHZXRVc2VyU2V0dGluZ3NSZXNwb25zZRKGAQoXc2V0dGluZ19rZXlfdmFsdWVfcGFpcnMYAS'
    'ADKAsyTy5lY29uYS5zZXJ2aWNlcy5zaXRlLnVzZXIudjEuR2V0VXNlclNldHRpbmdzUmVzcG9u'
    'c2UuVW5pZmllZFNldHRpbmdLZXlWYWx1ZVBhaXJSFHNldHRpbmdLZXlWYWx1ZVBhaXJzGq8BCh'
    'pVbmlmaWVkU2V0dGluZ0tleVZhbHVlUGFpchJLCgtzZXR0aW5nX2tleRgBIAEoDjIeLmVjb25h'
    'LmVudW1zLlVuaWZpZWRTZXR0aW5nS2V5Qgq6SAeCAQQQASAAUgpzZXR0aW5nS2V5EhYKBXZhbH'
    'VlGAIgASgJSABSBXZhbHVlEhQKBGZsYWcYAyABKAhIAFIEZmxhZ0IWCg12YWx1ZV9jb250ZW50'
    'EgW6SAIIAQ==');

