//
//  Generated code. Do not modify.
//  source: econa/enums/sibling_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 兄弟姉妹コード
class SiblingCode extends $pb.ProtobufEnum {
  static const SiblingCode SIBLING_CODE_UNSPECIFIED = SiblingCode._(0, _omitEnumNames ? '' : 'SIBLING_CODE_UNSPECIFIED');
  static const SiblingCode SIBLING_CODE_ELDEST_SON = SiblingCode._(1, _omitEnumNames ? '' : 'SIBLING_CODE_ELDEST_SON');
  static const SiblingCode SIBLING_CODE_SECOND_SON = SiblingCode._(2, _omitEnumNames ? '' : 'SIBLING_CODE_SECOND_SON');
  static const SiblingCode SIBLING_CODE_THIRD_SON = SiblingCode._(3, _omitEnumNames ? '' : 'SIBLING_CODE_THIRD_SON');
  static const SiblingCode SIBLING_CODE_ELDEST_DAUGHTER = SiblingCode._(4, _omitEnumNames ? '' : 'SIBLING_CODE_ELDEST_DAUGHTER');
  static const SiblingCode SIBLING_CODE_SECOND_DAUGHTER = SiblingCode._(5, _omitEnumNames ? '' : 'SIBLING_CODE_SECOND_DAUGHTER');
  static const SiblingCode SIBLING_CODE_THIRD_DAUGHTER = SiblingCode._(6, _omitEnumNames ? '' : 'SIBLING_CODE_THIRD_DAUGHTER');
  static const SiblingCode SIBLING_CODE_ONLY_CHILD_MALE = SiblingCode._(7, _omitEnumNames ? '' : 'SIBLING_CODE_ONLY_CHILD_MALE');
  static const SiblingCode SIBLING_CODE_ONLY_CHILD_FEMALE = SiblingCode._(8, _omitEnumNames ? '' : 'SIBLING_CODE_ONLY_CHILD_FEMALE');
  static const SiblingCode SIBLING_CODE_OTHER_MALE = SiblingCode._(9, _omitEnumNames ? '' : 'SIBLING_CODE_OTHER_MALE');
  static const SiblingCode SIBLING_CODE_OTHER_FEMALE = SiblingCode._(10, _omitEnumNames ? '' : 'SIBLING_CODE_OTHER_FEMALE');

  static const $core.List<SiblingCode> values = <SiblingCode> [
    SIBLING_CODE_UNSPECIFIED,
    SIBLING_CODE_ELDEST_SON,
    SIBLING_CODE_SECOND_SON,
    SIBLING_CODE_THIRD_SON,
    SIBLING_CODE_ELDEST_DAUGHTER,
    SIBLING_CODE_SECOND_DAUGHTER,
    SIBLING_CODE_THIRD_DAUGHTER,
    SIBLING_CODE_ONLY_CHILD_MALE,
    SIBLING_CODE_ONLY_CHILD_FEMALE,
    SIBLING_CODE_OTHER_MALE,
    SIBLING_CODE_OTHER_FEMALE,
  ];

  static final $core.Map<$core.int, SiblingCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SiblingCode? valueOf($core.int value) => _byValue[value];

  const SiblingCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
