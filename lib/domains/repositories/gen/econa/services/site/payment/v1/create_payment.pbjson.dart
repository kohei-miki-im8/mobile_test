//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/create_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createPaymentRequestDescriptor instead')
const CreatePaymentRequest$json = {
  '1': 'CreatePaymentRequest',
  '2': [
    {'1': 'idempotency_key', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'idempotencyKey'},
    {'1': 'product_code', '3': 2, '4': 1, '5': 9, '10': 'productCode'},
    {'1': 'payment_type', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.PaymentType', '8': {}, '10': 'paymentType'},
  ],
};

/// Descriptor for `CreatePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQYXltZW50UmVxdWVzdBIxCg9pZGVtcG90ZW5jeV9rZXkYASABKAlCCLpIBXIDsA'
    'EBUg5pZGVtcG90ZW5jeUtleRIhCgxwcm9kdWN0X2NvZGUYAiABKAlSC3Byb2R1Y3RDb2RlEkUK'
    'DHBheW1lbnRfdHlwZRgDIAEoDjIYLmVjb25hLmVudW1zLlBheW1lbnRUeXBlQgi6SAWCAQIgAF'
    'ILcGF5bWVudFR5cGU=');

@$core.Deprecated('Use createPaymentResponseDescriptor instead')
const CreatePaymentResponse$json = {
  '1': 'CreatePaymentResponse',
  '2': [
    {'1': 'payment_id', '3': 1, '4': 1, '5': 9, '10': 'paymentId'},
  ],
};

/// Descriptor for `CreatePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQYXltZW50UmVzcG9uc2USHQoKcGF5bWVudF9pZBgBIAEoCVIJcGF5bWVudElk');

