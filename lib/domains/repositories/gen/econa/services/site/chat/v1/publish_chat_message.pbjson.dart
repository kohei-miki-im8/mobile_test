//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/publish_chat_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use publishChatMessageRequestDescriptor instead')
const PublishChatMessageRequest$json = {
  '1': 'PublishChatMessageRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'chat_message', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.ChatMessage', '10': 'chatMessage'},
  ],
};

/// Descriptor for `PublishChatMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishChatMessageRequestDescriptor = $convert.base64Decode(
    'ChlQdWJsaXNoQ2hhdE1lc3NhZ2VSZXF1ZXN0EioKDGNoYXRfcm9vbV9pZBgBIAEoCUIIukgFcg'
    'OwAQFSCmNoYXRSb29tSWQSPAoMY2hhdF9tZXNzYWdlGAIgASgLMhkuZWNvbmEuc2hhcmVkLkNo'
    'YXRNZXNzYWdlUgtjaGF0TWVzc2FnZQ==');

@$core.Deprecated('Use publishChatMessageResponseDescriptor instead')
const PublishChatMessageResponse$json = {
  '1': 'PublishChatMessageResponse',
  '2': [
    {'1': 'chat_message_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatMessageId'},
    {'1': 'is_blocked', '3': 2, '4': 1, '5': 8, '10': 'isBlocked'},
  ],
};

/// Descriptor for `PublishChatMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishChatMessageResponseDescriptor = $convert.base64Decode(
    'ChpQdWJsaXNoQ2hhdE1lc3NhZ2VSZXNwb25zZRIwCg9jaGF0X21lc3NhZ2VfaWQYASABKAlCCL'
    'pIBXIDsAEBUg1jaGF0TWVzc2FnZUlkEh0KCmlzX2Jsb2NrZWQYAiABKAhSCWlzQmxvY2tlZA==');

