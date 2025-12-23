//
//  Generated code. Do not modify.
//  source: econa/enums/inquiry_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 問い合わせステータス
class InquiryStatus extends $pb.ProtobufEnum {
  static const InquiryStatus INQUIRY_STATUS_UNSPECIFIED = InquiryStatus._(0, _omitEnumNames ? '' : 'INQUIRY_STATUS_UNSPECIFIED');
  static const InquiryStatus INQUIRY_STATUS_PENDING = InquiryStatus._(1, _omitEnumNames ? '' : 'INQUIRY_STATUS_PENDING');
  static const InquiryStatus INQUIRY_STATUS_PROCESSING = InquiryStatus._(2, _omitEnumNames ? '' : 'INQUIRY_STATUS_PROCESSING');
  static const InquiryStatus INQUIRY_STATUS_RESOLVED = InquiryStatus._(3, _omitEnumNames ? '' : 'INQUIRY_STATUS_RESOLVED');

  static const $core.List<InquiryStatus> values = <InquiryStatus> [
    INQUIRY_STATUS_UNSPECIFIED,
    INQUIRY_STATUS_PENDING,
    INQUIRY_STATUS_PROCESSING,
    INQUIRY_STATUS_RESOLVED,
  ];

  static final $core.Map<$core.int, InquiryStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InquiryStatus? valueOf($core.int value) => _byValue[value];

  const InquiryStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
