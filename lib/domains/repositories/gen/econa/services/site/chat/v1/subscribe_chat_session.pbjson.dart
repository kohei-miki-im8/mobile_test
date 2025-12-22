//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/subscribe_chat_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use subscribeChatSessionRequestDescriptor instead')
const SubscribeChatSessionRequest$json = {
  '1': 'SubscribeChatSessionRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
  ],
};

/// Descriptor for `SubscribeChatSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeChatSessionRequestDescriptor = $convert.base64Decode(
    'ChtTdWJzY3JpYmVDaGF0U2Vzc2lvblJlcXVlc3QSKgoMY2hhdF9yb29tX2lkGAEgASgJQgi6SA'
    'VyA7ABAVIKY2hhdFJvb21JZA==');

@$core.Deprecated('Use subscribeChatSessionResponseDescriptor instead')
const SubscribeChatSessionResponse$json = {
  '1': 'SubscribeChatSessionResponse',
  '2': [
    {'1': 'published_user_id', '3': 1, '4': 1, '5': 9, '10': 'publishedUserId'},
    {'1': 'publish_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.ChatSessionPublishType', '8': {}, '10': 'publishType'},
    {'1': 'chat_message', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.ChatMessage', '9': 0, '10': 'chatMessage'},
    {'1': 'editing_chat_message', '3': 4, '4': 1, '5': 11, '6': '.econa.shared.EditingChatMessage', '9': 0, '10': 'editingChatMessage'},
    {'1': 'editable_chat_topics', '3': 5, '4': 1, '5': 11, '6': '.econa.shared.ChatTopics', '9': 0, '10': 'editableChatTopics'},
    {'1': 'read_last_chat_message_id', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'readLastChatMessageId'},
    {'1': 'is_to_user_typing', '3': 7, '4': 1, '5': 8, '9': 0, '10': 'isToUserTyping'},
    {'1': 'is_delivered', '3': 14, '4': 1, '5': 8, '10': 'isDelivered'},
    {'1': 'is_successful', '3': 15, '4': 1, '5': 8, '10': 'isSuccessful'},
    {'1': 'sender_first_message_service_review_status', '3': 16, '4': 1, '5': 14, '6': '.econa.enums.ServiceReviewStatus', '8': {}, '10': 'senderFirstMessageServiceReviewStatus'},
  ],
  '8': [
    {'1': 'response', '2': {}},
  ],
};

/// Descriptor for `SubscribeChatSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeChatSessionResponseDescriptor = $convert.base64Decode(
    'ChxTdWJzY3JpYmVDaGF0U2Vzc2lvblJlc3BvbnNlEioKEXB1Ymxpc2hlZF91c2VyX2lkGAEgAS'
    'gJUg9wdWJsaXNoZWRVc2VySWQSUgoMcHVibGlzaF90eXBlGAIgASgOMiMuZWNvbmEuZW51bXMu'
    'Q2hhdFNlc3Npb25QdWJsaXNoVHlwZUIKukgHggEEEAEgAFILcHVibGlzaFR5cGUSPgoMY2hhdF'
    '9tZXNzYWdlGAMgASgLMhkuZWNvbmEuc2hhcmVkLkNoYXRNZXNzYWdlSABSC2NoYXRNZXNzYWdl'
    'ElQKFGVkaXRpbmdfY2hhdF9tZXNzYWdlGAQgASgLMiAuZWNvbmEuc2hhcmVkLkVkaXRpbmdDaG'
    'F0TWVzc2FnZUgAUhJlZGl0aW5nQ2hhdE1lc3NhZ2USTAoUZWRpdGFibGVfY2hhdF90b3BpY3MY'
    'BSABKAsyGC5lY29uYS5zaGFyZWQuQ2hhdFRvcGljc0gAUhJlZGl0YWJsZUNoYXRUb3BpY3MSOg'
    'oZcmVhZF9sYXN0X2NoYXRfbWVzc2FnZV9pZBgGIAEoCUgAUhVyZWFkTGFzdENoYXRNZXNzYWdl'
    'SWQSKwoRaXNfdG9fdXNlcl90eXBpbmcYByABKAhIAFIOaXNUb1VzZXJUeXBpbmcSIQoMaXNfZG'
    'VsaXZlcmVkGA4gASgIUgtpc0RlbGl2ZXJlZBIjCg1pc19zdWNjZXNzZnVsGA8gASgIUgxpc1N1'
    'Y2Nlc3NmdWwShQEKKnNlbmRlcl9maXJzdF9tZXNzYWdlX3NlcnZpY2VfcmV2aWV3X3N0YXR1cx'
    'gQIAEoDjIgLmVjb25hLmVudW1zLlNlcnZpY2VSZXZpZXdTdGF0dXNCCLpIBYIBAhABUiVzZW5k'
    'ZXJGaXJzdE1lc3NhZ2VTZXJ2aWNlUmV2aWV3U3RhdHVzQhEKCHJlc3BvbnNlEgW6SAIIAQ==');

