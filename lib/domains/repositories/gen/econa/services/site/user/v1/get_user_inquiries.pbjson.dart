//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_inquiries.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use inquiryTypeDescriptor instead')
const InquiryType$json = {
  '1': 'InquiryType',
  '2': [
    {'1': 'INQUIRY_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'INQUIRY_TYPE_REPORTED_BY_ME', '2': 1},
    {'1': 'INQUIRY_TYPE_REPORTED_ABOUT_ME', '2': 2},
    {'1': 'INQUIRY_TYPE_DISCIPLINARY_ACTIONS', '2': 3},
  ],
};

/// Descriptor for `InquiryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List inquiryTypeDescriptor = $convert.base64Decode(
    'CgtJbnF1aXJ5VHlwZRIcChhJTlFVSVJZX1RZUEVfVU5TUEVDSUZJRUQQABIfChtJTlFVSVJZX1'
    'RZUEVfUkVQT1JURURfQllfTUUQARIiCh5JTlFVSVJZX1RZUEVfUkVQT1JURURfQUJPVVRfTUUQ'
    'AhIlCiFJTlFVSVJZX1RZUEVfRElTQ0lQTElOQVJZX0FDVElPTlMQAw==');

@$core.Deprecated('Use getUserInquiriesRequestDescriptor instead')
const GetUserInquiriesRequest$json = {
  '1': 'GetUserInquiriesRequest',
  '2': [
    {'1': 'inquiry_type', '3': 1, '4': 1, '5': 14, '6': '.econa.services.site.user.v1.InquiryType', '8': {}, '10': 'inquiryType'},
    {'1': 'cursor', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.PagerRequestCursor', '8': {}, '10': 'cursor'},
  ],
};

/// Descriptor for `GetUserInquiriesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInquiriesRequestDescriptor = $convert.base64Decode(
    'ChdHZXRVc2VySW5xdWlyaWVzUmVxdWVzdBJTCgxpbnF1aXJ5X3R5cGUYASABKA4yKC5lY29uYS'
    '5zZXJ2aWNlcy5zaXRlLnVzZXIudjEuSW5xdWlyeVR5cGVCBrpIA8gBAVILaW5xdWlyeVR5cGUS'
    'QAoGY3Vyc29yGAIgASgLMiAuZWNvbmEuc2hhcmVkLlBhZ2VyUmVxdWVzdEN1cnNvckIGukgDyA'
    'EBUgZjdXJzb3I=');

@$core.Deprecated('Use getUserInquiriesResponseDescriptor instead')
const GetUserInquiriesResponse$json = {
  '1': 'GetUserInquiriesResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.econa.services.site.user.v1.UserInquiryItem', '10': 'items'},
    {'1': 'cursor', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.PagerResponseCursor', '10': 'cursor'},
  ],
};

/// Descriptor for `GetUserInquiriesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInquiriesResponseDescriptor = $convert.base64Decode(
    'ChhHZXRVc2VySW5xdWlyaWVzUmVzcG9uc2USQgoFaXRlbXMYASADKAsyLC5lY29uYS5zZXJ2aW'
    'Nlcy5zaXRlLnVzZXIudjEuVXNlcklucXVpcnlJdGVtUgVpdGVtcxI5CgZjdXJzb3IYAiABKAsy'
    'IS5lY29uYS5zaGFyZWQuUGFnZXJSZXNwb25zZUN1cnNvclIGY3Vyc29y');

@$core.Deprecated('Use userInquiryItemDescriptor instead')
const UserInquiryItem$json = {
  '1': 'UserInquiryItem',
  '2': [
    {'1': 'inquiry', '3': 1, '4': 1, '5': 11, '6': '.econa.services.site.user.v1.UserInquiry', '9': 0, '10': 'inquiry'},
    {'1': 'disciplinary_action', '3': 2, '4': 1, '5': 11, '6': '.econa.services.site.user.v1.DisciplinaryAction', '9': 0, '10': 'disciplinaryAction'},
  ],
  '8': [
    {'1': 'item'},
  ],
};

/// Descriptor for `UserInquiryItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInquiryItemDescriptor = $convert.base64Decode(
    'Cg9Vc2VySW5xdWlyeUl0ZW0SRAoHaW5xdWlyeRgBIAEoCzIoLmVjb25hLnNlcnZpY2VzLnNpdG'
    'UudXNlci52MS5Vc2VySW5xdWlyeUgAUgdpbnF1aXJ5EmIKE2Rpc2NpcGxpbmFyeV9hY3Rpb24Y'
    'AiABKAsyLy5lY29uYS5zZXJ2aWNlcy5zaXRlLnVzZXIudjEuRGlzY2lwbGluYXJ5QWN0aW9uSA'
    'BSEmRpc2NpcGxpbmFyeUFjdGlvbkIGCgRpdGVt');

@$core.Deprecated('Use userInquiryDescriptor instead')
const UserInquiry$json = {
  '1': 'UserInquiry',
  '2': [
    {'1': 'user_inquiry_id', '3': 1, '4': 1, '5': 9, '10': 'userInquiryId'},
    {'1': 'reporter_user_id', '3': 2, '4': 1, '5': 9, '10': 'reporterUserId'},
    {'1': 'reported_user_id', '3': 3, '4': 1, '5': 9, '10': 'reportedUserId'},
    {'1': 'chat_room_id', '3': 4, '4': 1, '5': 9, '10': 'chatRoomId'},
    {'1': 'category_name', '3': 5, '4': 1, '5': 9, '10': 'categoryName'},
    {'1': 'inquiry_details', '3': 6, '4': 1, '5': 9, '10': 'inquiryDetails'},
    {'1': 'inquiry_status', '3': 7, '4': 1, '5': 14, '6': '.econa.enums.InquiryStatus', '10': 'inquiryStatus'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'is_reporter', '3': 9, '4': 1, '5': 8, '10': 'isReporter'},
  ],
};

/// Descriptor for `UserInquiry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInquiryDescriptor = $convert.base64Decode(
    'CgtVc2VySW5xdWlyeRImCg91c2VyX2lucXVpcnlfaWQYASABKAlSDXVzZXJJbnF1aXJ5SWQSKA'
    'oQcmVwb3J0ZXJfdXNlcl9pZBgCIAEoCVIOcmVwb3J0ZXJVc2VySWQSKAoQcmVwb3J0ZWRfdXNl'
    'cl9pZBgDIAEoCVIOcmVwb3J0ZWRVc2VySWQSIAoMY2hhdF9yb29tX2lkGAQgASgJUgpjaGF0Um'
    '9vbUlkEiMKDWNhdGVnb3J5X25hbWUYBSABKAlSDGNhdGVnb3J5TmFtZRInCg9pbnF1aXJ5X2Rl'
    'dGFpbHMYBiABKAlSDmlucXVpcnlEZXRhaWxzEkEKDmlucXVpcnlfc3RhdHVzGAcgASgOMhouZW'
    'NvbmEuZW51bXMuSW5xdWlyeVN0YXR1c1INaW5xdWlyeVN0YXR1cxI5CgpjcmVhdGVkX2F0GAgg'
    'ASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0Eh8KC2lzX3JlcG9ydG'
    'VyGAkgASgIUgppc1JlcG9ydGVy');

@$core.Deprecated('Use disciplinaryActionDescriptor instead')
const DisciplinaryAction$json = {
  '1': 'DisciplinaryAction',
  '2': [
    {'1': 'user_disciplinary_log_id', '3': 1, '4': 1, '5': 9, '10': 'userDisciplinaryLogId'},
    {'1': 'disciplinary_type', '3': 2, '4': 1, '5': 14, '6': '.econa.enums.DisciplinaryType', '10': 'disciplinaryType'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'body', '3': 4, '4': 1, '5': 9, '10': 'body'},
    {'1': 'sent_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
    {'1': 'is_agreed', '3': 6, '4': 1, '5': 8, '10': 'isAgreed'},
    {'1': 'agreed_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'agreedAt'},
  ],
};

/// Descriptor for `DisciplinaryAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disciplinaryActionDescriptor = $convert.base64Decode(
    'ChJEaXNjaXBsaW5hcnlBY3Rpb24SNwoYdXNlcl9kaXNjaXBsaW5hcnlfbG9nX2lkGAEgASgJUh'
    'V1c2VyRGlzY2lwbGluYXJ5TG9nSWQSSgoRZGlzY2lwbGluYXJ5X3R5cGUYAiABKA4yHS5lY29u'
    'YS5lbnVtcy5EaXNjaXBsaW5hcnlUeXBlUhBkaXNjaXBsaW5hcnlUeXBlEhQKBXRpdGxlGAMgAS'
    'gJUgV0aXRsZRISCgRib2R5GAQgASgJUgRib2R5EjMKB3NlbnRfYXQYBSABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgZzZW50QXQSGwoJaXNfYWdyZWVkGAYgASgIUghpc0FncmVlZB'
    'I3CglhZ3JlZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghhZ3JlZWRB'
    'dA==');

