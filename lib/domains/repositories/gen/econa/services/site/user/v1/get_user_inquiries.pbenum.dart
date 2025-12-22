//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_inquiries.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 取得タイプ
class InquiryType extends $pb.ProtobufEnum {
  static const InquiryType INQUIRY_TYPE_UNSPECIFIED = InquiryType._(0, _omitEnumNames ? '' : 'INQUIRY_TYPE_UNSPECIFIED');
  static const InquiryType INQUIRY_TYPE_REPORTED_BY_ME = InquiryType._(1, _omitEnumNames ? '' : 'INQUIRY_TYPE_REPORTED_BY_ME');
  static const InquiryType INQUIRY_TYPE_REPORTED_ABOUT_ME = InquiryType._(2, _omitEnumNames ? '' : 'INQUIRY_TYPE_REPORTED_ABOUT_ME');
  static const InquiryType INQUIRY_TYPE_DISCIPLINARY_ACTIONS = InquiryType._(3, _omitEnumNames ? '' : 'INQUIRY_TYPE_DISCIPLINARY_ACTIONS');

  static const $core.List<InquiryType> values = <InquiryType> [
    INQUIRY_TYPE_UNSPECIFIED,
    INQUIRY_TYPE_REPORTED_BY_ME,
    INQUIRY_TYPE_REPORTED_ABOUT_ME,
    INQUIRY_TYPE_DISCIPLINARY_ACTIONS,
  ];

  static final $core.Map<$core.int, InquiryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InquiryType? valueOf($core.int value) => _byValue[value];

  const InquiryType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
