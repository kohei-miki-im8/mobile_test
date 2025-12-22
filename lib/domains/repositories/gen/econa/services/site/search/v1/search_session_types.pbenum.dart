//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/search_session_types.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 検索セッション公開タイプ（メッセージ種別判別用）
class SearchSessionPublishType extends $pb.ProtobufEnum {
  static const SearchSessionPublishType SEARCH_SESSION_PUBLISH_TYPE_UNSPECIFIED = SearchSessionPublishType._(0, _omitEnumNames ? '' : 'SEARCH_SESSION_PUBLISH_TYPE_UNSPECIFIED');
  static const SearchSessionPublishType SEARCH_SESSION_PUBLISH_TYPE_AFFINITY_RECOMMENDATION_COMPLETED = SearchSessionPublishType._(1, _omitEnumNames ? '' : 'SEARCH_SESSION_PUBLISH_TYPE_AFFINITY_RECOMMENDATION_COMPLETED');

  static const $core.List<SearchSessionPublishType> values = <SearchSessionPublishType> [
    SEARCH_SESSION_PUBLISH_TYPE_UNSPECIFIED,
    SEARCH_SESSION_PUBLISH_TYPE_AFFINITY_RECOMMENDATION_COMPLETED,
  ];

  static final $core.Map<$core.int, SearchSessionPublishType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SearchSessionPublishType? valueOf($core.int value) => _byValue[value];

  const SearchSessionPublishType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
