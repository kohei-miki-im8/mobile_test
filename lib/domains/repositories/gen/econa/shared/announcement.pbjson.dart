//
//  Generated code. Do not modify.
//  source: econa/shared/announcement.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use announcementDescriptor instead')
const Announcement$json = {
  '1': 'Announcement',
  '2': [
    {'1': 'announcement_id', '3': 1, '4': 1, '5': 9, '10': 'announcementId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    {'1': 'image_url', '3': 4, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'link_url', '3': 5, '4': 1, '5': 9, '10': 'linkUrl'},
    {'1': 'target_type', '3': 6, '4': 1, '5': 14, '6': '.econa.enums.AnnouncementTargetType', '10': 'targetType'},
    {'1': 'priority', '3': 7, '4': 1, '5': 5, '10': 'priority'},
    {'1': 'start_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'startAt'},
    {'1': 'end_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endAt'},
    {'1': 'created_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `Announcement`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List announcementDescriptor = $convert.base64Decode(
    'CgxBbm5vdW5jZW1lbnQSJwoPYW5ub3VuY2VtZW50X2lkGAEgASgJUg5hbm5vdW5jZW1lbnRJZB'
    'IUCgV0aXRsZRgCIAEoCVIFdGl0bGUSEgoEYm9keRgDIAEoCVIEYm9keRIbCglpbWFnZV91cmwY'
    'BCABKAlSCGltYWdlVXJsEhkKCGxpbmtfdXJsGAUgASgJUgdsaW5rVXJsEkQKC3RhcmdldF90eX'
    'BlGAYgASgOMiMuZWNvbmEuZW51bXMuQW5ub3VuY2VtZW50VGFyZ2V0VHlwZVIKdGFyZ2V0VHlw'
    'ZRIaCghwcmlvcml0eRgHIAEoBVIIcHJpb3JpdHkSNQoIc3RhcnRfYXQYCCABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgdzdGFydEF0EjEKBmVuZF9hdBgJIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSBWVuZEF0EjkKCmNyZWF0ZWRfYXQYCiABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');

