//
//  Generated code. Do not modify.
//  source: econa/enums/question_content_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 質問内容の型
class QuestionContentType extends $pb.ProtobufEnum {
  static const QuestionContentType QUESTION_CONTENT_TYPE_UNSPECIFIED = QuestionContentType._(0, _omitEnumNames ? '' : 'QUESTION_CONTENT_TYPE_UNSPECIFIED');
  static const QuestionContentType QUESTION_CONTENT_TYPE_EDITING = QuestionContentType._(1, _omitEnumNames ? '' : 'QUESTION_CONTENT_TYPE_EDITING');
  static const QuestionContentType QUESTION_CONTENT_TYPE_POSTED = QuestionContentType._(2, _omitEnumNames ? '' : 'QUESTION_CONTENT_TYPE_POSTED');

  static const $core.List<QuestionContentType> values = <QuestionContentType> [
    QUESTION_CONTENT_TYPE_UNSPECIFIED,
    QUESTION_CONTENT_TYPE_EDITING,
    QUESTION_CONTENT_TYPE_POSTED,
  ];

  static final $core.Map<$core.int, QuestionContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static QuestionContentType? valueOf($core.int value) => _byValue[value];

  const QuestionContentType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
