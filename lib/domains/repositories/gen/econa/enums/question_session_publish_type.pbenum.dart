//
//  Generated code. Do not modify.
//  source: econa/enums/question_session_publish_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 質問セッション発行タイプ
class QuestionSessionPublishType extends $pb.ProtobufEnum {
  static const QuestionSessionPublishType QUESTION_SESSION_PUBLISH_TYPE_UNSPECIFIED = QuestionSessionPublishType._(0, _omitEnumNames ? '' : 'QUESTION_SESSION_PUBLISH_TYPE_UNSPECIFIED');
  static const QuestionSessionPublishType QUESTION_SESSION_PUBLISH_TYPE_EDITING_QUESTION = QuestionSessionPublishType._(1, _omitEnumNames ? '' : 'QUESTION_SESSION_PUBLISH_TYPE_EDITING_QUESTION');
  static const QuestionSessionPublishType QUESTION_SESSION_PUBLISH_TYPE_POSTED_QUESTION = QuestionSessionPublishType._(2, _omitEnumNames ? '' : 'QUESTION_SESSION_PUBLISH_TYPE_POSTED_QUESTION');
  static const QuestionSessionPublishType QUESTION_SESSION_PUBLISH_TYPE_DISCONNECT = QuestionSessionPublishType._(15, _omitEnumNames ? '' : 'QUESTION_SESSION_PUBLISH_TYPE_DISCONNECT');

  static const $core.List<QuestionSessionPublishType> values = <QuestionSessionPublishType> [
    QUESTION_SESSION_PUBLISH_TYPE_UNSPECIFIED,
    QUESTION_SESSION_PUBLISH_TYPE_EDITING_QUESTION,
    QUESTION_SESSION_PUBLISH_TYPE_POSTED_QUESTION,
    QUESTION_SESSION_PUBLISH_TYPE_DISCONNECT,
  ];

  static final $core.Map<$core.int, QuestionSessionPublishType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static QuestionSessionPublishType? valueOf($core.int value) => _byValue[value];

  const QuestionSessionPublishType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
