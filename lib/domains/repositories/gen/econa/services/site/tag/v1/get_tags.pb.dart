//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/get_tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/tag.pb.dart' as $182;

class GetTagsRequest extends $pb.GeneratedMessage {
  factory GetTagsRequest({
    $core.int? tagCategoryId,
  }) {
    final $result = create();
    if (tagCategoryId != null) {
      $result.tagCategoryId = tagCategoryId;
    }
    return $result;
  }
  GetTagsRequest._() : super();
  factory GetTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagCategoryId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTagsRequest clone() => GetTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTagsRequest copyWith(void Function(GetTagsRequest) updates) => super.copyWith((message) => updates(message as GetTagsRequest)) as GetTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTagsRequest create() => GetTagsRequest._();
  GetTagsRequest createEmptyInstance() => create();
  static $pb.PbList<GetTagsRequest> createRepeated() => $pb.PbList<GetTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagsRequest>(create);
  static GetTagsRequest? _defaultInstance;

  /// タグカテゴリID
  @$pb.TagNumber(1)
  $core.int get tagCategoryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagCategoryId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagCategoryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagCategoryId() => clearField(1);
}

class GetTagsResponse extends $pb.GeneratedMessage {
  factory GetTagsResponse({
    $core.Iterable<$182.Tag>? tags,
  }) {
    final $result = create();
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    return $result;
  }
  GetTagsResponse._() : super();
  factory GetTagsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTagsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTagsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..pc<$182.Tag>(1, _omitFieldNames ? '' : 'tags', $pb.PbFieldType.PM, subBuilder: $182.Tag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTagsResponse clone() => GetTagsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTagsResponse copyWith(void Function(GetTagsResponse) updates) => super.copyWith((message) => updates(message as GetTagsResponse)) as GetTagsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTagsResponse create() => GetTagsResponse._();
  GetTagsResponse createEmptyInstance() => create();
  static $pb.PbList<GetTagsResponse> createRepeated() => $pb.PbList<GetTagsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTagsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTagsResponse>(create);
  static GetTagsResponse? _defaultInstance;

  /// タグ群
  @$pb.TagNumber(1)
  $core.List<$182.Tag> get tags => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
