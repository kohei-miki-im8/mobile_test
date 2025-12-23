//
//  Generated code. Do not modify.
//  source: econa/enums/platform.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// プラットフォーム種別
class PlatformCode extends $pb.ProtobufEnum {
  static const PlatformCode PLATFORM_CODE_UNSPECIFIED = PlatformCode._(0, _omitEnumNames ? '' : 'PLATFORM_CODE_UNSPECIFIED');
  static const PlatformCode PLATFORM_CODE_WEB = PlatformCode._(1, _omitEnumNames ? '' : 'PLATFORM_CODE_WEB');
  static const PlatformCode PLATFORM_CODE_IOS = PlatformCode._(2, _omitEnumNames ? '' : 'PLATFORM_CODE_IOS');
  static const PlatformCode PLATFORM_CODE_ANDROID = PlatformCode._(3, _omitEnumNames ? '' : 'PLATFORM_CODE_ANDROID');
  static const PlatformCode PLATFORM_CODE_UNKNOWN = PlatformCode._(15, _omitEnumNames ? '' : 'PLATFORM_CODE_UNKNOWN');

  static const $core.List<PlatformCode> values = <PlatformCode> [
    PLATFORM_CODE_UNSPECIFIED,
    PLATFORM_CODE_WEB,
    PLATFORM_CODE_IOS,
    PLATFORM_CODE_ANDROID,
    PLATFORM_CODE_UNKNOWN,
  ];

  static final $core.Map<$core.int, PlatformCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlatformCode? valueOf($core.int value) => _byValue[value];

  const PlatformCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
