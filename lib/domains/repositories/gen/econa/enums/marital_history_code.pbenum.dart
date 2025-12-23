//
//  Generated code. Do not modify.
//  source: econa/enums/marital_history_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 結婚歴コード
class MaritalHistoryCode extends $pb.ProtobufEnum {
  static const MaritalHistoryCode MARITAL_HISTORY_CODE_UNSPECIFIED = MaritalHistoryCode._(0, _omitEnumNames ? '' : 'MARITAL_HISTORY_CODE_UNSPECIFIED');
  static const MaritalHistoryCode MARITAL_HISTORY_CODE_NEVER_MARRIED = MaritalHistoryCode._(1, _omitEnumNames ? '' : 'MARITAL_HISTORY_CODE_NEVER_MARRIED');
  static const MaritalHistoryCode MARITAL_HISTORY_CODE_DIVORCED = MaritalHistoryCode._(2, _omitEnumNames ? '' : 'MARITAL_HISTORY_CODE_DIVORCED');
  static const MaritalHistoryCode MARITAL_HISTORY_CODE_WIDOWED = MaritalHistoryCode._(3, _omitEnumNames ? '' : 'MARITAL_HISTORY_CODE_WIDOWED');
  static const MaritalHistoryCode MARITAL_HISTORY_CODE_OTHER = MaritalHistoryCode._(15, _omitEnumNames ? '' : 'MARITAL_HISTORY_CODE_OTHER');

  static const $core.List<MaritalHistoryCode> values = <MaritalHistoryCode> [
    MARITAL_HISTORY_CODE_UNSPECIFIED,
    MARITAL_HISTORY_CODE_NEVER_MARRIED,
    MARITAL_HISTORY_CODE_DIVORCED,
    MARITAL_HISTORY_CODE_WIDOWED,
    MARITAL_HISTORY_CODE_OTHER,
  ];

  static final $core.Map<$core.int, MaritalHistoryCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MaritalHistoryCode? valueOf($core.int value) => _byValue[value];

  const MaritalHistoryCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
