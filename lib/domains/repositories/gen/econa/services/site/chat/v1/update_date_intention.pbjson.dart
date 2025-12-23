//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_date_intention.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateDateIntentionRequestDescriptor instead')
const UpdateDateIntentionRequest$json = {
  '1': 'UpdateDateIntentionRequest',
  '2': [
    {'1': 'chat_message_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatMessageId'},
    {'1': 'has_date_intention', '3': 2, '4': 1, '5': 8, '8': {}, '10': 'hasDateIntention'},
  ],
};

/// Descriptor for `UpdateDateIntentionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDateIntentionRequestDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVEYXRlSW50ZW50aW9uUmVxdWVzdBIwCg9jaGF0X21lc3NhZ2VfaWQYASABKAlCCL'
    'pIBXIDsAEBUg1jaGF0TWVzc2FnZUlkEjUKEmhhc19kYXRlX2ludGVudGlvbhgCIAEoCEIHukgE'
    'agIIAVIQaGFzRGF0ZUludGVudGlvbg==');

@$core.Deprecated('Use updateDateIntentionResponseDescriptor instead')
const UpdateDateIntentionResponse$json = {
  '1': 'UpdateDateIntentionResponse',
};

/// Descriptor for `UpdateDateIntentionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDateIntentionResponseDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVEYXRlSW50ZW50aW9uUmVzcG9uc2U=');

