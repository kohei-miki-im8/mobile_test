//
//  Generated code. Do not modify.
//  source: econa/enums/withdrawal_reason_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// WithdrawalReasonCode: 退会理由コード
/// ユーザーがサービスを退会する理由を分類するための列挙型
class WithdrawalReasonCode extends $pb.ProtobufEnum {
  static const WithdrawalReasonCode WITHDRAWAL_REASON_CODE_UNSPECIFIED = WithdrawalReasonCode._(0, _omitEnumNames ? '' : 'WITHDRAWAL_REASON_CODE_UNSPECIFIED');
  static const WithdrawalReasonCode WITHDRAWAL_REASON_CODE_MATCHED_IN_LAVI = WithdrawalReasonCode._(1, _omitEnumNames ? '' : 'WITHDRAWAL_REASON_CODE_MATCHED_IN_LAVI');
  static const WithdrawalReasonCode WITHDRAWAL_REASON_CODE_MATCHED_ELSEWHERE = WithdrawalReasonCode._(2, _omitEnumNames ? '' : 'WITHDRAWAL_REASON_CODE_MATCHED_ELSEWHERE');
  static const WithdrawalReasonCode WITHDRAWAL_REASON_CODE_NO_GOOD_TYPE = WithdrawalReasonCode._(3, _omitEnumNames ? '' : 'WITHDRAWAL_REASON_CODE_NO_GOOD_TYPE');
  static const WithdrawalReasonCode WITHDRAWAL_REASON_CODE_NO_GOOD_MATCH = WithdrawalReasonCode._(4, _omitEnumNames ? '' : 'WITHDRAWAL_REASON_CODE_NO_GOOD_MATCH');
  static const WithdrawalReasonCode WITHDRAWAL_REASON_CODE_NO_GOOD_USAGE = WithdrawalReasonCode._(5, _omitEnumNames ? '' : 'WITHDRAWAL_REASON_CODE_NO_GOOD_USAGE');
  static const WithdrawalReasonCode WITHDRAWAL_REASON_CODE_OTHER = WithdrawalReasonCode._(15, _omitEnumNames ? '' : 'WITHDRAWAL_REASON_CODE_OTHER');

  static const $core.List<WithdrawalReasonCode> values = <WithdrawalReasonCode> [
    WITHDRAWAL_REASON_CODE_UNSPECIFIED,
    WITHDRAWAL_REASON_CODE_MATCHED_IN_LAVI,
    WITHDRAWAL_REASON_CODE_MATCHED_ELSEWHERE,
    WITHDRAWAL_REASON_CODE_NO_GOOD_TYPE,
    WITHDRAWAL_REASON_CODE_NO_GOOD_MATCH,
    WITHDRAWAL_REASON_CODE_NO_GOOD_USAGE,
    WITHDRAWAL_REASON_CODE_OTHER,
  ];

  static final $core.Map<$core.int, WithdrawalReasonCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WithdrawalReasonCode? valueOf($core.int value) => _byValue[value];

  const WithdrawalReasonCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
