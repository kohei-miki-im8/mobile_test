//
//  Generated code. Do not modify.
//  source: econa/services/site/payment/v1/create_billing_portal_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createBillingPortalSessionRequestDescriptor instead')
const CreateBillingPortalSessionRequest$json = {
  '1': 'CreateBillingPortalSessionRequest',
  '2': [
    {'1': 'return_url', '3': 1, '4': 1, '5': 9, '10': 'returnUrl'},
  ],
};

/// Descriptor for `CreateBillingPortalSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBillingPortalSessionRequestDescriptor = $convert.base64Decode(
    'CiFDcmVhdGVCaWxsaW5nUG9ydGFsU2Vzc2lvblJlcXVlc3QSHQoKcmV0dXJuX3VybBgBIAEoCV'
    'IJcmV0dXJuVXJs');

@$core.Deprecated('Use createBillingPortalSessionResponseDescriptor instead')
const CreateBillingPortalSessionResponse$json = {
  '1': 'CreateBillingPortalSessionResponse',
  '2': [
    {'1': 'portal_url', '3': 1, '4': 1, '5': 9, '10': 'portalUrl'},
    {'1': 'expires_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'expiresAt'},
    {'1': 'stripe_customer_id', '3': 3, '4': 1, '5': 9, '10': 'stripeCustomerId'},
  ],
};

/// Descriptor for `CreateBillingPortalSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBillingPortalSessionResponseDescriptor = $convert.base64Decode(
    'CiJDcmVhdGVCaWxsaW5nUG9ydGFsU2Vzc2lvblJlc3BvbnNlEh0KCnBvcnRhbF91cmwYASABKA'
    'lSCXBvcnRhbFVybBI5CgpleHBpcmVzX2F0GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVz'
    'dGFtcFIJZXhwaXJlc0F0EiwKEnN0cmlwZV9jdXN0b21lcl9pZBgDIAEoCVIQc3RyaXBlQ3VzdG'
    '9tZXJJZA==');

