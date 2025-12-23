//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/create_like.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createLikeRequestDescriptor instead')
const CreateLikeRequest$json = {
  '1': 'CreateLikeRequest',
  '2': [
    {'1': 'to_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'toUserId'},
    {'1': 'super_like_message', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'superLikeMessage'},
  ],
};

/// Descriptor for `CreateLikeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLikeRequestDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVMaWtlUmVxdWVzdBImCgp0b191c2VyX2lkGAEgASgJQgi6SAVyA7ABAVIIdG9Vc2'
    'VySWQSNgoSc3VwZXJfbGlrZV9tZXNzYWdlGAIgASgJQgi6SAVyAxjIAVIQc3VwZXJMaWtlTWVz'
    'c2FnZQ==');

@$core.Deprecated('Use createLikeResponseDescriptor instead')
const CreateLikeResponse$json = {
  '1': 'CreateLikeResponse',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '10': 'chatRoomId'},
    {'1': 'user_like_id', '3': 2, '4': 1, '5': 9, '10': 'userLikeId'},
    {'1': 'to_user_like_id', '3': 3, '4': 1, '5': 9, '10': 'toUserLikeId'},
  ],
};

/// Descriptor for `CreateLikeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLikeResponseDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVMaWtlUmVzcG9uc2USIAoMY2hhdF9yb29tX2lkGAEgASgJUgpjaGF0Um9vbUlkEi'
    'AKDHVzZXJfbGlrZV9pZBgCIAEoCVIKdXNlckxpa2VJZBIlCg90b191c2VyX2xpa2VfaWQYAyAB'
    'KAlSDHRvVXNlckxpa2VJZA==');

