//
//  Generated code. Do not modify.
//  source: econa/enums/setting_group.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 設定グループ
class SettingGroup extends $pb.ProtobufEnum {
  static const SettingGroup SETTING_GROUP_UNSPECIFIED = SettingGroup._(0, _omitEnumNames ? '' : 'SETTING_GROUP_UNSPECIFIED');
  static const SettingGroup SETTING_GROUP_CHAT = SettingGroup._(1, _omitEnumNames ? '' : 'SETTING_GROUP_CHAT');

  static const $core.List<SettingGroup> values = <SettingGroup> [
    SETTING_GROUP_UNSPECIFIED,
    SETTING_GROUP_CHAT,
  ];

  static final $core.Map<$core.int, SettingGroup> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SettingGroup? valueOf($core.int value) => _byValue[value];

  const SettingGroup._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
