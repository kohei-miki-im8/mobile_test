//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_pinned_chat_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updatePinnedChatMessageRequestDescriptor instead')
const UpdatePinnedChatMessageRequest$json = {
  '1': 'UpdatePinnedChatMessageRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'chat_message_id', '3': 2, '4': 1, '5': 9, '10': 'chatMessageId'},
  ],
};

/// Descriptor for `UpdatePinnedChatMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePinnedChatMessageRequestDescriptor = $convert.base64Decode(
    'Ch5VcGRhdGVQaW5uZWRDaGF0TWVzc2FnZVJlcXVlc3QSKgoMY2hhdF9yb29tX2lkGAEgASgJQg'
    'i6SAVyA7ABAVIKY2hhdFJvb21JZBImCg9jaGF0X21lc3NhZ2VfaWQYAiABKAlSDWNoYXRNZXNz'
    'YWdlSWQ=');

@$core.Deprecated('Use updatePinnedChatMessageResponseDescriptor instead')
const UpdatePinnedChatMessageResponse$json = {
  '1': 'UpdatePinnedChatMessageResponse',
};

/// Descriptor for `UpdatePinnedChatMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePinnedChatMessageResponseDescriptor = $convert.base64Decode(
    'Ch9VcGRhdGVQaW5uZWRDaGF0TWVzc2FnZVJlc3BvbnNl');

