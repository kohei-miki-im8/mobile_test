//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/purchase_force_read_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use purchaseForceReadStatusRequestDescriptor instead')
const PurchaseForceReadStatusRequest$json = {
  '1': 'PurchaseForceReadStatusRequest',
  '2': [
    {'1': 'chat_room_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
  ],
};

/// Descriptor for `PurchaseForceReadStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchaseForceReadStatusRequestDescriptor = $convert.base64Decode(
    'Ch5QdXJjaGFzZUZvcmNlUmVhZFN0YXR1c1JlcXVlc3QSKgoMY2hhdF9yb29tX2lkGAEgASgJQg'
    'i6SAVyA7ABAVIKY2hhdFJvb21JZA==');

@$core.Deprecated('Use purchaseForceReadStatusResponseDescriptor instead')
const PurchaseForceReadStatusResponse$json = {
  '1': 'PurchaseForceReadStatusResponse',
  '2': [
    {'1': 'after_point_balance', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.PointBalance', '10': 'afterPointBalance'},
  ],
};

/// Descriptor for `PurchaseForceReadStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchaseForceReadStatusResponseDescriptor = $convert.base64Decode(
    'Ch9QdXJjaGFzZUZvcmNlUmVhZFN0YXR1c1Jlc3BvbnNlEkoKE2FmdGVyX3BvaW50X2JhbGFuY2'
    'UYASABKAsyGi5lY29uYS5zaGFyZWQuUG9pbnRCYWxhbmNlUhFhZnRlclBvaW50QmFsYW5jZQ==');

