//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/create_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createQuestionRequestDescriptor instead')
const CreateQuestionRequest$json = {
  '1': 'CreateQuestionRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'raw_question', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'rawQuestion'},
    {'1': 'user_question_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'userQuestionId'},
  ],
};

/// Descriptor for `CreateQuestionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createQuestionRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVRdWVzdGlvblJlcXVlc3QSJgoKdG9fdXNlcl9pZBgBIAEoCUIIukgFcgOwAQFSCH'
    'RvVXNlcklkEi0KDHJhd19xdWVzdGlvbhgCIAEoCUIKukgHcgUQARjIAVILcmF3UXVlc3Rpb24S'
    'MgoQdXNlcl9xdWVzdGlvbl9pZBgDIAEoCUIIukgFcgOwAQFSDnVzZXJRdWVzdGlvbklk');

@$core.Deprecated('Use createQuestionResponseDescriptor instead')
const CreateQuestionResponse$json = {
  '1': 'CreateQuestionResponse',
  '2': [
    {'1': 'user_question_id', '3': 1, '4': 1, '5': 9, '10': 'userQuestionId'},
  ],
};

/// Descriptor for `CreateQuestionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createQuestionResponseDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVRdWVzdGlvblJlc3BvbnNlEigKEHVzZXJfcXVlc3Rpb25faWQYASABKAlSDnVzZX'
    'JRdWVzdGlvbklk');

