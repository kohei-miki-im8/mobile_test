//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/withdraw_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use withdrawUserRequestDescriptor instead')
const WithdrawUserRequest$json = {
  '1': 'WithdrawUserRequest',
  '2': [
    {'1': 'reason_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.WithdrawalReasonCode', '8': {}, '10': 'reasonCode'},
    {'1': 'reason_detail', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'reasonDetail'},
    {'1': 'confirmed_subscription_stopped', '3': 3, '4': 1, '5': 8, '8': {}, '10': 'confirmedSubscriptionStopped'},
  ],
};

/// Descriptor for `WithdrawUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List withdrawUserRequestDescriptor = $convert.base64Decode(
    'ChNXaXRoZHJhd1VzZXJSZXF1ZXN0ElEKC3JlYXNvbl9jb2RlGAEgASgOMiEuZWNvbmEuZW51bX'
    'MuV2l0aGRyYXdhbFJlYXNvbkNvZGVCDbpICsgBAYIBBBABIABSCnJlYXNvbkNvZGUSLQoNcmVh'
    'c29uX2RldGFpbBgCIAEoCUIIukgFcgMY6AdSDHJlYXNvbkRldGFpbBJQCh5jb25maXJtZWRfc3'
    'Vic2NyaXB0aW9uX3N0b3BwZWQYAyABKAhCCrpIB8gBAWoCCAFSHGNvbmZpcm1lZFN1YnNjcmlw'
    'dGlvblN0b3BwZWQ=');

@$core.Deprecated('Use withdrawUserResponseDescriptor instead')
const WithdrawUserResponse$json = {
  '1': 'WithdrawUserResponse',
  '2': [
    {'1': 'withdrawn_at', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'withdrawnAt'},
    {'1': 'rejoin_available_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'rejoinAvailableAt'},
  ],
};

/// Descriptor for `WithdrawUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List withdrawUserResponseDescriptor = $convert.base64Decode(
    'ChRXaXRoZHJhd1VzZXJSZXNwb25zZRI9Cgx3aXRoZHJhd25fYXQYASABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wUgt3aXRoZHJhd25BdBJKChNyZWpvaW5fYXZhaWxhYmxlX2F0GAIg'
    'ASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIRcmVqb2luQXZhaWxhYmxlQXQ=');

