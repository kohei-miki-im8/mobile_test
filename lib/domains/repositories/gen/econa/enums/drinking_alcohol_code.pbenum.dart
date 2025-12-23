//
//  Generated code. Do not modify.
//  source: econa/enums/drinking_alcohol_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 飲酒状況
class DrinkingAlcoholCode extends $pb.ProtobufEnum {
  static const DrinkingAlcoholCode DRINKING_ALCOHOL_CODE_UNSPECIFIED = DrinkingAlcoholCode._(0, _omitEnumNames ? '' : 'DRINKING_ALCOHOL_CODE_UNSPECIFIED');
  static const DrinkingAlcoholCode DRINKING_ALCOHOL_CODE_NON_DRINKER = DrinkingAlcoholCode._(1, _omitEnumNames ? '' : 'DRINKING_ALCOHOL_CODE_NON_DRINKER');
  static const DrinkingAlcoholCode DRINKING_ALCOHOL_CODE_REGULAR_DRINKER = DrinkingAlcoholCode._(2, _omitEnumNames ? '' : 'DRINKING_ALCOHOL_CODE_REGULAR_DRINKER');
  static const DrinkingAlcoholCode DRINKING_ALCOHOL_CODE_OCCASIONAL_DRINKER = DrinkingAlcoholCode._(3, _omitEnumNames ? '' : 'DRINKING_ALCOHOL_CODE_OCCASIONAL_DRINKER');
  static const DrinkingAlcoholCode DRINKING_ALCOHOL_CODE_SOCIAL_DRINKER = DrinkingAlcoholCode._(4, _omitEnumNames ? '' : 'DRINKING_ALCOHOL_CODE_SOCIAL_DRINKER');

  static const $core.List<DrinkingAlcoholCode> values = <DrinkingAlcoholCode> [
    DRINKING_ALCOHOL_CODE_UNSPECIFIED,
    DRINKING_ALCOHOL_CODE_NON_DRINKER,
    DRINKING_ALCOHOL_CODE_REGULAR_DRINKER,
    DRINKING_ALCOHOL_CODE_OCCASIONAL_DRINKER,
    DRINKING_ALCOHOL_CODE_SOCIAL_DRINKER,
  ];

  static final $core.Map<$core.int, DrinkingAlcoholCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DrinkingAlcoholCode? valueOf($core.int value) => _byValue[value];

  const DrinkingAlcoholCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
