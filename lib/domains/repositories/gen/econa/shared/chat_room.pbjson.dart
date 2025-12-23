//
//  Generated code. Do not modify.
//  source: econa/shared/chat_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatRoomDescriptor instead')
const ChatRoom$json = {
  '1': 'ChatRoom',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'thumbnail_user', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUser'},
    {'1': 'latest_chat_message', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.ChatMessage', '10': 'latestChatMessage'},
    {'1': 'messenger_status_badge', '3': 4, '4': 1, '5': 14, '6': '.econa.enums.MessengerStatusBadge', '8': {}, '10': 'messengerStatusBadge'},
    {'1': 'is_visible', '3': 5, '4': 1, '5': 8, '10': 'isVisible'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'is_force_read_purchased', '3': 8, '4': 1, '5': 8, '10': 'isForceReadPurchased'},
  ],
};

/// Descriptor for `ChatRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRoomDescriptor = $convert.base64Decode(
    'CghDaGF0Um9vbRIqCgxjaGF0X3Jvb21faWQYASABKAlCCLpIBXIDsAEBUgpjaGF0Um9vbUlkEk'
    'IKDnRodW1ibmFpbF91c2VyGAIgASgLMhsuZWNvbmEuc2hhcmVkLlRodW1ibmFpbFVzZXJSDXRo'
    'dW1ibmFpbFVzZXISSQoTbGF0ZXN0X2NoYXRfbWVzc2FnZRgDIAEoCzIZLmVjb25hLnNoYXJlZC'
    '5DaGF0TWVzc2FnZVIRbGF0ZXN0Q2hhdE1lc3NhZ2USYQoWbWVzc2VuZ2VyX3N0YXR1c19iYWRn'
    'ZRgEIAEoDjIhLmVjb25hLmVudW1zLk1lc3NlbmdlclN0YXR1c0JhZGdlQgi6SAWCAQIQAVIUbW'
    'Vzc2VuZ2VyU3RhdHVzQmFkZ2USHQoKaXNfdmlzaWJsZRgFIAEoCFIJaXNWaXNpYmxlEjkKCmNy'
    'ZWF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQ'
    'oKdXBkYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRB'
    'dBI1Chdpc19mb3JjZV9yZWFkX3B1cmNoYXNlZBgIIAEoCFIUaXNGb3JjZVJlYWRQdXJjaGFzZW'
    'Q=');

@$core.Deprecated('Use scheduledChatRoomDescriptor instead')
const ScheduledChatRoom$json = {
  '1': 'ScheduledChatRoom',
  '2': [
    {'1': 'scheduled_chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'scheduledChatRoomId'},
    {'1': 'thumbnail_user', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUser'},
    {'1': 'created_at', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `ScheduledChatRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List scheduledChatRoomDescriptor = $convert.base64Decode(
    'ChFTY2hlZHVsZWRDaGF0Um9vbRI9ChZzY2hlZHVsZWRfY2hhdF9yb29tX2lkGAEgASgJQgi6SA'
    'VyA7ABAVITc2NoZWR1bGVkQ2hhdFJvb21JZBJCCg50aHVtYm5haWxfdXNlchgCIAEoCzIbLmVj'
    'b25hLnNoYXJlZC5UaHVtYm5haWxVc2VyUg10aHVtYm5haWxVc2VyEjkKCmNyZWF0ZWRfYXQYAy'
    'ABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use simulatorChatRoomDescriptor instead')
const SimulatorChatRoom$json = {
  '1': 'SimulatorChatRoom',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'to_user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'anonymize_dummy_nickname', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'anonymizeDummyNickname'},
    {'1': 'birthday', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'simplified_personality_summary', '3': 5, '4': 1, '5': 9, '10': 'simplifiedPersonalitySummary'},
    {'1': 'is_skeleton', '3': 6, '4': 1, '5': 8, '10': 'isSkeleton'},
    {'1': 'dummy_photo_id', '3': 7, '4': 1, '5': 9, '10': 'dummyPhotoId'},
    {'1': 'dummy_profile_photo_urls', '3': 8, '4': 1, '5': 11, '6': '.econa.shared.SignedImageUrls', '10': 'dummyProfilePhotoUrls'},
  ],
};

/// Descriptor for `SimulatorChatRoom`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List simulatorChatRoomDescriptor = $convert.base64Decode(
    'ChFTaW11bGF0b3JDaGF0Um9vbRIqCgxjaGF0X3Jvb21faWQYASABKAlCCLpIBXIDsAEBUgpjaG'
    'F0Um9vbUlkEiYKCnRvX3VzZXJfaWQYAiABKAlCCLpIBXIDsAEBUgh0b1VzZXJJZBJDChhhbm9u'
    'eW1pemVfZHVtbXlfbmlja25hbWUYAyABKAlCCbpIBnIEEAEYZFIWYW5vbnltaXplRHVtbXlOaW'
    'NrbmFtZRI2CghiaXJ0aGRheRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCGJp'
    'cnRoZGF5EkQKHnNpbXBsaWZpZWRfcGVyc29uYWxpdHlfc3VtbWFyeRgFIAEoCVIcc2ltcGxpZm'
    'llZFBlcnNvbmFsaXR5U3VtbWFyeRIfCgtpc19za2VsZXRvbhgGIAEoCFIKaXNTa2VsZXRvbhIk'
    'Cg5kdW1teV9waG90b19pZBgHIAEoCVIMZHVtbXlQaG90b0lkElYKGGR1bW15X3Byb2ZpbGVfcG'
    'hvdG9fdXJscxgIIAEoCzIdLmVjb25hLnNoYXJlZC5TaWduZWRJbWFnZVVybHNSFWR1bW15UHJv'
    'ZmlsZVBob3RvVXJscw==');

