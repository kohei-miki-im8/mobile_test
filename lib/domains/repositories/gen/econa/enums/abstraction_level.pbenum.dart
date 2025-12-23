//
//  Generated code. Do not modify.
//  source: econa/enums/abstraction_level.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 抽象度
class AbstractionLevel extends $pb.ProtobufEnum {
  static const AbstractionLevel ABSTRACTION_LEVEL_UNSPECIFIED = AbstractionLevel._(0, _omitEnumNames ? '' : 'ABSTRACTION_LEVEL_UNSPECIFIED');
  static const AbstractionLevel ABSTRACTION_LEVEL_LOW = AbstractionLevel._(1, _omitEnumNames ? '' : 'ABSTRACTION_LEVEL_LOW');
  static const AbstractionLevel ABSTRACTION_LEVEL_MEDIUM = AbstractionLevel._(2, _omitEnumNames ? '' : 'ABSTRACTION_LEVEL_MEDIUM');
  static const AbstractionLevel ABSTRACTION_LEVEL_HIGH = AbstractionLevel._(3, _omitEnumNames ? '' : 'ABSTRACTION_LEVEL_HIGH');

  static const $core.List<AbstractionLevel> values = <AbstractionLevel> [
    ABSTRACTION_LEVEL_UNSPECIFIED,
    ABSTRACTION_LEVEL_LOW,
    ABSTRACTION_LEVEL_MEDIUM,
    ABSTRACTION_LEVEL_HIGH,
  ];

  static final $core.Map<$core.int, AbstractionLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AbstractionLevel? valueOf($core.int value) => _byValue[value];

  const AbstractionLevel._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
