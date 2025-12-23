//
//  Generated code. Do not modify.
//  source: econa/shared/thumbnail_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use thumbnailUserDescriptor instead')
const ThumbnailUser$json = {
  '1': 'ThumbnailUser',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'profile', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.Profile', '10': 'profile'},
    {'1': 'like', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.Like', '10': 'like'},
    {'1': 'received_like', '3': 4, '4': 1, '5': 11, '6': '.econa.shared.Like', '10': 'receivedLike'},
    {'1': 'user_status', '3': 5, '4': 1, '5': 11, '6': '.econa.shared.UserStatus', '10': 'userStatus'},
    {'1': 'is_favorite', '3': 6, '4': 1, '5': 8, '10': 'isFavorite'},
    {'1': 'last_activity_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastActivityAt'},
    {'1': 'recommendation_score', '3': 8, '4': 1, '5': 11, '6': '.econa.shared.RecommendationScore', '10': 'recommendationScore'},
    {'1': 'newbie_tag', '3': 9, '4': 1, '5': 14, '6': '.econa.enums.NewbieTag', '8': {}, '10': 'newbieTag'},
    {'1': 'user_activity_tag', '3': 10, '4': 1, '5': 14, '6': '.econa.enums.UserActivityTag', '8': {}, '10': 'userActivityTag'},
  ],
};

/// Descriptor for `ThumbnailUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List thumbnailUserDescriptor = $convert.base64Decode(
    'Cg1UaHVtYm5haWxVc2VyEiEKB3VzZXJfaWQYASABKAlCCLpIBXIDsAEBUgZ1c2VySWQSLwoHcH'
    'JvZmlsZRgCIAEoCzIVLmVjb25hLnNoYXJlZC5Qcm9maWxlUgdwcm9maWxlEiYKBGxpa2UYAyAB'
    'KAsyEi5lY29uYS5zaGFyZWQuTGlrZVIEbGlrZRI3Cg1yZWNlaXZlZF9saWtlGAQgASgLMhIuZW'
    'NvbmEuc2hhcmVkLkxpa2VSDHJlY2VpdmVkTGlrZRI5Cgt1c2VyX3N0YXR1cxgFIAEoCzIYLmVj'
    'b25hLnNoYXJlZC5Vc2VyU3RhdHVzUgp1c2VyU3RhdHVzEh8KC2lzX2Zhdm9yaXRlGAYgASgIUg'
    'ppc0Zhdm9yaXRlEkQKEGxhc3RfYWN0aXZpdHlfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYu'
    'VGltZXN0YW1wUg5sYXN0QWN0aXZpdHlBdBJUChRyZWNvbW1lbmRhdGlvbl9zY29yZRgIIAEoCz'
    'IhLmVjb25hLnNoYXJlZC5SZWNvbW1lbmRhdGlvblNjb3JlUhNyZWNvbW1lbmRhdGlvblNjb3Jl'
    'Ej8KCm5ld2JpZV90YWcYCSABKA4yFi5lY29uYS5lbnVtcy5OZXdiaWVUYWdCCLpIBYIBAhABUg'
    'luZXdiaWVUYWcSUgoRdXNlcl9hY3Rpdml0eV90YWcYCiABKA4yHC5lY29uYS5lbnVtcy5Vc2Vy'
    'QWN0aXZpdHlUYWdCCLpIBYIBAhABUg91c2VyQWN0aXZpdHlUYWc=');

