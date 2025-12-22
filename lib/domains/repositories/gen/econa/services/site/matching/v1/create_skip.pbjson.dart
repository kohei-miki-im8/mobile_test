//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/create_skip.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createSkipRequestDescriptor instead')
const CreateSkipRequest$json = {
  '1': 'CreateSkipRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'displayed_photo_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'displayedPhotoId'},
    {'1': 'skip_source', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.SkipSourceCode', '8': {}, '10': 'skipSource'},
  ],
};

/// Descriptor for `CreateSkipRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSkipRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVTa2lwUmVxdWVzdBImCgp0b191c2VyX2lkGAEgASgJQgi6SAVyA7ABAVIIdG9Vc2'
    'VySWQSNgoSZGlzcGxheWVkX3Bob3RvX2lkGAIgASgJQgi6SAVyA7ABAVIQZGlzcGxheWVkUGhv'
    'dG9JZBJICgtza2lwX3NvdXJjZRgDIAEoDjIbLmVjb25hLmVudW1zLlNraXBTb3VyY2VDb2RlQg'
    'q6SAeCAQQQASAAUgpza2lwU291cmNl');

@$core.Deprecated('Use createSkipResponseDescriptor instead')
const CreateSkipResponse$json = {
  '1': 'CreateSkipResponse',
};

/// Descriptor for `CreateSkipResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSkipResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVTa2lwUmVzcG9uc2U=');

