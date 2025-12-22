//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/delete_user_tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deleteUserTagRequestDescriptor instead')
const DeleteUserTagRequest$json = {
  '1': 'DeleteUserTagRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'tag_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'tagId'},
  ],
};

/// Descriptor for `DeleteUserTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserTagRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVVc2VyVGFnUmVxdWVzdBIhCgd1c2VyX2lkGAEgASgJQgi6SAVyA7ABAVIGdXNlck'
    'lkEh8KBnRhZ19pZBgCIAEoCUIIukgFcgOwAQFSBXRhZ0lk');

@$core.Deprecated('Use deleteUserTagResponseDescriptor instead')
const DeleteUserTagResponse$json = {
  '1': 'DeleteUserTagResponse',
};

/// Descriptor for `DeleteUserTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUserTagResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVVc2VyVGFnUmVzcG9uc2U=');

