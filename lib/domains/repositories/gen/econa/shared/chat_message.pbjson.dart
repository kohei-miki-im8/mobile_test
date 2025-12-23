//
//  Generated code. Do not modify.
//  source: econa/shared/chat_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'chat_message_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatMessageId'},
    {'1': 'published_user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'publishedUserId'},
    {'1': 'sent_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
    {'1': 'read_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'readAt'},
    {'1': 'ai_agent_code', '3': 5, '4': 1, '5': 14, '6': '.econa.enums.AiAgentCode', '8': {}, '10': 'aiAgentCode'},
    {'1': 'content_type', '3': 6, '4': 1, '5': 14, '6': '.econa.enums.MessageContentType', '8': {}, '10': 'contentType'},
    {'1': 'system', '3': 7, '4': 1, '5': 11, '6': '.econa.shared.SystemMessageContent', '9': 0, '10': 'system'},
    {'1': 'text', '3': 8, '4': 1, '5': 11, '6': '.econa.shared.TextMessageContent', '9': 0, '10': 'text'},
    {'1': 'ai_agent', '3': 9, '4': 1, '5': 11, '6': '.econa.shared.AiAgentMessageContent', '9': 0, '10': 'aiAgent'},
    {'1': 'photo', '3': 10, '4': 1, '5': 11, '6': '.econa.shared.PhotoMessageContent', '9': 0, '10': 'photo'},
    {'1': 'read_last_chat_message_id', '3': 11, '4': 1, '5': 9, '9': 0, '10': 'readLastChatMessageId'},
    {'1': 'is_to_user_typing', '3': 12, '4': 1, '5': 8, '9': 0, '10': 'isToUserTyping'},
    {'1': 'delivery_status', '3': 13, '4': 1, '5': 14, '6': '.econa.enums.ChatMessageDeliveryStatus', '8': {}, '10': 'deliveryStatus'},
  ],
  '8': [
    {'1': 'contents', '2': {}},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIwCg9jaGF0X21lc3NhZ2VfaWQYASABKAlCCLpIBXIDsAEBUg1jaGF0TW'
    'Vzc2FnZUlkEjQKEXB1Ymxpc2hlZF91c2VyX2lkGAIgASgJQgi6SAVyA7ABAVIPcHVibGlzaGVk'
    'VXNlcklkEjMKB3NlbnRfYXQYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgZzZW'
    '50QXQSMwoHcmVhZF9hdBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBnJlYWRB'
    'dBJGCg1haV9hZ2VudF9jb2RlGAUgASgOMhguZWNvbmEuZW51bXMuQWlBZ2VudENvZGVCCLpIBY'
    'IBAhABUgthaUFnZW50Q29kZRJOCgxjb250ZW50X3R5cGUYBiABKA4yHy5lY29uYS5lbnVtcy5N'
    'ZXNzYWdlQ29udGVudFR5cGVCCrpIB4IBBBABIABSC2NvbnRlbnRUeXBlEjwKBnN5c3RlbRgHIA'
    'EoCzIiLmVjb25hLnNoYXJlZC5TeXN0ZW1NZXNzYWdlQ29udGVudEgAUgZzeXN0ZW0SNgoEdGV4'
    'dBgIIAEoCzIgLmVjb25hLnNoYXJlZC5UZXh0TWVzc2FnZUNvbnRlbnRIAFIEdGV4dBJACghhaV'
    '9hZ2VudBgJIAEoCzIjLmVjb25hLnNoYXJlZC5BaUFnZW50TWVzc2FnZUNvbnRlbnRIAFIHYWlB'
    'Z2VudBI5CgVwaG90bxgKIAEoCzIhLmVjb25hLnNoYXJlZC5QaG90b01lc3NhZ2VDb250ZW50SA'
    'BSBXBob3RvEjoKGXJlYWRfbGFzdF9jaGF0X21lc3NhZ2VfaWQYCyABKAlIAFIVcmVhZExhc3RD'
    'aGF0TWVzc2FnZUlkEisKEWlzX3RvX3VzZXJfdHlwaW5nGAwgASgISABSDmlzVG9Vc2VyVHlwaW'
    '5nElkKD2RlbGl2ZXJ5X3N0YXR1cxgNIAEoDjImLmVjb25hLmVudW1zLkNoYXRNZXNzYWdlRGVs'
    'aXZlcnlTdGF0dXNCCLpIBYIBAhABUg5kZWxpdmVyeVN0YXR1c0IRCghjb250ZW50cxIFukgCCA'
    'E=');

@$core.Deprecated('Use systemMessageContentDescriptor instead')
const SystemMessageContent$json = {
  '1': 'SystemMessageContent',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'text'},
  ],
};

/// Descriptor for `SystemMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemMessageContentDescriptor = $convert.base64Decode(
    'ChRTeXN0ZW1NZXNzYWdlQ29udGVudBIeCgR0ZXh0GAEgASgJQgq6SAdyBRABGOgHUgR0ZXh0');

@$core.Deprecated('Use textMessageContentDescriptor instead')
const TextMessageContent$json = {
  '1': 'TextMessageContent',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'text'},
  ],
};

/// Descriptor for `TextMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textMessageContentDescriptor = $convert.base64Decode(
    'ChJUZXh0TWVzc2FnZUNvbnRlbnQSHgoEdGV4dBgBIAEoCUIKukgHcgUQARjoB1IEdGV4dA==');

@$core.Deprecated('Use aiAgentMessageContentDescriptor instead')
const AiAgentMessageContent$json = {
  '1': 'AiAgentMessageContent',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'text'},
    {'1': 'is_finished', '3': 2, '4': 1, '5': 8, '10': 'isFinished'},
  ],
};

/// Descriptor for `AiAgentMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aiAgentMessageContentDescriptor = $convert.base64Decode(
    'ChVBaUFnZW50TWVzc2FnZUNvbnRlbnQSHAoEdGV4dBgBIAEoCUIIukgFcgMY6AdSBHRleHQSHw'
    'oLaXNfZmluaXNoZWQYAiABKAhSCmlzRmluaXNoZWQ=');

@$core.Deprecated('Use photoMessageContentDescriptor instead')
const PhotoMessageContent$json = {
  '1': 'PhotoMessageContent',
  '2': [
    {'1': 'signed_image_urls', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.SignedImageUrls', '8': {}, '10': 'signedImageUrls'},
    {'1': 'service_review_status', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.ServiceReviewStatus', '10': 'serviceReviewStatus'},
  ],
};

/// Descriptor for `PhotoMessageContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List photoMessageContentDescriptor = $convert.base64Decode(
    'ChNQaG90b01lc3NhZ2VDb250ZW50ElEKEXNpZ25lZF9pbWFnZV91cmxzGAEgASgLMh0uZWNvbm'
    'Euc2hhcmVkLlNpZ25lZEltYWdlVXJsc0IGukgDyAEBUg9zaWduZWRJbWFnZVVybHMSVAoVc2Vy'
    'dmljZV9yZXZpZXdfc3RhdHVzGAIgASgOMiAuZWNvbmEuZW51bXMuU2VydmljZVJldmlld1N0YX'
    'R1c1ITc2VydmljZVJldmlld1N0YXR1cw==');

@$core.Deprecated('Use editingChatMessageDescriptor instead')
const EditingChatMessage$json = {
  '1': 'EditingChatMessage',
  '2': [
    {'1': 'editing_text', '3': 1, '4': 1, '5': 9, '10': 'editingText'},
    {'1': 'processed_ai_agent_code', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.AiAgentCode', '10': 'processedAiAgentCode'},
  ],
};

/// Descriptor for `EditingChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editingChatMessageDescriptor = $convert.base64Decode(
    'ChJFZGl0aW5nQ2hhdE1lc3NhZ2USIQoMZWRpdGluZ190ZXh0GAEgASgJUgtlZGl0aW5nVGV4dB'
    'JPChdwcm9jZXNzZWRfYWlfYWdlbnRfY29kZRgCIAEoDjIYLmVjb25hLmVudW1zLkFpQWdlbnRD'
    'b2RlUhRwcm9jZXNzZWRBaUFnZW50Q29kZQ==');

