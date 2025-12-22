//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_points.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserPointsRequestDescriptor instead')
const GetUserPointsRequest$json = {
  '1': 'GetUserPointsRequest',
};

/// Descriptor for `GetUserPointsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPointsRequestDescriptor = $convert.base64Decode(
    'ChRHZXRVc2VyUG9pbnRzUmVxdWVzdA==');

@$core.Deprecated('Use getUserPointsResponseDescriptor instead')
const GetUserPointsResponse$json = {
  '1': 'GetUserPointsResponse',
  '2': [
    {'1': 'free_like_point', '3': 1, '4': 1, '5': 5, '8': {}, '10': 'freeLikePoint'},
    {'1': 'free_matching_point', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'freeMatchingPoint'},
    {'1': 'free_lavigation_point', '3': 3, '4': 1, '5': 5, '8': {}, '10': 'freeLavigationPoint'},
    {'1': 'like_point', '3': 4, '4': 1, '5': 5, '8': {}, '10': 'likePoint'},
    {'1': 'matching_point', '3': 5, '4': 1, '5': 5, '8': {}, '10': 'matchingPoint'},
    {'1': 'lavigation_point', '3': 6, '4': 1, '5': 5, '8': {}, '10': 'lavigationPoint'},
    {'1': 'next_benefit_grant_date', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'nextBenefitGrantDate'},
  ],
};

/// Descriptor for `GetUserPointsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPointsResponseDescriptor = $convert.base64Decode(
    'ChVHZXRVc2VyUG9pbnRzUmVzcG9uc2USLwoPZnJlZV9saWtlX3BvaW50GAEgASgFQge6SAQaAi'
    'gAUg1mcmVlTGlrZVBvaW50EjcKE2ZyZWVfbWF0Y2hpbmdfcG9pbnQYAiABKAVCB7pIBBoCKABS'
    'EWZyZWVNYXRjaGluZ1BvaW50EjsKFWZyZWVfbGF2aWdhdGlvbl9wb2ludBgDIAEoBUIHukgEGg'
    'IoAFITZnJlZUxhdmlnYXRpb25Qb2ludBImCgpsaWtlX3BvaW50GAQgASgFQge6SAQaAigAUgls'
    'aWtlUG9pbnQSLgoObWF0Y2hpbmdfcG9pbnQYBSABKAVCB7pIBBoCKABSDW1hdGNoaW5nUG9pbn'
    'QSMgoQbGF2aWdhdGlvbl9wb2ludBgGIAEoBUIHukgEGgIoAFIPbGF2aWdhdGlvblBvaW50ElEK'
    'F25leHRfYmVuZWZpdF9ncmFudF9kYXRlGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIUbmV4dEJlbmVmaXRHcmFudERhdGU=');

