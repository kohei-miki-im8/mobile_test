//
//  Generated code. Do not modify.
//  source: econa/enums/user_role_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// UserRoleCode ユーザーロールコード
class UserRoleCode extends $pb.ProtobufEnum {
  static const UserRoleCode USER_ROLE_CODE_UNSPECIFIED = UserRoleCode._(0, _omitEnumNames ? '' : 'USER_ROLE_CODE_UNSPECIFIED');
  static const UserRoleCode USER_ROLE_CODE_COMMON = UserRoleCode._(1, _omitEnumNames ? '' : 'USER_ROLE_CODE_COMMON');
  static const UserRoleCode USER_ROLE_CODE_DEVELOPER = UserRoleCode._(2, _omitEnumNames ? '' : 'USER_ROLE_CODE_DEVELOPER');
  static const UserRoleCode USER_ROLE_CODE_OPERATOR = UserRoleCode._(3, _omitEnumNames ? '' : 'USER_ROLE_CODE_OPERATOR');

  static const $core.List<UserRoleCode> values = <UserRoleCode> [
    USER_ROLE_CODE_UNSPECIFIED,
    USER_ROLE_CODE_COMMON,
    USER_ROLE_CODE_DEVELOPER,
    USER_ROLE_CODE_OPERATOR,
  ];

  static final $core.Map<$core.int, UserRoleCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserRoleCode? valueOf($core.int value) => _byValue[value];

  const UserRoleCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
