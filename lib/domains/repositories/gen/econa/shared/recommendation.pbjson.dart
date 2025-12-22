//
//  Generated code. Do not modify.
//  source: econa/shared/recommendation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use recommendationScoreDescriptor instead')
const RecommendationScore$json = {
  '1': 'RecommendationScore',
  '2': [
    {'1': 'base_score', '3': 1, '4': 1, '5': 1, '10': 'baseScore'},
    {'1': 'boost_multiplier', '3': 2, '4': 1, '5': 1, '10': 'boostMultiplier'},
    {'1': 'final_score', '3': 3, '4': 1, '5': 1, '10': 'finalScore'},
    {'1': 'boost_expires_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'boostExpiresAt'},
  ],
};

/// Descriptor for `RecommendationScore`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recommendationScoreDescriptor = $convert.base64Decode(
    'ChNSZWNvbW1lbmRhdGlvblNjb3JlEh0KCmJhc2Vfc2NvcmUYASABKAFSCWJhc2VTY29yZRIpCh'
    'Bib29zdF9tdWx0aXBsaWVyGAIgASgBUg9ib29zdE11bHRpcGxpZXISHwoLZmluYWxfc2NvcmUY'
    'AyABKAFSCmZpbmFsU2NvcmUSRAoQYm9vc3RfZXhwaXJlc19hdBgFIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSDmJvb3N0RXhwaXJlc0F0');

