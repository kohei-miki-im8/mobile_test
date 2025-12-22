//
//  Generated code. Do not modify.
//  source: econa/enums/skip_source_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// スキップソースコード
class SkipSourceCode extends $pb.ProtobufEnum {
  static const SkipSourceCode SKIP_SOURCE_CODE_UNSPECIFIED = SkipSourceCode._(0, _omitEnumNames ? '' : 'SKIP_SOURCE_CODE_UNSPECIFIED');
  static const SkipSourceCode SKIP_SOURCE_CODE_HOME = SkipSourceCode._(1, _omitEnumNames ? '' : 'SKIP_SOURCE_CODE_HOME');
  static const SkipSourceCode SKIP_SOURCE_CODE_INCOMING_LIKES = SkipSourceCode._(2, _omitEnumNames ? '' : 'SKIP_SOURCE_CODE_INCOMING_LIKES');

  static const $core.List<SkipSourceCode> values = <SkipSourceCode> [
    SKIP_SOURCE_CODE_UNSPECIFIED,
    SKIP_SOURCE_CODE_HOME,
    SKIP_SOURCE_CODE_INCOMING_LIKES,
  ];

  static final $core.Map<$core.int, SkipSourceCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SkipSourceCode? valueOf($core.int value) => _byValue[value];

  const SkipSourceCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
