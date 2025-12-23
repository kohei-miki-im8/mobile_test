//
//  Generated code. Do not modify.
//  source: econa/enums/check_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use checkStatusDescriptor instead')
const CheckStatus$json = {
  '1': 'CheckStatus',
  '2': [
    {'1': 'CHECK_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'CHECK_STATUS_CHECKING', '2': 1},
    {'1': 'CHECK_STATUS_APPROVED', '2': 2},
    {'1': 'CHECK_STATUS_REJECTED', '2': 3},
  ],
};

/// Descriptor for `CheckStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List checkStatusDescriptor = $convert.base64Decode(
    'CgtDaGVja1N0YXR1cxIcChhDSEVDS19TVEFUVVNfVU5TUEVDSUZJRUQQABIZChVDSEVDS19TVE'
    'FUVVNfQ0hFQ0tJTkcQARIZChVDSEVDS19TVEFUVVNfQVBQUk9WRUQQAhIZChVDSEVDS19TVEFU'
    'VVNfUkVKRUNURUQQAw==');

