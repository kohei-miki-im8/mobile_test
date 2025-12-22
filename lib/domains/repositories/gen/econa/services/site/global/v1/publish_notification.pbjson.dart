//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/publish_notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use publishNotificationRequestDescriptor instead')
const PublishNotificationRequest$json = {
  '1': 'PublishNotificationRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'notification_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.NotificationType', '8': {}, '10': 'notificationType'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'title'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'message'},
    {'1': 'related_user_id', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'relatedUserId'},
    {'1': 'related_entity_id', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'relatedEntityId'},
    {'1': 'send_push', '3': 7, '4': 1, '5': 8, '10': 'sendPush'},
    {'1': 'ekyc_verification_data', '3': 8, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.EKYCVerificationData', '9': 0, '10': 'ekycVerificationData'},
    {'1': 'personal_verification_data', '3': 9, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.PersonalVerificationData', '9': 0, '10': 'personalVerificationData'},
    {'1': 'profile_approval_data', '3': 10, '4': 1, '5': 11, '6': '.econa.services.site.global.v1.ProfileApprovalData', '9': 0, '10': 'profileApprovalData'},
  ],
  '8': [
    {'1': 'detail_data'},
  ],
};

/// Descriptor for `PublishNotificationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishNotificationRequestDescriptor = $convert.base64Decode(
    'ChpQdWJsaXNoTm90aWZpY2F0aW9uUmVxdWVzdBIhCgd1c2VyX2lkGAEgASgJQgi6SAVyA7ABAV'
    'IGdXNlcklkElYKEW5vdGlmaWNhdGlvbl90eXBlGAIgASgOMh0uZWNvbmEuZW51bXMuTm90aWZp'
    'Y2F0aW9uVHlwZUIKukgHggEEEAEgAFIQbm90aWZpY2F0aW9uVHlwZRIgCgV0aXRsZRgDIAEoCU'
    'IKukgHcgUQARjIAVIFdGl0bGUSJAoHbWVzc2FnZRgEIAEoCUIKukgHcgUQARjIAVIHbWVzc2Fn'
    'ZRIwCg9yZWxhdGVkX3VzZXJfaWQYBSABKAlCCLpIBXIDsAEBUg1yZWxhdGVkVXNlcklkEjQKEX'
    'JlbGF0ZWRfZW50aXR5X2lkGAYgASgJQgi6SAVyA7ABAVIPcmVsYXRlZEVudGl0eUlkEhsKCXNl'
    'bmRfcHVzaBgHIAEoCFIIc2VuZFB1c2gSawoWZWt5Y192ZXJpZmljYXRpb25fZGF0YRgIIAEoCz'
    'IzLmVjb25hLnNlcnZpY2VzLnNpdGUuZ2xvYmFsLnYxLkVLWUNWZXJpZmljYXRpb25EYXRhSABS'
    'FGVreWNWZXJpZmljYXRpb25EYXRhEncKGnBlcnNvbmFsX3ZlcmlmaWNhdGlvbl9kYXRhGAkgAS'
    'gLMjcuZWNvbmEuc2VydmljZXMuc2l0ZS5nbG9iYWwudjEuUGVyc29uYWxWZXJpZmljYXRpb25E'
    'YXRhSABSGHBlcnNvbmFsVmVyaWZpY2F0aW9uRGF0YRJoChVwcm9maWxlX2FwcHJvdmFsX2RhdG'
    'EYCiABKAsyMi5lY29uYS5zZXJ2aWNlcy5zaXRlLmdsb2JhbC52MS5Qcm9maWxlQXBwcm92YWxE'
    'YXRhSABSE3Byb2ZpbGVBcHByb3ZhbERhdGFCDQoLZGV0YWlsX2RhdGE=');

@$core.Deprecated('Use publishNotificationResponseDescriptor instead')
const PublishNotificationResponse$json = {
  '1': 'PublishNotificationResponse',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 9, '10': 'notificationId'},
    {'1': 'push_sent', '3': 2, '4': 1, '5': 8, '10': 'pushSent'},
  ],
};

/// Descriptor for `PublishNotificationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publishNotificationResponseDescriptor = $convert.base64Decode(
    'ChtQdWJsaXNoTm90aWZpY2F0aW9uUmVzcG9uc2USJwoPbm90aWZpY2F0aW9uX2lkGAEgASgJUg'
    '5ub3RpZmljYXRpb25JZBIbCglwdXNoX3NlbnQYAiABKAhSCHB1c2hTZW50');

@$core.Deprecated('Use eKYCVerificationDataDescriptor instead')
const EKYCVerificationData$json = {
  '1': 'EKYCVerificationData',
  '2': [
    {'1': 'is_verified', '3': 1, '4': 1, '5': 8, '10': 'isVerified'},
    {'1': 'ekyc_level_code', '3': 2, '4': 1, '5': 9, '10': 'ekycLevelCode'},
    {'1': 'rejection_reason', '3': 3, '4': 1, '5': 9, '10': 'rejectionReason'},
    {'1': 'completed_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

/// Descriptor for `EKYCVerificationData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eKYCVerificationDataDescriptor = $convert.base64Decode(
    'ChRFS1lDVmVyaWZpY2F0aW9uRGF0YRIfCgtpc192ZXJpZmllZBgBIAEoCFIKaXNWZXJpZmllZB'
    'ImCg9la3ljX2xldmVsX2NvZGUYAiABKAlSDWVreWNMZXZlbENvZGUSKQoQcmVqZWN0aW9uX3Jl'
    'YXNvbhgDIAEoCVIPcmVqZWN0aW9uUmVhc29uEj0KDGNvbXBsZXRlZF9hdBgEIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2NvbXBsZXRlZEF0');

@$core.Deprecated('Use personalVerificationDataDescriptor instead')
const PersonalVerificationData$json = {
  '1': 'PersonalVerificationData',
  '2': [
    {'1': 'is_matched', '3': 1, '4': 1, '5': 8, '10': 'isMatched'},
    {'1': 'birth_date_matched', '3': 2, '4': 1, '5': 8, '10': 'birthDateMatched'},
    {'1': 'name_matched', '3': 3, '4': 1, '5': 8, '10': 'nameMatched'},
    {'1': 'mismatch_reason', '3': 4, '4': 1, '5': 9, '10': 'mismatchReason'},
    {'1': 'completed_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

/// Descriptor for `PersonalVerificationData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List personalVerificationDataDescriptor = $convert.base64Decode(
    'ChhQZXJzb25hbFZlcmlmaWNhdGlvbkRhdGESHQoKaXNfbWF0Y2hlZBgBIAEoCFIJaXNNYXRjaG'
    'VkEiwKEmJpcnRoX2RhdGVfbWF0Y2hlZBgCIAEoCFIQYmlydGhEYXRlTWF0Y2hlZBIhCgxuYW1l'
    'X21hdGNoZWQYAyABKAhSC25hbWVNYXRjaGVkEicKD21pc21hdGNoX3JlYXNvbhgEIAEoCVIObW'
    'lzbWF0Y2hSZWFzb24SPQoMY29tcGxldGVkX2F0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcFILY29tcGxldGVkQXQ=');

@$core.Deprecated('Use profileApprovalDataDescriptor instead')
const ProfileApprovalData$json = {
  '1': 'ProfileApprovalData',
  '2': [
    {'1': 'is_approved', '3': 1, '4': 1, '5': 8, '10': 'isApproved'},
    {'1': 'approval_type', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'approvalType'},
    {'1': 'field_name', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'fieldName'},
    {'1': 'rejection_reason', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'rejectionReason'},
    {'1': 'completed_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

/// Descriptor for `ProfileApprovalData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileApprovalDataDescriptor = $convert.base64Decode(
    'ChNQcm9maWxlQXBwcm92YWxEYXRhEh8KC2lzX2FwcHJvdmVkGAEgASgIUgppc0FwcHJvdmVkEi'
    '4KDWFwcHJvdmFsX3R5cGUYAiABKAlCCbpIBnIEEAEYMlIMYXBwcm92YWxUeXBlEigKCmZpZWxk'
    'X25hbWUYAyABKAlCCbpIBnIEEAEYZFIJZmllbGROYW1lEjMKEHJlamVjdGlvbl9yZWFzb24YBC'
    'ABKAlCCLpIBXIDGPQDUg9yZWplY3Rpb25SZWFzb24SPQoMY29tcGxldGVkX2F0GAUgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILY29tcGxldGVkQXQ=');

