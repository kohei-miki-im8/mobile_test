//
//  Generated code. Do not modify.
//  source: econa/enums/disciplinary_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 懲戒処分タイプ
class DisciplinaryType extends $pb.ProtobufEnum {
  static const DisciplinaryType DISCIPLINARY_TYPE_UNSPECIFIED = DisciplinaryType._(0, _omitEnumNames ? '' : 'DISCIPLINARY_TYPE_UNSPECIFIED');
  static const DisciplinaryType DISCIPLINARY_TYPE_WARNING = DisciplinaryType._(1, _omitEnumNames ? '' : 'DISCIPLINARY_TYPE_WARNING');
  static const DisciplinaryType DISCIPLINARY_TYPE_BAN = DisciplinaryType._(2, _omitEnumNames ? '' : 'DISCIPLINARY_TYPE_BAN');

  static const $core.List<DisciplinaryType> values = <DisciplinaryType> [
    DISCIPLINARY_TYPE_UNSPECIFIED,
    DISCIPLINARY_TYPE_WARNING,
    DISCIPLINARY_TYPE_BAN,
  ];

  static final $core.Map<$core.int, DisciplinaryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DisciplinaryType? valueOf($core.int value) => _byValue[value];

  const DisciplinaryType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
