//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/get_announcements.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getAnnouncementsRequestDescriptor instead')
const GetAnnouncementsRequest$json = {
  '1': 'GetAnnouncementsRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetAnnouncementsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAnnouncementsRequestDescriptor = $convert.base64Decode(
    'ChdHZXRBbm5vdW5jZW1lbnRzUmVxdWVzdBJACgZjdXJzb3IYDyABKAsyIC5lY29uYS5zaGFyZW'
    'QuUGFnZXJSZXF1ZXN0Q3Vyc29yQga6SAPIAQFSBmN1cnNvcg==');

@$core.Deprecated('Use getAnnouncementsResponseDescriptor instead')
const GetAnnouncementsResponse$json = {
  '1': 'GetAnnouncementsResponse',
  '2': [
    {'1': 'announcements', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.Announcement', '10': 'announcements'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetAnnouncementsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAnnouncementsResponseDescriptor = $convert.base64Decode(
    'ChhHZXRBbm5vdW5jZW1lbnRzUmVzcG9uc2USQAoNYW5ub3VuY2VtZW50cxgBIAMoCzIaLmVjb2'
    '5hLnNoYXJlZC5Bbm5vdW5jZW1lbnRSDWFubm91bmNlbWVudHMSOQoGY3Vyc29yGA8gASgLMiEu'
    'ZWNvbmEuc2hhcmVkLlBhZ2VyUmVzcG9uc2VDdXJzb3JSBmN1cnNvcg==');

