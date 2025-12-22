//
//  Generated code. Do not modify.
//  source: econa/enums/educational_background_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 学歴コード
class EducationalBackgroundCode extends $pb.ProtobufEnum {
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_UNSPECIFIED = EducationalBackgroundCode._(0, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_UNSPECIFIED');
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_HIGH_SCHOOL = EducationalBackgroundCode._(1, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_HIGH_SCHOOL');
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_TECHNICAL_COLLEGE = EducationalBackgroundCode._(2, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_TECHNICAL_COLLEGE');
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_VOCATIONAL_SCHOOL = EducationalBackgroundCode._(3, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_VOCATIONAL_SCHOOL');
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_JUNIOR_COLLEGE = EducationalBackgroundCode._(4, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_JUNIOR_COLLEGE');
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_UNIVERSITY = EducationalBackgroundCode._(5, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_UNIVERSITY');
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_GRADUATE_SCHOOL = EducationalBackgroundCode._(6, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_GRADUATE_SCHOOL');
  static const EducationalBackgroundCode EDUCATIONAL_BACKGROUND_CODE_OTHER = EducationalBackgroundCode._(15, _omitEnumNames ? '' : 'EDUCATIONAL_BACKGROUND_CODE_OTHER');

  static const $core.List<EducationalBackgroundCode> values = <EducationalBackgroundCode> [
    EDUCATIONAL_BACKGROUND_CODE_UNSPECIFIED,
    EDUCATIONAL_BACKGROUND_CODE_HIGH_SCHOOL,
    EDUCATIONAL_BACKGROUND_CODE_TECHNICAL_COLLEGE,
    EDUCATIONAL_BACKGROUND_CODE_VOCATIONAL_SCHOOL,
    EDUCATIONAL_BACKGROUND_CODE_JUNIOR_COLLEGE,
    EDUCATIONAL_BACKGROUND_CODE_UNIVERSITY,
    EDUCATIONAL_BACKGROUND_CODE_GRADUATE_SCHOOL,
    EDUCATIONAL_BACKGROUND_CODE_OTHER,
  ];

  static final $core.Map<$core.int, EducationalBackgroundCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EducationalBackgroundCode? valueOf($core.int value) => _byValue[value];

  const EducationalBackgroundCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
