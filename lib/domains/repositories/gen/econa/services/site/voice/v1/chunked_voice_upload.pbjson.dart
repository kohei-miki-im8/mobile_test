//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/chunked_voice_upload.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chunkedVoiceUploadRequestDescriptor instead')
const ChunkedVoiceUploadRequest$json = {
  '1': 'ChunkedVoiceUploadRequest',
  '2': [
    {'1': 'voice_type', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.VoiceType', '8': {}, '10': 'voiceType'},
    {'1': 'chunked_voice_data', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.ChunkedData', '10': 'chunkedVoiceData'},
  ],
};

/// Descriptor for `ChunkedVoiceUploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkedVoiceUploadRequestDescriptor = $convert.base64Decode(
    'ChlDaHVua2VkVm9pY2VVcGxvYWRSZXF1ZXN0EkEKCnZvaWNlX3R5cGUYASABKA4yFi5lY29uYS'
    '5lbnVtcy5Wb2ljZVR5cGVCCrpIB4IBBBABIABSCXZvaWNlVHlwZRJHChJjaHVua2VkX3ZvaWNl'
    'X2RhdGEYAiABKAsyGS5lY29uYS5zaGFyZWQuQ2h1bmtlZERhdGFSEGNodW5rZWRWb2ljZURhdG'
    'E=');

@$core.Deprecated('Use chunkedVoiceUploadResponseDescriptor instead')
const ChunkedVoiceUploadResponse$json = {
  '1': 'ChunkedVoiceUploadResponse',
  '2': [
    {'1': 'voice', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.Voice', '10': 'voice'},
  ],
};

/// Descriptor for `ChunkedVoiceUploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkedVoiceUploadResponseDescriptor = $convert.base64Decode(
    'ChpDaHVua2VkVm9pY2VVcGxvYWRSZXNwb25zZRIpCgV2b2ljZRgBIAEoCzITLmVjb25hLnNoYX'
    'JlZC5Wb2ljZVIFdm9pY2U=');

