//
//  Generated code. Do not modify.
//  source: econa/enums/user_agreement_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// ユーザー利用規約タイプ
class UserAgreementType extends $pb.ProtobufEnum {
  static const UserAgreementType USER_AGREEMENT_TYPE_UNSPECIFIED = UserAgreementType._(0, _omitEnumNames ? '' : 'USER_AGREEMENT_TYPE_UNSPECIFIED');
  static const UserAgreementType USER_AGREEMENT_TYPE_OVER_18_TO_49_SINGLE = UserAgreementType._(1, _omitEnumNames ? '' : 'USER_AGREEMENT_TYPE_OVER_18_TO_49_SINGLE');
  static const UserAgreementType USER_AGREEMENT_TYPE_TERMS_OF_SERVICE = UserAgreementType._(2, _omitEnumNames ? '' : 'USER_AGREEMENT_TYPE_TERMS_OF_SERVICE');
  static const UserAgreementType USER_AGREEMENT_TYPE_PRIVACY_POLICY = UserAgreementType._(3, _omitEnumNames ? '' : 'USER_AGREEMENT_TYPE_PRIVACY_POLICY');
  static const UserAgreementType USER_AGREEMENT_TYPE_AI_CHAT_HISTORY_REFERENCE = UserAgreementType._(4, _omitEnumNames ? '' : 'USER_AGREEMENT_TYPE_AI_CHAT_HISTORY_REFERENCE');

  static const $core.List<UserAgreementType> values = <UserAgreementType> [
    USER_AGREEMENT_TYPE_UNSPECIFIED,
    USER_AGREEMENT_TYPE_OVER_18_TO_49_SINGLE,
    USER_AGREEMENT_TYPE_TERMS_OF_SERVICE,
    USER_AGREEMENT_TYPE_PRIVACY_POLICY,
    USER_AGREEMENT_TYPE_AI_CHAT_HISTORY_REFERENCE,
  ];

  static final $core.Map<$core.int, UserAgreementType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserAgreementType? valueOf($core.int value) => _byValue[value];

  const UserAgreementType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
