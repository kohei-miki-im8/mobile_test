//
//  Generated code. Do not modify.
//  source: econa/shared/tag_category.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tagCategoryDescriptor instead')
const TagCategory$json = {
  '1': 'TagCategory',
  '2': [
    {'1': 'tag_category_id', '3': 1, '4': 1, '5': 5, '10': 'tagCategoryId'},
    {'1': 'category_name', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'categoryName'},
    {'1': 'sort_order', '3': 3, '4': 1, '5': 5, '10': 'sortOrder'},
    {'1': 'description', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'description'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `TagCategory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagCategoryDescriptor = $convert.base64Decode(
    'CgtUYWdDYXRlZ29yeRImCg90YWdfY2F0ZWdvcnlfaWQYASABKAVSDXRhZ0NhdGVnb3J5SWQSLg'
    'oNY2F0ZWdvcnlfbmFtZRgCIAEoCUIJukgGcgQQARgyUgxjYXRlZ29yeU5hbWUSHQoKc29ydF9v'
    'cmRlchgDIAEoBVIJc29ydE9yZGVyEioKC2Rlc2NyaXB0aW9uGAQgASgJQgi6SAVyAxjIAVILZG'
    'VzY3JpcHRpb24SOQoKY3JlYXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
    'bXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcFIJdXBkYXRlZEF0');

