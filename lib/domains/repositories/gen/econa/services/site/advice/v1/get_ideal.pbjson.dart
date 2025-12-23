//
//  Generated code. Do not modify.
//  source: econa/services/site/advice/v1/get_ideal.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getIdealRequestDescriptor instead')
const GetIdealRequest$json = {
  '1': 'GetIdealRequest',
};

/// Descriptor for `GetIdealRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIdealRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRJZGVhbFJlcXVlc3Q=');

@$core.Deprecated('Use getIdealResponseDescriptor instead')
const GetIdealResponse$json = {
  '1': 'GetIdealResponse',
  '2': [
    {'1': 'advice_message', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'adviceMessage'},
    {'1': 'user_simplified_personality', '3': 2, '4': 1, '5': 11, '6': '.econa.services.site.advice.v1.GetIdealResponse.UserSimplifiedPersonality', '10': 'userSimplifiedPersonality'},
    {'1': 'to_user_simplified_personality', '3': 3, '4': 1, '5': 11, '6': '.econa.services.site.advice.v1.GetIdealResponse.UserSimplifiedPersonality', '10': 'toUserSimplifiedPersonality'},
    {'1': 'same_gender_same_generation_ideal_personality', '3': 4, '4': 1, '5': 11, '6': '.econa.services.site.advice.v1.GetIdealResponse.UserSimplifiedPersonality', '10': 'sameGenderSameGenerationIdealPersonality'},
  ],
  '3': [GetIdealResponse_UserSimplifiedPersonality$json],
};

@$core.Deprecated('Use getIdealResponseDescriptor instead')
const GetIdealResponse_UserSimplifiedPersonality$json = {
  '1': 'UserSimplifiedPersonality',
  '2': [
    {'1': 'median_age', '3': 1, '4': 1, '5': 5, '10': 'medianAge'},
    {'1': 'median_height', '3': 2, '4': 1, '5': 5, '10': 'medianHeight'},
    {'1': 'body_type', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.BodyTypeCode', '10': 'bodyType'},
    {'1': 'salary_range', '3': 4, '4': 1, '5': 14, '6': '.econa.enums.SalaryRangeCode', '10': 'salaryRange'},
  ],
};

/// Descriptor for `GetIdealResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIdealResponseDescriptor = $convert.base64Decode(
    'ChBHZXRJZGVhbFJlc3BvbnNlEi8KDmFkdmljZV9tZXNzYWdlGAEgASgJQgi6SAVyAxiWAVINYW'
    'R2aWNlTWVzc2FnZRKJAQobdXNlcl9zaW1wbGlmaWVkX3BlcnNvbmFsaXR5GAIgASgLMkkuZWNv'
    'bmEuc2VydmljZXMuc2l0ZS5hZHZpY2UudjEuR2V0SWRlYWxSZXNwb25zZS5Vc2VyU2ltcGxpZm'
    'llZFBlcnNvbmFsaXR5Uhl1c2VyU2ltcGxpZmllZFBlcnNvbmFsaXR5Eo4BCh50b191c2VyX3Np'
    'bXBsaWZpZWRfcGVyc29uYWxpdHkYAyABKAsySS5lY29uYS5zZXJ2aWNlcy5zaXRlLmFkdmljZS'
    '52MS5HZXRJZGVhbFJlc3BvbnNlLlVzZXJTaW1wbGlmaWVkUGVyc29uYWxpdHlSG3RvVXNlclNp'
    'bXBsaWZpZWRQZXJzb25hbGl0eRKqAQotc2FtZV9nZW5kZXJfc2FtZV9nZW5lcmF0aW9uX2lkZW'
    'FsX3BlcnNvbmFsaXR5GAQgASgLMkkuZWNvbmEuc2VydmljZXMuc2l0ZS5hZHZpY2UudjEuR2V0'
    'SWRlYWxSZXNwb25zZS5Vc2VyU2ltcGxpZmllZFBlcnNvbmFsaXR5UihzYW1lR2VuZGVyU2FtZU'
    'dlbmVyYXRpb25JZGVhbFBlcnNvbmFsaXR5GtgBChlVc2VyU2ltcGxpZmllZFBlcnNvbmFsaXR5'
    'Eh0KCm1lZGlhbl9hZ2UYASABKAVSCW1lZGlhbkFnZRIjCg1tZWRpYW5faGVpZ2h0GAIgASgFUg'
    'xtZWRpYW5IZWlnaHQSNgoJYm9keV90eXBlGAMgASgOMhkuZWNvbmEuZW51bXMuQm9keVR5cGVD'
    'b2RlUghib2R5VHlwZRI/CgxzYWxhcnlfcmFuZ2UYBCABKA4yHC5lY29uYS5lbnVtcy5TYWxhcn'
    'lSYW5nZUNvZGVSC3NhbGFyeVJhbmdl');

