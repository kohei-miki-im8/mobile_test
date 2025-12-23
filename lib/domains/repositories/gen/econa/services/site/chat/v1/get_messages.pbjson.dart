//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_messages.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getMessagesRequestDescriptor instead')
const GetMessagesRequest$json = {
  '1': 'GetMessagesRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesRequestDescriptor = $convert.base64Decode(
    'ChJHZXRNZXNzYWdlc1JlcXVlc3QSKgoMY2hhdF9yb29tX2lkGAEgASgJQgi6SAVyA7ABAVIKY2'
    'hhdFJvb21JZBJACgZjdXJzb3IYDyABKAsyIC5lY29uYS5zaGFyZWQuUGFnZXJSZXF1ZXN0Q3Vy'
    'c29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getMessagesResponseDescriptor instead')
const GetMessagesResponse$json = {
  '1': 'GetMessagesResponse',
  '2': [
    {'1': 'chat_messages', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ChatMessage', '10': 'chatMessages'},
    {'1': 'pinned_chat_message_id', '3': 2, '4': 1, '5': 9, '10': 'pinnedChatMessageId'},
    {'1': 'read_last_chat_message_id', '3': 3, '4': 1, '5': 9, '10': 'readLastChatMessageId'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMessagesResponseDescriptor = $convert.base64Decode(
    'ChNHZXRNZXNzYWdlc1Jlc3BvbnNlEj4KDWNoYXRfbWVzc2FnZXMYASADKAsyGS5lY29uYS5zaG'
    'FyZWQuQ2hhdE1lc3NhZ2VSDGNoYXRNZXNzYWdlcxIzChZwaW5uZWRfY2hhdF9tZXNzYWdlX2lk'
    'GAIgASgJUhNwaW5uZWRDaGF0TWVzc2FnZUlkEjgKGXJlYWRfbGFzdF9jaGF0X21lc3NhZ2VfaW'
    'QYAyABKAlSFXJlYWRMYXN0Q2hhdE1lc3NhZ2VJZBI5CgZjdXJzb3IYDyABKAsyIS5lY29uYS5z'
    'aGFyZWQuUGFnZXJSZXNwb25zZUN1cnNvclIGY3Vyc29y');

