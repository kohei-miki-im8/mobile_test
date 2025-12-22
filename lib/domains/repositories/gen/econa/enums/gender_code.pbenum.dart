//
//  Generated code. Do not modify.
//  source: econa/enums/gender_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 性別コード
class GenderCode extends $pb.ProtobufEnum {
  static const GenderCode GENDER_CODE_UNSPECIFIED = GenderCode._(0, _omitEnumNames ? '' : 'GENDER_CODE_UNSPECIFIED');
  static const GenderCode GENDER_CODE_MALE = GenderCode._(1, _omitEnumNames ? '' : 'GENDER_CODE_MALE');
  static const GenderCode GENDER_CODE_FEMALE = GenderCode._(2, _omitEnumNames ? '' : 'GENDER_CODE_FEMALE');

  static const $core.List<GenderCode> values = <GenderCode> [
    GENDER_CODE_UNSPECIFIED,
    GENDER_CODE_MALE,
    GENDER_CODE_FEMALE,
  ];

  static final $core.Map<$core.int, GenderCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GenderCode? valueOf($core.int value) => _byValue[value];

  const GenderCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
