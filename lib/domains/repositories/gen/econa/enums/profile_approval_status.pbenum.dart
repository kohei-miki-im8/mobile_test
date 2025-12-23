//
//  Generated code. Do not modify.
//  source: econa/enums/profile_approval_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// プロフィール承認ステータス
class ProfileApprovalStatus extends $pb.ProtobufEnum {
  static const ProfileApprovalStatus PROFILE_APPROVAL_STATUS_UNSPECIFIED = ProfileApprovalStatus._(0, _omitEnumNames ? '' : 'PROFILE_APPROVAL_STATUS_UNSPECIFIED');
  static const ProfileApprovalStatus PROFILE_APPROVAL_STATUS_PENDING = ProfileApprovalStatus._(1, _omitEnumNames ? '' : 'PROFILE_APPROVAL_STATUS_PENDING');
  static const ProfileApprovalStatus PROFILE_APPROVAL_STATUS_IN_REVIEW = ProfileApprovalStatus._(2, _omitEnumNames ? '' : 'PROFILE_APPROVAL_STATUS_IN_REVIEW');
  static const ProfileApprovalStatus PROFILE_APPROVAL_STATUS_APPROVED = ProfileApprovalStatus._(3, _omitEnumNames ? '' : 'PROFILE_APPROVAL_STATUS_APPROVED');
  static const ProfileApprovalStatus PROFILE_APPROVAL_STATUS_REJECTED = ProfileApprovalStatus._(4, _omitEnumNames ? '' : 'PROFILE_APPROVAL_STATUS_REJECTED');
  static const ProfileApprovalStatus PROFILE_APPROVAL_STATUS_AUTO_APPROVED = ProfileApprovalStatus._(5, _omitEnumNames ? '' : 'PROFILE_APPROVAL_STATUS_AUTO_APPROVED');
  static const ProfileApprovalStatus PROFILE_APPROVAL_STATUS_CANCELLED = ProfileApprovalStatus._(6, _omitEnumNames ? '' : 'PROFILE_APPROVAL_STATUS_CANCELLED');

  static const $core.List<ProfileApprovalStatus> values = <ProfileApprovalStatus> [
    PROFILE_APPROVAL_STATUS_UNSPECIFIED,
    PROFILE_APPROVAL_STATUS_PENDING,
    PROFILE_APPROVAL_STATUS_IN_REVIEW,
    PROFILE_APPROVAL_STATUS_APPROVED,
    PROFILE_APPROVAL_STATUS_REJECTED,
    PROFILE_APPROVAL_STATUS_AUTO_APPROVED,
    PROFILE_APPROVAL_STATUS_CANCELLED,
  ];

  static final $core.Map<$core.int, ProfileApprovalStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProfileApprovalStatus? valueOf($core.int value) => _byValue[value];

  const ProfileApprovalStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
