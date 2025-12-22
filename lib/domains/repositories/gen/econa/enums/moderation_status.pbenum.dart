//
//  Generated code. Do not modify.
//  source: econa/enums/moderation_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// モデレーションステータスコード
class ModerationStatusCode extends $pb.ProtobufEnum {
  static const ModerationStatusCode MODERATION_STATUS_CODE_UNSPECIFIED = ModerationStatusCode._(0, _omitEnumNames ? '' : 'MODERATION_STATUS_CODE_UNSPECIFIED');
  static const ModerationStatusCode MODERATION_STATUS_CODE_PENDING = ModerationStatusCode._(1, _omitEnumNames ? '' : 'MODERATION_STATUS_CODE_PENDING');
  static const ModerationStatusCode MODERATION_STATUS_CODE_APPROVED = ModerationStatusCode._(2, _omitEnumNames ? '' : 'MODERATION_STATUS_CODE_APPROVED');
  static const ModerationStatusCode MODERATION_STATUS_CODE_REJECTED = ModerationStatusCode._(3, _omitEnumNames ? '' : 'MODERATION_STATUS_CODE_REJECTED');
  static const ModerationStatusCode MODERATION_STATUS_CODE_FORCE_VISIBLE = ModerationStatusCode._(4, _omitEnumNames ? '' : 'MODERATION_STATUS_CODE_FORCE_VISIBLE');

  static const $core.List<ModerationStatusCode> values = <ModerationStatusCode> [
    MODERATION_STATUS_CODE_UNSPECIFIED,
    MODERATION_STATUS_CODE_PENDING,
    MODERATION_STATUS_CODE_APPROVED,
    MODERATION_STATUS_CODE_REJECTED,
    MODERATION_STATUS_CODE_FORCE_VISIBLE,
  ];

  static final $core.Map<$core.int, ModerationStatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ModerationStatusCode? valueOf($core.int value) => _byValue[value];

  const ModerationStatusCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
