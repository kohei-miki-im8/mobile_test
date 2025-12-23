//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/delete_chat_topic.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deleteChatTopicRequestDescriptor instead')
const DeleteChatTopicRequest$json = {
  '1': 'DeleteChatTopicRequest',
  '2': [
    {'1': 'chat_topic_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatTopicId'},
  ],
};

/// Descriptor for `DeleteChatTopicRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChatTopicRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVDaGF0VG9waWNSZXF1ZXN0EiwKDWNoYXRfdG9waWNfaWQYASABKAlCCLpIBXIDsA'
    'EBUgtjaGF0VG9waWNJZA==');

@$core.Deprecated('Use deleteChatTopicResponseDescriptor instead')
const DeleteChatTopicResponse$json = {
  '1': 'DeleteChatTopicResponse',
};

/// Descriptor for `DeleteChatTopicResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChatTopicResponseDescriptor = $convert.base64Decode(
    'ChdEZWxldGVDaGF0VG9waWNSZXNwb25zZQ==');

