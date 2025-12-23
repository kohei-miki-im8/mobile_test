//
//  Generated code. Do not modify.
//  source: econa/enums/profile_rejection_reason_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// プロフィール却下理由コード
class ProfileRejectionReasonCode extends $pb.ProtobufEnum {
  static const ProfileRejectionReasonCode PROFILE_REJECTION_REASON_CODE_UNSPECIFIED = ProfileRejectionReasonCode._(0, _omitEnumNames ? '' : 'PROFILE_REJECTION_REASON_CODE_UNSPECIFIED');
  static const ProfileRejectionReasonCode PROFILE_REJECTION_REASON_CODE_INAPPROPRIATE_CONTENT = ProfileRejectionReasonCode._(1, _omitEnumNames ? '' : 'PROFILE_REJECTION_REASON_CODE_INAPPROPRIATE_CONTENT');
  static const ProfileRejectionReasonCode PROFILE_REJECTION_REASON_CODE_NO_HUMAN_IN_IMAGE = ProfileRejectionReasonCode._(2, _omitEnumNames ? '' : 'PROFILE_REJECTION_REASON_CODE_NO_HUMAN_IN_IMAGE');

  static const $core.List<ProfileRejectionReasonCode> values = <ProfileRejectionReasonCode> [
    PROFILE_REJECTION_REASON_CODE_UNSPECIFIED,
    PROFILE_REJECTION_REASON_CODE_INAPPROPRIATE_CONTENT,
    PROFILE_REJECTION_REASON_CODE_NO_HUMAN_IN_IMAGE,
  ];

  static final $core.Map<$core.int, ProfileRejectionReasonCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProfileRejectionReasonCode? valueOf($core.int value) => _byValue[value];

  const ProfileRejectionReasonCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
