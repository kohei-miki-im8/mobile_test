//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/update_profile_photo_display_order.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateProfilePhotoDisplayOrderRequestDescriptor instead')
const UpdateProfilePhotoDisplayOrderRequest$json = {
  '1': 'UpdateProfilePhotoDisplayOrderRequest',
  '2': [
    {'1': 'user_profile_photo_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userProfilePhotoId'},
    {'1': 'display_order', '3': 2, '4': 1, '5': 5, '8': {}, '10': 'displayOrder'},
  ],
};

/// Descriptor for `UpdateProfilePhotoDisplayOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfilePhotoDisplayOrderRequestDescriptor = $convert.base64Decode(
    'CiVVcGRhdGVQcm9maWxlUGhvdG9EaXNwbGF5T3JkZXJSZXF1ZXN0EjsKFXVzZXJfcHJvZmlsZV'
    '9waG90b19pZBgBIAEoCUIIukgFcgOwAQFSEnVzZXJQcm9maWxlUGhvdG9JZBIuCg1kaXNwbGF5'
    'X29yZGVyGAIgASgFQgm6SAYaBBgKKAFSDGRpc3BsYXlPcmRlcg==');

@$core.Deprecated('Use updateProfilePhotoDisplayOrderResponseDescriptor instead')
const UpdateProfilePhotoDisplayOrderResponse$json = {
  '1': 'UpdateProfilePhotoDisplayOrderResponse',
  '2': [
    {'1': 'profile_photos', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.RequiringReviewProfilePhoto', '10': 'profilePhotos'},
  ],
};

/// Descriptor for `UpdateProfilePhotoDisplayOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfilePhotoDisplayOrderResponseDescriptor = $convert.base64Decode(
    'CiZVcGRhdGVQcm9maWxlUGhvdG9EaXNwbGF5T3JkZXJSZXNwb25zZRJQCg5wcm9maWxlX3Bob3'
    'RvcxgBIAMoCzIpLmVjb25hLnNoYXJlZC5SZXF1aXJpbmdSZXZpZXdQcm9maWxlUGhvdG9SDXBy'
    'b2ZpbGVQaG90b3M=');

