//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/get_skips.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getSkipsRequestDescriptor instead')
const GetSkipsRequest$json = {
  '1': 'GetSkipsRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetSkipsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSkipsRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRTa2lwc1JlcXVlc3QSQAoGY3Vyc29yGA8gASgLMiAuZWNvbmEuc2hhcmVkLlBhZ2VyUm'
    'VxdWVzdEN1cnNvckIGukgDyAEBUgZjdXJzb3I=');

@$core.Deprecated('Use getSkipsResponseDescriptor instead')
const GetSkipsResponse$json = {
  '1': 'GetSkipsResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetSkipsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSkipsResponseDescriptor = $convert.base64Decode(
    'ChBHZXRTa2lwc1Jlc3BvbnNlEkQKD3RodW1ibmFpbF91c2VycxgBIAMoCzIbLmVjb25hLnNoYX'
    'JlZC5UaHVtYm5haWxVc2VyUg50aHVtYm5haWxVc2VycxI5CgZjdXJzb3IYDyABKAsyIS5lY29u'
    'YS5zaGFyZWQuUGFnZXJSZXNwb25zZUN1cnNvclIGY3Vyc29y');

