//
//  Generated code. Do not modify.
//  source: econa/enums/rejection_reason_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 却下理由コード
class RejectionReasonCode extends $pb.ProtobufEnum {
  static const RejectionReasonCode REJECTION_REASON_CODE_UNSPECIFIED = RejectionReasonCode._(0, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_UNSPECIFIED');
  static const RejectionReasonCode REJECTION_REASON_CODE_INVALID_DOCUMENT = RejectionReasonCode._(1, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_INVALID_DOCUMENT');
  static const RejectionReasonCode REJECTION_REASON_CODE_EXPIRED_DOCUMENT = RejectionReasonCode._(2, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_EXPIRED_DOCUMENT');
  static const RejectionReasonCode REJECTION_REASON_CODE_UNREADABLE = RejectionReasonCode._(3, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_UNREADABLE');
  static const RejectionReasonCode REJECTION_REASON_CODE_INCOMPLETE = RejectionReasonCode._(4, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_INCOMPLETE');
  static const RejectionReasonCode REJECTION_REASON_CODE_WRONG_PERSON = RejectionReasonCode._(5, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_WRONG_PERSON');
  static const RejectionReasonCode REJECTION_REASON_CODE_FAKE_DOCUMENT = RejectionReasonCode._(6, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_FAKE_DOCUMENT');
  static const RejectionReasonCode REJECTION_REASON_CODE_OTHER = RejectionReasonCode._(99, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_OTHER');
  static const RejectionReasonCode REJECTION_REASON_CODE_DUPLICATE_SUSPECTED = RejectionReasonCode._(10, _omitEnumNames ? '' : 'REJECTION_REASON_CODE_DUPLICATE_SUSPECTED');

  static const $core.List<RejectionReasonCode> values = <RejectionReasonCode> [
    REJECTION_REASON_CODE_UNSPECIFIED,
    REJECTION_REASON_CODE_INVALID_DOCUMENT,
    REJECTION_REASON_CODE_EXPIRED_DOCUMENT,
    REJECTION_REASON_CODE_UNREADABLE,
    REJECTION_REASON_CODE_INCOMPLETE,
    REJECTION_REASON_CODE_WRONG_PERSON,
    REJECTION_REASON_CODE_FAKE_DOCUMENT,
    REJECTION_REASON_CODE_OTHER,
    REJECTION_REASON_CODE_DUPLICATE_SUSPECTED,
  ];

  static final $core.Map<$core.int, RejectionReasonCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RejectionReasonCode? valueOf($core.int value) => _byValue[value];

  const RejectionReasonCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
