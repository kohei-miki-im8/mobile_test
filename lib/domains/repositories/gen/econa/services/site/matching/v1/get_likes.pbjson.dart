//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/get_likes.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getLikesRequestDescriptor instead')
const GetLikesRequest$json = {
  '1': 'GetLikesRequest',
  '2': [
    {'1': 'is_sent_by_me', '3': 1, '4': 1, '5': 8, '8': {}, '10': 'isSentByMe'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetLikesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLikesRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRMaWtlc1JlcXVlc3QSKQoNaXNfc2VudF9ieV9tZRgBIAEoCEIGukgDyAEBUgppc1Nlbn'
    'RCeU1lEkAKBmN1cnNvchgPIAEoCzIgLmVjb25hLnNoYXJlZC5QYWdlclJlcXVlc3RDdXJzb3JC'
    'BrpIA8gBAVIGY3Vyc29y');

@$core.Deprecated('Use getLikesResponseDescriptor instead')
const GetLikesResponse$json = {
  '1': 'GetLikesResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetLikesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLikesResponseDescriptor = $convert.base64Decode(
    'ChBHZXRMaWtlc1Jlc3BvbnNlEkQKD3RodW1ibmFpbF91c2VycxgBIAMoCzIbLmVjb25hLnNoYX'
    'JlZC5UaHVtYm5haWxVc2VyUg50aHVtYm5haWxVc2VycxI5CgZjdXJzb3IYDyABKAsyIS5lY29u'
    'YS5zaGFyZWQuUGFnZXJSZXNwb25zZUN1cnNvclIGY3Vyc29y');

