//
//  Generated code. Do not modify.
//  source: econa/enums/announcement_target_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// お知らせ対象ユーザータイプ
class AnnouncementTargetType extends $pb.ProtobufEnum {
  static const AnnouncementTargetType ANNOUNCEMENT_TARGET_TYPE_UNSPECIFIED = AnnouncementTargetType._(0, _omitEnumNames ? '' : 'ANNOUNCEMENT_TARGET_TYPE_UNSPECIFIED');
  static const AnnouncementTargetType ANNOUNCEMENT_TARGET_TYPE_ALL = AnnouncementTargetType._(1, _omitEnumNames ? '' : 'ANNOUNCEMENT_TARGET_TYPE_ALL');
  static const AnnouncementTargetType ANNOUNCEMENT_TARGET_TYPE_PREMIUM = AnnouncementTargetType._(2, _omitEnumNames ? '' : 'ANNOUNCEMENT_TARGET_TYPE_PREMIUM');
  static const AnnouncementTargetType ANNOUNCEMENT_TARGET_TYPE_FREE = AnnouncementTargetType._(3, _omitEnumNames ? '' : 'ANNOUNCEMENT_TARGET_TYPE_FREE');
  static const AnnouncementTargetType ANNOUNCEMENT_TARGET_TYPE_NEW_USER = AnnouncementTargetType._(4, _omitEnumNames ? '' : 'ANNOUNCEMENT_TARGET_TYPE_NEW_USER');
  static const AnnouncementTargetType ANNOUNCEMENT_TARGET_TYPE_ACTIVE = AnnouncementTargetType._(5, _omitEnumNames ? '' : 'ANNOUNCEMENT_TARGET_TYPE_ACTIVE');

  static const $core.List<AnnouncementTargetType> values = <AnnouncementTargetType> [
    ANNOUNCEMENT_TARGET_TYPE_UNSPECIFIED,
    ANNOUNCEMENT_TARGET_TYPE_ALL,
    ANNOUNCEMENT_TARGET_TYPE_PREMIUM,
    ANNOUNCEMENT_TARGET_TYPE_FREE,
    ANNOUNCEMENT_TARGET_TYPE_NEW_USER,
    ANNOUNCEMENT_TARGET_TYPE_ACTIVE,
  ];

  static final $core.Map<$core.int, AnnouncementTargetType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AnnouncementTargetType? valueOf($core.int value) => _byValue[value];

  const AnnouncementTargetType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
