//
//  Generated code. Do not modify.
//  source: econa/enums/account_status_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// アカウントステータス
class AccountStatusCode extends $pb.ProtobufEnum {
  static const AccountStatusCode ACCOUNT_STATUS_CODE_UNSPECIFIED = AccountStatusCode._(0, _omitEnumNames ? '' : 'ACCOUNT_STATUS_CODE_UNSPECIFIED');
  static const AccountStatusCode ACCOUNT_STATUS_CODE_REGISTERING = AccountStatusCode._(1, _omitEnumNames ? '' : 'ACCOUNT_STATUS_CODE_REGISTERING');
  static const AccountStatusCode ACCOUNT_STATUS_CODE_ACTIVE = AccountStatusCode._(2, _omitEnumNames ? '' : 'ACCOUNT_STATUS_CODE_ACTIVE');
  static const AccountStatusCode ACCOUNT_STATUS_CODE_LIMITED = AccountStatusCode._(3, _omitEnumNames ? '' : 'ACCOUNT_STATUS_CODE_LIMITED');
  static const AccountStatusCode ACCOUNT_STATUS_CODE_BANNED = AccountStatusCode._(4, _omitEnumNames ? '' : 'ACCOUNT_STATUS_CODE_BANNED');
  static const AccountStatusCode ACCOUNT_STATUS_CODE_REMOVED = AccountStatusCode._(5, _omitEnumNames ? '' : 'ACCOUNT_STATUS_CODE_REMOVED');

  static const $core.List<AccountStatusCode> values = <AccountStatusCode> [
    ACCOUNT_STATUS_CODE_UNSPECIFIED,
    ACCOUNT_STATUS_CODE_REGISTERING,
    ACCOUNT_STATUS_CODE_ACTIVE,
    ACCOUNT_STATUS_CODE_LIMITED,
    ACCOUNT_STATUS_CODE_BANNED,
    ACCOUNT_STATUS_CODE_REMOVED,
  ];

  static final $core.Map<$core.int, AccountStatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccountStatusCode? valueOf($core.int value) => _byValue[value];

  const AccountStatusCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
