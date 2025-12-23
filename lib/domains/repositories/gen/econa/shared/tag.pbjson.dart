//
//  Generated code. Do not modify.
//  source: econa/shared/tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tagDescriptor instead')
const Tag$json = {
  '1': 'Tag',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'tagId'},
    {'1': 'tag_name', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'tagName'},
    {'1': 'tag_image_signed_url', '3': 3, '4': 1, '5': 9, '10': 'tagImageSignedUrl'},
    {'1': 'abstraction_level', '3': 4, '4': 1, '5': 14, '6': '.econa.enums.AbstractionLevel', '8': {}, '10': 'abstractionLevel'},
    {'1': 'sort_order', '3': 5, '4': 1, '5': 5, '10': 'sortOrder'},
    {'1': 'description', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'description'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Tag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tagDescriptor = $convert.base64Decode(
    'CgNUYWcSHwoGdGFnX2lkGAEgASgJQgi6SAVyA7ABAVIFdGFnSWQSJAoIdGFnX25hbWUYAiABKA'
    'lCCbpIBnIEEAEYZFIHdGFnTmFtZRIvChR0YWdfaW1hZ2Vfc2lnbmVkX3VybBgDIAEoCVIRdGFn'
    'SW1hZ2VTaWduZWRVcmwSVgoRYWJzdHJhY3Rpb25fbGV2ZWwYBCABKA4yHS5lY29uYS5lbnVtcy'
    '5BYnN0cmFjdGlvbkxldmVsQgq6SAeCAQQQASAAUhBhYnN0cmFjdGlvbkxldmVsEh0KCnNvcnRf'
    'b3JkZXIYBSABKAVSCXNvcnRPcmRlchIqCgtkZXNjcmlwdGlvbhgGIAEoCUIIukgFcgMYyAFSC2'
    'Rlc2NyaXB0aW9uEjkKCmNyZWF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUgljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW'
    '1lc3RhbXBSCXVwZGF0ZWRBdA==');

