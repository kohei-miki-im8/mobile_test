//
//  Generated code. Do not modify.
//  source: econa/enums/marriage_aspiration_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 結婚願望コード
class MarriageAspirationCode extends $pb.ProtobufEnum {
  static const MarriageAspirationCode MARRIAGE_ASPIRATION_CODE_UNSPECIFIED = MarriageAspirationCode._(0, _omitEnumNames ? '' : 'MARRIAGE_ASPIRATION_CODE_UNSPECIFIED');
  static const MarriageAspirationCode MARRIAGE_ASPIRATION_CODE_ASAP = MarriageAspirationCode._(1, _omitEnumNames ? '' : 'MARRIAGE_ASPIRATION_CODE_ASAP');
  static const MarriageAspirationCode MARRIAGE_ASPIRATION_CODE_WITHIN_2_3_YEARS = MarriageAspirationCode._(2, _omitEnumNames ? '' : 'MARRIAGE_ASPIRATION_CODE_WITHIN_2_3_YEARS');
  static const MarriageAspirationCode MARRIAGE_ASPIRATION_CODE_IF_RIGHT_PERSON = MarriageAspirationCode._(3, _omitEnumNames ? '' : 'MARRIAGE_ASPIRATION_CODE_IF_RIGHT_PERSON');
  static const MarriageAspirationCode MARRIAGE_ASPIRATION_CODE_DISCUSS_WITH_PARTNER = MarriageAspirationCode._(4, _omitEnumNames ? '' : 'MARRIAGE_ASPIRATION_CODE_DISCUSS_WITH_PARTNER');
  static const MarriageAspirationCode MARRIAGE_ASPIRATION_CODE_UNSURE = MarriageAspirationCode._(5, _omitEnumNames ? '' : 'MARRIAGE_ASPIRATION_CODE_UNSURE');

  static const $core.List<MarriageAspirationCode> values = <MarriageAspirationCode> [
    MARRIAGE_ASPIRATION_CODE_UNSPECIFIED,
    MARRIAGE_ASPIRATION_CODE_ASAP,
    MARRIAGE_ASPIRATION_CODE_WITHIN_2_3_YEARS,
    MARRIAGE_ASPIRATION_CODE_IF_RIGHT_PERSON,
    MARRIAGE_ASPIRATION_CODE_DISCUSS_WITH_PARTNER,
    MARRIAGE_ASPIRATION_CODE_UNSURE,
  ];

  static final $core.Map<$core.int, MarriageAspirationCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MarriageAspirationCode? valueOf($core.int value) => _byValue[value];

  const MarriageAspirationCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
