//
//  Generated code. Do not modify.
//  source: econa/enums/single_certificate_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 独身証明書類種別
class SingleCertificateType extends $pb.ProtobufEnum {
  static const SingleCertificateType SINGLE_CERTIFICATE_TYPE_UNSPECIFIED = SingleCertificateType._(0, _omitEnumNames ? '' : 'SINGLE_CERTIFICATE_TYPE_UNSPECIFIED');
  static const SingleCertificateType SINGLE_CERTIFICATE_TYPE_SINGLE_CERTIFICATE = SingleCertificateType._(1, _omitEnumNames ? '' : 'SINGLE_CERTIFICATE_TYPE_SINGLE_CERTIFICATE');
  static const SingleCertificateType SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_COPY = SingleCertificateType._(2, _omitEnumNames ? '' : 'SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_COPY');
  static const SingleCertificateType SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_EXCERPT = SingleCertificateType._(3, _omitEnumNames ? '' : 'SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_EXCERPT');

  static const $core.List<SingleCertificateType> values = <SingleCertificateType> [
    SINGLE_CERTIFICATE_TYPE_UNSPECIFIED,
    SINGLE_CERTIFICATE_TYPE_SINGLE_CERTIFICATE,
    SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_COPY,
    SINGLE_CERTIFICATE_TYPE_FAMILY_REGISTER_EXCERPT,
  ];

  static final $core.Map<$core.int, SingleCertificateType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SingleCertificateType? valueOf($core.int value) => _byValue[value];

  const SingleCertificateType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
