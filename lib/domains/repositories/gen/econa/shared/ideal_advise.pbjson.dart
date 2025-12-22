//
//  Generated code. Do not modify.
//  source: econa/shared/ideal_advise.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use idealAdviseDescriptor instead')
const IdealAdvise$json = {
  '1': 'IdealAdvise',
  '2': [
    {'1': 'advise', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'advise'},
    {'1': 'interested_in_partner_user_feature', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.UserFeature', '10': 'interestedInPartnerUserFeature'},
    {'1': 'interested_in_you_user_feature', '3': 3, '4': 1, '5': 11, '6': '.econa.shared.UserFeature', '10': 'interestedInYouUserFeature'},
    {'1': 'same_generation_user_feature', '3': 4, '4': 1, '5': 11, '6': '.econa.shared.UserFeature', '10': 'sameGenerationUserFeature'},
  ],
};

/// Descriptor for `IdealAdvise`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idealAdviseDescriptor = $convert.base64Decode(
    'CgtJZGVhbEFkdmlzZRIiCgZhZHZpc2UYASABKAlCCrpIB3IFEAEYlgFSBmFkdmlzZRJlCiJpbn'
    'RlcmVzdGVkX2luX3BhcnRuZXJfdXNlcl9mZWF0dXJlGAIgASgLMhkuZWNvbmEuc2hhcmVkLlVz'
    'ZXJGZWF0dXJlUh5pbnRlcmVzdGVkSW5QYXJ0bmVyVXNlckZlYXR1cmUSXQoeaW50ZXJlc3RlZF'
    '9pbl95b3VfdXNlcl9mZWF0dXJlGAMgASgLMhkuZWNvbmEuc2hhcmVkLlVzZXJGZWF0dXJlUhpp'
    'bnRlcmVzdGVkSW5Zb3VVc2VyRmVhdHVyZRJaChxzYW1lX2dlbmVyYXRpb25fdXNlcl9mZWF0dX'
    'JlGAQgASgLMhkuZWNvbmEuc2hhcmVkLlVzZXJGZWF0dXJlUhlzYW1lR2VuZXJhdGlvblVzZXJG'
    'ZWF0dXJl');

@$core.Deprecated('Use userFeatureDescriptor instead')
const UserFeature$json = {
  '1': 'UserFeature',
  '2': [
    {'1': 'min_age', '3': 1, '4': 1, '5': 5, '10': 'minAge'},
    {'1': 'max_age', '3': 2, '4': 1, '5': 5, '10': 'maxAge'},
    {'1': 'salary_range', '3': 3, '4': 1, '5': 14, '6': '.econa.enums.SalaryRangeCode', '10': 'salaryRange'},
    {'1': 'min_height', '3': 4, '4': 1, '5': 5, '10': 'minHeight'},
    {'1': 'max_height', '3': 5, '4': 1, '5': 5, '10': 'maxHeight'},
    {'1': 'body_type', '3': 6, '4': 1, '5': 14, '6': '.econa.enums.BodyTypeCode', '10': 'bodyType'},
    {'1': 'house_work', '3': 7, '4': 1, '5': 14, '6': '.econa.enums.HouseWorkCode', '10': 'houseWork'},
  ],
};

/// Descriptor for `UserFeature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userFeatureDescriptor = $convert.base64Decode(
    'CgtVc2VyRmVhdHVyZRIXCgdtaW5fYWdlGAEgASgFUgZtaW5BZ2USFwoHbWF4X2FnZRgCIAEoBV'
    'IGbWF4QWdlEj8KDHNhbGFyeV9yYW5nZRgDIAEoDjIcLmVjb25hLmVudW1zLlNhbGFyeVJhbmdl'
    'Q29kZVILc2FsYXJ5UmFuZ2USHQoKbWluX2hlaWdodBgEIAEoBVIJbWluSGVpZ2h0Eh0KCm1heF'
    '9oZWlnaHQYBSABKAVSCW1heEhlaWdodBI2Cglib2R5X3R5cGUYBiABKA4yGS5lY29uYS5lbnVt'
    'cy5Cb2R5VHlwZUNvZGVSCGJvZHlUeXBlEjkKCmhvdXNlX3dvcmsYByABKA4yGi5lY29uYS5lbn'
    'Vtcy5Ib3VzZVdvcmtDb2RlUglob3VzZVdvcms=');

