//
//  Generated code. Do not modify.
//  source: econa/shared/stripe.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use stripeProductCatalogDescriptor instead')
const StripeProductCatalog$json = {
  '1': 'StripeProductCatalog',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'product_type', '3': 2, '4': 1, '5': 9, '10': 'productType'},
    {'1': 'gender_code', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.GenderCode', '8': {}, '10': 'genderCode'},
    {'1': 'interval_count', '3': 4, '4': 1, '5': 5, '10': 'intervalCount'},
    {'1': 'interval', '3': 5, '4': 1, '5': 9, '10': 'interval'},
    {'1': 'trial_period_days', '3': 6, '4': 1, '5': 5, '10': 'trialPeriodDays'},
    {'1': 'default_price', '3': 7, '4': 1, '5': 11, '6': '.econa.shared.StripePrice', '10': 'defaultPrice'},
    {'1': 'active_campaign_price', '3': 8, '4': 1, '5': 11, '6': '.econa.shared.StripePrice', '10': 'activeCampaignPrice'},
    {'1': 'matching_points', '3': 9, '4': 1, '5': 5, '10': 'matchingPoints'},
    {'1': 'lavigation_points', '3': 10, '4': 1, '5': 5, '10': 'lavigationPoints'},
    {'1': 'livemode', '3': 15, '4': 1, '5': 8, '10': 'livemode'},
  ],
};

/// Descriptor for `StripeProductCatalog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stripeProductCatalogDescriptor = $convert.base64Decode(
    'ChRTdHJpcGVQcm9kdWN0Q2F0YWxvZxIdCgpwcm9kdWN0X2lkGAEgASgJUglwcm9kdWN0SWQSIQ'
    'oMcHJvZHVjdF90eXBlGAIgASgJUgtwcm9kdWN0VHlwZRJCCgtnZW5kZXJfY29kZRgDIAEoDjIX'
    'LmVjb25hLmVudW1zLkdlbmRlckNvZGVCCLpIBYIBAhABUgpnZW5kZXJDb2RlEiUKDmludGVydm'
    'FsX2NvdW50GAQgASgFUg1pbnRlcnZhbENvdW50EhoKCGludGVydmFsGAUgASgJUghpbnRlcnZh'
    'bBIqChF0cmlhbF9wZXJpb2RfZGF5cxgGIAEoBVIPdHJpYWxQZXJpb2REYXlzEj4KDWRlZmF1bH'
    'RfcHJpY2UYByABKAsyGS5lY29uYS5zaGFyZWQuU3RyaXBlUHJpY2VSDGRlZmF1bHRQcmljZRJN'
    'ChVhY3RpdmVfY2FtcGFpZ25fcHJpY2UYCCABKAsyGS5lY29uYS5zaGFyZWQuU3RyaXBlUHJpY2'
    'VSE2FjdGl2ZUNhbXBhaWduUHJpY2USJwoPbWF0Y2hpbmdfcG9pbnRzGAkgASgFUg5tYXRjaGlu'
    'Z1BvaW50cxIrChFsYXZpZ2F0aW9uX3BvaW50cxgKIAEoBVIQbGF2aWdhdGlvblBvaW50cxIaCg'
    'hsaXZlbW9kZRgPIAEoCFIIbGl2ZW1vZGU=');

@$core.Deprecated('Use stripeSubscriptionDescriptor instead')
const StripeSubscription$json = {
  '1': 'StripeSubscription',
  '2': [
    {'1': 'subscription_id', '3': 1, '4': 1, '5': 9, '10': 'subscriptionId'},
    {'1': 'price', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.StripePrice', '10': 'price'},
    {'1': 'livemode', '3': 15, '4': 1, '5': 8, '10': 'livemode'},
  ],
};

/// Descriptor for `StripeSubscription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stripeSubscriptionDescriptor = $convert.base64Decode(
    'ChJTdHJpcGVTdWJzY3JpcHRpb24SJwoPc3Vic2NyaXB0aW9uX2lkGAEgASgJUg5zdWJzY3JpcH'
    'Rpb25JZBIvCgVwcmljZRgCIAEoCzIZLmVjb25hLnNoYXJlZC5TdHJpcGVQcmljZVIFcHJpY2US'
    'GgoIbGl2ZW1vZGUYDyABKAhSCGxpdmVtb2Rl');

@$core.Deprecated('Use stripePriceDescriptor instead')
const StripePrice$json = {
  '1': 'StripePrice',
  '2': [
    {'1': 'price_id', '3': 1, '4': 1, '5': 9, '10': 'priceId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'amount', '3': 3, '4': 1, '5': 5, '10': 'amount'},
    {'1': 'currency', '3': 4, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'sort_order', '3': 5, '4': 1, '5': 5, '10': 'sortOrder'},
    {'1': 'is_default', '3': 6, '4': 1, '5': 8, '10': 'isDefault'},
  ],
};

/// Descriptor for `StripePrice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stripePriceDescriptor = $convert.base64Decode(
    'CgtTdHJpcGVQcmljZRIZCghwcmljZV9pZBgBIAEoCVIHcHJpY2VJZBIaCghuaWNrbmFtZRgCIA'
    'EoCVIIbmlja25hbWUSFgoGYW1vdW50GAMgASgFUgZhbW91bnQSGgoIY3VycmVuY3kYBCABKAlS'
    'CGN1cnJlbmN5Eh0KCnNvcnRfb3JkZXIYBSABKAVSCXNvcnRPcmRlchIdCgppc19kZWZhdWx0GA'
    'YgASgIUglpc0RlZmF1bHQ=');

