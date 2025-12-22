//
//  Generated code. Do not modify.
//  source: econa/shared/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userStatusDescriptor instead')
const UserStatus$json = {
  '1': 'UserStatus',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'account_status_code', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.AccountStatusCode', '10': 'accountStatusCode'},
    {'1': 'subscription_tier', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.SubscriptionTier', '8': {}, '10': 'subscriptionTier'},
    {'1': 'paid_subscription_expires_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'paidSubscriptionExpiresAt'},
    {'1': 'certificate_level_code', '3': 5, '4': 1, '5': 14, '6': '.econa.enums.CertificateLevelCode', '10': 'certificateLevelCode'},
    {'1': 'has_personality_summary', '3': 6, '4': 1, '5': 8, '10': 'hasPersonalitySummary'},
    {'1': 'has_tone_summary', '3': 7, '4': 1, '5': 8, '10': 'hasToneSummary'},
    {'1': 'first_message_service_review_status', '3': 8, '4': 1, '5': 14, '6': '.econa.enums.ServiceReviewStatus', '10': 'firstMessageServiceReviewStatus'},
  ],
};

/// Descriptor for `UserStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userStatusDescriptor = $convert.base64Decode(
    'CgpVc2VyU3RhdHVzEiEKB3VzZXJfaWQYASABKAlCCLpIBXIDsAEBUgZ1c2VySWQSTgoTYWNjb3'
    'VudF9zdGF0dXNfY29kZRgCIAEoDjIeLmVjb25hLmVudW1zLkFjY291bnRTdGF0dXNDb2RlUhFh'
    'Y2NvdW50U3RhdHVzQ29kZRJWChFzdWJzY3JpcHRpb25fdGllchgDIAEoDjIdLmVjb25hLmVudW'
    '1zLlN1YnNjcmlwdGlvblRpZXJCCrpIB4IBBBABIABSEHN1YnNjcmlwdGlvblRpZXISWwoccGFp'
    'ZF9zdWJzY3JpcHRpb25fZXhwaXJlc19hdBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSGXBhaWRTdWJzY3JpcHRpb25FeHBpcmVzQXQSVwoWY2VydGlmaWNhdGVfbGV2ZWxfY29k'
    'ZRgFIAEoDjIhLmVjb25hLmVudW1zLkNlcnRpZmljYXRlTGV2ZWxDb2RlUhRjZXJ0aWZpY2F0ZU'
    'xldmVsQ29kZRI2ChdoYXNfcGVyc29uYWxpdHlfc3VtbWFyeRgGIAEoCFIVaGFzUGVyc29uYWxp'
    'dHlTdW1tYXJ5EigKEGhhc190b25lX3N1bW1hcnkYByABKAhSDmhhc1RvbmVTdW1tYXJ5Em4KI2'
    'ZpcnN0X21lc3NhZ2Vfc2VydmljZV9yZXZpZXdfc3RhdHVzGAggASgOMiAuZWNvbmEuZW51bXMu'
    'U2VydmljZVJldmlld1N0YXR1c1IfZmlyc3RNZXNzYWdlU2VydmljZVJldmlld1N0YXR1cw==');

