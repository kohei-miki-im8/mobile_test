//
//  Generated code. Do not modify.
//  source: econa/shared/chat_topic.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatTopicsDescriptor instead')
const ChatTopics$json = {
  '1': 'ChatTopics',
  '2': [
    {'1': 'chat_topics', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ChatTopic', '8': {}, '10': 'chatTopics'},
    {'1': 'processed_ai_agent_code', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.AiAgentCode', '10': 'processedAiAgentCode'},
  ],
};

/// Descriptor for `ChatTopics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatTopicsDescriptor = $convert.base64Decode(
    'CgpDaGF0VG9waWNzEkQKC2NoYXRfdG9waWNzGAEgAygLMhcuZWNvbmEuc2hhcmVkLkNoYXRUb3'
    'BpY0IKukgHkgEECAEQBVIKY2hhdFRvcGljcxJPChdwcm9jZXNzZWRfYWlfYWdlbnRfY29kZRgC'
    'IAEoDjIYLmVjb25hLmVudW1zLkFpQWdlbnRDb2RlUhRwcm9jZXNzZWRBaUFnZW50Q29kZQ==');

@$core.Deprecated('Use chatTopicDescriptor instead')
const ChatTopic$json = {
  '1': 'ChatTopic',
  '2': [
    {'1': 'chat_topic_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatTopicId'},
    {'1': 'photo_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'photoId'},
    {'1': 'tag_id', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'tagId'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
  '8': [
    {'1': 'chat_topic_content', '2': {}},
  ],
};

/// Descriptor for `ChatTopic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatTopicDescriptor = $convert.base64Decode(
    'CglDaGF0VG9waWMSLAoNY2hhdF90b3BpY19pZBgBIAEoCUIIukgFcgOwAQFSC2NoYXRUb3BpY0'
    'lkEhsKCHBob3RvX2lkGAIgASgJSABSB3Bob3RvSWQSFwoGdGFnX2lkGAMgASgJSABSBXRhZ0lk'
    'EhgKB21lc3NhZ2UYBCABKAlSB21lc3NhZ2USOQoKY3JlYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdEIbChJjaGF0X3RvcGljX2NvbnRlbnQSBbpI'
    'AggB');

