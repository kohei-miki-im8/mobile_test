//
//  Generated code. Do not modify.
//  source: econa/enums/first_message_review_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 初回メッセージ審査ステータス
class FirstMessageReviewStatus extends $pb.ProtobufEnum {
  static const FirstMessageReviewStatus FIRST_MESSAGE_REVIEW_STATUS_UNSPECIFIED = FirstMessageReviewStatus._(0, _omitEnumNames ? '' : 'FIRST_MESSAGE_REVIEW_STATUS_UNSPECIFIED');
  static const FirstMessageReviewStatus FIRST_MESSAGE_REVIEW_STATUS_UNREVIEWED = FirstMessageReviewStatus._(1, _omitEnumNames ? '' : 'FIRST_MESSAGE_REVIEW_STATUS_UNREVIEWED');
  static const FirstMessageReviewStatus FIRST_MESSAGE_REVIEW_STATUS_UNDER_REVIEW = FirstMessageReviewStatus._(2, _omitEnumNames ? '' : 'FIRST_MESSAGE_REVIEW_STATUS_UNDER_REVIEW');
  static const FirstMessageReviewStatus FIRST_MESSAGE_REVIEW_STATUS_APPROVED = FirstMessageReviewStatus._(3, _omitEnumNames ? '' : 'FIRST_MESSAGE_REVIEW_STATUS_APPROVED');

  static const $core.List<FirstMessageReviewStatus> values = <FirstMessageReviewStatus> [
    FIRST_MESSAGE_REVIEW_STATUS_UNSPECIFIED,
    FIRST_MESSAGE_REVIEW_STATUS_UNREVIEWED,
    FIRST_MESSAGE_REVIEW_STATUS_UNDER_REVIEW,
    FIRST_MESSAGE_REVIEW_STATUS_APPROVED,
  ];

  static final $core.Map<$core.int, FirstMessageReviewStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static FirstMessageReviewStatus? valueOf($core.int value) => _byValue[value];

  const FirstMessageReviewStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
