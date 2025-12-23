//
//  Generated code. Do not modify.
//  source: econa/services/site/inquiry/v1/get_violation_categories.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 違反カテゴリ取得リクエスト
class GetViolationCategoriesRequest extends $pb.GeneratedMessage {
  factory GetViolationCategoriesRequest() => create();
  GetViolationCategoriesRequest._() : super();
  factory GetViolationCategoriesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetViolationCategoriesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetViolationCategoriesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.inquiry.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetViolationCategoriesRequest clone() => GetViolationCategoriesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetViolationCategoriesRequest copyWith(void Function(GetViolationCategoriesRequest) updates) => super.copyWith((message) => updates(message as GetViolationCategoriesRequest)) as GetViolationCategoriesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetViolationCategoriesRequest create() => GetViolationCategoriesRequest._();
  GetViolationCategoriesRequest createEmptyInstance() => create();
  static $pb.PbList<GetViolationCategoriesRequest> createRepeated() => $pb.PbList<GetViolationCategoriesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetViolationCategoriesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetViolationCategoriesRequest>(create);
  static GetViolationCategoriesRequest? _defaultInstance;
}

/// 違反カテゴリ取得レスポンス
class GetViolationCategoriesResponse extends $pb.GeneratedMessage {
  factory GetViolationCategoriesResponse({
    $core.Iterable<ViolationCategory>? categories,
  }) {
    final $result = create();
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    return $result;
  }
  GetViolationCategoriesResponse._() : super();
  factory GetViolationCategoriesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetViolationCategoriesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetViolationCategoriesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.inquiry.v1'), createEmptyInstance: create)
    ..pc<ViolationCategory>(1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM, subBuilder: ViolationCategory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetViolationCategoriesResponse clone() => GetViolationCategoriesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetViolationCategoriesResponse copyWith(void Function(GetViolationCategoriesResponse) updates) => super.copyWith((message) => updates(message as GetViolationCategoriesResponse)) as GetViolationCategoriesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetViolationCategoriesResponse create() => GetViolationCategoriesResponse._();
  GetViolationCategoriesResponse createEmptyInstance() => create();
  static $pb.PbList<GetViolationCategoriesResponse> createRepeated() => $pb.PbList<GetViolationCategoriesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetViolationCategoriesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetViolationCategoriesResponse>(create);
  static GetViolationCategoriesResponse? _defaultInstance;

  /// 違反カテゴリリスト
  @$pb.TagNumber(1)
  $core.List<ViolationCategory> get categories => $_getList(0);
}

/// 違反カテゴリ
class ViolationCategory extends $pb.GeneratedMessage {
  factory ViolationCategory({
    $core.int? inquiryCategoryId,
    $core.String? categoryName,
    $core.int? displayOrder,
  }) {
    final $result = create();
    if (inquiryCategoryId != null) {
      $result.inquiryCategoryId = inquiryCategoryId;
    }
    if (categoryName != null) {
      $result.categoryName = categoryName;
    }
    if (displayOrder != null) {
      $result.displayOrder = displayOrder;
    }
    return $result;
  }
  ViolationCategory._() : super();
  factory ViolationCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ViolationCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ViolationCategory', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.inquiry.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'inquiryCategoryId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'categoryName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'displayOrder', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ViolationCategory clone() => ViolationCategory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ViolationCategory copyWith(void Function(ViolationCategory) updates) => super.copyWith((message) => updates(message as ViolationCategory)) as ViolationCategory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ViolationCategory create() => ViolationCategory._();
  ViolationCategory createEmptyInstance() => create();
  static $pb.PbList<ViolationCategory> createRepeated() => $pb.PbList<ViolationCategory>();
  @$core.pragma('dart2js:noInline')
  static ViolationCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ViolationCategory>(create);
  static ViolationCategory? _defaultInstance;

  /// カテゴリID
  @$pb.TagNumber(1)
  $core.int get inquiryCategoryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set inquiryCategoryId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInquiryCategoryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInquiryCategoryId() => clearField(1);

  /// カテゴリ名
  @$pb.TagNumber(2)
  $core.String get categoryName => $_getSZ(1);
  @$pb.TagNumber(2)
  set categoryName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCategoryName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCategoryName() => clearField(2);

  /// 表示順序
  @$pb.TagNumber(3)
  $core.int get displayOrder => $_getIZ(2);
  @$pb.TagNumber(3)
  set displayOrder($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayOrder() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
