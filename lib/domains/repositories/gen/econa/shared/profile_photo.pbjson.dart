//
//  Generated code. Do not modify.
//  source: econa/shared/profile_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use profilePhotoDescriptor instead')
const ProfilePhoto$json = {
  '1': 'ProfilePhoto',
  '2': [
    {'1': 'profile_photo_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'profilePhotoId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'signed_image_urls', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.SignedImageUrls', '10': 'signedImageUrls'},
    {'1': 'is_main', '3': 4, '4': 1, '5': 8, '10': 'isMain'},
    {'1': 'display_order', '3': 5, '4': 1, '5': 5, '10': 'displayOrder'},
    {'1': 'service_review_status', '3': 6, '4': 1, '5': 14, '6': '.econa.enums.ServiceReviewStatus', '10': 'serviceReviewStatus'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'already_skipped', '3': 9, '4': 1, '5': 8, '10': 'alreadySkipped'},
    {'1': 'caption', '3': 10, '4': 1, '5': 9, '8': {}, '10': 'caption'},
  ],
};

/// Descriptor for `ProfilePhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profilePhotoDescriptor = $convert.base64Decode(
    'CgxQcm9maWxlUGhvdG8SMgoQcHJvZmlsZV9waG90b19pZBgBIAEoCUIIukgFcgOwAQFSDnByb2'
    'ZpbGVQaG90b0lkEiEKB3VzZXJfaWQYAiABKAlCCLpIBXIDsAEBUgZ1c2VySWQSSQoRc2lnbmVk'
    'X2ltYWdlX3VybHMYAyABKAsyHS5lY29uYS5zaGFyZWQuU2lnbmVkSW1hZ2VVcmxzUg9zaWduZW'
    'RJbWFnZVVybHMSFwoHaXNfbWFpbhgEIAEoCFIGaXNNYWluEiMKDWRpc3BsYXlfb3JkZXIYBSAB'
    'KAVSDGRpc3BsYXlPcmRlchJUChVzZXJ2aWNlX3Jldmlld19zdGF0dXMYBiABKA4yIC5lY29uYS'
    '5lbnVtcy5TZXJ2aWNlUmV2aWV3U3RhdHVzUhNzZXJ2aWNlUmV2aWV3U3RhdHVzEjkKCmNyZWF0'
    'ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQoKdX'
    'BkYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRBdBIn'
    'Cg9hbHJlYWR5X3NraXBwZWQYCSABKAhSDmFscmVhZHlTa2lwcGVkEiIKB2NhcHRpb24YCiABKA'
    'lCCLpIBXIDGMgBUgdjYXB0aW9u');

