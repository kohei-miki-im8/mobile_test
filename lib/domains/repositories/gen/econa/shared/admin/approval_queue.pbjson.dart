//
//  Generated code. Do not modify.
//  source: econa/shared/admin/approval_queue.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use adminApprovalQueueDescriptor instead')
const AdminApprovalQueue$json = {
  '1': 'AdminApprovalQueue',
  '2': [
    {'1': 'profile_approval_queue_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'profileApprovalQueueId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'current_nickname', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'currentNickname'},
    {'1': 'profile_approval_type', '3': 4, '4': 1, '5': 14, '6': '.econa.enums.ProfileApprovalType', '8': {}, '10': 'profileApprovalType'},
    {'1': 'current_value', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'currentValue'},
    {'1': 'new_value', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'newValue'},
    {'1': 'current_photo_url', '3': 7, '4': 1, '5': 9, '8': {}, '10': 'currentPhotoUrl'},
    {'1': 'new_photo_url', '3': 8, '4': 1, '5': 9, '8': {}, '10': 'newPhotoUrl'},
    {'1': 'current_photo_priority', '3': 9, '4': 1, '5': 5, '8': {}, '10': 'currentPhotoPriority'},
    {'1': 'new_photo_priority', '3': 10, '4': 1, '5': 5, '8': {}, '10': 'newPhotoPriority'},
    {'1': 'admin_review_status', '3': 11, '4': 1, '5': 14, '6': '.econa.enums.AdminReviewStatus', '8': {}, '10': 'adminReviewStatus'},
    {'1': 'priority', '3': 12, '4': 1, '5': 5, '8': {}, '10': 'priority'},
    {'1': 'submitted_at', '3': 13, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': {}, '10': 'submittedAt'},
    {'1': 'rejection_reason_code', '3': 14, '4': 1, '5': 9, '8': {}, '10': 'rejectionReasonCode'},
    {'1': 'profile_approval_memo', '3': 15, '4': 1, '5': 9, '8': {}, '10': 'profileApprovalMemo'},
    {'1': 'reviewed_by', '3': 16, '4': 1, '5': 9, '8': {}, '10': 'reviewedBy'},
    {'1': 'reviewed_at', '3': 17, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'reviewedAt'},
    {'1': 'ng_words', '3': 18, '4': 3, '5': 9, '8': {}, '10': 'ngWords'},
    {'1': 'is_best_photo', '3': 19, '4': 1, '5': 8, '10': 'isBestPhoto'},
  ],
};

/// Descriptor for `AdminApprovalQueue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminApprovalQueueDescriptor = $convert.base64Decode(
    'ChJBZG1pbkFwcHJvdmFsUXVldWUSRgoZcHJvZmlsZV9hcHByb3ZhbF9xdWV1ZV9pZBgBIAEoCU'
    'ILukgIyAEBcgOwAQFSFnByb2ZpbGVBcHByb3ZhbFF1ZXVlSWQSJAoHdXNlcl9pZBgCIAEoCUIL'
    'ukgIyAEBcgOwAQFSBnVzZXJJZBI0ChBjdXJyZW50X25pY2tuYW1lGAMgASgJQgm6SAZyBBABGD'
    'JSD2N1cnJlbnROaWNrbmFtZRJhChVwcm9maWxlX2FwcHJvdmFsX3R5cGUYBCABKA4yIC5lY29u'
    'YS5lbnVtcy5Qcm9maWxlQXBwcm92YWxUeXBlQgu6SAjIAQGCAQIQAVITcHJvZmlsZUFwcHJvdm'
    'FsVHlwZRItCg1jdXJyZW50X3ZhbHVlGAUgASgJQgi6SAVyAxjoB1IMY3VycmVudFZhbHVlEioK'
    'CW5ld192YWx1ZRgGIAEoCUINukgKyAEBcgUQARjoB1IIbmV3VmFsdWUSNAoRY3VycmVudF9waG'
    '90b191cmwYByABKAlCCLpIBXIDiAEBUg9jdXJyZW50UGhvdG9VcmwSLAoNbmV3X3Bob3RvX3Vy'
    'bBgIIAEoCUIIukgFcgOIAQFSC25ld1Bob3RvVXJsEj8KFmN1cnJlbnRfcGhvdG9fcHJpb3JpdH'
    'kYCSABKAVCCbpIBhoEGGQoAFIUY3VycmVudFBob3RvUHJpb3JpdHkSNwoSbmV3X3Bob3RvX3By'
    'aW9yaXR5GAogASgFQgm6SAYaBBhkKABSEG5ld1Bob3RvUHJpb3JpdHkSWwoTYWRtaW5fcmV2aW'
    'V3X3N0YXR1cxgLIAEoDjIeLmVjb25hLmVudW1zLkFkbWluUmV2aWV3U3RhdHVzQgu6SAjIAQGC'
    'AQIQAVIRYWRtaW5SZXZpZXdTdGF0dXMSJQoIcHJpb3JpdHkYDCABKAVCCbpIBhoEGGQoAFIIcH'
    'Jpb3JpdHkSRQoMc3VibWl0dGVkX2F0GA0gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cEIGukgDyAEBUgtzdWJtaXR0ZWRBdBI7ChVyZWplY3Rpb25fcmVhc29uX2NvZGUYDiABKAlCB7'
    'pIBHICGGRSE3JlamVjdGlvblJlYXNvbkNvZGUSPAoVcHJvZmlsZV9hcHByb3ZhbF9tZW1vGA8g'
    'ASgJQgi6SAVyAxj0A1ITcHJvZmlsZUFwcHJvdmFsTWVtbxIpCgtyZXZpZXdlZF9ieRgQIAEoCU'
    'IIukgFcgOwAQFSCnJldmlld2VkQnkSOwoLcmV2aWV3ZWRfYXQYESABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wUgpyZXZpZXdlZEF0EisKCG5nX3dvcmRzGBIgAygJQhC6SA2SAQoQMi'
    'IGcgQQARhkUgduZ1dvcmRzEiIKDWlzX2Jlc3RfcGhvdG8YEyABKAhSC2lzQmVzdFBob3Rv');

