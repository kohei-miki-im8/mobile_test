//
//  Generated code. Do not modify.
//  source: econa/shared/voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use voiceDescriptor instead')
const Voice$json = {
  '1': 'Voice',
  '2': [
    {'1': 'voice_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'voiceId'},
    {'1': 'voice_data_origin', '3': 2, '4': 1, '5': 11, '6': '.econa.shared.VoiceDataOrigin', '10': 'voiceDataOrigin'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'caption', '3': 4, '4': 1, '5': 9, '10': 'caption'},
    {'1': 'service_review_status', '3': 5, '4': 1, '5': 14, '6': '.econa.enums.ServiceReviewStatus', '8': {}, '10': 'serviceReviewStatus'},
    {'1': 'signed_url', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'signedUrl'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
  ],
};

/// Descriptor for `Voice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voiceDescriptor = $convert.base64Decode(
    'CgVWb2ljZRIjCgh2b2ljZV9pZBgBIAEoCUIIukgFcgOwAQFSB3ZvaWNlSWQSSQoRdm9pY2VfZG'
    'F0YV9vcmlnaW4YAiABKAsyHS5lY29uYS5zaGFyZWQuVm9pY2VEYXRhT3JpZ2luUg92b2ljZURh'
    'dGFPcmlnaW4SIQoHdXNlcl9pZBgDIAEoCUIIukgFcgOwAQFSBnVzZXJJZBIYCgdjYXB0aW9uGA'
    'QgASgJUgdjYXB0aW9uEmAKFXNlcnZpY2VfcmV2aWV3X3N0YXR1cxgFIAEoDjIgLmVjb25hLmVu'
    'dW1zLlNlcnZpY2VSZXZpZXdTdGF0dXNCCrpIB4IBBBABIABSE3NlcnZpY2VSZXZpZXdTdGF0dX'
    'MSJwoKc2lnbmVkX3VybBgGIAEoCUIIukgFcgOIAQFSCXNpZ25lZFVybBI5CgpjcmVhdGVkX2F0'
    'GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0');

