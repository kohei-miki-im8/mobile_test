//
//  Generated code. Do not modify.
//  source: econa/enums/service_review_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Site API向け統一審査ステータス
/// ユーザー向けAPIで返却する審査ステータスを定義。
/// 管理画面向けのAdminReviewStatusとは別に、ユーザーに見せる情報を制限している。
class ServiceReviewStatus extends $pb.ProtobufEnum {
  static const ServiceReviewStatus SERVICE_REVIEW_STATUS_UNSPECIFIED = ServiceReviewStatus._(0, _omitEnumNames ? '' : 'SERVICE_REVIEW_STATUS_UNSPECIFIED');
  static const ServiceReviewStatus SERVICE_REVIEW_STATUS_REVIEWING = ServiceReviewStatus._(1, _omitEnumNames ? '' : 'SERVICE_REVIEW_STATUS_REVIEWING');
  static const ServiceReviewStatus SERVICE_REVIEW_STATUS_APPROVED = ServiceReviewStatus._(2, _omitEnumNames ? '' : 'SERVICE_REVIEW_STATUS_APPROVED');
  static const ServiceReviewStatus SERVICE_REVIEW_STATUS_REJECTED = ServiceReviewStatus._(3, _omitEnumNames ? '' : 'SERVICE_REVIEW_STATUS_REJECTED');
  static const ServiceReviewStatus SERVICE_REVIEW_STATUS_CANCELLED = ServiceReviewStatus._(4, _omitEnumNames ? '' : 'SERVICE_REVIEW_STATUS_CANCELLED');
  static const ServiceReviewStatus SERVICE_REVIEW_STATUS_ERROR = ServiceReviewStatus._(15, _omitEnumNames ? '' : 'SERVICE_REVIEW_STATUS_ERROR');

  static const $core.List<ServiceReviewStatus> values = <ServiceReviewStatus> [
    SERVICE_REVIEW_STATUS_UNSPECIFIED,
    SERVICE_REVIEW_STATUS_REVIEWING,
    SERVICE_REVIEW_STATUS_APPROVED,
    SERVICE_REVIEW_STATUS_REJECTED,
    SERVICE_REVIEW_STATUS_CANCELLED,
    SERVICE_REVIEW_STATUS_ERROR,
  ];

  static final $core.Map<$core.int, ServiceReviewStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceReviewStatus? valueOf($core.int value) => _byValue[value];

  const ServiceReviewStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
