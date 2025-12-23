//
//  Generated code. Do not modify.
//  source: econa/enums/voice_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 音声種別
class VoiceType extends $pb.ProtobufEnum {
  static const VoiceType VOICE_TYPE_UNSPECIFIED = VoiceType._(0, _omitEnumNames ? '' : 'VOICE_TYPE_UNSPECIFIED');
  static const VoiceType VOICE_TYPE_PROFILE = VoiceType._(1, _omitEnumNames ? '' : 'VOICE_TYPE_PROFILE');

  static const $core.List<VoiceType> values = <VoiceType> [
    VOICE_TYPE_UNSPECIFIED,
    VOICE_TYPE_PROFILE,
  ];

  static final $core.Map<$core.int, VoiceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VoiceType? valueOf($core.int value) => _byValue[value];

  const VoiceType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
