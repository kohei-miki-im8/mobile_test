//
//  Generated code. Do not modify.
//  source: econa/enums/distance_location_code.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 距離コード
class DistanceLocationCode extends $pb.ProtobufEnum {
  static const DistanceLocationCode DISTANCE_LOCATION_CODE_UNSPECIFIED = DistanceLocationCode._(0, _omitEnumNames ? '' : 'DISTANCE_LOCATION_CODE_UNSPECIFIED');
  static const DistanceLocationCode DISTANCE_LOCATION_CODE_10_KM = DistanceLocationCode._(1, _omitEnumNames ? '' : 'DISTANCE_LOCATION_CODE_10_KM');
  static const DistanceLocationCode DISTANCE_LOCATION_CODE_30_KM = DistanceLocationCode._(2, _omitEnumNames ? '' : 'DISTANCE_LOCATION_CODE_30_KM');
  static const DistanceLocationCode DISTANCE_LOCATION_CODE_50_KM = DistanceLocationCode._(3, _omitEnumNames ? '' : 'DISTANCE_LOCATION_CODE_50_KM');
  static const DistanceLocationCode DISTANCE_LOCATION_CODE_100_KM = DistanceLocationCode._(4, _omitEnumNames ? '' : 'DISTANCE_LOCATION_CODE_100_KM');
  static const DistanceLocationCode DISTANCE_LOCATION_CODE_200_KM = DistanceLocationCode._(5, _omitEnumNames ? '' : 'DISTANCE_LOCATION_CODE_200_KM');

  static const $core.List<DistanceLocationCode> values = <DistanceLocationCode> [
    DISTANCE_LOCATION_CODE_UNSPECIFIED,
    DISTANCE_LOCATION_CODE_10_KM,
    DISTANCE_LOCATION_CODE_30_KM,
    DISTANCE_LOCATION_CODE_50_KM,
    DISTANCE_LOCATION_CODE_100_KM,
    DISTANCE_LOCATION_CODE_200_KM,
  ];

  static final $core.Map<$core.int, DistanceLocationCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DistanceLocationCode? valueOf($core.int value) => _byValue[value];

  const DistanceLocationCode._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
