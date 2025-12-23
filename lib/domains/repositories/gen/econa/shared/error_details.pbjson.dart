//
//  Generated code. Do not modify.
//  source: econa/shared/error_details.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use errorDetailsDescriptor instead')
const ErrorDetails$json = {
  '1': 'ErrorDetails',
  '2': [
    {'1': 'error_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.ErrorCode', '10': 'errorCode'},
    {'1': 'user_action', '3': 2, '4': 1, '5': 9, '10': 'userAction'},
    {'1': 'details', '3': 3, '4': 3, '5': 11, '6': '.econa.shared.ErrorDetails.DetailsEntry', '10': 'details'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
  '3': [ErrorDetails_DetailsEntry$json],
};

@$core.Deprecated('Use errorDetailsDescriptor instead')
const ErrorDetails_DetailsEntry$json = {
  '1': 'DetailsEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ErrorDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDetailsDescriptor = $convert.base64Decode(
    'CgxFcnJvckRldGFpbHMSNQoKZXJyb3JfY29kZRgBIAEoDjIWLmVjb25hLmVudW1zLkVycm9yQ2'
    '9kZVIJZXJyb3JDb2RlEh8KC3VzZXJfYWN0aW9uGAIgASgJUgp1c2VyQWN0aW9uEkEKB2RldGFp'
    'bHMYAyADKAsyJy5lY29uYS5zaGFyZWQuRXJyb3JEZXRhaWxzLkRldGFpbHNFbnRyeVIHZGV0YW'
    'lscxIYCgdtZXNzYWdlGAQgASgJUgdtZXNzYWdlGjoKDERldGFpbHNFbnRyeRIQCgNrZXkYASAB'
    'KAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

