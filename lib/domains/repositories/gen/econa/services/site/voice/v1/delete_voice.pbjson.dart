//
//  Generated code. Do not modify.
//  source: econa/services/site/voice/v1/delete_voice.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deleteVoiceRequestDescriptor instead')
const DeleteVoiceRequest$json = {
  '1': 'DeleteVoiceRequest',
  '2': [
    {'1': 'voice_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'voiceId'},
  ],
};

/// Descriptor for `DeleteVoiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteVoiceRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVWb2ljZVJlcXVlc3QSIwoIdm9pY2VfaWQYASABKAlCCLpIBXIDsAEBUgd2b2ljZU'
    'lk');

@$core.Deprecated('Use deleteVoiceResponseDescriptor instead')
const DeleteVoiceResponse$json = {
  '1': 'DeleteVoiceResponse',
};

/// Descriptor for `DeleteVoiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteVoiceResponseDescriptor = $convert.base64Decode(
    'ChNEZWxldGVWb2ljZVJlc3BvbnNl');

