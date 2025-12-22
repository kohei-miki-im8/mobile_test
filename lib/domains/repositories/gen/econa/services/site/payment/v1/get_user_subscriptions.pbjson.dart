//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/get_user_subscriptions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserSubscriptionsRequestDescriptor instead')
const GetUserSubscriptionsRequest$json = {
  '1': 'GetUserSubscriptionsRequest',
};

/// Descriptor for `GetUserSubscriptionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserSubscriptionsRequestDescriptor = $convert.base64Decode(
    'ChtHZXRVc2VyU3Vic2NyaXB0aW9uc1JlcXVlc3Q=');

@$core.Deprecated('Use getUserSubscriptionsResponseDescriptor instead')
const GetUserSubscriptionsResponse$json = {
  '1': 'GetUserSubscriptionsResponse',
  '2': [
    {'1': 'subscriptions', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.StripeSubscription', '10': 'subscriptions'},
  ],
};

/// Descriptor for `GetUserSubscriptionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserSubscriptionsResponseDescriptor = $convert.base64Decode(
    'ChxHZXRVc2VyU3Vic2NyaXB0aW9uc1Jlc3BvbnNlEkYKDXN1YnNjcmlwdGlvbnMYASADKAsyIC'
    '5lY29uYS5zaGFyZWQuU3RyaXBlU3Vic2NyaXB0aW9uUg1zdWJzY3JpcHRpb25z');

