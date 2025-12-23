//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/subscribe_global_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sessionEventTypeDescriptor instead')
const SessionEventType$json = {
  '1': 'SessionEventType',
  '2': [
    {'1': 'SESSION_EVENT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'SESSION_EVENT_TYPE_EKYC_VERIFICATION_COMPLETED', '2': 1},
    {'1': 'SESSION_EVENT_TYPE_PERSONAL_VERIFICATION_COMPLETED', '2': 2},
  ],
};

/// Descriptor for `SessionEventType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sessionEventTypeDescriptor = $convert.base64Decode(
    'ChBTZXNzaW9uRXZlbnRUeXBlEiIKHlNFU1NJT05fRVZFTlRfVFlQRV9VTlNQRUNJRklFRBAAEj'
    'IKLlNFU1NJT05fRVZFTlRfVFlQRV9FS1lDX1ZFUklGSUNBVElPTl9DT01QTEVURUQQARI2CjJT'
    'RVNTSU9OX0VWRU5UX1RZUEVfUEVSU09OQUxfVkVSSUZJQ0FUSU9OX0NPTVBMRVRFRBAC');

@$core.Deprecated('Use subscribeGlobalSessionRequestDescriptor instead')
const SubscribeGlobalSessionRequest$json = {
  '1': 'SubscribeGlobalSessionRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `SubscribeGlobalSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeGlobalSessionRequestDescriptor = $convert.base64Decode(
    'Ch1TdWJzY3JpYmVHbG9iYWxTZXNzaW9uUmVxdWVzdBIhCgd1c2VyX2lkGAEgASgJQgi6SAVyA7'
    'ABAVIGdXNlcklk');

@$core.Deprecated('Use subscribeGlobalSessionResponseDescriptor instead')
const SubscribeGlobalSessionResponse$json = {
  '1': 'SubscribeGlobalSessionResponse',
  '2': [
    {'1': 'published_user_id', '3': 1, '4': 1, '5': 9, '10': 'publishedUserId'},
    {'1': 'event_type', '3': 2, '4': 1, '5': 14, '6': '.econa.services.site.global.v1.SessionEventType', '8': {}, '10': 'eventType'},
    {'1': 'ekyc_verification_completed', '3': 3, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.EKYCVerificationCompleted', '9': 0, '10': 'ekycVerificationCompleted'},
    {'1': 'personal_verification_completed', '3': 4, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.PersonalVerificationCompleted', '9': 0, '10': 'personalVerificationCompleted'},
    {'1': 'timestamp', '3': 14, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'is_successful', '3': 15, '4': 1, '5': 8, '10': 'isSuccessful'},
  ],
  '8': [
    {'1': 'event_data', '2': {}},
  ],
};

/// Descriptor for `SubscribeGlobalSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List subscribeGlobalSessionResponseDescriptor = $convert.base64Decode(
    'Ch5TdWJzY3JpYmVHbG9iYWxTZXNzaW9uUmVzcG9uc2USKgoRcHVibGlzaGVkX3VzZXJfaWQYAS'
    'ABKAlSD3B1Ymxpc2hlZFVzZXJJZBJaCgpldmVudF90eXBlGAIgASgOMi8uZWNvbmEuc2Vydmlj'
    'ZXMuc2l0ZS5nbG9iYWwudjEuU2Vzc2lvbkV2ZW50VHlwZUIKukgHggEEEAEgAFIJZXZlbnRUeX'
    'BlEnoKG2VreWNfdmVyaWZpY2F0aW9uX2NvbXBsZXRlZBgDIAEoCzI4LmVjb25hLnNlcnZpY2Vz'
    'LnNpdGUuZ2xvYmFsLnYxLkVLWUNWZXJpZmljYXRpb25Db21wbGV0ZWRIAFIZZWt5Y1ZlcmlmaW'
    'NhdGlvbkNvbXBsZXRlZBKGAQofcGVyc29uYWxfdmVyaWZpY2F0aW9uX2NvbXBsZXRlZBgEIAEo'
    'CzI8LmVjb25hLnNlcnZpY2VzLnNpdGUuZ2xvYmFsLnYxLlBlcnNvbmFsVmVyaWZpY2F0aW9uQ2'
    '9tcGxldGVkSABSHXBlcnNvbmFsVmVyaWZpY2F0aW9uQ29tcGxldGVkEjgKCXRpbWVzdGFtcBgO'
    'IAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcBIjCg1pc19zdWNjZX'
    'NzZnVsGA8gASgIUgxpc1N1Y2Nlc3NmdWxCEwoKZXZlbnRfZGF0YRIFukgCCAE=');

@$core.Deprecated('Use eKYCVerificationCompletedDescriptor instead')
const EKYCVerificationCompleted$json = {
  '1': 'EKYCVerificationCompleted',
  '2': [
    {'1': 'is_verified', '3': 1, '4': 1, '5': 8, '10': 'isVerified'},
    {'1': 'ekyc_level_code', '3': 2, '4': 1, '5': 9, '10': 'ekycLevelCode'},
    {'1': 'rejection_reason', '3': 3, '4': 1, '5': 9, '10': 'rejectionReason'},
    {'1': 'completed_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

/// Descriptor for `EKYCVerificationCompleted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eKYCVerificationCompletedDescriptor = $convert.base64Decode(
    'ChlFS1lDVmVyaWZpY2F0aW9uQ29tcGxldGVkEh8KC2lzX3ZlcmlmaWVkGAEgASgIUgppc1Zlcm'
    'lmaWVkEiYKD2VreWNfbGV2ZWxfY29kZRgCIAEoCVINZWt5Y0xldmVsQ29kZRIpChByZWplY3Rp'
    'b25fcmVhc29uGAMgASgJUg9yZWplY3Rpb25SZWFzb24SPQoMY29tcGxldGVkX2F0GAQgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILY29tcGxldGVkQXQ=');

@$core.Deprecated('Use personalVerificationCompletedDescriptor instead')
const PersonalVerificationCompleted$json = {
  '1': 'PersonalVerificationCompleted',
  '2': [
    {'1': 'is_matched', '3': 1, '4': 1, '5': 8, '10': 'isMatched'},
    {'1': 'birth_date_matched', '3': 2, '4': 1, '5': 8, '10': 'birthDateMatched'},
    {'1': 'name_matched', '3': 3, '4': 1, '5': 8, '10': 'nameMatched'},
    {'1': 'mismatch_reason', '3': 4, '4': 1, '5': 9, '10': 'mismatchReason'},
    {'1': 'completed_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

/// Descriptor for `PersonalVerificationCompleted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personalVerificationCompletedDescriptor = $convert.base64Decode(
    'Ch1QZXJzb25hbFZlcmlmaWNhdGlvbkNvbXBsZXRlZBIdCgppc19tYXRjaGVkGAEgASgIUglpc0'
    '1hdGNoZWQSLAoSYmlydGhfZGF0ZV9tYXRjaGVkGAIgASgIUhBiaXJ0aERhdGVNYXRjaGVkEiEK'
    'DG5hbWVfbWF0Y2hlZBgDIAEoCFILbmFtZU1hdGNoZWQSJwoPbWlzbWF0Y2hfcmVhc29uGAQgAS'
    'gJUg5taXNtYXRjaFJlYXNvbhI9Cgxjb21wbGV0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUgtjb21wbGV0ZWRBdA==');

