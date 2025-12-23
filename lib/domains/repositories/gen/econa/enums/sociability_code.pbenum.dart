//
//  Generated code. Do not modify.
//  source: econa/enums/sociability_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 社交性コード
class SociabilityCode extends $pb.ProtobufEnum {
  static const SociabilityCode SOCIABILITY_CODE_UNSPECIFIED = SociabilityCode._(0, _omitEnumNames ? '' : 'SOCIABILITY_CODE_UNSPECIFIED');
  static const SociabilityCode SOCIABILITY_CODE_QUICK_FRIENDSHIP = SociabilityCode._(1, _omitEnumNames ? '' : 'SOCIABILITY_CODE_QUICK_FRIENDSHIP');
  static const SociabilityCode SOCIABILITY_CODE_GRADUAL_FRIENDSHIP = SociabilityCode._(2, _omitEnumNames ? '' : 'SOCIABILITY_CODE_GRADUAL_FRIENDSHIP');
  static const SociabilityCode SOCIABILITY_CODE_SLOW_FRIENDSHIP = SociabilityCode._(3, _omitEnumNames ? '' : 'SOCIABILITY_CODE_SLOW_FRIENDSHIP');

  static const $core.List<SociabilityCode> values = <SociabilityCode> [
    SOCIABILITY_CODE_UNSPECIFIED,
    SOCIABILITY_CODE_QUICK_FRIENDSHIP,
    SOCIABILITY_CODE_GRADUAL_FRIENDSHIP,
    SOCIABILITY_CODE_SLOW_FRIENDSHIP,
  ];

  static final $core.Map<$core.int, SociabilityCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SociabilityCode? valueOf($core.int value) => _byValue[value];

  const SociabilityCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
