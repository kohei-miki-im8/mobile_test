//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/create_checkout_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createCheckoutSessionRequestDescriptor instead')
const CreateCheckoutSessionRequest$json = {
  '1': 'CreateCheckoutSessionRequest',
  '2': [
    {'1': 'price_id', '3': 1, '4': 1, '5': 9, '10': 'priceId'},
    {'1': 'campaign_id', '3': 2, '4': 1, '5': 9, '10': 'campaignId'},
    {'1': 'success_url', '3': 3, '4': 1, '5': 9, '10': 'successUrl'},
    {'1': 'cancel_url', '3': 4, '4': 1, '5': 9, '10': 'cancelUrl'},
    {'1': 'metadata', '3': 5, '4': 3, '5': 11, '6': '.econa.services.site.payment.v1.CreateCheckoutSessionRequest.MetadataEntry', '10': 'metadata'},
    {'1': 'allow_trial', '3': 6, '4': 1, '5': 8, '10': 'allowTrial'},
  ],
  '3': [CreateCheckoutSessionRequest_MetadataEntry$json],
};

@$core.Deprecated('Use createCheckoutSessionRequestDescriptor instead')
const CreateCheckoutSessionRequest_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CreateCheckoutSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCheckoutSessionRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVDaGVja291dFNlc3Npb25SZXF1ZXN0EhkKCHByaWNlX2lkGAEgASgJUgdwcmljZU'
    'lkEh8KC2NhbXBhaWduX2lkGAIgASgJUgpjYW1wYWlnbklkEh8KC3N1Y2Nlc3NfdXJsGAMgASgJ'
    'UgpzdWNjZXNzVXJsEh0KCmNhbmNlbF91cmwYBCABKAlSCWNhbmNlbFVybBJmCghtZXRhZGF0YR'
    'gFIAMoCzJKLmVjb25hLnNlcnZpY2VzLnNpdGUucGF5bWVudC52MS5DcmVhdGVDaGVja291dFNl'
    'c3Npb25SZXF1ZXN0Lk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhEh8KC2FsbG93X3RyaWFsGAYgAS'
    'gIUgphbGxvd1RyaWFsGjsKDU1ldGFkYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFs'
    'dWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use createCheckoutSessionResponseDescriptor instead')
const CreateCheckoutSessionResponse$json = {
  '1': 'CreateCheckoutSessionResponse',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'checkout_url', '3': 2, '4': 1, '5': 9, '10': 'checkoutUrl'},
    {'1': 'expires_in', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'expiresIn'},
    {'1': 'customer_id', '3': 4, '4': 1, '5': 9, '10': 'customerId'},
    {'1': 'stripe_customer_id', '3': 5, '4': 1, '5': 9, '10': 'stripeCustomerId'},
  ],
};

/// Descriptor for `CreateCheckoutSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCheckoutSessionResponseDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVDaGVja291dFNlc3Npb25SZXNwb25zZRIdCgpzZXNzaW9uX2lkGAEgASgJUglzZX'
    'NzaW9uSWQSIQoMY2hlY2tvdXRfdXJsGAIgASgJUgtjaGVja291dFVybBI4CgpleHBpcmVzX2lu'
    'GAMgASgLMhkuZ29vZ2xlLnByb3RvYnVmLkR1cmF0aW9uUglleHBpcmVzSW4SHwoLY3VzdG9tZX'
    'JfaWQYBCABKAlSCmN1c3RvbWVySWQSLAoSc3RyaXBlX2N1c3RvbWVyX2lkGAUgASgJUhBzdHJp'
    'cGVDdXN0b21lcklk');

@$core.Deprecated('Use completeCheckoutRequestDescriptor instead')
const CompleteCheckoutRequest$json = {
  '1': 'CompleteCheckoutRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

/// Descriptor for `CompleteCheckoutRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeCheckoutRequestDescriptor = $convert.base64Decode(
    'ChdDb21wbGV0ZUNoZWNrb3V0UmVxdWVzdBIdCgpzZXNzaW9uX2lkGAEgASgJUglzZXNzaW9uSW'
    'Q=');

@$core.Deprecated('Use completeCheckoutResponseDescriptor instead')
const CompleteCheckoutResponse$json = {
  '1': 'CompleteCheckoutResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'subscription_id', '3': 2, '4': 1, '5': 9, '10': 'subscriptionId'},
    {'1': 'customer_id', '3': 3, '4': 1, '5': 9, '10': 'customerId'},
    {'1': 'error_message', '3': 4, '4': 1, '5': 9, '10': 'errorMessage'},
    {'1': 'stripe_customer_id', '3': 5, '4': 1, '5': 9, '10': 'stripeCustomerId'},
  ],
};

/// Descriptor for `CompleteCheckoutResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List completeCheckoutResponseDescriptor = $convert.base64Decode(
    'ChhDb21wbGV0ZUNoZWNrb3V0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxInCg'
    '9zdWJzY3JpcHRpb25faWQYAiABKAlSDnN1YnNjcmlwdGlvbklkEh8KC2N1c3RvbWVyX2lkGAMg'
    'ASgJUgpjdXN0b21lcklkEiMKDWVycm9yX21lc3NhZ2UYBCABKAlSDGVycm9yTWVzc2FnZRIsCh'
    'JzdHJpcGVfY3VzdG9tZXJfaWQYBSABKAlSEHN0cmlwZUN1c3RvbWVySWQ=');

