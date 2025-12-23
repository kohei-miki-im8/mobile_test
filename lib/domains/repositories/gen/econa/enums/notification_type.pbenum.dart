//
//  Generated code. Do not modify.
//  source: econa/enums/notification_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 通知タイプ
class NotificationType extends $pb.ProtobufEnum {
  static const NotificationType NOTIFICATION_TYPE_UNSPECIFIED = NotificationType._(0, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_UNSPECIFIED');
  static const NotificationType NOTIFICATION_TYPE_PUSH_NOTICE = NotificationType._(1, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PUSH_NOTICE');
  static const NotificationType NOTIFICATION_TYPE_PUSH_NOTICE_LIKE = NotificationType._(2, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PUSH_NOTICE_LIKE');
  static const NotificationType NOTIFICATION_TYPE_PUSH_NOTICE_MATCH = NotificationType._(3, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PUSH_NOTICE_MATCH');
  static const NotificationType NOTIFICATION_TYPE_PUSH_NOTICE_MESSAGE = NotificationType._(4, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PUSH_NOTICE_MESSAGE');
  static const NotificationType NOTIFICATION_TYPE_PUSH_NOTICE_ANNOUNCEMENT = NotificationType._(5, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PUSH_NOTICE_ANNOUNCEMENT');
  static const NotificationType NOTIFICATION_TYPE_EMAIL_NOTICE = NotificationType._(6, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_EMAIL_NOTICE');
  static const NotificationType NOTIFICATION_TYPE_EMAIL_NOTICE_LIKE = NotificationType._(7, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_EMAIL_NOTICE_LIKE');
  static const NotificationType NOTIFICATION_TYPE_EMAIL_NOTICE_MATCH = NotificationType._(8, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_EMAIL_NOTICE_MATCH');
  static const NotificationType NOTIFICATION_TYPE_EMAIL_NOTICE_MESSAGE = NotificationType._(9, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_EMAIL_NOTICE_MESSAGE');
  static const NotificationType NOTIFICATION_TYPE_EMAIL_NOTICE_ANNOUNCEMENT = NotificationType._(10, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_EMAIL_NOTICE_ANNOUNCEMENT');
  static const NotificationType NOTIFICATION_TYPE_PROFILE_NICKNAME_APPROVAL = NotificationType._(11, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PROFILE_NICKNAME_APPROVAL');
  static const NotificationType NOTIFICATION_TYPE_PROFILE_PHOTO_APPROVAL = NotificationType._(12, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PROFILE_PHOTO_APPROVAL');
  static const NotificationType NOTIFICATION_TYPE_PROFILE_INTRODUCTORY_APPROVAL = NotificationType._(13, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PROFILE_INTRODUCTORY_APPROVAL');
  static const NotificationType NOTIFICATION_TYPE_FIRST_MESSAGE_APPROVED = NotificationType._(14, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_FIRST_MESSAGE_APPROVED');
  static const NotificationType NOTIFICATION_TYPE_FIRST_MESSAGE_REJECTED = NotificationType._(15, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_FIRST_MESSAGE_REJECTED');
  static const NotificationType NOTIFICATION_TYPE_PERSONAL_VERIFICATION_COMPLETED = NotificationType._(16, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_PERSONAL_VERIFICATION_COMPLETED');
  static const NotificationType NOTIFICATION_TYPE_SINGLE_CERTIFICATE_APPROVED = NotificationType._(17, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_SINGLE_CERTIFICATE_APPROVED');
  static const NotificationType NOTIFICATION_TYPE_SINGLE_CERTIFICATE_REJECTED = NotificationType._(18, _omitEnumNames ? '' : 'NOTIFICATION_TYPE_SINGLE_CERTIFICATE_REJECTED');

  static const $core.List<NotificationType> values = <NotificationType> [
    NOTIFICATION_TYPE_UNSPECIFIED,
    NOTIFICATION_TYPE_PUSH_NOTICE,
    NOTIFICATION_TYPE_PUSH_NOTICE_LIKE,
    NOTIFICATION_TYPE_PUSH_NOTICE_MATCH,
    NOTIFICATION_TYPE_PUSH_NOTICE_MESSAGE,
    NOTIFICATION_TYPE_PUSH_NOTICE_ANNOUNCEMENT,
    NOTIFICATION_TYPE_EMAIL_NOTICE,
    NOTIFICATION_TYPE_EMAIL_NOTICE_LIKE,
    NOTIFICATION_TYPE_EMAIL_NOTICE_MATCH,
    NOTIFICATION_TYPE_EMAIL_NOTICE_MESSAGE,
    NOTIFICATION_TYPE_EMAIL_NOTICE_ANNOUNCEMENT,
    NOTIFICATION_TYPE_PROFILE_NICKNAME_APPROVAL,
    NOTIFICATION_TYPE_PROFILE_PHOTO_APPROVAL,
    NOTIFICATION_TYPE_PROFILE_INTRODUCTORY_APPROVAL,
    NOTIFICATION_TYPE_FIRST_MESSAGE_APPROVED,
    NOTIFICATION_TYPE_FIRST_MESSAGE_REJECTED,
    NOTIFICATION_TYPE_PERSONAL_VERIFICATION_COMPLETED,
    NOTIFICATION_TYPE_SINGLE_CERTIFICATE_APPROVED,
    NOTIFICATION_TYPE_SINGLE_CERTIFICATE_REJECTED,
  ];

  static final $core.Map<$core.int, NotificationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NotificationType? valueOf($core.int value) => _byValue[value];

  const NotificationType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
