//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/sync_user_tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use syncUserTagRequestDescriptor instead')
const SyncUserTagRequest$json = {
  '1': 'SyncUserTagRequest',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'tagId'},
    {'1': 'is_attached', '3': 2, '4': 1, '5': 8, '10': 'isAttached'},
  ],
};

/// Descriptor for `SyncUserTagRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncUserTagRequestDescriptor = $convert.base64Decode(
    'ChJTeW5jVXNlclRhZ1JlcXVlc3QSHwoGdGFnX2lkGAEgASgJQgi6SAVyA7ABAVIFdGFnSWQSHw'
    'oLaXNfYXR0YWNoZWQYAiABKAhSCmlzQXR0YWNoZWQ=');

@$core.Deprecated('Use syncUserTagResponseDescriptor instead')
const SyncUserTagResponse$json = {
  '1': 'SyncUserTagResponse',
};

/// Descriptor for `SyncUserTagResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncUserTagResponseDescriptor = $convert.base64Decode(
    'ChNTeW5jVXNlclRhZ1Jlc3BvbnNl');

