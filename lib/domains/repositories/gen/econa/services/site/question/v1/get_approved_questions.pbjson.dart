//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/get_approved_questions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getApprovedQuestionsRequestDescriptor instead')
const GetApprovedQuestionsRequest$json = {
  '1': 'GetApprovedQuestionsRequest',
  '2': [
    {'1': 'is_from_me', '3': 1, '4': 1, '5': 8, '8': {}, '10': 'isFromMe'},
    {'1': 'to_user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'moderation_status_code', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.ModerationStatusCode', '8': {}, '10': 'moderationStatusCode'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetApprovedQuestionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getApprovedQuestionsRequestDescriptor = $convert.base64Decode(
    'ChtHZXRBcHByb3ZlZFF1ZXN0aW9uc1JlcXVlc3QSJAoKaXNfZnJvbV9tZRgBIAEoCEIGukgDyA'
    'EBUghpc0Zyb21NZRImCgp0b191c2VyX2lkGAIgASgJQgi6SAVyA7ABAVIIdG9Vc2VySWQSYQoW'
    'bW9kZXJhdGlvbl9zdGF0dXNfY29kZRgDIAEoDjIhLmVjb25hLmVudW1zLk1vZGVyYXRpb25TdG'
    'F0dXNDb2RlQgi6SAWCAQIIAlIUbW9kZXJhdGlvblN0YXR1c0NvZGUSQAoGY3Vyc29yGA8gASgL'
    'MiAuZWNvbmEuc2hhcmVkLlBhZ2VyUmVxdWVzdEN1cnNvckIGukgDyAEBUgZjdXJzb3I=');

@$core.Deprecated('Use getApprovedQuestionsResponseDescriptor instead')
const GetApprovedQuestionsResponse$json = {
  '1': 'GetApprovedQuestionsResponse',
  '2': [
    {'1': 'questions', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.Question', '10': 'questions'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetApprovedQuestionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getApprovedQuestionsResponseDescriptor = $convert.base64Decode(
    'ChxHZXRBcHByb3ZlZFF1ZXN0aW9uc1Jlc3BvbnNlEjQKCXF1ZXN0aW9ucxgBIAMoCzIWLmVjb2'
    '5hLnNoYXJlZC5RdWVzdGlvblIJcXVlc3Rpb25zEjkKBmN1cnNvchgPIAEoCzIhLmVjb25hLnNo'
    'YXJlZC5QYWdlclJlc3BvbnNlQ3Vyc29yUgZjdXJzb3I=');

