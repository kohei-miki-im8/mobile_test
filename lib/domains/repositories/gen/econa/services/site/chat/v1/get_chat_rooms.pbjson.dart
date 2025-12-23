//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_chat_rooms.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getChatRoomsRequestDescriptor instead')
const GetChatRoomsRequest$json = {
  '1': 'GetChatRoomsRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
    {'1': 'invisible_mode', '3': 16, '4': 1, '5': 8, '10': 'invisibleMode'},
  ],
};

/// Descriptor for `GetChatRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRoomsRequestDescriptor = $convert.base64Decode(
    'ChNHZXRDaGF0Um9vbXNSZXF1ZXN0EkAKBmN1cnNvchgPIAEoCzIgLmVjb25hLnNoYXJlZC5QYW'
    'dlclJlcXVlc3RDdXJzb3JCBrpIA8gBAVIGY3Vyc29yEiUKDmludmlzaWJsZV9tb2RlGBAgASgI'
    'Ug1pbnZpc2libGVNb2Rl');

@$core.Deprecated('Use getChatRoomsResponseDescriptor instead')
const GetChatRoomsResponse$json = {
  '1': 'GetChatRoomsResponse',
  '2': [
    {'1': 'chat_rooms', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ChatRoom', '10': 'chatRooms'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetChatRoomsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRoomsResponseDescriptor = $convert.base64Decode(
    'ChRHZXRDaGF0Um9vbXNSZXNwb25zZRI1CgpjaGF0X3Jvb21zGAEgAygLMhYuZWNvbmEuc2hhcm'
    'VkLkNoYXRSb29tUgljaGF0Um9vbXMSOQoGY3Vyc29yGA8gASgLMiEuZWNvbmEuc2hhcmVkLlBh'
    'Z2VyUmVzcG9uc2VDdXJzb3JSBmN1cnNvcg==');

