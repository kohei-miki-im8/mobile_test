//
//  Generated code. Do not modify.
//  source: econa/enums/messenger_status_badge.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// メッセンジャーステータスバッジの種類
class MessengerStatusBadge extends $pb.ProtobufEnum {
  static const MessengerStatusBadge MESSENGER_STATUS_BADGE_UNSPECIFIED = MessengerStatusBadge._(0, _omitEnumNames ? '' : 'MESSENGER_STATUS_BADGE_UNSPECIFIED');
  static const MessengerStatusBadge MESSENGER_STATUS_BADGE_NEW = MessengerStatusBadge._(1, _omitEnumNames ? '' : 'MESSENGER_STATUS_BADGE_NEW');
  static const MessengerStatusBadge MESSENGER_STATUS_BADGE_SHOOTING_STAR_MATCH = MessengerStatusBadge._(2, _omitEnumNames ? '' : 'MESSENGER_STATUS_BADGE_SHOOTING_STAR_MATCH');
  static const MessengerStatusBadge MESSENGER_STATUS_BADGE_UNSENT = MessengerStatusBadge._(3, _omitEnumNames ? '' : 'MESSENGER_STATUS_BADGE_UNSENT');

  static const $core.List<MessengerStatusBadge> values = <MessengerStatusBadge> [
    MESSENGER_STATUS_BADGE_UNSPECIFIED,
    MESSENGER_STATUS_BADGE_NEW,
    MESSENGER_STATUS_BADGE_SHOOTING_STAR_MATCH,
    MESSENGER_STATUS_BADGE_UNSENT,
  ];

  static final $core.Map<$core.int, MessengerStatusBadge> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessengerStatusBadge? valueOf($core.int value) => _byValue[value];

  const MessengerStatusBadge._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
