//
//  Generated code. Do not modify.
//  source: econa/enums/environment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// サーバー環境種別
class Environment extends $pb.ProtobufEnum {
  static const Environment ENVIRONMENT_UNSPECIFIED = Environment._(0, _omitEnumNames ? '' : 'ENVIRONMENT_UNSPECIFIED');
  static const Environment ENVIRONMENT_PRODUCTION = Environment._(1, _omitEnumNames ? '' : 'ENVIRONMENT_PRODUCTION');
  static const Environment ENVIRONMENT_STAGING = Environment._(2, _omitEnumNames ? '' : 'ENVIRONMENT_STAGING');
  static const Environment ENVIRONMENT_DEVELOPMENT = Environment._(3, _omitEnumNames ? '' : 'ENVIRONMENT_DEVELOPMENT');

  static const $core.List<Environment> values = <Environment> [
    ENVIRONMENT_UNSPECIFIED,
    ENVIRONMENT_PRODUCTION,
    ENVIRONMENT_STAGING,
    ENVIRONMENT_DEVELOPMENT,
  ];

  static final $core.Map<$core.int, Environment> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Environment? valueOf($core.int value) => _byValue[value];

  const Environment._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
