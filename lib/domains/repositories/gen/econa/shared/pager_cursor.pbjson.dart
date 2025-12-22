//
//  Generated code. Do not modify.
//  source: econa/shared/pager_cursor.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use pagerRequestCursorDescriptor instead')
const PagerRequestCursor$json = {
  '1': 'PagerRequestCursor',
  '2': [
    {'1': 'cursor_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'cursorId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'limit'},
  ],
};

/// Descriptor for `PagerRequestCursor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pagerRequestCursorDescriptor = $convert.base64Decode(
    'ChJQYWdlclJlcXVlc3RDdXJzb3ISJQoJY3Vyc29yX2lkGAEgASgJQgi6SAVyA7ABAVIIY3Vyc2'
    '9ySWQSIgoFbGltaXQYAiABKAVCDLpICcgBARoEGGQgAFIFbGltaXQ=');

@$core.Deprecated('Use pagerResponseCursorDescriptor instead')
const PagerResponseCursor$json = {
  '1': 'PagerResponseCursor',
  '2': [
    {'1': 'next_cursor_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'nextCursorId'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'totalCount'},
  ],
};

/// Descriptor for `PagerResponseCursor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pagerResponseCursorDescriptor = $convert.base64Decode(
    'ChNQYWdlclJlc3BvbnNlQ3Vyc29yEi4KDm5leHRfY3Vyc29yX2lkGAEgASgJQgi6SAVyA7ABAV'
    'IMbmV4dEN1cnNvcklkEigKC3RvdGFsX2NvdW50GAIgASgFQge6SAQaAigAUgp0b3RhbENvdW50');

