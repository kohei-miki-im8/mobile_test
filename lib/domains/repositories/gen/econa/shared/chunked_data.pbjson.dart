//
//  Generated code. Do not modify.
//  source: econa/shared/chunked_data.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chunkedDataDescriptor instead')
const ChunkedData$json = {
  '1': 'ChunkedData',
  '2': [
    {'1': 'upload_manage_key', '3': 1, '4': 1, '5': 9, '10': 'uploadManageKey'},
    {'1': 'chunk_number', '3': 2, '4': 1, '5': 5, '10': 'chunkNumber'},
    {'1': 'is_last_chunk', '3': 3, '4': 1, '5': 8, '10': 'isLastChunk'},
    {'1': 'chunk_data', '3': 4, '4': 1, '5': 12, '10': 'chunkData'},
    {'1': 'file_name', '3': 5, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content_type', '3': 6, '4': 1, '5': 9, '10': 'contentType'},
    {'1': 'metadata', '3': 7, '4': 3, '5': 11, '6': '.econa.shared.ChunkedData.MetadataEntry', '10': 'metadata'},
  ],
  '3': [ChunkedData_MetadataEntry$json],
};

@$core.Deprecated('Use chunkedDataDescriptor instead')
const ChunkedData_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ChunkedData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkedDataDescriptor = $convert.base64Decode(
    'CgtDaHVua2VkRGF0YRIqChF1cGxvYWRfbWFuYWdlX2tleRgBIAEoCVIPdXBsb2FkTWFuYWdlS2'
    'V5EiEKDGNodW5rX251bWJlchgCIAEoBVILY2h1bmtOdW1iZXISIgoNaXNfbGFzdF9jaHVuaxgD'
    'IAEoCFILaXNMYXN0Q2h1bmsSHQoKY2h1bmtfZGF0YRgEIAEoDFIJY2h1bmtEYXRhEhsKCWZpbG'
    'VfbmFtZRgFIAEoCVIIZmlsZU5hbWUSIQoMY29udGVudF90eXBlGAYgASgJUgtjb250ZW50VHlw'
    'ZRJDCghtZXRhZGF0YRgHIAMoCzInLmVjb25hLnNoYXJlZC5DaHVua2VkRGF0YS5NZXRhZGF0YU'
    'VudHJ5UghtZXRhZGF0YRo7Cg1NZXRhZGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZh'
    'bHVlGAIgASgJUgV2YWx1ZToCOAE=');

