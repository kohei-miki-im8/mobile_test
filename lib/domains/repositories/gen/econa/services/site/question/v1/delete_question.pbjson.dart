//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/delete_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deleteQuestionRequestDescriptor instead')
const DeleteQuestionRequest$json = {
  '1': 'DeleteQuestionRequest',
  '2': [
    {'1': 'question_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'questionId'},
  ],
};

/// Descriptor for `DeleteQuestionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteQuestionRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVRdWVzdGlvblJlcXVlc3QSKQoLcXVlc3Rpb25faWQYASABKAlCCLpIBXIDsAEBUg'
    'pxdWVzdGlvbklk');

@$core.Deprecated('Use deleteQuestionResponseDescriptor instead')
const DeleteQuestionResponse$json = {
  '1': 'DeleteQuestionResponse',
};

/// Descriptor for `DeleteQuestionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteQuestionResponseDescriptor = $convert.base64Decode(
    'ChZEZWxldGVRdWVzdGlvblJlc3BvbnNl');

