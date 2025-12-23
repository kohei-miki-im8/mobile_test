//
//  Generated code. Do not modify.
//  source: econa/shared/admin/user_statistics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use adminUserStatisticsDescriptor instead')
const AdminUserStatistics$json = {
  '1': 'AdminUserStatistics',
  '2': [
    {'1': 'total_photos', '3': 1, '4': 1, '5': 5, '10': 'totalPhotos'},
    {'1': 'approved_photos', '3': 2, '4': 1, '5': 5, '10': 'approvedPhotos'},
    {'1': 'pending_photos', '3': 3, '4': 1, '5': 5, '10': 'pendingPhotos'},
    {'1': 'rejected_photos', '3': 4, '4': 1, '5': 5, '10': 'rejectedPhotos'},
    {'1': 'total_likes_given', '3': 5, '4': 1, '5': 5, '10': 'totalLikesGiven'},
    {'1': 'total_likes_received', '3': 6, '4': 1, '5': 5, '10': 'totalLikesReceived'},
    {'1': 'total_matches', '3': 7, '4': 1, '5': 5, '10': 'totalMatches'},
    {'1': 'total_mp_consumed', '3': 8, '4': 1, '5': 5, '10': 'totalMpConsumed'},
    {'1': 'total_lp_consumed', '3': 9, '4': 1, '5': 5, '10': 'totalLpConsumed'},
    {'1': 'violation_count', '3': 10, '4': 1, '5': 5, '10': 'violationCount'},
    {'1': 'last_violation_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastViolationAt'},
  ],
};

/// Descriptor for `AdminUserStatistics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminUserStatisticsDescriptor = $convert.base64Decode(
    'ChNBZG1pblVzZXJTdGF0aXN0aWNzEiEKDHRvdGFsX3Bob3RvcxgBIAEoBVILdG90YWxQaG90b3'
    'MSJwoPYXBwcm92ZWRfcGhvdG9zGAIgASgFUg5hcHByb3ZlZFBob3RvcxIlCg5wZW5kaW5nX3Bo'
    'b3RvcxgDIAEoBVINcGVuZGluZ1Bob3RvcxInCg9yZWplY3RlZF9waG90b3MYBCABKAVSDnJlam'
    'VjdGVkUGhvdG9zEioKEXRvdGFsX2xpa2VzX2dpdmVuGAUgASgFUg90b3RhbExpa2VzR2l2ZW4S'
    'MAoUdG90YWxfbGlrZXNfcmVjZWl2ZWQYBiABKAVSEnRvdGFsTGlrZXNSZWNlaXZlZBIjCg10b3'
    'RhbF9tYXRjaGVzGAcgASgFUgx0b3RhbE1hdGNoZXMSKgoRdG90YWxfbXBfY29uc3VtZWQYCCAB'
    'KAVSD3RvdGFsTXBDb25zdW1lZBIqChF0b3RhbF9scF9jb25zdW1lZBgJIAEoBVIPdG90YWxMcE'
    'NvbnN1bWVkEicKD3Zpb2xhdGlvbl9jb3VudBgKIAEoBVIOdmlvbGF0aW9uQ291bnQSRgoRbGFz'
    'dF92aW9sYXRpb25fYXQYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg9sYXN0Vm'
    'lvbGF0aW9uQXQ=');

