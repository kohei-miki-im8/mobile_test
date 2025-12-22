//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/create_user_inquiry.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createUserInquiryRequestDescriptor instead')
const CreateUserInquiryRequest$json = {
  '1': 'CreateUserInquiryRequest',
  '2': [
    {'1': 'reported_user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'reportedUserId'},
    {'1': 'chat_room_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'chatRoomId'},
    {'1': 'inquiry_category_id', '3': 3, '4': 1, '5': 5, '10': 'inquiryCategoryId'},
    {'1': 'inquiry_details', '3': 4, '4': 1, '5': 9, '10': 'inquiryDetails'},
  ],
};

/// Descriptor for `CreateUserInquiryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserInquiryRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVVc2VySW5xdWlyeVJlcXVlc3QSMgoQcmVwb3J0ZWRfdXNlcl9pZBgBIAEoCUIIuk'
    'gFcgOwAQFSDnJlcG9ydGVkVXNlcklkEioKDGNoYXRfcm9vbV9pZBgCIAEoCUIIukgFcgOwAQFS'
    'CmNoYXRSb29tSWQSLgoTaW5xdWlyeV9jYXRlZ29yeV9pZBgDIAEoBVIRaW5xdWlyeUNhdGVnb3'
    'J5SWQSJwoPaW5xdWlyeV9kZXRhaWxzGAQgASgJUg5pbnF1aXJ5RGV0YWlscw==');

@$core.Deprecated('Use createUserInquiryResponseDescriptor instead')
const CreateUserInquiryResponse$json = {
  '1': 'CreateUserInquiryResponse',
  '2': [
    {'1': 'user_inquiry_id', '3': 1, '4': 1, '5': 9, '10': 'userInquiryId'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `CreateUserInquiryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserInquiryResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVVc2VySW5xdWlyeVJlc3BvbnNlEiYKD3VzZXJfaW5xdWlyeV9pZBgBIAEoCVINdX'
    'NlcklucXVpcnlJZBI5CgpjcmVhdGVkX2F0GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVz'
    'dGFtcFIJY3JlYXRlZEF0');

