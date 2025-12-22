//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_scheduled_chat_rooms.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getScheduledChatRoomsRequestDescriptor instead')
const GetScheduledChatRoomsRequest$json = {
  '1': 'GetScheduledChatRoomsRequest',
  '2': [
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
    {'1': 'invisible_mode', '3': 16, '4': 1, '5': 8, '10': 'invisibleMode'},
  ],
};

/// Descriptor for `GetScheduledChatRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScheduledChatRoomsRequestDescriptor = $convert.base64Decode(
    'ChxHZXRTY2hlZHVsZWRDaGF0Um9vbXNSZXF1ZXN0EkAKBmN1cnNvchgPIAEoCzIgLmVjb25hLn'
    'NoYXJlZC5QYWdlclJlcXVlc3RDdXJzb3JCBrpIA8gBAVIGY3Vyc29yEiUKDmludmlzaWJsZV9t'
    'b2RlGBAgASgIUg1pbnZpc2libGVNb2Rl');

@$core.Deprecated('Use getScheduledChatRoomsResponseDescriptor instead')
const GetScheduledChatRoomsResponse$json = {
  '1': 'GetScheduledChatRoomsResponse',
  '2': [
    {'1': 'scheduled_chat_rooms', '3': 1, '4': 3, '5': 11, '6': '.econa.shared.ScheduledChatRoom', '10': 'scheduledChatRooms'},
    {'1': 'cursor', '3': 15, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetScheduledChatRoomsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getScheduledChatRoomsResponseDescriptor = $convert.base64Decode(
    'Ch1HZXRTY2hlZHVsZWRDaGF0Um9vbXNSZXNwb25zZRJRChRzY2hlZHVsZWRfY2hhdF9yb29tcx'
    'gBIAMoCzIfLmVjb25hLnNoYXJlZC5TY2hlZHVsZWRDaGF0Um9vbVISc2NoZWR1bGVkQ2hhdFJv'
    'b21zEjkKBmN1cnNvchgPIAEoCzIhLmVjb25hLnNoYXJlZC5QYWdlclJlc3BvbnNlQ3Vyc29yUg'
    'ZjdXJzb3I=');

