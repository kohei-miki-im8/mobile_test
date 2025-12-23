//
//  Generated code. Do not modify.
//  source: econa/shared/question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use questionDescriptor instead')
const Question$json = {
  '1': 'Question',
  '2': [
    {'1': 'question_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'questionId'},
    {'1': 'ai_agent_code', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.AiAgentCode', '8': {}, '10': 'aiAgentCode'},
    {'1': 'question_content_type', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.QuestionContentType', '8': {}, '10': 'questionContentType'},
    {'1': 'editing_question', '3': 4, '4': 1, '5': 11, '6': '.econa.shared.EditingQuestion', '9': 0, '10': 'editingQuestion'},
    {'1': 'posted_question', '3': 5, '4': 1, '5': 11, '6': '.econa.shared.PostedQuestion', '9': 0, '10': 'postedQuestion'},
  ],
  '8': [
    {'1': 'contents', '2': {}},
  ],
};

/// Descriptor for `Question`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List questionDescriptor = $convert.base64Decode(
    'CghRdWVzdGlvbhIpCgtxdWVzdGlvbl9pZBgBIAEoCUIIukgFcgOwAQFSCnF1ZXN0aW9uSWQSRg'
    'oNYWlfYWdlbnRfY29kZRgCIAEoDjIYLmVjb25hLmVudW1zLkFpQWdlbnRDb2RlQgi6SAWCAQIQ'
    'AVILYWlBZ2VudENvZGUSYAoVcXVlc3Rpb25fY29udGVudF90eXBlGAMgASgOMiAuZWNvbmEuZW'
    '51bXMuUXVlc3Rpb25Db250ZW50VHlwZUIKukgHggEEEAEgAFITcXVlc3Rpb25Db250ZW50VHlw'
    'ZRJKChBlZGl0aW5nX3F1ZXN0aW9uGAQgASgLMh0uZWNvbmEuc2hhcmVkLkVkaXRpbmdRdWVzdG'
    'lvbkgAUg9lZGl0aW5nUXVlc3Rpb24SRwoPcG9zdGVkX3F1ZXN0aW9uGAUgASgLMhwuZWNvbmEu'
    'c2hhcmVkLlBvc3RlZFF1ZXN0aW9uSABSDnBvc3RlZFF1ZXN0aW9uQhEKCGNvbnRlbnRzEgW6SA'
    'IIAQ==');

@$core.Deprecated('Use editingQuestionDescriptor instead')
const EditingQuestion$json = {
  '1': 'EditingQuestion',
  '2': [
    {'1': 'editing_question', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'editingQuestion'},
    {'1': 'proposed_question', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'proposedQuestion'},
    {'1': 'is_rejected', '3': 3, '4': 1, '5': 8, '10': 'isRejected'},
  ],
};

/// Descriptor for `EditingQuestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editingQuestionDescriptor = $convert.base64Decode(
    'Cg9FZGl0aW5nUXVlc3Rpb24SMwoQZWRpdGluZ19xdWVzdGlvbhgBIAEoCUIIukgFcgMYyAFSD2'
    'VkaXRpbmdRdWVzdGlvbhI1ChFwcm9wb3NlZF9xdWVzdGlvbhgCIAEoCUIIukgFcgMYyAFSEHBy'
    'b3Bvc2VkUXVlc3Rpb24SHwoLaXNfcmVqZWN0ZWQYAyABKAhSCmlzUmVqZWN0ZWQ=');

@$core.Deprecated('Use postedQuestionDescriptor instead')
const PostedQuestion$json = {
  '1': 'PostedQuestion',
  '2': [
    {'1': 'moderated_question', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'moderatedQuestion'},
    {'1': 'answer', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'answer'},
    {'1': 'thumbnail_user', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUser'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'answered_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'answeredAt'},
  ],
};

/// Descriptor for `PostedQuestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postedQuestionDescriptor = $convert.base64Decode(
    'Cg5Qb3N0ZWRRdWVzdGlvbhI3ChJtb2RlcmF0ZWRfcXVlc3Rpb24YASABKAlCCLpIBXIDGMgBUh'
    'Ftb2RlcmF0ZWRRdWVzdGlvbhIgCgZhbnN3ZXIYAiABKAlCCLpIBXIDGMgBUgZhbnN3ZXISQgoO'
    'dGh1bWJuYWlsX3VzZXIYAyABKAsyGy5lY29uYS5zaGFyZWQuVGh1bWJuYWlsVXNlclINdGh1bW'
    'JuYWlsVXNlchI5CgpjcmVhdGVkX2F0GAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cFIJY3JlYXRlZEF0EjsKC2Fuc3dlcmVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcFIKYW5zd2VyZWRBdA==');

@$core.Deprecated('Use editingAnswerDescriptor instead')
const EditingAnswer$json = {
  '1': 'EditingAnswer',
  '2': [
    {'1': 'editing_answer', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'editingAnswer'},
    {'1': 'is_rejected', '3': 2, '4': 1, '5': 8, '10': 'isRejected'},
  ],
};

/// Descriptor for `EditingAnswer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List editingAnswerDescriptor = $convert.base64Decode(
    'Cg1FZGl0aW5nQW5zd2VyEi8KDmVkaXRpbmdfYW5zd2VyGAEgASgJQgi6SAVyAxjIAVINZWRpdG'
    'luZ0Fuc3dlchIfCgtpc19yZWplY3RlZBgCIAEoCFIKaXNSZWplY3RlZA==');

@$core.Deprecated('Use postedAnswerDescriptor instead')
const PostedAnswer$json = {
  '1': 'PostedAnswer',
  '2': [
    {'1': 'moderated_answer', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'moderatedAnswer'},
  ],
};

/// Descriptor for `PostedAnswer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postedAnswerDescriptor = $convert.base64Decode(
    'CgxQb3N0ZWRBbnN3ZXISMwoQbW9kZXJhdGVkX2Fuc3dlchgBIAEoCUIIukgFcgMYyAFSD21vZG'
    'VyYXRlZEFuc3dlcg==');

