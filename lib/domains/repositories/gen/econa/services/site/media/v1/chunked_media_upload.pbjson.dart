//
//  Generated code. Do not modify.
//  source: econa/services/site/media/v1/chunked_media_upload.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chunkedMediaUploadRequestDescriptor instead')
const ChunkedMediaUploadRequest$json = {
  '1': 'ChunkedMediaUploadRequest',
  '2': [
    {'1': 'media_category', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.MediaCategory', '8': {}, '10': 'mediaCategory'},
    {'1': 'chunked_data', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.ChunkedData', '8': {}, '10': 'chunkedData'},
    {'1': 'photo_crop_settings', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.PhotoCropSettings', '10': 'photoCropSettings'},
    {'1': 'profile_photo_priority', '3': 4, '4': 1, '5': 5, '8': {}, '9': 0, '10': 'profilePhotoPriority'},
    {'1': 'report_id', '3': 6, '4': 1, '5': 9, '8': {}, '9': 0, '10': 'reportId'},
    {'1': 'chat_room_id', '3': 7, '4': 1, '5': 9, '8': {}, '9': 0, '10': 'chatRoomId'},
  ],
  '8': [
    {'1': 'related_info'},
  ],
};

/// Descriptor for `ChunkedMediaUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkedMediaUploadRequestDescriptor = $convert.base64Decode(
    'ChlDaHVua2VkTWVkaWFVcGxvYWRSZXF1ZXN0ElAKDm1lZGlhX2NhdGVnb3J5GAEgASgOMhouZW'
    'NvbmEuZW51bXMuTWVkaWFDYXRlZ29yeUINukgKyAEBggEEEAEgAFINbWVkaWFDYXRlZ29yeRJE'
    'CgxjaHVua2VkX2RhdGEYAiABKAsyGS5lY29uYS5zaGFyZWQuQ2h1bmtlZERhdGFCBrpIA8gBAV'
    'ILY2h1bmtlZERhdGESTwoTcGhvdG9fY3JvcF9zZXR0aW5ncxgDIAEoCzIfLmVjb25hLnNoYXJl'
    'ZC5QaG90b0Nyb3BTZXR0aW5nc1IRcGhvdG9Dcm9wU2V0dGluZ3MSQQoWcHJvZmlsZV9waG90b1'
    '9wcmlvcml0eRgEIAEoBUIJukgGGgQYCSgBSABSFHByb2ZpbGVQaG90b1ByaW9yaXR5EicKCXJl'
    'cG9ydF9pZBgGIAEoCUIIukgFcgOwAQFIAFIIcmVwb3J0SWQSLAoMY2hhdF9yb29tX2lkGAcgAS'
    'gJQgi6SAVyA7ABAUgAUgpjaGF0Um9vbUlkQg4KDHJlbGF0ZWRfaW5mbw==');

@$core.Deprecated('Use chunkedMediaUploadResponseDescriptor instead')
const ChunkedMediaUploadResponse$json = {
  '1': 'ChunkedMediaUploadResponse',
  '2': [
    {'1': 'signed_image_urls', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.SignedImageUrls', '9': 0, '10': 'signedImageUrls'},
    {'1': 'signed_voice_urls', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.SignedVoiceUrls', '9': 0, '10': 'signedVoiceUrls'},
    {'1': 'chat_message_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'chatMessageId'},
  ],
  '8': [
    {'1': 'signed_urls', '2': {}},
  ],
};

/// Descriptor for `ChunkedMediaUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkedMediaUploadResponseDescriptor = $convert.base64Decode(
    'ChpDaHVua2VkTWVkaWFVcGxvYWRSZXNwb25zZRJLChFzaWduZWRfaW1hZ2VfdXJscxgBIAEoCz'
    'IdLmVjb25hLnNoYXJlZC5TaWduZWRJbWFnZVVybHNIAFIPc2lnbmVkSW1hZ2VVcmxzEksKEXNp'
    'Z25lZF92b2ljZV91cmxzGAIgASgLMh0uZWNvbmEuc2hhcmVkLlNpZ25lZFZvaWNlVXJsc0gAUg'
    '9zaWduZWRWb2ljZVVybHMSMAoPY2hhdF9tZXNzYWdlX2lkGAMgASgJQgi6SAVyA7ABAVINY2hh'
    'dE1lc3NhZ2VJZEIUCgtzaWduZWRfdXJscxIFukgCCAE=');

