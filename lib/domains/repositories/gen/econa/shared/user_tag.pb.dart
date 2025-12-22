//
//  Generated code. Do not modify.
//  source: econa/shared/user_tag.proto
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

/// ユーザーのタグ
class UserTag extends $pb.GeneratedMessage {
  factory UserTag({
    $core.String? tagId,
    $core.String? tagName,
    $179.AbstractionLevel? abstractionLevel,
    $109.Timestamp? createdAt,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (tagName != null) {
      $result.tagName = tagName;
    }
    if (abstractionLevel != null) {
      $result.abstractionLevel = abstractionLevel;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  UserTag._() : super();
  factory UserTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserTag', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tagId')
    ..aOS(2, _omitFieldNames ? '' : 'tagName')
    ..e<$179.AbstractionLevel>(3, _omitFieldNames ? '' : 'abstractionLevel', $pb.PbFieldType.OE, defaultOrMaker: $179.AbstractionLevel.ABSTRACTION_LEVEL_UNSPECIFIED, valueOf: $179.AbstractionLevel.valueOf, enumValues: $179.AbstractionLevel.values)
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserTag clone() => UserTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserTag copyWith(void Function(UserTag) updates) => super.copyWith((message) => updates(message as UserTag)) as UserTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserTag create() => UserTag._();
  UserTag createEmptyInstance() => create();
  static $pb.PbList<UserTag> createRepeated() => $pb.PbList<UserTag>();
  @$core.pragma('dart2js:noInline')
  static UserTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserTag>(create);
  static UserTag? _defaultInstance;

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

  /// 抽象度
  @$pb.TagNumber(3)
  $179.AbstractionLevel get abstractionLevel => $_getN(2);
  @$pb.TagNumber(3)
  set abstractionLevel($179.AbstractionLevel v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAbstractionLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearAbstractionLevel() => clearField(3);

  /// 作成日時
  @$pb.TagNumber(4)
  $109.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($109.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $109.Timestamp ensureCreatedAt() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
