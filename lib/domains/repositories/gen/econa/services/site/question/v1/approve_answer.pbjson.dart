//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/approve_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use approveAnswerRequestDescriptor instead')
const ApproveAnswerRequest$json = {
  '1': 'ApproveAnswerRequest',
  '2': [
    {'1': 'user_question_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userQuestionId'},
    {'1': 'approved_answer', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'approvedAnswer'},
  ],
};

/// Descriptor for `ApproveAnswerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveAnswerRequestDescriptor = $convert.base64Decode(
    'ChRBcHByb3ZlQW5zd2VyUmVxdWVzdBIyChB1c2VyX3F1ZXN0aW9uX2lkGAEgASgJQgi6SAVyA7'
    'ABAVIOdXNlclF1ZXN0aW9uSWQSMwoPYXBwcm92ZWRfYW5zd2VyGAIgASgJQgq6SAdyBRABGMgB'
    'Ug5hcHByb3ZlZEFuc3dlcg==');

@$core.Deprecated('Use approveAnswerResponseDescriptor instead')
const ApproveAnswerResponse$json = {
  '1': 'ApproveAnswerResponse',
  '2': [
    {'1': 'is_successful', '3': 1, '4': 1, '5': 8, '10': 'isSuccessful'},
  ],
};

/// Descriptor for `ApproveAnswerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveAnswerResponseDescriptor = $convert.base64Decode(
    'ChVBcHByb3ZlQW5zd2VyUmVzcG9uc2USIwoNaXNfc3VjY2Vzc2Z1bBgBIAEoCFIMaXNTdWNjZX'
    'NzZnVs');

