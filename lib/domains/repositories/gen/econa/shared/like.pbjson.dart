//
//  Generated code. Do not modify.
//  source: econa/shared/like.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use likeDescriptor instead')
const Like$json = {
  '1': 'Like',
  '2': [
    {'1': 'user_like_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userLikeId'},
    {'1': 'super_like_message', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'superLikeMessage'},
    {'1': 'simplified_personality_summary', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'simplifiedPersonalitySummary'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'appealed_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'appealedAt'},
  ],
};

/// Descriptor for `Like`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeDescriptor = $convert.base64Decode(
    'CgRMaWtlEioKDHVzZXJfbGlrZV9pZBgBIAEoCUIIukgFcgOwAQFSCnVzZXJMaWtlSWQSNgoSc3'
    'VwZXJfbGlrZV9tZXNzYWdlGAIgASgJQgi6SAVyAxjIAVIQc3VwZXJMaWtlTWVzc2FnZRJNCh5z'
    'aW1wbGlmaWVkX3BlcnNvbmFsaXR5X3N1bW1hcnkYAyABKAlCB7pIBHICGGRSHHNpbXBsaWZpZW'
    'RQZXJzb25hbGl0eVN1bW1hcnkSOQoKY3JlYXRlZF9hdBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI7CgthcHBlYWxlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCmFwcGVhbGVkQXQ=');

