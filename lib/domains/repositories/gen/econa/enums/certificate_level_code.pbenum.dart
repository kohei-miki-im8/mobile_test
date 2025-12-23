//
//  Generated code. Do not modify.
//  source: econa/enums/certificate_level_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 本人確認レベルコード
class CertificateLevelCode extends $pb.ProtobufEnum {
  static const CertificateLevelCode CERTIFICATE_LEVEL_CODE_UNSPECIFIED = CertificateLevelCode._(0, _omitEnumNames ? '' : 'CERTIFICATE_LEVEL_CODE_UNSPECIFIED');
  static const CertificateLevelCode CERTIFICATE_LEVEL_CODE_UNVERIFIED = CertificateLevelCode._(1, _omitEnumNames ? '' : 'CERTIFICATE_LEVEL_CODE_UNVERIFIED');
  static const CertificateLevelCode CERTIFICATE_LEVEL_CODE_VERIFIED = CertificateLevelCode._(2, _omitEnumNames ? '' : 'CERTIFICATE_LEVEL_CODE_VERIFIED');
  static const CertificateLevelCode CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED = CertificateLevelCode._(3, _omitEnumNames ? '' : 'CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED');
  static const CertificateLevelCode CERTIFICATE_LEVEL_CODE_PENDING_REVIEW = CertificateLevelCode._(4, _omitEnumNames ? '' : 'CERTIFICATE_LEVEL_CODE_PENDING_REVIEW');

  static const $core.List<CertificateLevelCode> values = <CertificateLevelCode> [
    CERTIFICATE_LEVEL_CODE_UNSPECIFIED,
    CERTIFICATE_LEVEL_CODE_UNVERIFIED,
    CERTIFICATE_LEVEL_CODE_VERIFIED,
    CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED,
    CERTIFICATE_LEVEL_CODE_PENDING_REVIEW,
  ];

  static final $core.Map<$core.int, CertificateLevelCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CertificateLevelCode? valueOf($core.int value) => _byValue[value];

  const CertificateLevelCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
