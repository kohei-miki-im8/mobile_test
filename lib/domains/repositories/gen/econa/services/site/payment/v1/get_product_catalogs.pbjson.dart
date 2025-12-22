//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/get_product_catalogs.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getProductCatalogsRequestDescriptor instead')
const GetProductCatalogsRequest$json = {
  '1': 'GetProductCatalogsRequest',
};

/// Descriptor for `GetProductCatalogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductCatalogsRequestDescriptor = $convert.base64Decode(
    'ChlHZXRQcm9kdWN0Q2F0YWxvZ3NSZXF1ZXN0');

@$core.Deprecated('Use getProductCatalogsResponseDescriptor instead')
const GetProductCatalogsResponse$json = {
  '1': 'GetProductCatalogsResponse',
  '2': [
    {'1': 'catalogs', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.StripeProductCatalog', '10': 'catalogs'},
  ],
};

/// Descriptor for `GetProductCatalogsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductCatalogsResponseDescriptor = $convert.base64Decode(
    'ChpHZXRQcm9kdWN0Q2F0YWxvZ3NSZXNwb25zZRI+CghjYXRhbG9ncxgBIAMoCzIiLmVjb25hLn'
    'NoYXJlZC5TdHJpcGVQcm9kdWN0Q2F0YWxvZ1IIY2F0YWxvZ3M=');

