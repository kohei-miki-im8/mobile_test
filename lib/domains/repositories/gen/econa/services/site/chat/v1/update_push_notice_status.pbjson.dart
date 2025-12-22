//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/update_push_notice_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use updatePushNoticeStatusRequestDescriptor instead')
const UpdatePushNoticeStatusRequest$json = {
  '1': 'UpdatePushNoticeStatusRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'enable_push_notice', '3': 2, '4': 1, '5': 8, '10': 'enablePushNotice'},
  ],
};

/// Descriptor for `UpdatePushNoticeStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePushNoticeStatusRequestDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVQdXNoTm90aWNlU3RhdHVzUmVxdWVzdBIqCgxjaGF0X3Jvb21faWQYASABKAlCCL'
    'pIBXIDsAEBUgpjaGF0Um9vbUlkEiwKEmVuYWJsZV9wdXNoX25vdGljZRgCIAEoCFIQZW5hYmxl'
    'UHVzaE5vdGljZQ==');

@$core.Deprecated('Use updatePushNoticeStatusResponseDescriptor instead')
const UpdatePushNoticeStatusResponse$json = {
  '1': 'UpdatePushNoticeStatusResponse',
};

/// Descriptor for `UpdatePushNoticeStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePushNoticeStatusResponseDescriptor = $convert.base64Decode(
    'Ch5VcGRhdGVQdXNoTm90aWNlU3RhdHVzUmVzcG9uc2U=');

