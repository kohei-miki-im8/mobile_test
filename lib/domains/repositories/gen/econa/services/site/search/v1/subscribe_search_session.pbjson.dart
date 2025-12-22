//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/subscribe_search_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use subscribeSearchSessionRequestDescriptor instead')
const SubscribeSearchSessionRequest$json = {
  '1': 'SubscribeSearchSessionRequest',
};

/// Descriptor for `SubscribeSearchSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeSearchSessionRequestDescriptor = $convert.base64Decode(
    'Ch1TdWJzY3JpYmVTZWFyY2hTZXNzaW9uUmVxdWVzdA==');

@$core.Deprecated('Use subscribeSearchSessionResponseDescriptor instead')
const SubscribeSearchSessionResponse$json = {
  '1': 'SubscribeSearchSessionResponse',
  '2': [
    {'1': 'published_user_id', '3': 1, '4': 1, '5': 9, '10': 'publishedUserId'},
    {'1': 'publish_type', '3': 2, '4': 1, '5': 14, '6': '.econa.services.site.search.v1.SearchSessionPublishType', '10': 'publishType'},
    {'1': 'affinity_recommendation_completed', '3': 3, '4': 1, '5': 11, '6': '.econa.services.site.search.v1.AffinityRecommendationCompletedNotification', '9': 0, '10': 'affinityRecommendationCompleted'},
    {'1': 'is_successful', '3': 10, '4': 1, '5': 8, '10': 'isSuccessful'},
    {'1': 'error_message', '3': 11, '4': 1, '5': 9, '10': 'errorMessage'},
  ],
  '8': [
    {'1': 'notification'},
  ],
};

/// Descriptor for `SubscribeSearchSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeSearchSessionResponseDescriptor = $convert.base64Decode(
    'Ch5TdWJzY3JpYmVTZWFyY2hTZXNzaW9uUmVzcG9uc2USKgoRcHVibGlzaGVkX3VzZXJfaWQYAS'
    'ABKAlSD3B1Ymxpc2hlZFVzZXJJZBJaCgxwdWJsaXNoX3R5cGUYAiABKA4yNy5lY29uYS5zZXJ2'
    'aWNlcy5zaXRlLnNlYXJjaC52MS5TZWFyY2hTZXNzaW9uUHVibGlzaFR5cGVSC3B1Ymxpc2hUeX'
    'BlEpgBCiFhZmZpbml0eV9yZWNvbW1lbmRhdGlvbl9jb21wbGV0ZWQYAyABKAsySi5lY29uYS5z'
    'ZXJ2aWNlcy5zaXRlLnNlYXJjaC52MS5BZmZpbml0eVJlY29tbWVuZGF0aW9uQ29tcGxldGVkTm'
    '90aWZpY2F0aW9uSABSH2FmZmluaXR5UmVjb21tZW5kYXRpb25Db21wbGV0ZWQSIwoNaXNfc3Vj'
    'Y2Vzc2Z1bBgKIAEoCFIMaXNTdWNjZXNzZnVsEiMKDWVycm9yX21lc3NhZ2UYCyABKAlSDGVycm'
    '9yTWVzc2FnZUIOCgxub3RpZmljYXRpb24=');

