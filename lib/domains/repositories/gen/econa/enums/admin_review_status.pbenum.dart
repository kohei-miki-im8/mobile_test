//
//  Generated code. Do not modify.
//  source: econa/enums/admin_review_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Admin API向け統一審査ステータス
/// 管理画面向けAPIで使用する審査キューステータスを定義。
/// ユーザー向けのServiceReviewStatusより詳細な状態遷移を表現。
class AdminReviewStatus extends $pb.ProtobufEnum {
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_UNSPECIFIED = AdminReviewStatus._(0, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_UNSPECIFIED');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_PENDING = AdminReviewStatus._(1, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_PENDING');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_REVIEWING = AdminReviewStatus._(2, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_REVIEWING');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_APPROVED = AdminReviewStatus._(3, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_APPROVED');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_AUTO_APPROVED = AdminReviewStatus._(4, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_AUTO_APPROVED');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_REJECTED = AdminReviewStatus._(5, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_REJECTED');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_CANCELLED = AdminReviewStatus._(6, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_CANCELLED');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_EXPIRED = AdminReviewStatus._(7, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_EXPIRED');
  static const AdminReviewStatus ADMIN_REVIEW_STATUS_ERROR = AdminReviewStatus._(15, _omitEnumNames ? '' : 'ADMIN_REVIEW_STATUS_ERROR');

  static const $core.List<AdminReviewStatus> values = <AdminReviewStatus> [
    ADMIN_REVIEW_STATUS_UNSPECIFIED,
    ADMIN_REVIEW_STATUS_PENDING,
    ADMIN_REVIEW_STATUS_REVIEWING,
    ADMIN_REVIEW_STATUS_APPROVED,
    ADMIN_REVIEW_STATUS_AUTO_APPROVED,
    ADMIN_REVIEW_STATUS_REJECTED,
    ADMIN_REVIEW_STATUS_CANCELLED,
    ADMIN_REVIEW_STATUS_EXPIRED,
    ADMIN_REVIEW_STATUS_ERROR,
  ];

  static final $core.Map<$core.int, AdminReviewStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdminReviewStatus? valueOf($core.int value) => _byValue[value];

  const AdminReviewStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
