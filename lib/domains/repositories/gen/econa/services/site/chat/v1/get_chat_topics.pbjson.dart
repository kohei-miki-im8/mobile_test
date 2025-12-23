//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_chat_topics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getChatTopicsRequestDescriptor instead')
const GetChatTopicsRequest$json = {
  '1': 'GetChatTopicsRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
  ],
};

/// Descriptor for `GetChatTopicsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatTopicsRequestDescriptor = $convert.base64Decode(
    'ChRHZXRDaGF0VG9waWNzUmVxdWVzdBIqCgxjaGF0X3Jvb21faWQYASABKAlCCLpIBXIDsAEBUg'
    'pjaGF0Um9vbUlk');

@$core.Deprecated('Use getChatTopicsResponseDescriptor instead')
const GetChatTopicsResponse$json = {
  '1': 'GetChatTopicsResponse',
  '2': [
    {'1': 'chat_topics', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ChatTopic', '8': {}, '10': 'chatTopics'},
  ],
};

/// Descriptor for `GetChatTopicsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatTopicsResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDaGF0VG9waWNzUmVzcG9uc2USQgoLY2hhdF90b3BpY3MYASADKAsyFy5lY29uYS5zaG'
    'FyZWQuQ2hhdFRvcGljQgi6SAWSAQIQBVIKY2hhdFRvcGljcw==');

