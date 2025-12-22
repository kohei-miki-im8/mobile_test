//
//  Generated code. Do not modify.
//  source: econa/enums/salary_range_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 年収範囲コード
class SalaryRangeCode extends $pb.ProtobufEnum {
  static const SalaryRangeCode SALARY_RANGE_CODE_UNSPECIFIED = SalaryRangeCode._(0, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_UNSPECIFIED');
  static const SalaryRangeCode SALARY_RANGE_CODE_UNDER_2M = SalaryRangeCode._(1, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_UNDER_2M');
  static const SalaryRangeCode SALARY_RANGE_CODE_2M_TO_4M = SalaryRangeCode._(2, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_2M_TO_4M');
  static const SalaryRangeCode SALARY_RANGE_CODE_4M_TO_6M = SalaryRangeCode._(3, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_4M_TO_6M');
  static const SalaryRangeCode SALARY_RANGE_CODE_6M_TO_8M = SalaryRangeCode._(4, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_6M_TO_8M');
  static const SalaryRangeCode SALARY_RANGE_CODE_8M_TO_10M = SalaryRangeCode._(5, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_8M_TO_10M');
  static const SalaryRangeCode SALARY_RANGE_CODE_10M_TO_15M = SalaryRangeCode._(6, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_10M_TO_15M');
  static const SalaryRangeCode SALARY_RANGE_CODE_15M_TO_20M = SalaryRangeCode._(7, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_15M_TO_20M');
  static const SalaryRangeCode SALARY_RANGE_CODE_20M_TO_30M = SalaryRangeCode._(8, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_20M_TO_30M');
  static const SalaryRangeCode SALARY_RANGE_CODE_OVER_30M = SalaryRangeCode._(9, _omitEnumNames ? '' : 'SALARY_RANGE_CODE_OVER_30M');

  static const $core.List<SalaryRangeCode> values = <SalaryRangeCode> [
    SALARY_RANGE_CODE_UNSPECIFIED,
    SALARY_RANGE_CODE_UNDER_2M,
    SALARY_RANGE_CODE_2M_TO_4M,
    SALARY_RANGE_CODE_4M_TO_6M,
    SALARY_RANGE_CODE_6M_TO_8M,
    SALARY_RANGE_CODE_8M_TO_10M,
    SALARY_RANGE_CODE_10M_TO_15M,
    SALARY_RANGE_CODE_15M_TO_20M,
    SALARY_RANGE_CODE_20M_TO_30M,
    SALARY_RANGE_CODE_OVER_30M,
  ];

  static final $core.Map<$core.int, SalaryRangeCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SalaryRangeCode? valueOf($core.int value) => _byValue[value];

  const SalaryRangeCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
