//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/get_voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getVoiceRequestDescriptor instead')
const GetVoiceRequest$json = {
  '1': 'GetVoiceRequest',
  '2': [
    {'1': 'voice_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'voiceId'},
  ],
};

/// Descriptor for `GetVoiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoiceRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRWb2ljZVJlcXVlc3QSIwoIdm9pY2VfaWQYASABKAlCCLpIBXIDsAEBUgd2b2ljZUlk');

@$core.Deprecated('Use getVoiceResponseDescriptor instead')
const GetVoiceResponse$json = {
  '1': 'GetVoiceResponse',
  '2': [
    {'1': 'voice', '3': 1, '4': 1, '5': 11, '6': '.econa.shared.Voice', '10': 'voice'},
  ],
};

/// Descriptor for `GetVoiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoiceResponseDescriptor = $convert.base64Decode(
    'ChBHZXRWb2ljZVJlc3BvbnNlEikKBXZvaWNlGAEgASgLMhMuZWNvbmEuc2hhcmVkLlZvaWNlUg'
    'V2b2ljZQ==');

