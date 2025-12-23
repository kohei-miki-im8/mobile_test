//
//  Generated code. Do not modify.
//  source: econa/enums/payment_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use paymentTypeDescriptor instead')
const PaymentType$json = {
  '1': 'PaymentType',
  '2': [
    {'1': 'PAYMENT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'PAYMENT_TYPE_ONE_TIME', '2': 1},
    {'1': 'PAYMENT_TYPE_RECURRING', '2': 2},
  ],
};

/// Descriptor for `PaymentType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paymentTypeDescriptor = $convert.base64Decode(
    'CgtQYXltZW50VHlwZRIcChhQQVlNRU5UX1RZUEVfVU5TUEVDSUZJRUQQABIZChVQQVlNRU5UX1'
    'RZUEVfT05FX1RJTUUQARIaChZQQVlNRU5UX1RZUEVfUkVDVVJSSU5HEAI=');

