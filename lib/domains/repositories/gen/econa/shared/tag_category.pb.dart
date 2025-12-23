//
//  Generated code. Do not modify.
//  source: econa/shared/tag_category.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;

/// タグカテゴリ情報
class TagCategory extends $pb.GeneratedMessage {
  factory TagCategory({
    $core.int? tagCategoryId,
    $core.String? categoryName,
    $core.int? sortOrder,
    $core.String? description,
    $109.Timestamp? createdAt,
    $109.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (tagCategoryId != null) {
      $result.tagCategoryId = tagCategoryId;
    }
    if (categoryName != null) {
      $result.categoryName = categoryName;
    }
    if (sortOrder != null) {
      $result.sortOrder = sortOrder;
    }
    if (description != null) {
      $result.description = description;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  TagCategory._() : super();
  factory TagCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TagCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TagCategory', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'tagCategoryId', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'categoryName')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'sortOrder', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(6, _omitFieldNames ? '' : 'updatedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TagCategory clone() => TagCategory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TagCategory copyWith(void Function(TagCategory) updates) => super.copyWith((message) => updates(message as TagCategory)) as TagCategory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TagCategory create() => TagCategory._();
  TagCategory createEmptyInstance() => create();
  static $pb.PbList<TagCategory> createRepeated() => $pb.PbList<TagCategory>();
  @$core.pragma('dart2js:noInline')
  static TagCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TagCategory>(create);
  static TagCategory? _defaultInstance;

  /// タグカテゴリID
  @$pb.TagNumber(1)
  $core.int get tagCategoryId => $_getIZ(0);
  @$pb.TagNumber(1)
  set tagCategoryId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagCategoryId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagCategoryId() => clearField(1);

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
  $core.int get sortOrder => $_getIZ(2);
  @$pb.TagNumber(3)
  set sortOrder($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSortOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearSortOrder() => clearField(3);

  /// カテゴリの説明
  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => clearField(4);

  /// 作成日時
  @$pb.TagNumber(5)
  $109.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureCreatedAt() => $_ensure(4);

  /// 更新日時
  @$pb.TagNumber(6)
  $109.Timestamp get updatedAt => $_getN(5);
  @$pb.TagNumber(6)
  set updatedAt($109.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $109.Timestamp ensureUpdatedAt() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
