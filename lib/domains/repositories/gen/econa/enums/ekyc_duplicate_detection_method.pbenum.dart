//
//  Generated code. Do not modify.
//  source: econa/enums/ekyc_duplicate_detection_method.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// eKYC重複検出方法
class EKYCDuplicateDetectionMethod extends $pb.ProtobufEnum {
  static const EKYCDuplicateDetectionMethod EKYC_DUPLICATE_DETECTION_METHOD_UNSPECIFIED = EKYCDuplicateDetectionMethod._(0, _omitEnumNames ? '' : 'EKYC_DUPLICATE_DETECTION_METHOD_UNSPECIFIED');
  static const EKYCDuplicateDetectionMethod EKYC_DUPLICATE_DETECTION_METHOD_CARD_ID = EKYCDuplicateDetectionMethod._(1, _omitEnumNames ? '' : 'EKYC_DUPLICATE_DETECTION_METHOD_CARD_ID');
  static const EKYCDuplicateDetectionMethod EKYC_DUPLICATE_DETECTION_METHOD_PERSONAL_INFO = EKYCDuplicateDetectionMethod._(2, _omitEnumNames ? '' : 'EKYC_DUPLICATE_DETECTION_METHOD_PERSONAL_INFO');
  static const EKYCDuplicateDetectionMethod EKYC_DUPLICATE_DETECTION_METHOD_ALL_FIELDS = EKYCDuplicateDetectionMethod._(3, _omitEnumNames ? '' : 'EKYC_DUPLICATE_DETECTION_METHOD_ALL_FIELDS');
  static const EKYCDuplicateDetectionMethod EKYC_DUPLICATE_DETECTION_METHOD_SIMILAR_NAME = EKYCDuplicateDetectionMethod._(4, _omitEnumNames ? '' : 'EKYC_DUPLICATE_DETECTION_METHOD_SIMILAR_NAME');
  static const EKYCDuplicateDetectionMethod EKYC_DUPLICATE_DETECTION_METHOD_SAME_IP = EKYCDuplicateDetectionMethod._(5, _omitEnumNames ? '' : 'EKYC_DUPLICATE_DETECTION_METHOD_SAME_IP');

  static const $core.List<EKYCDuplicateDetectionMethod> values = <EKYCDuplicateDetectionMethod> [
    EKYC_DUPLICATE_DETECTION_METHOD_UNSPECIFIED,
    EKYC_DUPLICATE_DETECTION_METHOD_CARD_ID,
    EKYC_DUPLICATE_DETECTION_METHOD_PERSONAL_INFO,
    EKYC_DUPLICATE_DETECTION_METHOD_ALL_FIELDS,
    EKYC_DUPLICATE_DETECTION_METHOD_SIMILAR_NAME,
    EKYC_DUPLICATE_DETECTION_METHOD_SAME_IP,
  ];

  static final $core.Map<$core.int, EKYCDuplicateDetectionMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static EKYCDuplicateDetectionMethod? valueOf($core.int value) => _byValue[value];

  const EKYCDuplicateDetectionMethod._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
