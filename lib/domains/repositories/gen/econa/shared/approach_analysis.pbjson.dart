//
//  Generated code. Do not modify.
//  source: econa/shared/approach_analysis.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use approachAnalysisDescriptor instead')
const ApproachAnalysis$json = {
  '1': 'ApproachAnalysis',
  '2': [
    {'1': 'advise', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'advise'},
    {'1': 'footprint_transitions', '3': 2, '4': 3, '5': 11, '6': '.econa.shared.FootprintTransition', '10': 'footprintTransitions'},
    {'1': 'like_transitions', '3': 3, '4': 3, '5': 11, '6': '.econa.shared.LikeTransition', '10': 'likeTransitions'},
  ],
};

/// Descriptor for `ApproachAnalysis`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List approachAnalysisDescriptor = $convert.base64Decode(
    'ChBBcHByb2FjaEFuYWx5c2lzEiIKBmFkdmlzZRgBIAEoCUIKukgHcgUQARiWAVIGYWR2aXNlEl'
    'YKFWZvb3RwcmludF90cmFuc2l0aW9ucxgCIAMoCzIhLmVjb25hLnNoYXJlZC5Gb290cHJpbnRU'
    'cmFuc2l0aW9uUhRmb290cHJpbnRUcmFuc2l0aW9ucxJHChBsaWtlX3RyYW5zaXRpb25zGAMgAy'
    'gLMhwuZWNvbmEuc2hhcmVkLkxpa2VUcmFuc2l0aW9uUg9saWtlVHJhbnNpdGlvbnM=');

@$core.Deprecated('Use footprintTransitionDescriptor instead')
const FootprintTransition$json = {
  '1': 'FootprintTransition',
  '2': [
    {'1': 'date', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'footprint_count', '3': 2, '4': 1, '5': 5, '10': 'footprintCount'},
  ],
};

/// Descriptor for `FootprintTransition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List footprintTransitionDescriptor = $convert.base64Decode(
    'ChNGb290cHJpbnRUcmFuc2l0aW9uEi4KBGRhdGUYASABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wUgRkYXRlEicKD2Zvb3RwcmludF9jb3VudBgCIAEoBVIOZm9vdHByaW50Q291bnQ=');

@$core.Deprecated('Use likeTransitionDescriptor instead')
const LikeTransition$json = {
  '1': 'LikeTransition',
  '2': [
    {'1': 'date', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'date'},
    {'1': 'like_count', '3': 2, '4': 1, '5': 5, '10': 'likeCount'},
  ],
};

/// Descriptor for `LikeTransition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List likeTransitionDescriptor = $convert.base64Decode(
    'Cg5MaWtlVHJhbnNpdGlvbhIuCgRkYXRlGAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIEZGF0ZRIdCgpsaWtlX2NvdW50GAIgASgFUglsaWtlQ291bnQ=');

