//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/exchange_matching_to_like.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use exchangeMatchingToLikeRequestDescriptor instead')
const ExchangeMatchingToLikeRequest$json = {
  '1': 'ExchangeMatchingToLikeRequest',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 3, '8': {}, '10': 'amount'},
  ],
};

/// Descriptor for `ExchangeMatchingToLikeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeMatchingToLikeRequestDescriptor = $convert.base64Decode(
    'Ch1FeGNoYW5nZU1hdGNoaW5nVG9MaWtlUmVxdWVzdBIiCgZhbW91bnQYASABKANCCrpIB8gBAS'
    'ICIABSBmFtb3VudA==');

@$core.Deprecated('Use exchangeMatchingToLikeResponseDescriptor instead')
const ExchangeMatchingToLikeResponse$json = {
  '1': 'ExchangeMatchingToLikeResponse',
  '2': [
    {'1': 'point_balance', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.PointBalance', '10': 'pointBalance'},
  ],
};

/// Descriptor for `ExchangeMatchingToLikeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exchangeMatchingToLikeResponseDescriptor = $convert.base64Decode(
    'Ch5FeGNoYW5nZU1hdGNoaW5nVG9MaWtlUmVzcG9uc2USPwoNcG9pbnRfYmFsYW5jZRgBIAEoCz'
    'IaLmVjb25hLnNoYXJlZC5Qb2ludEJhbGFuY2VSDHBvaW50QmFsYW5jZQ==');

