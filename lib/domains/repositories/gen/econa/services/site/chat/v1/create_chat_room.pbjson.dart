//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/create_chat_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createChatRoomRequestDescriptor instead')
const CreateChatRoomRequest$json = {
  '1': 'CreateChatRoomRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'ai_agent_code', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.AiAgentCode', '8': {}, '10': 'aiAgentCode'},
    {'1': 'anonymize_dummy_nickname', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'anonymizeDummyNickname'},
    {'1': 'dummy_photo_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'dummyPhotoId'},
  ],
};

/// Descriptor for `CreateChatRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatRoomRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVDaGF0Um9vbVJlcXVlc3QSKQoKdG9fdXNlcl9pZBgBIAEoCUILukgIyAEBcgOwAQ'
    'FSCHRvVXNlcklkEkgKDWFpX2FnZW50X2NvZGUYAiABKA4yGC5lY29uYS5lbnVtcy5BaUFnZW50'
    'Q29kZUIKukgHggEEEAEgAFILYWlBZ2VudENvZGUSQwoYYW5vbnltaXplX2R1bW15X25pY2tuYW'
    '1lGAMgASgJQgm6SAZyBBABGGRSFmFub255bWl6ZUR1bW15Tmlja25hbWUSLgoOZHVtbXlfcGhv'
    'dG9faWQYBCABKAlCCLpIBXIDsAEBUgxkdW1teVBob3RvSWQ=');

@$core.Deprecated('Use createChatRoomResponseDescriptor instead')
const CreateChatRoomResponse$json = {
  '1': 'CreateChatRoomResponse',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'is_force_read_purchased', '3': 2, '4': 1, '5': 8, '10': 'isForceReadPurchased'},
  ],
};

/// Descriptor for `CreateChatRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatRoomResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVDaGF0Um9vbVJlc3BvbnNlEioKDGNoYXRfcm9vbV9pZBgBIAEoCUIIukgFcgOwAQ'
    'FSCmNoYXRSb29tSWQSNQoXaXNfZm9yY2VfcmVhZF9wdXJjaGFzZWQYAiABKAhSFGlzRm9yY2VS'
    'ZWFkUHVyY2hhc2Vk');

