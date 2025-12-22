//
//  Generated code. Do not modify.
//  source: econa/enums/blood_type_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 血液型コード
class BloodTypeCode extends $pb.ProtobufEnum {
  static const BloodTypeCode BLOOD_TYPE_CODE_UNSPECIFIED = BloodTypeCode._(0, _omitEnumNames ? '' : 'BLOOD_TYPE_CODE_UNSPECIFIED');
  static const BloodTypeCode BLOOD_TYPE_CODE_A = BloodTypeCode._(1, _omitEnumNames ? '' : 'BLOOD_TYPE_CODE_A');
  static const BloodTypeCode BLOOD_TYPE_CODE_B = BloodTypeCode._(2, _omitEnumNames ? '' : 'BLOOD_TYPE_CODE_B');
  static const BloodTypeCode BLOOD_TYPE_CODE_O = BloodTypeCode._(3, _omitEnumNames ? '' : 'BLOOD_TYPE_CODE_O');
  static const BloodTypeCode BLOOD_TYPE_CODE_AB = BloodTypeCode._(4, _omitEnumNames ? '' : 'BLOOD_TYPE_CODE_AB');
  static const BloodTypeCode BLOOD_TYPE_CODE_UNKNOWN = BloodTypeCode._(5, _omitEnumNames ? '' : 'BLOOD_TYPE_CODE_UNKNOWN');

  static const $core.List<BloodTypeCode> values = <BloodTypeCode> [
    BLOOD_TYPE_CODE_UNSPECIFIED,
    BLOOD_TYPE_CODE_A,
    BLOOD_TYPE_CODE_B,
    BLOOD_TYPE_CODE_O,
    BLOOD_TYPE_CODE_AB,
    BLOOD_TYPE_CODE_UNKNOWN,
  ];

  static final $core.Map<$core.int, BloodTypeCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BloodTypeCode? valueOf($core.int value) => _byValue[value];

  const BloodTypeCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
