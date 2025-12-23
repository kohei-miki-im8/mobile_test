//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/publish_system_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use publishSystemMessageRequestDescriptor instead')
const PublishSystemMessageRequest$json = {
  '1': 'PublishSystemMessageRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'content_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.MessageContentType', '8': {}, '10': 'contentType'},
    {'1': 'content', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.SystemMessageContent', '10': 'content'},
  ],
};

/// Descriptor for `PublishSystemMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishSystemMessageRequestDescriptor = $convert.base64Decode(
    'ChtQdWJsaXNoU3lzdGVtTWVzc2FnZVJlcXVlc3QSKgoMY2hhdF9yb29tX2lkGAEgASgJQgi6SA'
    'VyA7ABAVIKY2hhdFJvb21JZBJMCgxjb250ZW50X3R5cGUYAiABKA4yHy5lY29uYS5lbnVtcy5N'
    'ZXNzYWdlQ29udGVudFR5cGVCCLpIBYIBAggCUgtjb250ZW50VHlwZRI8Cgdjb250ZW50GAMgAS'
    'gLMiIuZWNvbmEuc2hhcmVkLlN5c3RlbU1lc3NhZ2VDb250ZW50Ugdjb250ZW50');

@$core.Deprecated('Use publishSystemMessageResponseDescriptor instead')
const PublishSystemMessageResponse$json = {
  '1': 'PublishSystemMessageResponse',
  '2': [
    {'1': 'chat_message_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatMessageId'},
  ],
};

/// Descriptor for `PublishSystemMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishSystemMessageResponseDescriptor = $convert.base64Decode(
    'ChxQdWJsaXNoU3lzdGVtTWVzc2FnZVJlc3BvbnNlEjAKD2NoYXRfbWVzc2FnZV9pZBgBIAEoCU'
    'IIukgFcgOwAQFSDWNoYXRNZXNzYWdlSWQ=');

