//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/restore_subscriptions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use restoreSubscriptionsRequestDescriptor instead')
const RestoreSubscriptionsRequest$json = {
  '1': 'RestoreSubscriptionsRequest',
};

/// Descriptor for `RestoreSubscriptionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreSubscriptionsRequestDescriptor = $convert.base64Decode(
    'ChtSZXN0b3JlU3Vic2NyaXB0aW9uc1JlcXVlc3Q=');

@$core.Deprecated('Use restoreSubscriptionsResponseDescriptor instead')
const RestoreSubscriptionsResponse$json = {
  '1': 'RestoreSubscriptionsResponse',
  '2': [
    {'1': 'restored_subscriptions', '3': 1, '4': 3, '5': 11, '6': '.econa.services.site.payment.v1.RestoredSubscription', '10': 'restoredSubscriptions'},
  ],
};

/// Descriptor for `RestoreSubscriptionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoreSubscriptionsResponseDescriptor = $convert.base64Decode(
    'ChxSZXN0b3JlU3Vic2NyaXB0aW9uc1Jlc3BvbnNlEmsKFnJlc3RvcmVkX3N1YnNjcmlwdGlvbn'
    'MYASADKAsyNC5lY29uYS5zZXJ2aWNlcy5zaXRlLnBheW1lbnQudjEuUmVzdG9yZWRTdWJzY3Jp'
    'cHRpb25SFXJlc3RvcmVkU3Vic2NyaXB0aW9ucw==');

@$core.Deprecated('Use restoredSubscriptionDescriptor instead')
const RestoredSubscription$json = {
  '1': 'RestoredSubscription',
  '2': [
    {'1': 'product_identifier', '3': 1, '4': 1, '5': 9, '10': 'productIdentifier'},
    {'1': 'expires_date', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresDate'},
    {'1': 'entitlement_id', '3': 3, '4': 1, '5': 9, '10': 'entitlementId'},
  ],
};

/// Descriptor for `RestoredSubscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List restoredSubscriptionDescriptor = $convert.base64Decode(
    'ChRSZXN0b3JlZFN1YnNjcmlwdGlvbhItChJwcm9kdWN0X2lkZW50aWZpZXIYASABKAlSEXByb2'
    'R1Y3RJZGVudGlmaWVyEj0KDGV4cGlyZXNfZGF0ZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBSC2V4cGlyZXNEYXRlEiUKDmVudGl0bGVtZW50X2lkGAMgASgJUg1lbnRpdGxlbW'
    'VudElk');

