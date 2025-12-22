//
//  Generated code. Do not modify.
//  source: econa/enums/user_activity_tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 活動タグ
class UserActivityTag extends $pb.ProtobufEnum {
  static const UserActivityTag USER_ACTIVITY_TAG_UNSPECIFIED = UserActivityTag._(0, _omitEnumNames ? '' : 'USER_ACTIVITY_TAG_UNSPECIFIED');
  static const UserActivityTag USER_ACTIVITY_TAG_ONLINE = UserActivityTag._(1, _omitEnumNames ? '' : 'USER_ACTIVITY_TAG_ONLINE');
  static const UserActivityTag USER_ACTIVITY_TAG_24_HOURS = UserActivityTag._(2, _omitEnumNames ? '' : 'USER_ACTIVITY_TAG_24_HOURS');
  static const UserActivityTag USER_ACTIVITY_TAG_3_DAYS = UserActivityTag._(3, _omitEnumNames ? '' : 'USER_ACTIVITY_TAG_3_DAYS');
  static const UserActivityTag USER_ACTIVITY_TAG_1_WEEK = UserActivityTag._(4, _omitEnumNames ? '' : 'USER_ACTIVITY_TAG_1_WEEK');
  static const UserActivityTag USER_ACTIVITY_TAG_1_MONTH = UserActivityTag._(5, _omitEnumNames ? '' : 'USER_ACTIVITY_TAG_1_MONTH');
  static const UserActivityTag USER_ACTIVITY_TAG_OVER_1_MONTHS = UserActivityTag._(6, _omitEnumNames ? '' : 'USER_ACTIVITY_TAG_OVER_1_MONTHS');

  static const $core.List<UserActivityTag> values = <UserActivityTag> [
    USER_ACTIVITY_TAG_UNSPECIFIED,
    USER_ACTIVITY_TAG_ONLINE,
    USER_ACTIVITY_TAG_24_HOURS,
    USER_ACTIVITY_TAG_3_DAYS,
    USER_ACTIVITY_TAG_1_WEEK,
    USER_ACTIVITY_TAG_1_MONTH,
    USER_ACTIVITY_TAG_OVER_1_MONTHS,
  ];

  static final $core.Map<$core.int, UserActivityTag> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserActivityTag? valueOf($core.int value) => _byValue[value];

  const UserActivityTag._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
