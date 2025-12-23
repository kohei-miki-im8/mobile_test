//
//  Generated code. Do not modify.
//  source: econa/enums/child_situation_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 子供の状況
class ChildSituationCode extends $pb.ProtobufEnum {
  static const ChildSituationCode CHILD_SITUATION_CODE_UNSPECIFIED = ChildSituationCode._(0, _omitEnumNames ? '' : 'CHILD_SITUATION_CODE_UNSPECIFIED');
  static const ChildSituationCode CHILD_SITUATION_CODE_NO_CHILDREN = ChildSituationCode._(1, _omitEnumNames ? '' : 'CHILD_SITUATION_CODE_NO_CHILDREN');
  static const ChildSituationCode CHILD_SITUATION_CODE_LIVING_TOGETHER = ChildSituationCode._(2, _omitEnumNames ? '' : 'CHILD_SITUATION_CODE_LIVING_TOGETHER');
  static const ChildSituationCode CHILD_SITUATION_CODE_LIVING_APART = ChildSituationCode._(3, _omitEnumNames ? '' : 'CHILD_SITUATION_CODE_LIVING_APART');

  static const $core.List<ChildSituationCode> values = <ChildSituationCode> [
    CHILD_SITUATION_CODE_UNSPECIFIED,
    CHILD_SITUATION_CODE_NO_CHILDREN,
    CHILD_SITUATION_CODE_LIVING_TOGETHER,
    CHILD_SITUATION_CODE_LIVING_APART,
  ];

  static final $core.Map<$core.int, ChildSituationCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChildSituationCode? valueOf($core.int value) => _byValue[value];

  const ChildSituationCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
