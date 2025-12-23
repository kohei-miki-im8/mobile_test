//
//  Generated code. Do not modify.
//  source: econa/enums/profile_approval_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// プロフィール承認タイプ
class ProfileApprovalType extends $pb.ProtobufEnum {
  static const ProfileApprovalType PROFILE_APPROVAL_TYPE_UNSPECIFIED = ProfileApprovalType._(0, _omitEnumNames ? '' : 'PROFILE_APPROVAL_TYPE_UNSPECIFIED');
  static const ProfileApprovalType PROFILE_APPROVAL_TYPE_NICKNAME = ProfileApprovalType._(1, _omitEnumNames ? '' : 'PROFILE_APPROVAL_TYPE_NICKNAME');
  static const ProfileApprovalType PROFILE_APPROVAL_TYPE_INTRODUCTORY = ProfileApprovalType._(2, _omitEnumNames ? '' : 'PROFILE_APPROVAL_TYPE_INTRODUCTORY');
  static const ProfileApprovalType PROFILE_APPROVAL_TYPE_PHOTO = ProfileApprovalType._(3, _omitEnumNames ? '' : 'PROFILE_APPROVAL_TYPE_PHOTO');

  static const $core.List<ProfileApprovalType> values = <ProfileApprovalType> [
    PROFILE_APPROVAL_TYPE_UNSPECIFIED,
    PROFILE_APPROVAL_TYPE_NICKNAME,
    PROFILE_APPROVAL_TYPE_INTRODUCTORY,
    PROFILE_APPROVAL_TYPE_PHOTO,
  ];

  static final $core.Map<$core.int, ProfileApprovalType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProfileApprovalType? valueOf($core.int value) => _byValue[value];

  const ProfileApprovalType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
