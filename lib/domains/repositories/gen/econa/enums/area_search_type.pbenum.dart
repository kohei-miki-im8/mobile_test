//
//  Generated code. Do not modify.
//  source: econa/enums/area_search_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// エリア検索タイプ
class AreaSearchType extends $pb.ProtobufEnum {
  static const AreaSearchType AREA_SEARCH_TYPE_UNSPECIFIED = AreaSearchType._(0, _omitEnumNames ? '' : 'AREA_SEARCH_TYPE_UNSPECIFIED');
  static const AreaSearchType AREA_SEARCH_TYPE_RESIDENCE_REGIONS = AreaSearchType._(1, _omitEnumNames ? '' : 'AREA_SEARCH_TYPE_RESIDENCE_REGIONS');
  static const AreaSearchType AREA_SEARCH_TYPE_DISTANCE_LOCATION = AreaSearchType._(2, _omitEnumNames ? '' : 'AREA_SEARCH_TYPE_DISTANCE_LOCATION');

  static const $core.List<AreaSearchType> values = <AreaSearchType> [
    AREA_SEARCH_TYPE_UNSPECIFIED,
    AREA_SEARCH_TYPE_RESIDENCE_REGIONS,
    AREA_SEARCH_TYPE_DISTANCE_LOCATION,
  ];

  static final $core.Map<$core.int, AreaSearchType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AreaSearchType? valueOf($core.int value) => _byValue[value];

  const AreaSearchType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
