//
//  Generated code. Do not modify.
//  source: econa/enums/point_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// ポイント種別
class PointType extends $pb.ProtobufEnum {
  static const PointType POINT_TYPE_UNSPECIFIED = PointType._(0, _omitEnumNames ? '' : 'POINT_TYPE_UNSPECIFIED');
  static const PointType POINT_TYPE_LIKE = PointType._(1, _omitEnumNames ? '' : 'POINT_TYPE_LIKE');
  static const PointType POINT_TYPE_MATCHING = PointType._(2, _omitEnumNames ? '' : 'POINT_TYPE_MATCHING');
  static const PointType POINT_TYPE_LAVIGATION = PointType._(3, _omitEnumNames ? '' : 'POINT_TYPE_LAVIGATION');

  static const $core.List<PointType> values = <PointType> [
    POINT_TYPE_UNSPECIFIED,
    POINT_TYPE_LIKE,
    POINT_TYPE_MATCHING,
    POINT_TYPE_LAVIGATION,
  ];

  static final $core.Map<$core.int, PointType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PointType? valueOf($core.int value) => _byValue[value];

  const PointType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
