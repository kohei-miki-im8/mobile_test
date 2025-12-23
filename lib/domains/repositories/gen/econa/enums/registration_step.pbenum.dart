//
//  Generated code. Do not modify.
//  source: econa/enums/registration_step.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 登録ステップ
class RegistrationStep extends $pb.ProtobufEnum {
  static const RegistrationStep REGISTRATION_STEP_UNSPECIFIED = RegistrationStep._(0, _omitEnumNames ? '' : 'REGISTRATION_STEP_UNSPECIFIED');
  static const RegistrationStep REGISTRATION_STEP_1_01 = RegistrationStep._(101, _omitEnumNames ? '' : 'REGISTRATION_STEP_1_01');
  static const RegistrationStep REGISTRATION_STEP_2_01 = RegistrationStep._(201, _omitEnumNames ? '' : 'REGISTRATION_STEP_2_01');
  static const RegistrationStep REGISTRATION_STEP_3_01 = RegistrationStep._(301, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_01');
  static const RegistrationStep REGISTRATION_STEP_3_02 = RegistrationStep._(302, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_02');
  static const RegistrationStep REGISTRATION_STEP_3_03 = RegistrationStep._(303, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_03');
  static const RegistrationStep REGISTRATION_STEP_3_04 = RegistrationStep._(304, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_04');
  static const RegistrationStep REGISTRATION_STEP_3_05 = RegistrationStep._(305, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_05');
  static const RegistrationStep REGISTRATION_STEP_3_06 = RegistrationStep._(306, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_06');
  static const RegistrationStep REGISTRATION_STEP_3_07 = RegistrationStep._(307, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_07');
  static const RegistrationStep REGISTRATION_STEP_3_08 = RegistrationStep._(308, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_08');
  static const RegistrationStep REGISTRATION_STEP_3_09 = RegistrationStep._(309, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_09');
  static const RegistrationStep REGISTRATION_STEP_3_10 = RegistrationStep._(310, _omitEnumNames ? '' : 'REGISTRATION_STEP_3_10');
  static const RegistrationStep REGISTRATION_STEP_4_01 = RegistrationStep._(401, _omitEnumNames ? '' : 'REGISTRATION_STEP_4_01');
  static const RegistrationStep REGISTRATION_STEP_5_01 = RegistrationStep._(501, _omitEnumNames ? '' : 'REGISTRATION_STEP_5_01');
  static const RegistrationStep REGISTRATION_STEP_5_02 = RegistrationStep._(502, _omitEnumNames ? '' : 'REGISTRATION_STEP_5_02');

  static const $core.List<RegistrationStep> values = <RegistrationStep> [
    REGISTRATION_STEP_UNSPECIFIED,
    REGISTRATION_STEP_1_01,
    REGISTRATION_STEP_2_01,
    REGISTRATION_STEP_3_01,
    REGISTRATION_STEP_3_02,
    REGISTRATION_STEP_3_03,
    REGISTRATION_STEP_3_04,
    REGISTRATION_STEP_3_05,
    REGISTRATION_STEP_3_06,
    REGISTRATION_STEP_3_07,
    REGISTRATION_STEP_3_08,
    REGISTRATION_STEP_3_09,
    REGISTRATION_STEP_3_10,
    REGISTRATION_STEP_4_01,
    REGISTRATION_STEP_5_01,
    REGISTRATION_STEP_5_02,
  ];

  static final $core.Map<$core.int, RegistrationStep> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RegistrationStep? valueOf($core.int value) => _byValue[value];

  const RegistrationStep._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
