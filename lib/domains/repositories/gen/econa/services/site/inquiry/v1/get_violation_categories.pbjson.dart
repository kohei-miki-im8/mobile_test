//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/get_violation_categories.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getViolationCategoriesRequestDescriptor instead')
const GetViolationCategoriesRequest$json = {
  '1': 'GetViolationCategoriesRequest',
};

/// Descriptor for `GetViolationCategoriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getViolationCategoriesRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRWaW9sYXRpb25DYXRlZ29yaWVzUmVxdWVzdA==');

@$core.Deprecated('Use getViolationCategoriesResponseDescriptor instead')
const GetViolationCategoriesResponse$json = {
  '1': 'GetViolationCategoriesResponse',
  '2': [
    {'1': 'categories', '3': 1, '4': 3, '5': 11, '6': '.econa.services.site.inquiry.v1.ViolationCategory', '10': 'categories'},
  ],
};

/// Descriptor for `GetViolationCategoriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getViolationCategoriesResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRWaW9sYXRpb25DYXRlZ29yaWVzUmVzcG9uc2USUQoKY2F0ZWdvcmllcxgBIAMoCzIxLm'
    'Vjb25hLnNlcnZpY2VzLnNpdGUuaW5xdWlyeS52MS5WaW9sYXRpb25DYXRlZ29yeVIKY2F0ZWdv'
    'cmllcw==');

@$core.Deprecated('Use violationCategoryDescriptor instead')
const ViolationCategory$json = {
  '1': 'ViolationCategory',
  '2': [
    {'1': 'inquiry_category_id', '3': 1, '4': 1, '5': 5, '10': 'inquiryCategoryId'},
    {'1': 'category_name', '3': 2, '4': 1, '5': 9, '10': 'categoryName'},
    {'1': 'display_order', '3': 3, '4': 1, '5': 5, '10': 'displayOrder'},
  ],
};

/// Descriptor for `ViolationCategory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List violationCategoryDescriptor = $convert.base64Decode(
    'ChFWaW9sYXRpb25DYXRlZ29yeRIuChNpbnF1aXJ5X2NhdGVnb3J5X2lkGAEgASgFUhFpbnF1aX'
    'J5Q2F0ZWdvcnlJZBIjCg1jYXRlZ29yeV9uYW1lGAIgASgJUgxjYXRlZ29yeU5hbWUSIwoNZGlz'
    'cGxheV9vcmRlchgDIAEoBVIMZGlzcGxheU9yZGVy');

