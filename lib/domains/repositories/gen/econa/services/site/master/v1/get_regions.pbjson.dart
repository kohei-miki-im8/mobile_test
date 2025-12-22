//
//  Generated code. Do not modify.
//  source: econa/services/site/master/v1/get_regions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getRegionsRequestDescriptor instead')
const GetRegionsRequest$json = {
  '1': 'GetRegionsRequest',
  '2': [
    {'1': 'language_code', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.LanguageCode', '8': {}, '10': 'languageCode'},
  ],
};

/// Descriptor for `GetRegionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRegionsRequestDescriptor = $convert.base64Decode(
    'ChFHZXRSZWdpb25zUmVxdWVzdBJPCg1sYW5ndWFnZV9jb2RlGAEgASgOMhkuZWNvbmEuZW51bX'
    'MuTGFuZ3VhZ2VDb2RlQg+6SAzIAQGCAQYQARgBIABSDGxhbmd1YWdlQ29kZQ==');

@$core.Deprecated('Use getRegionsResponseDescriptor instead')
const GetRegionsResponse$json = {
  '1': 'GetRegionsResponse',
  '2': [
    {'1': 'regions', '3': 1, '4': 3, '5': 11, '6': '.econa.master.Region', '10': 'regions'},
  ],
};

/// Descriptor for `GetRegionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRegionsResponseDescriptor = $convert.base64Decode(
    'ChJHZXRSZWdpb25zUmVzcG9uc2USLgoHcmVnaW9ucxgBIAMoCzIULmVjb25hLm1hc3Rlci5SZW'
    'dpb25SB3JlZ2lvbnM=');

