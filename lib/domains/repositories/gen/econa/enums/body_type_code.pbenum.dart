//
//  Generated code. Do not modify.
//  source: econa/enums/body_type_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 体型コード
class BodyTypeCode extends $pb.ProtobufEnum {
  static const BodyTypeCode BODY_TYPE_CODE_UNSPECIFIED = BodyTypeCode._(0, _omitEnumNames ? '' : 'BODY_TYPE_CODE_UNSPECIFIED');
  static const BodyTypeCode BODY_TYPE_CODE_SLIM = BodyTypeCode._(1, _omitEnumNames ? '' : 'BODY_TYPE_CODE_SLIM');
  static const BodyTypeCode BODY_TYPE_CODE_SLIGHTLY_SLIM = BodyTypeCode._(2, _omitEnumNames ? '' : 'BODY_TYPE_CODE_SLIGHTLY_SLIM');
  static const BodyTypeCode BODY_TYPE_CODE_AVERAGE = BodyTypeCode._(3, _omitEnumNames ? '' : 'BODY_TYPE_CODE_AVERAGE');
  static const BodyTypeCode BODY_TYPE_CODE_GLAMOROUS = BodyTypeCode._(4, _omitEnumNames ? '' : 'BODY_TYPE_CODE_GLAMOROUS');
  static const BodyTypeCode BODY_TYPE_CODE_MUSCULAR = BodyTypeCode._(5, _omitEnumNames ? '' : 'BODY_TYPE_CODE_MUSCULAR');
  static const BodyTypeCode BODY_TYPE_CODE_SLIGHTLY_CHUBBY = BodyTypeCode._(6, _omitEnumNames ? '' : 'BODY_TYPE_CODE_SLIGHTLY_CHUBBY');
  static const BodyTypeCode BODY_TYPE_CODE_CHUBBY = BodyTypeCode._(7, _omitEnumNames ? '' : 'BODY_TYPE_CODE_CHUBBY');

  static const $core.List<BodyTypeCode> values = <BodyTypeCode> [
    BODY_TYPE_CODE_UNSPECIFIED,
    BODY_TYPE_CODE_SLIM,
    BODY_TYPE_CODE_SLIGHTLY_SLIM,
    BODY_TYPE_CODE_AVERAGE,
    BODY_TYPE_CODE_GLAMOROUS,
    BODY_TYPE_CODE_MUSCULAR,
    BODY_TYPE_CODE_SLIGHTLY_CHUBBY,
    BODY_TYPE_CODE_CHUBBY,
  ];

  static final $core.Map<$core.int, BodyTypeCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BodyTypeCode? valueOf($core.int value) => _byValue[value];

  const BodyTypeCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
