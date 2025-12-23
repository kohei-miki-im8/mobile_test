//
//  Generated code. Do not modify.
//  source: econa/enums/smoking_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 喫煙習慣コード
class SmokingCode extends $pb.ProtobufEnum {
  static const SmokingCode SMOKING_CODE_UNSPECIFIED = SmokingCode._(0, _omitEnumNames ? '' : 'SMOKING_CODE_UNSPECIFIED');
  static const SmokingCode SMOKING_CODE_NON_SMOKER = SmokingCode._(1, _omitEnumNames ? '' : 'SMOKING_CODE_NON_SMOKER');
  static const SmokingCode SMOKING_CODE_SMOKER = SmokingCode._(2, _omitEnumNames ? '' : 'SMOKING_CODE_SMOKER');
  static const SmokingCode SMOKING_CODE_E_CIGARETTE_SMOKER = SmokingCode._(3, _omitEnumNames ? '' : 'SMOKING_CODE_E_CIGARETTE_SMOKER');
  static const SmokingCode SMOKING_CODE_CONSIDERATE_SMOKER = SmokingCode._(4, _omitEnumNames ? '' : 'SMOKING_CODE_CONSIDERATE_SMOKER');
  static const SmokingCode SMOKING_CODE_FLEXIBLE_SMOKER = SmokingCode._(5, _omitEnumNames ? '' : 'SMOKING_CODE_FLEXIBLE_SMOKER');
  static const SmokingCode SMOKING_CODE_OCCASIONAL_SMOKER = SmokingCode._(6, _omitEnumNames ? '' : 'SMOKING_CODE_OCCASIONAL_SMOKER');

  static const $core.List<SmokingCode> values = <SmokingCode> [
    SMOKING_CODE_UNSPECIFIED,
    SMOKING_CODE_NON_SMOKER,
    SMOKING_CODE_SMOKER,
    SMOKING_CODE_E_CIGARETTE_SMOKER,
    SMOKING_CODE_CONSIDERATE_SMOKER,
    SMOKING_CODE_FLEXIBLE_SMOKER,
    SMOKING_CODE_OCCASIONAL_SMOKER,
  ];

  static final $core.Map<$core.int, SmokingCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SmokingCode? valueOf($core.int value) => _byValue[value];

  const SmokingCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
