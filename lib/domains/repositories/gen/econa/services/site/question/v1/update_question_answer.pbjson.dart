//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/update_question_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateQuestionAnswerRequestDescriptor instead')
const UpdateQuestionAnswerRequest$json = {
  '1': 'UpdateQuestionAnswerRequest',
  '2': [
    {'1': 'user_question_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userQuestionId'},
    {'1': 'raw_user_answer', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'rawUserAnswer'},
    {'1': 'published_user_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'publishedUserId'},
  ],
};

/// Descriptor for `UpdateQuestionAnswerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateQuestionAnswerRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVRdWVzdGlvbkFuc3dlclJlcXVlc3QSMgoQdXNlcl9xdWVzdGlvbl9pZBgBIAEoCU'
    'IIukgFcgOwAQFSDnVzZXJRdWVzdGlvbklkEjAKD3Jhd191c2VyX2Fuc3dlchgCIAEoCUIIukgF'
    'cgMYyAFSDXJhd1VzZXJBbnN3ZXISNAoRcHVibGlzaGVkX3VzZXJfaWQYAyABKAlCCLpIBXIDsA'
    'EBUg9wdWJsaXNoZWRVc2VySWQ=');

@$core.Deprecated('Use updateQuestionAnswerResponseDescriptor instead')
const UpdateQuestionAnswerResponse$json = {
  '1': 'UpdateQuestionAnswerResponse',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.Question', '10': 'question'},
  ],
};

/// Descriptor for `UpdateQuestionAnswerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateQuestionAnswerResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVRdWVzdGlvbkFuc3dlclJlc3BvbnNlEjIKCHF1ZXN0aW9uGAEgASgLMhYuZWNvbm'
    'Euc2hhcmVkLlF1ZXN0aW9uUghxdWVzdGlvbg==');

