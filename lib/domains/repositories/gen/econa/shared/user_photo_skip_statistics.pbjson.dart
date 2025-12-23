//
//  Generated code. Do not modify.
//  source: econa/shared/user_photo_skip_statistics.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userPhotoSkipStatisticsDescriptor instead')
const UserPhotoSkipStatistics$json = {
  '1': 'UserPhotoSkipStatistics',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'total_photos', '3': 2, '4': 1, '5': 5, '10': 'totalPhotos'},
    {'1': 'total_skips', '3': 3, '4': 1, '5': 5, '10': 'totalSkips'},
    {'1': 'unique_skippers', '3': 4, '4': 1, '5': 5, '10': 'uniqueSkippers'},
    {'1': 'average_skips_per_photo', '3': 5, '4': 1, '5': 1, '10': 'averageSkipsPerPhoto'},
    {'1': 'skip_rate_percentage', '3': 6, '4': 1, '5': 1, '10': 'skipRatePercentage'},
  ],
};

/// Descriptor for `UserPhotoSkipStatistics`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPhotoSkipStatisticsDescriptor = $convert.base64Decode(
    'ChdVc2VyUGhvdG9Ta2lwU3RhdGlzdGljcxIhCgd1c2VyX2lkGAEgASgJQgi6SAVyA7ABAVIGdX'
    'NlcklkEiEKDHRvdGFsX3Bob3RvcxgCIAEoBVILdG90YWxQaG90b3MSHwoLdG90YWxfc2tpcHMY'
    'AyABKAVSCnRvdGFsU2tpcHMSJwoPdW5pcXVlX3NraXBwZXJzGAQgASgFUg51bmlxdWVTa2lwcG'
    'VycxI1ChdhdmVyYWdlX3NraXBzX3Blcl9waG90bxgFIAEoAVIUYXZlcmFnZVNraXBzUGVyUGhv'
    'dG8SMAoUc2tpcF9yYXRlX3BlcmNlbnRhZ2UYBiABKAFSEnNraXBSYXRlUGVyY2VudGFnZQ==');

