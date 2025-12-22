//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/set_avatar_crop_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use setAvatarCropSettingsRequestDescriptor instead')
const SetAvatarCropSettingsRequest$json = {
  '1': 'SetAvatarCropSettingsRequest',
  '2': [
    {'1': 'profile_photo_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'profilePhotoId'},
    {'1': 'crop_settings', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.PhotoCropSettings', '8': {}, '10': 'cropSettings'},
  ],
};

/// Descriptor for `SetAvatarCropSettingsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAvatarCropSettingsRequestDescriptor = $convert.base64Decode(
    'ChxTZXRBdmF0YXJDcm9wU2V0dGluZ3NSZXF1ZXN0EjAKEHByb2ZpbGVfcGhvdG9faWQYASABKA'
    'lCBrpIA8gBAVIOcHJvZmlsZVBob3RvSWQSTAoNY3JvcF9zZXR0aW5ncxgCIAEoCzIfLmVjb25h'
    'LnNoYXJlZC5QaG90b0Nyb3BTZXR0aW5nc0IGukgDyAEBUgxjcm9wU2V0dGluZ3M=');

@$core.Deprecated('Use setAvatarCropSettingsResponseDescriptor instead')
const SetAvatarCropSettingsResponse$json = {
  '1': 'SetAvatarCropSettingsResponse',
};

/// Descriptor for `SetAvatarCropSettingsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAvatarCropSettingsResponseDescriptor = $convert.base64Decode(
    'Ch1TZXRBdmF0YXJDcm9wU2V0dGluZ3NSZXNwb25zZQ==');

