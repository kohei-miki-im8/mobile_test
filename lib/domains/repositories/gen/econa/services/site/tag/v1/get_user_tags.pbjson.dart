//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/get_user_tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserTagsRequestDescriptor instead')
const GetUserTagsRequest$json = {
  '1': 'GetUserTagsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserTagsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserTagsRequestDescriptor = $convert.base64Decode(
    'ChJHZXRVc2VyVGFnc1JlcXVlc3QSIQoHdXNlcl9pZBgBIAEoCUIIukgFcgOwAQFSBnVzZXJJZA'
    '==');

@$core.Deprecated('Use getUserTagsResponseDescriptor instead')
const GetUserTagsResponse$json = {
  '1': 'GetUserTagsResponse',
  '2': [
    {'1': 'user_tags', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.UserTag', '10': 'userTags'},
  ],
};

/// Descriptor for `GetUserTagsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserTagsResponseDescriptor = $convert.base64Decode(
    'ChNHZXRVc2VyVGFnc1Jlc3BvbnNlEjIKCXVzZXJfdGFncxgBIAMoCzIVLmVjb25hLnNoYXJlZC'
    '5Vc2VyVGFnUgh1c2VyVGFncw==');

