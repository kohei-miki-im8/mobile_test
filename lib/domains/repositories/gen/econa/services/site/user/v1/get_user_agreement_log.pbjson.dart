//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_agreement_log.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserAgreementLogRequestDescriptor instead')
const GetUserAgreementLogRequest$json = {
  '1': 'GetUserAgreementLogRequest',
  '2': [
    {'1': 'agreement_type', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.UserAgreementType', '8': {}, '10': 'agreementType'},
  ],
};

/// Descriptor for `GetUserAgreementLogRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserAgreementLogRequestDescriptor = $convert.base64Decode(
    'ChpHZXRVc2VyQWdyZWVtZW50TG9nUmVxdWVzdBJRCg5hZ3JlZW1lbnRfdHlwZRgBIAEoDjIeLm'
    'Vjb25hLmVudW1zLlVzZXJBZ3JlZW1lbnRUeXBlQgq6SAeCAQQQASAAUg1hZ3JlZW1lbnRUeXBl');

@$core.Deprecated('Use getUserAgreementLogResponseDescriptor instead')
const GetUserAgreementLogResponse$json = {
  '1': 'GetUserAgreementLogResponse',
  '2': [
    {'1': 'has_agreed', '3': 1, '4': 1, '5': 8, '10': 'hasAgreed'},
  ],
};

/// Descriptor for `GetUserAgreementLogResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserAgreementLogResponseDescriptor = $convert.base64Decode(
    'ChtHZXRVc2VyQWdyZWVtZW50TG9nUmVzcG9uc2USHQoKaGFzX2FncmVlZBgBIAEoCFIJaGFzQW'
    'dyZWVk');

