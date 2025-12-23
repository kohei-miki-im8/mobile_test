//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/subscribe_question_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use subscribeQuestionSessionRequestDescriptor instead')
const SubscribeQuestionSessionRequest$json = {
  '1': 'SubscribeQuestionSessionRequest',
  '2': [
    {'1': 'user_question_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userQuestionId'},
  ],
};

/// Descriptor for `SubscribeQuestionSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeQuestionSessionRequestDescriptor = $convert.base64Decode(
    'Ch9TdWJzY3JpYmVRdWVzdGlvblNlc3Npb25SZXF1ZXN0EjIKEHVzZXJfcXVlc3Rpb25faWQYAS'
    'ABKAlCCLpIBXIDsAEBUg51c2VyUXVlc3Rpb25JZA==');

@$core.Deprecated('Use subscribeQuestionSessionResponseDescriptor instead')
const SubscribeQuestionSessionResponse$json = {
  '1': 'SubscribeQuestionSessionResponse',
  '2': [
    {'1': 'published_user_id', '3': 1, '4': 1, '5': 9, '10': 'publishedUserId'},
    {'1': 'publish_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.QuestionSessionPublishType', '8': {}, '10': 'publishType'},
    {'1': 'editing_question', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.EditingQuestion', '9': 0, '10': 'editingQuestion'},
    {'1': 'posted_question', '3': 4, '4': 1, '5': 11, '6': '.econa.shared.PostedQuestion', '9': 0, '10': 'postedQuestion'},
    {'1': 'editing_answer', '3': 5, '4': 1, '5': 11, '6': '.econa.shared.EditingAnswer', '9': 0, '10': 'editingAnswer'},
    {'1': 'posted_answer', '3': 6, '4': 1, '5': 11, '6': '.econa.shared.PostedAnswer', '9': 0, '10': 'postedAnswer'},
    {'1': 'is_successful', '3': 15, '4': 1, '5': 8, '10': 'isSuccessful'},
  ],
  '8': [
    {'1': 'response', '2': {}},
  ],
};

/// Descriptor for `SubscribeQuestionSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeQuestionSessionResponseDescriptor = $convert.base64Decode(
    'CiBTdWJzY3JpYmVRdWVzdGlvblNlc3Npb25SZXNwb25zZRIqChFwdWJsaXNoZWRfdXNlcl9pZB'
    'gBIAEoCVIPcHVibGlzaGVkVXNlcklkElYKDHB1Ymxpc2hfdHlwZRgCIAEoDjInLmVjb25hLmVu'
    'dW1zLlF1ZXN0aW9uU2Vzc2lvblB1Ymxpc2hUeXBlQgq6SAeCAQQQASAAUgtwdWJsaXNoVHlwZR'
    'JKChBlZGl0aW5nX3F1ZXN0aW9uGAMgASgLMh0uZWNvbmEuc2hhcmVkLkVkaXRpbmdRdWVzdGlv'
    'bkgAUg9lZGl0aW5nUXVlc3Rpb24SRwoPcG9zdGVkX3F1ZXN0aW9uGAQgASgLMhwuZWNvbmEuc2'
    'hhcmVkLlBvc3RlZFF1ZXN0aW9uSABSDnBvc3RlZFF1ZXN0aW9uEkQKDmVkaXRpbmdfYW5zd2Vy'
    'GAUgASgLMhsuZWNvbmEuc2hhcmVkLkVkaXRpbmdBbnN3ZXJIAFINZWRpdGluZ0Fuc3dlchJBCg'
    '1wb3N0ZWRfYW5zd2VyGAYgASgLMhouZWNvbmEuc2hhcmVkLlBvc3RlZEFuc3dlckgAUgxwb3N0'
    'ZWRBbnN3ZXISIwoNaXNfc3VjY2Vzc2Z1bBgPIAEoCFIMaXNTdWNjZXNzZnVsQhEKCHJlc3Bvbn'
    'NlEgW6SAIIAQ==');

