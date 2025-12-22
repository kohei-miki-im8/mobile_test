//
//  Generated code. Do not modify.
//  source: econa/shared/user_tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userTagDescriptor instead')
const UserTag$json = {
  '1': 'UserTag',
  '2': [
    {'1': 'tag_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'tagId'},
    {'1': 'tag_name', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'tagName'},
    {'1': 'abstraction_level', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.AbstractionLevel', '8': {}, '10': 'abstractionLevel'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `UserTag`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userTagDescriptor = $convert.base64Decode(
    'CgdVc2VyVGFnEh8KBnRhZ19pZBgBIAEoCUIIukgFcgOwAQFSBXRhZ0lkEiQKCHRhZ19uYW1lGA'
    'IgASgJQgm6SAZyBBABGGRSB3RhZ05hbWUSVgoRYWJzdHJhY3Rpb25fbGV2ZWwYAyABKA4yHS5l'
    'Y29uYS5lbnVtcy5BYnN0cmFjdGlvbkxldmVsQgq6SAeCAQQQASAAUhBhYnN0cmFjdGlvbkxldm'
    'VsEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVh'
    'dGVkQXQ=');

