//
//  Generated code. Do not modify.
//  source: econa/services/site/footprint/v1/get_footprints.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getFootprintsRequestDescriptor instead')
const GetFootprintsRequest$json = {
  '1': 'GetFootprintsRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetFootprintsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFootprintsRequestDescriptor = $convert.base64Decode(
    'ChRHZXRGb290cHJpbnRzUmVxdWVzdBJACgZjdXJzb3IYDyABKAsyIC5lY29uYS5zaGFyZWQuUG'
    'FnZXJSZXF1ZXN0Q3Vyc29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getFootprintsResponseDescriptor instead')
const GetFootprintsResponse$json = {
  '1': 'GetFootprintsResponse',
  '2': [
    {'1': 'thumbnail_users', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ThumbnailUser', '10': 'thumbnailUsers'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetFootprintsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFootprintsResponseDescriptor = $convert.base64Decode(
    'ChVHZXRGb290cHJpbnRzUmVzcG9uc2USRAoPdGh1bWJuYWlsX3VzZXJzGAEgAygLMhsuZWNvbm'
    'Euc2hhcmVkLlRodW1ibmFpbFVzZXJSDnRodW1ibmFpbFVzZXJzEjkKBmN1cnNvchgPIAEoCzIh'
    'LmVjb25hLnNoYXJlZC5QYWdlclJlc3BvbnNlQ3Vyc29yUgZjdXJzb3I=');

