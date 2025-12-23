//
//  Generated code. Do not modify.
//  source: econa/shared/admin/single_certificate_statistics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use singleCertificateStatisticsDescriptor instead')
const SingleCertificateStatistics$json = {
  '1': 'SingleCertificateStatistics',
  '2': [
    {'1': 'total_reviewed', '3': 1, '4': 1, '5': 5, '10': 'totalReviewed'},
    {'1': 'approved_count', '3': 2, '4': 1, '5': 5, '10': 'approvedCount'},
    {'1': 'rejected_count', '3': 3, '4': 1, '5': 5, '10': 'rejectedCount'},
    {'1': 'approval_rate', '3': 4, '4': 1, '5': 1, '10': 'approvalRate'},
    {'1': 'rejection_reasons', '3': 5, '4': 3, '5': 11, '6': '.econa.shared.admin.SingleCertificateStatistics.RejectionReasonsEntry', '10': 'rejectionReasons'},
  ],
  '3': [SingleCertificateStatistics_RejectionReasonsEntry$json],
};

@$core.Deprecated('Use singleCertificateStatisticsDescriptor instead')
const SingleCertificateStatistics_RejectionReasonsEntry$json = {
  '1': 'RejectionReasonsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 5, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SingleCertificateStatistics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleCertificateStatisticsDescriptor = $convert.base64Decode(
    'ChtTaW5nbGVDZXJ0aWZpY2F0ZVN0YXRpc3RpY3MSJQoOdG90YWxfcmV2aWV3ZWQYASABKAVSDX'
    'RvdGFsUmV2aWV3ZWQSJQoOYXBwcm92ZWRfY291bnQYAiABKAVSDWFwcHJvdmVkQ291bnQSJQoO'
    'cmVqZWN0ZWRfY291bnQYAyABKAVSDXJlamVjdGVkQ291bnQSIwoNYXBwcm92YWxfcmF0ZRgEIA'
    'EoAVIMYXBwcm92YWxSYXRlEnIKEXJlamVjdGlvbl9yZWFzb25zGAUgAygLMkUuZWNvbmEuc2hh'
    'cmVkLmFkbWluLlNpbmdsZUNlcnRpZmljYXRlU3RhdGlzdGljcy5SZWplY3Rpb25SZWFzb25zRW'
    '50cnlSEHJlamVjdGlvblJlYXNvbnMaQwoVUmVqZWN0aW9uUmVhc29uc0VudHJ5EhAKA2tleRgB'
    'IAEoCVIDa2V5EhQKBXZhbHVlGAIgASgFUgV2YWx1ZToCOAE=');

