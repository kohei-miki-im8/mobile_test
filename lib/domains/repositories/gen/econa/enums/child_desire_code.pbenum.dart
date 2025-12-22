//
//  Generated code. Do not modify.
//  source: econa/enums/child_desire_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 子供を望むかどうか
class ChildDesireCode extends $pb.ProtobufEnum {
  static const ChildDesireCode CHILD_DESIRE_CODE_UNSPECIFIED = ChildDesireCode._(0, _omitEnumNames ? '' : 'CHILD_DESIRE_CODE_UNSPECIFIED');
  static const ChildDesireCode CHILD_DESIRE_CODE_NO_CHILDREN = ChildDesireCode._(1, _omitEnumNames ? '' : 'CHILD_DESIRE_CODE_NO_CHILDREN');
  static const ChildDesireCode CHILD_DESIRE_CODE_WANT_CHILDREN = ChildDesireCode._(2, _omitEnumNames ? '' : 'CHILD_DESIRE_CODE_WANT_CHILDREN');
  static const ChildDesireCode CHILD_DESIRE_CODE_DISCUSS_WITH_PARTNER = ChildDesireCode._(3, _omitEnumNames ? '' : 'CHILD_DESIRE_CODE_DISCUSS_WITH_PARTNER');
  static const ChildDesireCode CHILD_DESIRE_CODE_UNSURE = ChildDesireCode._(4, _omitEnumNames ? '' : 'CHILD_DESIRE_CODE_UNSURE');

  static const $core.List<ChildDesireCode> values = <ChildDesireCode> [
    CHILD_DESIRE_CODE_UNSPECIFIED,
    CHILD_DESIRE_CODE_NO_CHILDREN,
    CHILD_DESIRE_CODE_WANT_CHILDREN,
    CHILD_DESIRE_CODE_DISCUSS_WITH_PARTNER,
    CHILD_DESIRE_CODE_UNSURE,
  ];

  static final $core.Map<$core.int, ChildDesireCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChildDesireCode? valueOf($core.int value) => _byValue[value];

  const ChildDesireCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
