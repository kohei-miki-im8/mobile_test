//
//  Generated code. Do not modify.
//  source: econa/services/site/advice/v1/get_approach_analysis.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getApproachAnalysisRequestDescriptor instead')
const GetApproachAnalysisRequest$json = {
  '1': 'GetApproachAnalysisRequest',
};

/// Descriptor for `GetApproachAnalysisRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getApproachAnalysisRequestDescriptor = $convert.base64Decode(
    'ChpHZXRBcHByb2FjaEFuYWx5c2lzUmVxdWVzdA==');

@$core.Deprecated('Use getApproachAnalysisResponseDescriptor instead')
const GetApproachAnalysisResponse$json = {
  '1': 'GetApproachAnalysisResponse',
  '2': [
    {'1': 'advice_message', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'adviceMessage'},
    {'1': 'footprint_histories', '3': 2, '4': 3, '5': 11, '6': '.econa.services.site.advice.v1.GetApproachAnalysisResponse.FootprintHistory', '8': {}, '10': 'footprintHistories'},
    {'1': 'like_histories', '3': 3, '4': 3, '5': 11, '6': '.econa.services.site.advice.v1.GetApproachAnalysisResponse.LikeHistory', '8': {}, '10': 'likeHistories'},
  ],
  '3': [GetApproachAnalysisResponse_FootprintHistory$json, GetApproachAnalysisResponse_LikeHistory$json],
};

@$core.Deprecated('Use getApproachAnalysisResponseDescriptor instead')
const GetApproachAnalysisResponse_FootprintHistory$json = {
  '1': 'FootprintHistory',
  '2': [
    {'1': 'history_date', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'historyDate'},
    {'1': 'footprint_amount', '3': 2, '4': 1, '5': 5, '10': 'footprintAmount'},
  ],
};

@$core.Deprecated('Use getApproachAnalysisResponseDescriptor instead')
const GetApproachAnalysisResponse_LikeHistory$json = {
  '1': 'LikeHistory',
  '2': [
    {'1': 'history_date', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'historyDate'},
    {'1': 'like_amount', '3': 2, '4': 1, '5': 5, '10': 'likeAmount'},
  ],
};

/// Descriptor for `GetApproachAnalysisResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getApproachAnalysisResponseDescriptor = $convert.base64Decode(
    'ChtHZXRBcHByb2FjaEFuYWx5c2lzUmVzcG9uc2USLwoOYWR2aWNlX21lc3NhZ2UYASABKAlCCL'
    'pIBXIDGJYBUg1hZHZpY2VNZXNzYWdlEogBChNmb290cHJpbnRfaGlzdG9yaWVzGAIgAygLMksu'
    'ZWNvbmEuc2VydmljZXMuc2l0ZS5hZHZpY2UudjEuR2V0QXBwcm9hY2hBbmFseXNpc1Jlc3Bvbn'
    'NlLkZvb3RwcmludEhpc3RvcnlCCrpIB5IBBAgBEAdSEmZvb3RwcmludEhpc3RvcmllcxJ5Cg5s'
    'aWtlX2hpc3RvcmllcxgDIAMoCzJGLmVjb25hLnNlcnZpY2VzLnNpdGUuYWR2aWNlLnYxLkdldE'
    'FwcHJvYWNoQW5hbHlzaXNSZXNwb25zZS5MaWtlSGlzdG9yeUIKukgHkgEECAEQB1INbGlrZUhp'
    'c3Rvcmllcxp8ChBGb290cHJpbnRIaXN0b3J5Ej0KDGhpc3RvcnlfZGF0ZRgBIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2hpc3RvcnlEYXRlEikKEGZvb3RwcmludF9hbW91bnQY'
    'AiABKAVSD2Zvb3RwcmludEFtb3VudBptCgtMaWtlSGlzdG9yeRI9CgxoaXN0b3J5X2RhdGUYAS'
    'ABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgtoaXN0b3J5RGF0ZRIfCgtsaWtlX2Ft'
    'b3VudBgCIAEoBVIKbGlrZUFtb3VudA==');

