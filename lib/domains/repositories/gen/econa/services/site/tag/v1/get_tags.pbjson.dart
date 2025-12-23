//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/get_tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getTagsRequestDescriptor instead')
const GetTagsRequest$json = {
  '1': 'GetTagsRequest',
  '2': [
    {'1': 'tag_category_id', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'tagCategoryId'},
  ],
};

/// Descriptor for `GetTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTagsRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRUYWdzUmVxdWVzdBIvCg90YWdfY2F0ZWdvcnlfaWQYASABKAVCB7pIBBoCIABSDXRhZ0'
    'NhdGVnb3J5SWQ=');

@$core.Deprecated('Use getTagsResponseDescriptor instead')
const GetTagsResponse$json = {
  '1': 'GetTagsResponse',
  '2': [
    {'1': 'tags', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.Tag', '10': 'tags'},
  ],
};

/// Descriptor for `GetTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTagsResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRUYWdzUmVzcG9uc2USJQoEdGFncxgBIAMoCzIRLmVjb25hLnNoYXJlZC5UYWdSBHRhZ3'
    'M=');

