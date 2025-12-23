//
//  Generated code. Do not modify.
//  source: econa/master/external_services.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 外部サービスコード
class ExternalServiceCode extends $pb.ProtobufEnum {
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_UNSPECIFIED = ExternalServiceCode._(0, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_UNSPECIFIED');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_GOOGLE = ExternalServiceCode._(10, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_GOOGLE');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_ANDROID = ExternalServiceCode._(20, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_ANDROID');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_IOS = ExternalServiceCode._(21, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_IOS');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_WEB = ExternalServiceCode._(22, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_WEB');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_TRAIL = ExternalServiceCode._(23, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_TRAIL');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_TRUST_MATE = ExternalServiceCode._(30, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_TRUST_MATE');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_STRIPE = ExternalServiceCode._(40, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_STRIPE');
  static const ExternalServiceCode EXTERNAL_SERVICE_CODE_REVENUECAT = ExternalServiceCode._(50, _omitEnumNames ? '' : 'EXTERNAL_SERVICE_CODE_REVENUECAT');

  static const $core.List<ExternalServiceCode> values = <ExternalServiceCode> [
    EXTERNAL_SERVICE_CODE_UNSPECIFIED,
    EXTERNAL_SERVICE_CODE_GOOGLE,
    EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_ANDROID,
    EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_IOS,
    EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_WEB,
    EXTERNAL_SERVICE_CODE_GMO_FACIAL_RECOGNITION_EKYC_TRAIL,
    EXTERNAL_SERVICE_CODE_TRUST_MATE,
    EXTERNAL_SERVICE_CODE_STRIPE,
    EXTERNAL_SERVICE_CODE_REVENUECAT,
  ];

  static final $core.Map<$core.int, ExternalServiceCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ExternalServiceCode? valueOf($core.int value) => _byValue[value];

  const ExternalServiceCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
