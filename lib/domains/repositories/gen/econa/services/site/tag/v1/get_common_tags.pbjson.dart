//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/get_common_tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getCommonTagsRequestDescriptor instead')
const GetCommonTagsRequest$json = {
  '1': 'GetCommonTagsRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'limit'},
  ],
};

/// Descriptor for `GetCommonTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommonTagsRequestDescriptor = $convert.base64Decode(
    'ChRHZXRDb21tb25UYWdzUmVxdWVzdBImCgp0b191c2VyX2lkGAEgASgJQgi6SAVyA7ABAVIIdG'
    '9Vc2VySWQSHwoFbGltaXQYAiABKAVCCbpIBhoEGBQoAVIFbGltaXQ=');

@$core.Deprecated('Use getCommonTagsResponseDescriptor instead')
const GetCommonTagsResponse$json = {
  '1': 'GetCommonTagsResponse',
  '2': [
    {'1': 'common_tags', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.UserTag', '10': 'commonTags'},
  ],
};

/// Descriptor for `GetCommonTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommonTagsResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDb21tb25UYWdzUmVzcG9uc2USNgoLY29tbW9uX3RhZ3MYASADKAsyFS5lY29uYS5zaG'
    'FyZWQuVXNlclRhZ1IKY29tbW9uVGFncw==');

