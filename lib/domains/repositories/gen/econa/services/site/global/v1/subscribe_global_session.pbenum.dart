//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/subscribe_global_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// セッションイベントタイプ
class SessionEventType extends $pb.ProtobufEnum {
  static const SessionEventType SESSION_EVENT_TYPE_UNSPECIFIED = SessionEventType._(0, _omitEnumNames ? '' : 'SESSION_EVENT_TYPE_UNSPECIFIED');
  static const SessionEventType SESSION_EVENT_TYPE_EKYC_VERIFICATION_COMPLETED = SessionEventType._(1, _omitEnumNames ? '' : 'SESSION_EVENT_TYPE_EKYC_VERIFICATION_COMPLETED');
  static const SessionEventType SESSION_EVENT_TYPE_PERSONAL_VERIFICATION_COMPLETED = SessionEventType._(2, _omitEnumNames ? '' : 'SESSION_EVENT_TYPE_PERSONAL_VERIFICATION_COMPLETED');

  static const $core.List<SessionEventType> values = <SessionEventType> [
    SESSION_EVENT_TYPE_UNSPECIFIED,
    SESSION_EVENT_TYPE_EKYC_VERIFICATION_COMPLETED,
    SESSION_EVENT_TYPE_PERSONAL_VERIFICATION_COMPLETED,
  ];

  static final $core.Map<$core.int, SessionEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SessionEventType? valueOf($core.int value) => _byValue[value];

  const SessionEventType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
