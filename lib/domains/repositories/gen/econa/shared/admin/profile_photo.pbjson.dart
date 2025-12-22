//
//  Generated code. Do not modify.
//  source: econa/shared/admin/profile_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use adminProfilePhotoDescriptor instead')
const AdminProfilePhoto$json = {
  '1': 'AdminProfilePhoto',
  '2': [
    {'1': 'profile_photo_id', '3': 1, '4': 1, '5': 9, '10': 'profilePhotoId'},
    {'1': 'origin_signed_url', '3': 2, '4': 1, '5': 9, '10': 'originSignedUrl'},
    {'1': 'thumbnail_signed_urls', '3': 3, '4': 3, '5': 9, '10': 'thumbnailSignedUrls'},
    {'1': 'avatar_signed_url', '3': 4, '4': 1, '5': 9, '10': 'avatarSignedUrl'},
    {'1': 'priority', '3': 5, '4': 1, '5': 5, '10': 'priority'},
    {'1': 'is_best_photo', '3': 6, '4': 1, '5': 8, '10': 'isBestPhoto'},
    {'1': 'media_category', '3': 7, '4': 1, '5': 14, '6': '.econa.enums.MediaCategory', '10': 'mediaCategory'},
    {'1': 'admin_review_status', '3': 8, '4': 1, '5': 14, '6': '.econa.enums.AdminReviewStatus', '10': 'adminReviewStatus'},
    {'1': 'approval_queue_id', '3': 9, '4': 1, '5': 9, '10': 'approvalQueueId'},
    {'1': 'uploaded_at', '3': 10, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'uploadedAt'},
    {'1': 'approved_at', '3': 11, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'approvedAt'},
  ],
};

/// Descriptor for `AdminProfilePhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adminProfilePhotoDescriptor = $convert.base64Decode(
    'ChFBZG1pblByb2ZpbGVQaG90bxIoChBwcm9maWxlX3Bob3RvX2lkGAEgASgJUg5wcm9maWxlUG'
    'hvdG9JZBIqChFvcmlnaW5fc2lnbmVkX3VybBgCIAEoCVIPb3JpZ2luU2lnbmVkVXJsEjIKFXRo'
    'dW1ibmFpbF9zaWduZWRfdXJscxgDIAMoCVITdGh1bWJuYWlsU2lnbmVkVXJscxIqChFhdmF0YX'
    'Jfc2lnbmVkX3VybBgEIAEoCVIPYXZhdGFyU2lnbmVkVXJsEhoKCHByaW9yaXR5GAUgASgFUghw'
    'cmlvcml0eRIiCg1pc19iZXN0X3Bob3RvGAYgASgIUgtpc0Jlc3RQaG90bxJBCg5tZWRpYV9jYX'
    'RlZ29yeRgHIAEoDjIaLmVjb25hLmVudW1zLk1lZGlhQ2F0ZWdvcnlSDW1lZGlhQ2F0ZWdvcnkS'
    'TgoTYWRtaW5fcmV2aWV3X3N0YXR1cxgIIAEoDjIeLmVjb25hLmVudW1zLkFkbWluUmV2aWV3U3'
    'RhdHVzUhFhZG1pblJldmlld1N0YXR1cxIqChFhcHByb3ZhbF9xdWV1ZV9pZBgJIAEoCVIPYXBw'
    'cm92YWxRdWV1ZUlkEjsKC3VwbG9hZGVkX2F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcFIKdXBsb2FkZWRBdBI7CgthcHByb3ZlZF9hdBgLIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSCmFwcHJvdmVkQXQ=');

