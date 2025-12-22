//
//  Generated code. Do not modify.
//  source: econa/shared/voice_data_origin.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use voiceDataOriginDescriptor instead')
const VoiceDataOrigin$json = {
  '1': 'VoiceDataOrigin',
  '2': [
    {'1': 'voice_data_origin_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'voiceDataOriginId'},
    {'1': 'voice_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.VoiceType', '8': {}, '10': 'voiceType'},
    {'1': 'file_name', '3': 3, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 4, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'file_size', '3': 5, '4': 1, '5': 5, '10': 'fileSize'},
    {'1': 'metadata', '3': 6, '4': 3, '5': 11, '6': '.econa.shared.VoiceDataOrigin.MetadataEntry', '10': 'metadata'},
  ],
  '3': [VoiceDataOrigin_MetadataEntry$json],
};

@$core.Deprecated('Use voiceDataOriginDescriptor instead')
const VoiceDataOrigin_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `VoiceDataOrigin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceDataOriginDescriptor = $convert.base64Decode(
    'Cg9Wb2ljZURhdGFPcmlnaW4SOQoUdm9pY2VfZGF0YV9vcmlnaW5faWQYASABKAlCCLpIBXIDsA'
    'EBUhF2b2ljZURhdGFPcmlnaW5JZBJBCgp2b2ljZV90eXBlGAIgASgOMhYuZWNvbmEuZW51bXMu'
    'Vm9pY2VUeXBlQgq6SAeCAQQQASAAUgl2b2ljZVR5cGUSGwoJZmlsZV9uYW1lGAMgASgJUghmaW'
    'xlTmFtZRIhCgxjb250ZW50X3R5cGUYBCABKAlSC2NvbnRlbnRUeXBlEhsKCWZpbGVfc2l6ZRgF'
    'IAEoBVIIZmlsZVNpemUSRwoIbWV0YWRhdGEYBiADKAsyKy5lY29uYS5zaGFyZWQuVm9pY2VEYX'
    'RhT3JpZ2luLk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhGjsKDU1ldGFkYXRhRW50cnkSEAoDa2V5'
    'GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

