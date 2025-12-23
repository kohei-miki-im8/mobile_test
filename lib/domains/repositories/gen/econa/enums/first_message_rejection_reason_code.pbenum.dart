//
//  Generated code. Do not modify.
//  source: econa/enums/first_message_rejection_reason_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 初回メッセージ却下理由コード
class FirstMessageRejectionReasonCode extends $pb.ProtobufEnum {
  static const FirstMessageRejectionReasonCode FIRST_MESSAGE_REJECTION_REASON_CODE_UNSPECIFIED = FirstMessageRejectionReasonCode._(0, _omitEnumNames ? '' : 'FIRST_MESSAGE_REJECTION_REASON_CODE_UNSPECIFIED');
  static const FirstMessageRejectionReasonCode FIRST_MESSAGE_REJECTION_REASON_CODE_NG_WORD = FirstMessageRejectionReasonCode._(1, _omitEnumNames ? '' : 'FIRST_MESSAGE_REJECTION_REASON_CODE_NG_WORD');
  static const FirstMessageRejectionReasonCode FIRST_MESSAGE_REJECTION_REASON_CODE_INAPPROPRIATE_CONTENT = FirstMessageRejectionReasonCode._(2, _omitEnumNames ? '' : 'FIRST_MESSAGE_REJECTION_REASON_CODE_INAPPROPRIATE_CONTENT');
  static const FirstMessageRejectionReasonCode FIRST_MESSAGE_REJECTION_REASON_CODE_SPAM = FirstMessageRejectionReasonCode._(3, _omitEnumNames ? '' : 'FIRST_MESSAGE_REJECTION_REASON_CODE_SPAM');

  static const $core.List<FirstMessageRejectionReasonCode> values = <FirstMessageRejectionReasonCode> [
    FIRST_MESSAGE_REJECTION_REASON_CODE_UNSPECIFIED,
    FIRST_MESSAGE_REJECTION_REASON_CODE_NG_WORD,
    FIRST_MESSAGE_REJECTION_REASON_CODE_INAPPROPRIATE_CONTENT,
    FIRST_MESSAGE_REJECTION_REASON_CODE_SPAM,
  ];

  static final $core.Map<$core.int, FirstMessageRejectionReasonCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FirstMessageRejectionReasonCode? valueOf($core.int value) => _byValue[value];

  const FirstMessageRejectionReasonCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
