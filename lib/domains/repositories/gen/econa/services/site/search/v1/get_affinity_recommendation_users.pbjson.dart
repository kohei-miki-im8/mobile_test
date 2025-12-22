//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/get_affinity_recommendation_users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cacheStatusDescriptor instead')
const CacheStatus$json = {
  '1': 'CacheStatus',
  '2': [
    {'1': 'CACHE_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'CACHE_STATUS_HIT', '2': 1},
    {'1': 'CACHE_STATUS_MISS', '2': 2},
    {'1': 'CACHE_STATUS_REGENERATED', '2': 3},
  ],
};

/// Descriptor for `CacheStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cacheStatusDescriptor = $convert.base64Decode(
    'CgtDYWNoZVN0YXR1cxIcChhDQUNIRV9TVEFUVVNfVU5TUEVDSUZJRUQQABIUChBDQUNIRV9TVE'
    'FUVVNfSElUEAESFQoRQ0FDSEVfU1RBVFVTX01JU1MQAhIcChhDQUNIRV9TVEFUVVNfUkVHRU5F'
    'UkFURUQQAw==');

@$core.Deprecated('Use getAffinityRecommendationUsersRequestDescriptor instead')
const GetAffinityRecommendationUsersRequest$json = {
  '1': 'GetAffinityRecommendationUsersRequest',
  '2': [
    {'1': 'regenerate', '3': 1, '4': 1, '5': 8, '10': 'regenerate'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'limit'},
    {'1': 'request_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'requestId'},
  ],
};

/// Descriptor for `GetAffinityRecommendationUsersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAffinityRecommendationUsersRequestDescriptor = $convert.base64Decode(
    'CiVHZXRBZmZpbml0eVJlY29tbWVuZGF0aW9uVXNlcnNSZXF1ZXN0Eh4KCnJlZ2VuZXJhdGUYAS'
    'ABKAhSCnJlZ2VuZXJhdGUSHwoFbGltaXQYAiABKAVCCbpIBhoEGAUoAVIFbGltaXQSJgoKcmVx'
    'dWVzdF9pZBgDIAEoCUIHukgEcgIYQFIJcmVxdWVzdElk');

@$core.Deprecated('Use affinityRecommendationUserDescriptor instead')
const AffinityRecommendationUser$json = {
  '1': 'AffinityRecommendationUser',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'matching_reason', '3': 2, '4': 1, '5': 11, '6': '.econa.services.site.search.v1.MatchingReason', '10': 'matchingReason'},
  ],
};

/// Descriptor for `AffinityRecommendationUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List affinityRecommendationUserDescriptor = $convert.base64Decode(
    'ChpBZmZpbml0eVJlY29tbWVuZGF0aW9uVXNlchIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSVg'
    'oPbWF0Y2hpbmdfcmVhc29uGAIgASgLMi0uZWNvbmEuc2VydmljZXMuc2l0ZS5zZWFyY2gudjEu'
    'TWF0Y2hpbmdSZWFzb25SDm1hdGNoaW5nUmVhc29u');

@$core.Deprecated('Use matchingReasonDescriptor instead')
const MatchingReason$json = {
  '1': 'MatchingReason',
  '2': [
    {'1': 'main_title', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'mainTitle'},
    {'1': 'main_content', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'mainContent'},
    {'1': 'reason_details', '3': 3, '4': 3, '5': 11, '6': '.econa.services.site.search.v1.ReasonDetail', '8': {}, '10': 'reasonDetails'},
  ],
};

/// Descriptor for `MatchingReason`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List matchingReasonDescriptor = $convert.base64Decode(
    'Cg5NYXRjaGluZ1JlYXNvbhImCgptYWluX3RpdGxlGAEgASgJQge6SARyAhgaUgltYWluVGl0bG'
    'USKwoMbWFpbl9jb250ZW50GAIgASgJQgi6SAVyAxjIAVILbWFpbkNvbnRlbnQSXAoOcmVhc29u'
    'X2RldGFpbHMYAyADKAsyKy5lY29uYS5zZXJ2aWNlcy5zaXRlLnNlYXJjaC52MS5SZWFzb25EZX'
    'RhaWxCCLpIBZIBAhAFUg1yZWFzb25EZXRhaWxz');

@$core.Deprecated('Use reasonDetailDescriptor instead')
const ReasonDetail$json = {
  '1': 'ReasonDetail',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'title'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'content'},
  ],
};

/// Descriptor for `ReasonDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reasonDetailDescriptor = $convert.base64Decode(
    'CgxSZWFzb25EZXRhaWwSHQoFdGl0bGUYASABKAlCB7pIBHICGDJSBXRpdGxlEiIKB2NvbnRlbn'
    'QYAiABKAlCCLpIBXIDGMgBUgdjb250ZW50');

@$core.Deprecated('Use getAffinityRecommendationUsersResponseDescriptor instead')
const GetAffinityRecommendationUsersResponse$json = {
  '1': 'GetAffinityRecommendationUsersResponse',
  '2': [
    {'1': 'users', '3': 1, '4': 3, '5': 11, '6': '.econa.services.site.search.v1.AffinityRecommendationUser', '10': 'users'},
    {'1': 'cache_status', '3': 2, '4': 1, '5': 14, '6': '.econa.services.site.search.v1.CacheStatus', '10': 'cacheStatus'},
    {'1': 'generation_time_ms', '3': 3, '4': 1, '5': 3, '10': 'generationTimeMs'},
    {'1': 'generated_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'generatedAt'},
  ],
};

/// Descriptor for `GetAffinityRecommendationUsersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAffinityRecommendationUsersResponseDescriptor = $convert.base64Decode(
    'CiZHZXRBZmZpbml0eVJlY29tbWVuZGF0aW9uVXNlcnNSZXNwb25zZRJPCgV1c2VycxgBIAMoCz'
    'I5LmVjb25hLnNlcnZpY2VzLnNpdGUuc2VhcmNoLnYxLkFmZmluaXR5UmVjb21tZW5kYXRpb25V'
    'c2VyUgV1c2VycxJNCgxjYWNoZV9zdGF0dXMYAiABKA4yKi5lY29uYS5zZXJ2aWNlcy5zaXRlLn'
    'NlYXJjaC52MS5DYWNoZVN0YXR1c1ILY2FjaGVTdGF0dXMSLAoSZ2VuZXJhdGlvbl90aW1lX21z'
    'GAMgASgDUhBnZW5lcmF0aW9uVGltZU1zEj0KDGdlbmVyYXRlZF9hdBgEIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBSC2dlbmVyYXRlZEF0');

