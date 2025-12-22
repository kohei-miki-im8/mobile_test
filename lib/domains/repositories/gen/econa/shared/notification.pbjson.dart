//
//  Generated code. Do not modify.
//  source: econa/shared/notification.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use notificationDescriptor instead')
const Notification$json = {
  '1': 'Notification',
  '2': [
    {'1': 'notification_id', '3': 1, '4': 1, '5': 9, '10': 'notificationId'},
    {'1': 'notification_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.NotificationType', '10': 'notificationType'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'related_user_id', '3': 5, '4': 1, '5': 9, '10': 'relatedUserId'},
    {'1': 'related_entity_id', '3': 6, '4': 1, '5': 9, '10': 'relatedEntityId'},
    {'1': 'is_read', '3': 7, '4': 1, '5': 8, '10': 'isRead'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'read_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'readAt'},
    {'1': 'related_user_info', '3': 10, '4': 1, '5': 11, '6': '.econa.shared.Notification.RelatedUserInfo', '9': 0, '10': 'relatedUserInfo'},
    {'1': 'related_chat_room_info', '3': 11, '4': 1, '5': 11, '6': '.econa.shared.Notification.RelatedChatRoomInfo', '9': 0, '10': 'relatedChatRoomInfo'},
    {'1': 'related_announcement_info', '3': 12, '4': 1, '5': 11, '6': '.econa.shared.Notification.RelatedAnnouncementInfo', '9': 0, '10': 'relatedAnnouncementInfo'},
    {'1': 'related_ekyc_info', '3': 13, '4': 1, '5': 11, '6': '.econa.shared.Notification.RelatedEKYCInfo', '9': 0, '10': 'relatedEkycInfo'},
    {'1': 'related_profile_approval_info', '3': 14, '4': 1, '5': 11, '6': '.econa.shared.Notification.RelatedProfileApprovalInfo', '9': 0, '10': 'relatedProfileApprovalInfo'},
  ],
  '3': [Notification_RelatedUserInfo$json, Notification_RelatedChatRoomInfo$json, Notification_RelatedAnnouncementInfo$json, Notification_RelatedEKYCInfo$json, Notification_EKYCVerificationResult$json, Notification_PersonalVerificationResult$json, Notification_RelatedProfileApprovalInfo$json],
  '8': [
    {'1': 'related_info'},
  ],
};

@$core.Deprecated('Use notificationDescriptor instead')
const Notification_RelatedUserInfo$json = {
  '1': 'RelatedUserInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'nickname', '3': 2, '4': 1, '5': 9, '10': 'nickname'},
    {'1': 'profile_image_url', '3': 3, '4': 1, '5': 9, '10': 'profileImageUrl'},
    {'1': 'is_deleted', '3': 4, '4': 1, '5': 8, '10': 'isDeleted'},
  ],
};

@$core.Deprecated('Use notificationDescriptor instead')
const Notification_RelatedChatRoomInfo$json = {
  '1': 'RelatedChatRoomInfo',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '10': 'chatRoomId'},
    {'1': 'latest_message_preview', '3': 2, '4': 1, '5': 9, '10': 'latestMessagePreview'},
  ],
};

@$core.Deprecated('Use notificationDescriptor instead')
const Notification_RelatedAnnouncementInfo$json = {
  '1': 'RelatedAnnouncementInfo',
  '2': [
    {'1': 'announcement_id', '3': 1, '4': 1, '5': 9, '10': 'announcementId'},
    {'1': 'image_url', '3': 2, '4': 1, '5': 9, '10': 'imageUrl'},
    {'1': 'link_url', '3': 3, '4': 1, '5': 9, '10': 'linkUrl'},
  ],
};

@$core.Deprecated('Use notificationDescriptor instead')
const Notification_RelatedEKYCInfo$json = {
  '1': 'RelatedEKYCInfo',
  '2': [
    {'1': 'ekyc_verification', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.Notification.EKYCVerificationResult', '9': 0, '10': 'ekycVerification'},
    {'1': 'personal_verification', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.Notification.PersonalVerificationResult', '9': 0, '10': 'personalVerification'},
  ],
  '8': [
    {'1': 'ekyc_data'},
  ],
};

@$core.Deprecated('Use notificationDescriptor instead')
const Notification_EKYCVerificationResult$json = {
  '1': 'EKYCVerificationResult',
  '2': [
    {'1': 'is_verified', '3': 1, '4': 1, '5': 8, '10': 'isVerified'},
    {'1': 'ekyc_level_code', '3': 2, '4': 1, '5': 9, '10': 'ekycLevelCode'},
    {'1': 'rejection_reason', '3': 3, '4': 1, '5': 9, '10': 'rejectionReason'},
    {'1': 'completed_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

@$core.Deprecated('Use notificationDescriptor instead')
const Notification_PersonalVerificationResult$json = {
  '1': 'PersonalVerificationResult',
  '2': [
    {'1': 'is_matched', '3': 1, '4': 1, '5': 8, '10': 'isMatched'},
    {'1': 'birth_date_matched', '3': 2, '4': 1, '5': 8, '10': 'birthDateMatched'},
    {'1': 'name_matched', '3': 3, '4': 1, '5': 8, '10': 'nameMatched'},
    {'1': 'mismatch_reason', '3': 4, '4': 1, '5': 9, '10': 'mismatchReason'},
    {'1': 'completed_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

@$core.Deprecated('Use notificationDescriptor instead')
const Notification_RelatedProfileApprovalInfo$json = {
  '1': 'RelatedProfileApprovalInfo',
  '2': [
    {'1': 'is_approved', '3': 1, '4': 1, '5': 8, '10': 'isApproved'},
    {'1': 'approval_type', '3': 2, '4': 1, '5': 9, '10': 'approvalType'},
    {'1': 'field_name', '3': 3, '4': 1, '5': 9, '10': 'fieldName'},
    {'1': 'rejection_reason', '3': 4, '4': 1, '5': 9, '10': 'rejectionReason'},
    {'1': 'completed_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'completedAt'},
  ],
};

/// Descriptor for `Notification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationDescriptor = $convert.base64Decode(
    'CgxOb3RpZmljYXRpb24SJwoPbm90aWZpY2F0aW9uX2lkGAEgASgJUg5ub3RpZmljYXRpb25JZB'
    'JKChFub3RpZmljYXRpb25fdHlwZRgCIAEoDjIdLmVjb25hLmVudW1zLk5vdGlmaWNhdGlvblR5'
    'cGVSEG5vdGlmaWNhdGlvblR5cGUSFAoFdGl0bGUYAyABKAlSBXRpdGxlEhgKB21lc3NhZ2UYBC'
    'ABKAlSB21lc3NhZ2USJgoPcmVsYXRlZF91c2VyX2lkGAUgASgJUg1yZWxhdGVkVXNlcklkEioK'
    'EXJlbGF0ZWRfZW50aXR5X2lkGAYgASgJUg9yZWxhdGVkRW50aXR5SWQSFwoHaXNfcmVhZBgHIA'
    'EoCFIGaXNSZWFkEjkKCmNyZWF0ZWRfYXQYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUgljcmVhdGVkQXQSMwoHcmVhZF9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSBnJlYWRBdBJYChFyZWxhdGVkX3VzZXJfaW5mbxgKIAEoCzIqLmVjb25hLnNoYXJlZC5O'
    'b3RpZmljYXRpb24uUmVsYXRlZFVzZXJJbmZvSABSD3JlbGF0ZWRVc2VySW5mbxJlChZyZWxhdG'
    'VkX2NoYXRfcm9vbV9pbmZvGAsgASgLMi4uZWNvbmEuc2hhcmVkLk5vdGlmaWNhdGlvbi5SZWxh'
    'dGVkQ2hhdFJvb21JbmZvSABSE3JlbGF0ZWRDaGF0Um9vbUluZm8ScAoZcmVsYXRlZF9hbm5vdW'
    '5jZW1lbnRfaW5mbxgMIAEoCzIyLmVjb25hLnNoYXJlZC5Ob3RpZmljYXRpb24uUmVsYXRlZEFu'
    'bm91bmNlbWVudEluZm9IAFIXcmVsYXRlZEFubm91bmNlbWVudEluZm8SWAoRcmVsYXRlZF9la3'
    'ljX2luZm8YDSABKAsyKi5lY29uYS5zaGFyZWQuTm90aWZpY2F0aW9uLlJlbGF0ZWRFS1lDSW5m'
    'b0gAUg9yZWxhdGVkRWt5Y0luZm8SegodcmVsYXRlZF9wcm9maWxlX2FwcHJvdmFsX2luZm8YDi'
    'ABKAsyNS5lY29uYS5zaGFyZWQuTm90aWZpY2F0aW9uLlJlbGF0ZWRQcm9maWxlQXBwcm92YWxJ'
    'bmZvSABSGnJlbGF0ZWRQcm9maWxlQXBwcm92YWxJbmZvGpEBCg9SZWxhdGVkVXNlckluZm8SFw'
    'oHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhoKCG5pY2tuYW1lGAIgASgJUghuaWNrbmFtZRIqChFw'
    'cm9maWxlX2ltYWdlX3VybBgDIAEoCVIPcHJvZmlsZUltYWdlVXJsEh0KCmlzX2RlbGV0ZWQYBC'
    'ABKAhSCWlzRGVsZXRlZBptChNSZWxhdGVkQ2hhdFJvb21JbmZvEiAKDGNoYXRfcm9vbV9pZBgB'
    'IAEoCVIKY2hhdFJvb21JZBI0ChZsYXRlc3RfbWVzc2FnZV9wcmV2aWV3GAIgASgJUhRsYXRlc3'
    'RNZXNzYWdlUHJldmlldxp6ChdSZWxhdGVkQW5ub3VuY2VtZW50SW5mbxInCg9hbm5vdW5jZW1l'
    'bnRfaWQYASABKAlSDmFubm91bmNlbWVudElkEhsKCWltYWdlX3VybBgCIAEoCVIIaW1hZ2VVcm'
    'wSGQoIbGlua191cmwYAyABKAlSB2xpbmtVcmwa7gEKD1JlbGF0ZWRFS1lDSW5mbxJgChFla3lj'
    'X3ZlcmlmaWNhdGlvbhgBIAEoCzIxLmVjb25hLnNoYXJlZC5Ob3RpZmljYXRpb24uRUtZQ1Zlcm'
    'lmaWNhdGlvblJlc3VsdEgAUhBla3ljVmVyaWZpY2F0aW9uEmwKFXBlcnNvbmFsX3ZlcmlmaWNh'
    'dGlvbhgCIAEoCzI1LmVjb25hLnNoYXJlZC5Ob3RpZmljYXRpb24uUGVyc29uYWxWZXJpZmljYX'
    'Rpb25SZXN1bHRIAFIUcGVyc29uYWxWZXJpZmljYXRpb25CCwoJZWt5Y19kYXRhGssBChZFS1lD'
    'VmVyaWZpY2F0aW9uUmVzdWx0Eh8KC2lzX3ZlcmlmaWVkGAEgASgIUgppc1ZlcmlmaWVkEiYKD2'
    'VreWNfbGV2ZWxfY29kZRgCIAEoCVINZWt5Y0xldmVsQ29kZRIpChByZWplY3Rpb25fcmVhc29u'
    'GAMgASgJUg9yZWplY3Rpb25SZWFzb24SPQoMY29tcGxldGVkX2F0GAQgASgLMhouZ29vZ2xlLn'
    'Byb3RvYnVmLlRpbWVzdGFtcFILY29tcGxldGVkQXQa9AEKGlBlcnNvbmFsVmVyaWZpY2F0aW9u'
    'UmVzdWx0Eh0KCmlzX21hdGNoZWQYASABKAhSCWlzTWF0Y2hlZBIsChJiaXJ0aF9kYXRlX21hdG'
    'NoZWQYAiABKAhSEGJpcnRoRGF0ZU1hdGNoZWQSIQoMbmFtZV9tYXRjaGVkGAMgASgIUgtuYW1l'
    'TWF0Y2hlZBInCg9taXNtYXRjaF9yZWFzb24YBCABKAlSDm1pc21hdGNoUmVhc29uEj0KDGNvbX'
    'BsZXRlZF9hdBgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2NvbXBsZXRlZEF0'
    'GusBChpSZWxhdGVkUHJvZmlsZUFwcHJvdmFsSW5mbxIfCgtpc19hcHByb3ZlZBgBIAEoCFIKaX'
    'NBcHByb3ZlZBIjCg1hcHByb3ZhbF90eXBlGAIgASgJUgxhcHByb3ZhbFR5cGUSHQoKZmllbGRf'
    'bmFtZRgDIAEoCVIJZmllbGROYW1lEikKEHJlamVjdGlvbl9yZWFzb24YBCABKAlSD3JlamVjdG'
    'lvblJlYXNvbhI9Cgxjb21wbGV0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUgtjb21wbGV0ZWRBdEIOCgxyZWxhdGVkX2luZm8=');

