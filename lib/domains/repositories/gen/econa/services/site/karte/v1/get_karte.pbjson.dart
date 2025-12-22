//
//  Generated code. Do not modify.
//  source: econa/services/site/karte/v1/get_karte.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getKarteRequestDescriptor instead')
const GetKarteRequest$json = {
  '1': 'GetKarteRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetKarteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getKarteRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRLYXJ0ZVJlcXVlc3QSQAoGY3Vyc29yGA8gASgLMiAuZWNvbmEuc2hhcmVkLlBhZ2VyUm'
    'VxdWVzdEN1cnNvckIGukgDyAEBUgZjdXJzb3I=');

@$core.Deprecated('Use getKarteResponseDescriptor instead')
const GetKarteResponse$json = {
  '1': 'GetKarteResponse',
  '2': [
    {'1': 'user_analyses', '3': 1, '4': 3, '5': 11, '6': '.econa.services.site.karte.v1.GetKarteResponse.UserAnalysis', '10': 'userAnalyses'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
  '3': [GetKarteResponse_UserAnalysis$json],
};

@$core.Deprecated('Use getKarteResponseDescriptor instead')
const GetKarteResponse_UserAnalysis$json = {
  '1': 'UserAnalysis',
  '2': [
    {'1': 'philosophy_on_love', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'philosophyOnLove'},
    {'1': 'potential_needs', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'potentialNeeds'},
    {'1': 'compatibility_features', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'compatibilityFeatures'},
    {'1': 'comprehensive_analysis', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'comprehensiveAnalysis'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `GetKarteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getKarteResponseDescriptor = $convert.base64Decode(
    'ChBHZXRLYXJ0ZVJlc3BvbnNlEmAKDXVzZXJfYW5hbHlzZXMYASADKAsyOy5lY29uYS5zZXJ2aW'
    'Nlcy5zaXRlLmthcnRlLnYxLkdldEthcnRlUmVzcG9uc2UuVXNlckFuYWx5c2lzUgx1c2VyQW5h'
    'bHlzZXMSOQoGY3Vyc29yGA8gASgLMiEuZWNvbmEuc2hhcmVkLlBhZ2VyUmVzcG9uc2VDdXJzb3'
    'JSBmN1cnNvchq2AgoMVXNlckFuYWx5c2lzEjYKEnBoaWxvc29waHlfb25fbG92ZRgBIAEoCUII'
    'ukgFcgMY+gFSEHBoaWxvc29waHlPbkxvdmUSMQoPcG90ZW50aWFsX25lZWRzGAIgASgJQgi6SA'
    'VyAxj6AVIOcG90ZW50aWFsTmVlZHMSPwoWY29tcGF0aWJpbGl0eV9mZWF0dXJlcxgDIAEoCUII'
    'ukgFcgMY+gFSFWNvbXBhdGliaWxpdHlGZWF0dXJlcxI/ChZjb21wcmVoZW5zaXZlX2FuYWx5c2'
    'lzGAQgASgJQgi6SAVyAxj6AVIVY29tcHJlaGVuc2l2ZUFuYWx5c2lzEjkKCmNyZWF0ZWRfYXQY'
    'BSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');

