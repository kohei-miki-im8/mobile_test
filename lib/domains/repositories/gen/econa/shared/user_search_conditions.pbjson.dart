//
//  Generated code. Do not modify.
//  source: econa/shared/user_search_conditions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userSearchConditionsResidenceRegionsDescriptor instead')
const UserSearchConditionsResidenceRegions$json = {
  '1': 'UserSearchConditionsResidenceRegions',
  '2': [
    {'1': 'regions', '3': 1, '4': 3, '5': 11, '6': '.econa.master.Region', '10': 'regions'},
  ],
};

/// Descriptor for `UserSearchConditionsResidenceRegions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSearchConditionsResidenceRegionsDescriptor = $convert.base64Decode(
    'CiRVc2VyU2VhcmNoQ29uZGl0aW9uc1Jlc2lkZW5jZVJlZ2lvbnMSLgoHcmVnaW9ucxgBIAMoCz'
    'IULmVjb25hLm1hc3Rlci5SZWdpb25SB3JlZ2lvbnM=');

@$core.Deprecated('Use userSearchConditionsDescriptor instead')
const UserSearchConditions$json = {
  '1': 'UserSearchConditions',
  '2': [
    {'1': 'area_search_type', '3': 1, '4': 1, '5': 14, '6': '.econa.enums.AreaSearchType', '8': {}, '10': 'areaSearchType'},
    {'1': 'residence_regions', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.UserSearchConditionsResidenceRegions', '9': 0, '10': 'residenceRegions'},
    {'1': 'distance_location_code', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.DistanceLocationCode', '8': {}, '9': 0, '10': 'distanceLocationCode'},
    {'1': 'min_age', '3': 4, '4': 1, '5': 5, '8': {}, '10': 'minAge'},
    {'1': 'max_age', '3': 5, '4': 1, '5': 5, '8': {}, '10': 'maxAge'},
    {'1': 'min_height', '3': 6, '4': 1, '5': 5, '8': {}, '10': 'minHeight'},
    {'1': 'max_height', '3': 7, '4': 1, '5': 5, '8': {}, '10': 'maxHeight'},
    {'1': 'body_type_codes', '3': 8, '4': 3, '5': 14, '6': '.econa.enums.BodyTypeCode', '10': 'bodyTypeCodes'},
    {'1': 'smoking_codes', '3': 9, '4': 3, '5': 14, '6': '.econa.enums.SmokingCode', '10': 'smokingCodes'},
    {'1': 'child_situation_codes', '3': 10, '4': 3, '5': 14, '6': '.econa.enums.ChildSituationCode', '10': 'childSituationCodes'},
  ],
  '7': {},
  '8': [
    {'1': 'area', '2': {}},
  ],
};

/// Descriptor for `UserSearchConditions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSearchConditionsDescriptor = $convert.base64Decode(
    'ChRVc2VyU2VhcmNoQ29uZGl0aW9ucxJUChBhcmVhX3NlYXJjaF90eXBlGAEgASgOMhsuZWNvbm'
    'EuZW51bXMuQXJlYVNlYXJjaFR5cGVCDbpICsgBAYIBBBABIABSDmFyZWFTZWFyY2hUeXBlEmEK'
    'EXJlc2lkZW5jZV9yZWdpb25zGAIgASgLMjIuZWNvbmEuc2hhcmVkLlVzZXJTZWFyY2hDb25kaX'
    'Rpb25zUmVzaWRlbmNlUmVnaW9uc0gAUhByZXNpZGVuY2VSZWdpb25zEmMKFmRpc3RhbmNlX2xv'
    'Y2F0aW9uX2NvZGUYAyABKA4yIS5lY29uYS5lbnVtcy5EaXN0YW5jZUxvY2F0aW9uQ29kZUIIuk'
    'gFggECEAFIAFIUZGlzdGFuY2VMb2NhdGlvbkNvZGUSIAoHbWluX2FnZRgEIAEoBUIHukgEGgIo'
    'ElIGbWluQWdlEiAKB21heF9hZ2UYBSABKAVCB7pIBBoCGDJSBm1heEFnZRInCgptaW5faGVpZ2'
    'h0GAYgASgFQgi6SAUaAyiCAVIJbWluSGVpZ2h0EicKCm1heF9oZWlnaHQYByABKAVCCLpIBRoD'
    'GMgBUgltYXhIZWlnaHQSQQoPYm9keV90eXBlX2NvZGVzGAggAygOMhkuZWNvbmEuZW51bXMuQm'
    '9keVR5cGVDb2RlUg1ib2R5VHlwZUNvZGVzEj0KDXNtb2tpbmdfY29kZXMYCSADKA4yGC5lY29u'
    'YS5lbnVtcy5TbW9raW5nQ29kZVIMc21va2luZ0NvZGVzElMKFWNoaWxkX3NpdHVhdGlvbl9jb2'
    'RlcxgKIAMoDjIfLmVjb25hLmVudW1zLkNoaWxkU2l0dWF0aW9uQ29kZVITY2hpbGRTaXR1YXRp'
    'b25Db2RlczrTArpIzwIamgEKFGFnZV9yYW5nZV92YWxpZGF0aW9uEjltaW5fYWdlIG11c3QgYm'
    'UgbGVzcyB0aGFuIG1heF9hZ2Ugd2hlbiBib3RoIGFyZSBzcGVjaWZpZWQaRyFoYXModGhpcy5t'
    'aW5fYWdlKSB8fCAhaGFzKHRoaXMubWF4X2FnZSkgfHwgdGhpcy5taW5fYWdlIDwgdGhpcy5tYX'
    'hfYWdlGq8BChdoZWlnaHRfcmFuZ2VfdmFsaWRhdGlvbhI/bWluX2hlaWdodCBtdXN0IGJlIGxl'
    'c3MgdGhhbiBtYXhfaGVpZ2h0IHdoZW4gYm90aCBhcmUgc3BlY2lmaWVkGlMhaGFzKHRoaXMubW'
    'luX2hlaWdodCkgfHwgIWhhcyh0aGlzLm1heF9oZWlnaHQpIHx8IHRoaXMubWluX2hlaWdodCA8'
    'IHRoaXMubWF4X2hlaWdodEINCgRhcmVhEgW6SAIIAQ==');

