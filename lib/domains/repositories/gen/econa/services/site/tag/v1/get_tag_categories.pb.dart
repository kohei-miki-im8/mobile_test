//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/get_tag_categories.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/tag_category.pb.dart' as $181;

class GetTagCategoriesRequest extends $pb.GeneratedMessage {
  factory GetTagCategoriesRequest() => create();
  GetTagCategoriesRequest._() : super();
  factory GetTagCategoriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagCategoriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTagCategoriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTagCategoriesRequest clone() => GetTagCategoriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTagCategoriesRequest copyWith(void Function(GetTagCategoriesRequest) updates) => super.copyWith((message) => updates(message as GetTagCategoriesRequest)) as GetTagCategoriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTagCategoriesRequest create() => GetTagCategoriesRequest._();
  GetTagCategoriesRequest createEmptyInstance() => create();
  static $pb.PbList<GetTagCategoriesRequest> createRepeated() => $pb.PbList<GetTagCategoriesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTagCategoriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagCategoriesRequest>(create);
  static GetTagCategoriesRequest? _defaultInstance;
}

class GetTagCategoriesResponse extends $pb.GeneratedMessage {
  factory GetTagCategoriesResponse({
    $core.Iterable<$181.TagCategory>? tagCategories,
  }) {
    final $result = create();
    if (tagCategories != null) {
      $result.tagCategories.addAll(tagCategories);
    }
    return $result;
  }
  GetTagCategoriesResponse._() : super();
  factory GetTagCategoriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagCategoriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTagCategoriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..pc<$181.TagCategory>(1, _omitFieldNames ? '' : 'tagCategories', $pb.PbFieldType.PM, subBuilder: $181.TagCategory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTagCategoriesResponse clone() => GetTagCategoriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTagCategoriesResponse copyWith(void Function(GetTagCategoriesResponse) updates) => super.copyWith((message) => updates(message as GetTagCategoriesResponse)) as GetTagCategoriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTagCategoriesResponse create() => GetTagCategoriesResponse._();
  GetTagCategoriesResponse createEmptyInstance() => create();
  static $pb.PbList<GetTagCategoriesResponse> createRepeated() => $pb.PbList<GetTagCategoriesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTagCategoriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagCategoriesResponse>(create);
  static GetTagCategoriesResponse? _defaultInstance;

  /// タグカテゴリ群
  @$pb.TagNumber(1)
  $core.List<$181.TagCategory> get tagCategories => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
