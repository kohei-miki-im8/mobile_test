//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/approve_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use approveQuestionRequestDescriptor instead')
const ApproveQuestionRequest$json = {
  '1': 'ApproveQuestionRequest',
  '2': [
    {'1': 'user_question_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userQuestionId'},
    {'1': 'approved_question', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'approvedQuestion'},
  ],
};

/// Descriptor for `ApproveQuestionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveQuestionRequestDescriptor = $convert.base64Decode(
    'ChZBcHByb3ZlUXVlc3Rpb25SZXF1ZXN0EjUKEHVzZXJfcXVlc3Rpb25faWQYASABKAlCC7pICM'
    'gBAXIDsAEBUg51c2VyUXVlc3Rpb25JZBI3ChFhcHByb3ZlZF9xdWVzdGlvbhgCIAEoCUIKukgH'
    'cgUQARjIAVIQYXBwcm92ZWRRdWVzdGlvbg==');

@$core.Deprecated('Use approveQuestionResponseDescriptor instead')
const ApproveQuestionResponse$json = {
  '1': 'ApproveQuestionResponse',
  '2': [
    {'1': 'question', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.Question', '10': 'question'},
  ],
};

/// Descriptor for `ApproveQuestionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approveQuestionResponseDescriptor = $convert.base64Decode(
    'ChdBcHByb3ZlUXVlc3Rpb25SZXNwb25zZRIyCghxdWVzdGlvbhgBIAEoCzIWLmVjb25hLnNoYX'
    'JlZC5RdWVzdGlvblIIcXVlc3Rpb24=');

