//
//  Generated code. Do not modify.
//  source: econa/enums/holiday_type_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 休日種別コード
class HolidayTypeCode extends $pb.ProtobufEnum {
  static const HolidayTypeCode HOLIDAY_TYPE_CODE_UNSPECIFIED = HolidayTypeCode._(0, _omitEnumNames ? '' : 'HOLIDAY_TYPE_CODE_UNSPECIFIED');
  static const HolidayTypeCode HOLIDAY_TYPE_CODE_WEEKEND = HolidayTypeCode._(1, _omitEnumNames ? '' : 'HOLIDAY_TYPE_CODE_WEEKEND');
  static const HolidayTypeCode HOLIDAY_TYPE_CODE_WEEKDAY = HolidayTypeCode._(2, _omitEnumNames ? '' : 'HOLIDAY_TYPE_CODE_WEEKDAY');
  static const HolidayTypeCode HOLIDAY_TYPE_CODE_IRREGULAR = HolidayTypeCode._(3, _omitEnumNames ? '' : 'HOLIDAY_TYPE_CODE_IRREGULAR');
  static const HolidayTypeCode HOLIDAY_TYPE_CODE_OTHER = HolidayTypeCode._(15, _omitEnumNames ? '' : 'HOLIDAY_TYPE_CODE_OTHER');

  static const $core.List<HolidayTypeCode> values = <HolidayTypeCode> [
    HOLIDAY_TYPE_CODE_UNSPECIFIED,
    HOLIDAY_TYPE_CODE_WEEKEND,
    HOLIDAY_TYPE_CODE_WEEKDAY,
    HOLIDAY_TYPE_CODE_IRREGULAR,
    HOLIDAY_TYPE_CODE_OTHER,
  ];

  static final $core.Map<$core.int, HolidayTypeCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HolidayTypeCode? valueOf($core.int value) => _byValue[value];

  const HolidayTypeCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
