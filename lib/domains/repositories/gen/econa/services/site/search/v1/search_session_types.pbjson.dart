//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/search_session_types.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use searchSessionPublishTypeDescriptor instead')
const SearchSessionPublishType$json = {
  '1': 'SearchSessionPublishType',
  '2': [
    {'1': 'SEARCH_SESSION_PUBLISH_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'SEARCH_SESSION_PUBLISH_TYPE_AFFINITY_RECOMMENDATION_COMPLETED', '2': 1},
  ],
};

/// Descriptor for `SearchSessionPublishType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List searchSessionPublishTypeDescriptor = $convert.base64Decode(
    'ChhTZWFyY2hTZXNzaW9uUHVibGlzaFR5cGUSKwonU0VBUkNIX1NFU1NJT05fUFVCTElTSF9UWV'
    'BFX1VOU1BFQ0lGSUVEEAASQQo9U0VBUkNIX1NFU1NJT05fUFVCTElTSF9UWVBFX0FGRklOSVRZ'
    'X1JFQ09NTUVOREFUSU9OX0NPTVBMRVRFRBAB');

@$core.Deprecated('Use affinityRecommendationCompletedNotificationDescriptor instead')
const AffinityRecommendationCompletedNotification$json = {
  '1': 'AffinityRecommendationCompletedNotification',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'recommendation_count', '3': 2, '4': 1, '5': 5, '10': 'recommendationCount'},
    {'1': 'cache_status', '3': 3, '4': 1, '5': 14, '6': '.econa.services.site.search.v1.CacheStatus', '10': 'cacheStatus'},
    {'1': 'generation_time_ms', '3': 4, '4': 1, '5': 3, '10': 'generationTimeMs'},
    {'1': 'is_successful', '3': 5, '4': 1, '5': 8, '10': 'isSuccessful'},
    {'1': 'completed_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
    {'1': 'request_id', '3': 7, '4': 1, '5': 9, '10': 'requestId'},
    {'1': 'error_message', '3': 8, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
};

/// Descriptor for `AffinityRecommendationCompletedNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List affinityRecommendationCompletedNotificationDescriptor = $convert.base64Decode(
    'CitBZmZpbml0eVJlY29tbWVuZGF0aW9uQ29tcGxldGVkTm90aWZpY2F0aW9uEhcKB3VzZXJfaW'
    'QYASABKAlSBnVzZXJJZBIxChRyZWNvbW1lbmRhdGlvbl9jb3VudBgCIAEoBVITcmVjb21tZW5k'
    'YXRpb25Db3VudBJNCgxjYWNoZV9zdGF0dXMYAyABKA4yKi5lY29uYS5zZXJ2aWNlcy5zaXRlLn'
    'NlYXJjaC52MS5DYWNoZVN0YXR1c1ILY2FjaGVTdGF0dXMSLAoSZ2VuZXJhdGlvbl90aW1lX21z'
    'GAQgASgDUhBnZW5lcmF0aW9uVGltZU1zEiMKDWlzX3N1Y2Nlc3NmdWwYBSABKAhSDGlzU3VjY2'
    'Vzc2Z1bBI9Cgxjb21wbGV0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1w'
    'Ugtjb21wbGV0ZWRBdBIdCgpyZXF1ZXN0X2lkGAcgASgJUglyZXF1ZXN0SWQSIwoNZXJyb3JfbW'
    'Vzc2FnZRgIIAEoCVIMZXJyb3JNZXNzYWdl');

