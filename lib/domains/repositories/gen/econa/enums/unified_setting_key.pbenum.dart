//
//  Generated code. Do not modify.
//  source: econa/enums/unified_setting_key.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 汎用設定キー
class UnifiedSettingKey extends $pb.ProtobufEnum {
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_UNSPECIFIED = UnifiedSettingKey._(0, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_UNSPECIFIED');
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_AUTO_MATCHING = UnifiedSettingKey._(1, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_AUTO_MATCHING');
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_INITIAL_MESSAGE = UnifiedSettingKey._(2, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_INITIAL_MESSAGE');
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_IS_PERSONA_GREETING_DEFAULT = UnifiedSettingKey._(3, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_IS_PERSONA_GREETING_DEFAULT');
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_LEAVE_FOOTPRINT = UnifiedSettingKey._(4, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_LEAVE_FOOTPRINT');
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_LIKE_RECEIVE_LIMIT = UnifiedSettingKey._(5, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_LIKE_RECEIVE_LIMIT');
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_OFFLINE_MODE = UnifiedSettingKey._(6, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_OFFLINE_MODE');
  static const UnifiedSettingKey UNIFIED_SETTING_KEY_PRIVATE_MODE = UnifiedSettingKey._(7, _omitEnumNames ? '' : 'UNIFIED_SETTING_KEY_PRIVATE_MODE');

  static const $core.List<UnifiedSettingKey> values = <UnifiedSettingKey> [
    UNIFIED_SETTING_KEY_UNSPECIFIED,
    UNIFIED_SETTING_KEY_AUTO_MATCHING,
    UNIFIED_SETTING_KEY_INITIAL_MESSAGE,
    UNIFIED_SETTING_KEY_IS_PERSONA_GREETING_DEFAULT,
    UNIFIED_SETTING_KEY_LEAVE_FOOTPRINT,
    UNIFIED_SETTING_KEY_LIKE_RECEIVE_LIMIT,
    UNIFIED_SETTING_KEY_OFFLINE_MODE,
    UNIFIED_SETTING_KEY_PRIVATE_MODE,
  ];

  static final $core.Map<$core.int, UnifiedSettingKey> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UnifiedSettingKey? valueOf($core.int value) => _byValue[value];

  const UnifiedSettingKey._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
