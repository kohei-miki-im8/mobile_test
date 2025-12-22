//
//  Generated code. Do not modify.
//  source: econa/enums/dating_preference_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 出会い方の希望
class DatingPreferenceCode extends $pb.ProtobufEnum {
  static const DatingPreferenceCode DATING_PREFERENCE_CODE_UNSPECIFIED = DatingPreferenceCode._(0, _omitEnumNames ? '' : 'DATING_PREFERENCE_CODE_UNSPECIFIED');
  static const DatingPreferenceCode DATING_PREFERENCE_CODE_DATE_SOON = DatingPreferenceCode._(1, _omitEnumNames ? '' : 'DATING_PREFERENCE_CODE_DATE_SOON');
  static const DatingPreferenceCode DATING_PREFERENCE_CODE_DATE_IF_COMPATIBLE = DatingPreferenceCode._(2, _omitEnumNames ? '' : 'DATING_PREFERENCE_CODE_DATE_IF_COMPATIBLE');
  static const DatingPreferenceCode DATING_PREFERENCE_CODE_MESSAGE_BEFORE_DATE = DatingPreferenceCode._(3, _omitEnumNames ? '' : 'DATING_PREFERENCE_CODE_MESSAGE_BEFORE_DATE');

  static const $core.List<DatingPreferenceCode> values = <DatingPreferenceCode> [
    DATING_PREFERENCE_CODE_UNSPECIFIED,
    DATING_PREFERENCE_CODE_DATE_SOON,
    DATING_PREFERENCE_CODE_DATE_IF_COMPATIBLE,
    DATING_PREFERENCE_CODE_MESSAGE_BEFORE_DATE,
  ];

  static final $core.Map<$core.int, DatingPreferenceCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DatingPreferenceCode? valueOf($core.int value) => _byValue[value];

  const DatingPreferenceCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
