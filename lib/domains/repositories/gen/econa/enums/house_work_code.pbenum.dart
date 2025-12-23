//
//  Generated code. Do not modify.
//  source: econa/enums/house_work_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 家事習慣コード
class HouseWorkCode extends $pb.ProtobufEnum {
  static const HouseWorkCode HOUSE_WORK_CODE_UNSPECIFIED = HouseWorkCode._(0, _omitEnumNames ? '' : 'HOUSE_WORK_CODE_UNSPECIFIED');
  static const HouseWorkCode HOUSE_WORK_CODE_ACTIVELY_PARTICIPATE = HouseWorkCode._(1, _omitEnumNames ? '' : 'HOUSE_WORK_CODE_ACTIVELY_PARTICIPATE');
  static const HouseWorkCode HOUSE_WORK_CODE_WILLING_TO_PARTICIPATE = HouseWorkCode._(2, _omitEnumNames ? '' : 'HOUSE_WORK_CODE_WILLING_TO_PARTICIPATE');
  static const HouseWorkCode HOUSE_WORK_CODE_SHARE_EQUALLY = HouseWorkCode._(3, _omitEnumNames ? '' : 'HOUSE_WORK_CODE_SHARE_EQUALLY');
  static const HouseWorkCode HOUSE_WORK_CODE_PREFER_PARTNER_HANDLE = HouseWorkCode._(4, _omitEnumNames ? '' : 'HOUSE_WORK_CODE_PREFER_PARTNER_HANDLE');
  static const HouseWorkCode HOUSE_WORK_CODE_PARTNER_HANDLE = HouseWorkCode._(5, _omitEnumNames ? '' : 'HOUSE_WORK_CODE_PARTNER_HANDLE');

  static const $core.List<HouseWorkCode> values = <HouseWorkCode> [
    HOUSE_WORK_CODE_UNSPECIFIED,
    HOUSE_WORK_CODE_ACTIVELY_PARTICIPATE,
    HOUSE_WORK_CODE_WILLING_TO_PARTICIPATE,
    HOUSE_WORK_CODE_SHARE_EQUALLY,
    HOUSE_WORK_CODE_PREFER_PARTNER_HANDLE,
    HOUSE_WORK_CODE_PARTNER_HANDLE,
  ];

  static final $core.Map<$core.int, HouseWorkCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HouseWorkCode? valueOf($core.int value) => _byValue[value];

  const HouseWorkCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
