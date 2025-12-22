//
//  Generated code. Do not modify.
//  source: econa/enums/verification_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 審査ステータスコード
class VerificationStatusCode extends $pb.ProtobufEnum {
  static const VerificationStatusCode VERIFICATION_STATUS_CODE_UNSPECIFIED = VerificationStatusCode._(0, _omitEnumNames ? '' : 'VERIFICATION_STATUS_CODE_UNSPECIFIED');
  static const VerificationStatusCode VERIFICATION_STATUS_CODE_PENDING = VerificationStatusCode._(1, _omitEnumNames ? '' : 'VERIFICATION_STATUS_CODE_PENDING');
  static const VerificationStatusCode VERIFICATION_STATUS_CODE_APPROVED = VerificationStatusCode._(2, _omitEnumNames ? '' : 'VERIFICATION_STATUS_CODE_APPROVED');
  static const VerificationStatusCode VERIFICATION_STATUS_CODE_REJECTED = VerificationStatusCode._(3, _omitEnumNames ? '' : 'VERIFICATION_STATUS_CODE_REJECTED');
  static const VerificationStatusCode VERIFICATION_STATUS_CODE_EXPIRED = VerificationStatusCode._(4, _omitEnumNames ? '' : 'VERIFICATION_STATUS_CODE_EXPIRED');
  static const VerificationStatusCode VERIFICATION_STATUS_CODE_CANCELLED = VerificationStatusCode._(5, _omitEnumNames ? '' : 'VERIFICATION_STATUS_CODE_CANCELLED');

  static const $core.List<VerificationStatusCode> values = <VerificationStatusCode> [
    VERIFICATION_STATUS_CODE_UNSPECIFIED,
    VERIFICATION_STATUS_CODE_PENDING,
    VERIFICATION_STATUS_CODE_APPROVED,
    VERIFICATION_STATUS_CODE_REJECTED,
    VERIFICATION_STATUS_CODE_EXPIRED,
    VERIFICATION_STATUS_CODE_CANCELLED,
  ];

  static final $core.Map<$core.int, VerificationStatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static VerificationStatusCode? valueOf($core.int value) => _byValue[value];

  const VerificationStatusCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
