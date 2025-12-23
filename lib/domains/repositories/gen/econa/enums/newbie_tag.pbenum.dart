//
//  Generated code. Do not modify.
//  source: econa/enums/newbie_tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 新人タグ
class NewbieTag extends $pb.ProtobufEnum {
  static const NewbieTag NEWBIE_TAG_UNSPECIFIED = NewbieTag._(0, _omitEnumNames ? '' : 'NEWBIE_TAG_UNSPECIFIED');
  static const NewbieTag NEWBIE_TAG_2_WEEKS = NewbieTag._(1, _omitEnumNames ? '' : 'NEWBIE_TAG_2_WEEKS');
  static const NewbieTag NEWBIE_TAG_1_MONTH = NewbieTag._(2, _omitEnumNames ? '' : 'NEWBIE_TAG_1_MONTH');

  static const $core.List<NewbieTag> values = <NewbieTag> [
    NEWBIE_TAG_UNSPECIFIED,
    NEWBIE_TAG_2_WEEKS,
    NEWBIE_TAG_1_MONTH,
  ];

  static final $core.Map<$core.int, NewbieTag> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NewbieTag? valueOf($core.int value) => _byValue[value];

  const NewbieTag._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
