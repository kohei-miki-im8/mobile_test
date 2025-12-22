//
//  Generated code. Do not modify.
//  source: econa/shared/signed_url.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use signedImageUrlsDescriptor instead')
const SignedImageUrls$json = {
  '1': 'SignedImageUrls',
  '2': [
    {'1': 'origin_url', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'originUrl'},
    {'1': 'non_resized_webp_url', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'nonResizedWebpUrl'},
    {'1': 'large_thumbnail_webp_url', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'largeThumbnailWebpUrl'},
    {'1': 'medium_thumbnail_webp_url', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'mediumThumbnailWebpUrl'},
    {'1': 'small_thumbnail_webp_url', '3': 5, '4': 1, '5': 9, '8': {}, '10': 'smallThumbnailWebpUrl'},
    {'1': 'avatar_icon_webp_url', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'avatarIconWebpUrl'},
  ],
};

/// Descriptor for `SignedImageUrls`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedImageUrlsDescriptor = $convert.base64Decode(
    'Cg9TaWduZWRJbWFnZVVybHMSKgoKb3JpZ2luX3VybBgBIAEoCUILukgIyAEBcgOIAQFSCW9yaW'
    'dpblVybBI5ChRub25fcmVzaXplZF93ZWJwX3VybBgCIAEoCUIIukgFcgOIAQFSEW5vblJlc2l6'
    'ZWRXZWJwVXJsEkEKGGxhcmdlX3RodW1ibmFpbF93ZWJwX3VybBgDIAEoCUIIukgFcgOIAQFSFW'
    'xhcmdlVGh1bWJuYWlsV2VicFVybBJDChltZWRpdW1fdGh1bWJuYWlsX3dlYnBfdXJsGAQgASgJ'
    'Qgi6SAVyA4gBAVIWbWVkaXVtVGh1bWJuYWlsV2VicFVybBJBChhzbWFsbF90aHVtYm5haWxfd2'
    'VicF91cmwYBSABKAlCCLpIBXIDiAEBUhVzbWFsbFRodW1ibmFpbFdlYnBVcmwSOQoUYXZhdGFy'
    'X2ljb25fd2VicF91cmwYBiABKAlCCLpIBXIDiAEBUhFhdmF0YXJJY29uV2VicFVybA==');

@$core.Deprecated('Use signedVoiceUrlsDescriptor instead')
const SignedVoiceUrls$json = {
  '1': 'SignedVoiceUrls',
  '2': [
    {'1': 'origin_url', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'originUrl'},
  ],
};

/// Descriptor for `SignedVoiceUrls`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedVoiceUrlsDescriptor = $convert.base64Decode(
    'Cg9TaWduZWRWb2ljZVVybHMSKgoKb3JpZ2luX3VybBgBIAEoCUILukgIyAEBcgOIAQFSCW9yaW'
    'dpblVybA==');

