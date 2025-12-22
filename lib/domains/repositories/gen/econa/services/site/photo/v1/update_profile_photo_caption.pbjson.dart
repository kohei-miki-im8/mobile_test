//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/update_profile_photo_caption.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateProfilePhotoCaptionRequestDescriptor instead')
const UpdateProfilePhotoCaptionRequest$json = {
  '1': 'UpdateProfilePhotoCaptionRequest',
  '2': [
    {'1': 'user_profile_photo_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userProfilePhotoId'},
    {'1': 'caption', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'caption'},
  ],
};

/// Descriptor for `UpdateProfilePhotoCaptionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfilePhotoCaptionRequestDescriptor = $convert.base64Decode(
    'CiBVcGRhdGVQcm9maWxlUGhvdG9DYXB0aW9uUmVxdWVzdBI7ChV1c2VyX3Byb2ZpbGVfcGhvdG'
    '9faWQYASABKAlCCLpIBXIDsAEBUhJ1c2VyUHJvZmlsZVBob3RvSWQSIgoHY2FwdGlvbhgCIAEo'
    'CUIIukgFcgMYyAFSB2NhcHRpb24=');

@$core.Deprecated('Use updateProfilePhotoCaptionResponseDescriptor instead')
const UpdateProfilePhotoCaptionResponse$json = {
  '1': 'UpdateProfilePhotoCaptionResponse',
  '2': [
    {'1': 'profile_photo', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.ProfilePhoto', '10': 'profilePhoto'},
  ],
};

/// Descriptor for `UpdateProfilePhotoCaptionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfilePhotoCaptionResponseDescriptor = $convert.base64Decode(
    'CiFVcGRhdGVQcm9maWxlUGhvdG9DYXB0aW9uUmVzcG9uc2USPwoNcHJvZmlsZV9waG90bxgBIA'
    'EoCzIaLmVjb25hLnNoYXJlZC5Qcm9maWxlUGhvdG9SDHByb2ZpbGVQaG90bw==');

