//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_date_intention.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getDateIntentionRequestDescriptor instead')
const GetDateIntentionRequest$json = {
  '1': 'GetDateIntentionRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
  ],
};

/// Descriptor for `GetDateIntentionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDateIntentionRequestDescriptor = $convert.base64Decode(
    'ChdHZXREYXRlSW50ZW50aW9uUmVxdWVzdBIqCgxjaGF0X3Jvb21faWQYASABKAlCCLpIBXIDsA'
    'EBUgpjaGF0Um9vbUlk');

@$core.Deprecated('Use getDateIntentionResponseDescriptor instead')
const GetDateIntentionResponse$json = {
  '1': 'GetDateIntentionResponse',
  '2': [
    {'1': 'date_intention', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.DateIntention', '10': 'dateIntention'},
    {'1': 'to_user_date_intention', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.DateIntention', '10': 'toUserDateIntention'},
  ],
};

/// Descriptor for `GetDateIntentionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDateIntentionResponseDescriptor = $convert.base64Decode(
    'ChhHZXREYXRlSW50ZW50aW9uUmVzcG9uc2USQgoOZGF0ZV9pbnRlbnRpb24YASABKAsyGy5lY2'
    '9uYS5zaGFyZWQuRGF0ZUludGVudGlvblINZGF0ZUludGVudGlvbhJQChZ0b191c2VyX2RhdGVf'
    'aW50ZW50aW9uGAIgASgLMhsuZWNvbmEuc2hhcmVkLkRhdGVJbnRlbnRpb25SE3RvVXNlckRhdG'
    'VJbnRlbnRpb24=');

