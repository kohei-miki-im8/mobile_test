//
//  Generated code. Do not modify.
//  source: econa/shared/tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/abstraction_level.pbenum.dart' as $179;

/// タグ
class Tag extends $pb.GeneratedMessage {
  factory Tag({
    $core.String? tagId,
    $core.String? tagName,
    $core.String? tagImageSignedUrl,
    $179.AbstractionLevel? abstractionLevel,
    $core.int? sortOrder,
    $core.String? description,
    $109.Timestamp? createdAt,
    $109.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (tagName != null) {
      $result.tagName = tagName;
    }
    if (tagImageSignedUrl != null) {
      $result.tagImageSignedUrl = tagImageSignedUrl;
    }
    if (abstractionLevel != null) {
      $result.abstractionLevel = abstractionLevel;
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
  Tag._() : super();
  factory Tag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Tag', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tagId')
    ..aOS(2, _omitFieldNames ? '' : 'tagName')
    ..aOS(3, _omitFieldNames ? '' : 'tagImageSignedUrl')
    ..e<$179.AbstractionLevel>(4, _omitFieldNames ? '' : 'abstractionLevel', $pb.PbFieldType.OE, defaultOrMaker: $179.AbstractionLevel.ABSTRACTION_LEVEL_UNSPECIFIED, valueOf: $179.AbstractionLevel.valueOf, enumValues: $179.AbstractionLevel.values)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'sortOrder', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..aOM<$109.Timestamp>(7, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(8, _omitFieldNames ? '' : 'updatedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Tag clone() => Tag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Tag copyWith(void Function(Tag) updates) => super.copyWith((message) => updates(message as Tag)) as Tag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Tag create() => Tag._();
  Tag createEmptyInstance() => create();
  static $pb.PbList<Tag> createRepeated() => $pb.PbList<Tag>();
  @$core.pragma('dart2js:noInline')
  static Tag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tag>(create);
  static Tag? _defaultInstance;

  /// タグID
  @$pb.TagNumber(1)
  $core.String get tagId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tagId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  /// タグ名
  @$pb.TagNumber(2)
  $core.String get tagName => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTagName() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagName() => clearField(2);

  /// タグ画像の署名付きURL(未実装)
  @$pb.TagNumber(3)
  $core.String get tagImageSignedUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set tagImageSignedUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTagImageSignedUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagImageSignedUrl() => clearField(3);

  /// 抽象度
  @$pb.TagNumber(4)
  $179.AbstractionLevel get abstractionLevel => $_getN(3);
  @$pb.TagNumber(4)
  set abstractionLevel($179.AbstractionLevel v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAbstractionLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbstractionLevel() => clearField(4);

  /// ソート順
  @$pb.TagNumber(5)
  $core.int get sortOrder => $_getIZ(4);
  @$pb.TagNumber(5)
  set sortOrder($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSortOrder() => $_has(4);
  @$pb.TagNumber(5)
  void clearSortOrder() => clearField(5);

  /// タグ説明
  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => clearField(6);

  /// 作成日時
  @$pb.TagNumber(7)
  $109.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($109.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $109.Timestamp ensureCreatedAt() => $_ensure(6);

  /// 更新日時
  @$pb.TagNumber(8)
  $109.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($109.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $109.Timestamp ensureUpdatedAt() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
