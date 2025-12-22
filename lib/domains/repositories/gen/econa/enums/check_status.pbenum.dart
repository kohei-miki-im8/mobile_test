//
//  Generated code. Do not modify.
//  source: econa/enums/check_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 検査ステータス
class CheckStatus extends $pb.ProtobufEnum {
  static const CheckStatus CHECK_STATUS_UNSPECIFIED = CheckStatus._(0, _omitEnumNames ? '' : 'CHECK_STATUS_UNSPECIFIED');
  static const CheckStatus CHECK_STATUS_CHECKING = CheckStatus._(1, _omitEnumNames ? '' : 'CHECK_STATUS_CHECKING');
  static const CheckStatus CHECK_STATUS_APPROVED = CheckStatus._(2, _omitEnumNames ? '' : 'CHECK_STATUS_APPROVED');
  static const CheckStatus CHECK_STATUS_REJECTED = CheckStatus._(3, _omitEnumNames ? '' : 'CHECK_STATUS_REJECTED');

  static const $core.List<CheckStatus> values = <CheckStatus> [
    CHECK_STATUS_UNSPECIFIED,
    CHECK_STATUS_CHECKING,
    CHECK_STATUS_APPROVED,
    CHECK_STATUS_REJECTED,
  ];

  static final $core.Map<$core.int, CheckStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CheckStatus? valueOf($core.int value) => _byValue[value];

  const CheckStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
