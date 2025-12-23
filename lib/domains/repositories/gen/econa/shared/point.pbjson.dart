//
//  Generated code. Do not modify.
//  source: econa/shared/point.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use pointBalanceDescriptor instead')
const PointBalance$json = {
  '1': 'PointBalance',
  '2': [
    {'1': 'free_like_points', '3': 1, '4': 1, '5': 5, '10': 'freeLikePoints'},
    {'1': 'free_matching_points', '3': 2, '4': 1, '5': 5, '10': 'freeMatchingPoints'},
    {'1': 'free_lavigation_points', '3': 3, '4': 1, '5': 5, '10': 'freeLavigationPoints'},
    {'1': 'like_points', '3': 4, '4': 1, '5': 5, '10': 'likePoints'},
    {'1': 'matching_points', '3': 5, '4': 1, '5': 5, '10': 'matchingPoints'},
    {'1': 'lavigation_points', '3': 6, '4': 1, '5': 5, '10': 'lavigationPoints'},
  ],
};

/// Descriptor for `PointBalance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointBalanceDescriptor = $convert.base64Decode(
    'CgxQb2ludEJhbGFuY2USKAoQZnJlZV9saWtlX3BvaW50cxgBIAEoBVIOZnJlZUxpa2VQb2ludH'
    'MSMAoUZnJlZV9tYXRjaGluZ19wb2ludHMYAiABKAVSEmZyZWVNYXRjaGluZ1BvaW50cxI0ChZm'
    'cmVlX2xhdmlnYXRpb25fcG9pbnRzGAMgASgFUhRmcmVlTGF2aWdhdGlvblBvaW50cxIfCgtsaW'
    'tlX3BvaW50cxgEIAEoBVIKbGlrZVBvaW50cxInCg9tYXRjaGluZ19wb2ludHMYBSABKAVSDm1h'
    'dGNoaW5nUG9pbnRzEisKEWxhdmlnYXRpb25fcG9pbnRzGAYgASgFUhBsYXZpZ2F0aW9uUG9pbn'
    'Rz');

