//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/get_affinity_recommendation_users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// キャッシュステータス
class CacheStatus extends $pb.ProtobufEnum {
  static const CacheStatus CACHE_STATUS_UNSPECIFIED = CacheStatus._(0, _omitEnumNames ? '' : 'CACHE_STATUS_UNSPECIFIED');
  static const CacheStatus CACHE_STATUS_HIT = CacheStatus._(1, _omitEnumNames ? '' : 'CACHE_STATUS_HIT');
  static const CacheStatus CACHE_STATUS_MISS = CacheStatus._(2, _omitEnumNames ? '' : 'CACHE_STATUS_MISS');
  static const CacheStatus CACHE_STATUS_REGENERATED = CacheStatus._(3, _omitEnumNames ? '' : 'CACHE_STATUS_REGENERATED');

  static const $core.List<CacheStatus> values = <CacheStatus> [
    CACHE_STATUS_UNSPECIFIED,
    CACHE_STATUS_HIT,
    CACHE_STATUS_MISS,
    CACHE_STATUS_REGENERATED,
  ];

  static final $core.Map<$core.int, CacheStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CacheStatus? valueOf($core.int value) => _byValue[value];

  const CacheStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
