//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_visible_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updateVisibleStatusRequestDescriptor instead')
const UpdateVisibleStatusRequest$json = {
  '1': 'UpdateVisibleStatusRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'is_visible', '3': 2, '4': 1, '5': 8, '10': 'isVisible'},
  ],
};

/// Descriptor for `UpdateVisibleStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateVisibleStatusRequestDescriptor = $convert.base64Decode(
    'ChpVcGRhdGVWaXNpYmxlU3RhdHVzUmVxdWVzdBIqCgxjaGF0X3Jvb21faWQYASABKAlCCLpIBX'
    'IDsAEBUgpjaGF0Um9vbUlkEh0KCmlzX3Zpc2libGUYAiABKAhSCWlzVmlzaWJsZQ==');

@$core.Deprecated('Use updateVisibleStatusResponseDescriptor instead')
const UpdateVisibleStatusResponse$json = {
  '1': 'UpdateVisibleStatusResponse',
};

/// Descriptor for `UpdateVisibleStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateVisibleStatusResponseDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVWaXNpYmxlU3RhdHVzUmVzcG9uc2U=');

