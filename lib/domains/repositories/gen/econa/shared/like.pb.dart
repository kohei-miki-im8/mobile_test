//
//  Generated code. Do not modify.
//  source: econa/shared/like.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;

/// いいね
class Like extends $pb.GeneratedMessage {
  factory Like({
    $core.String? userLikeId,
    $core.String? superLikeMessage,
    $core.String? simplifiedPersonalitySummary,
    $109.Timestamp? createdAt,
    $109.Timestamp? appealedAt,
  }) {
    final $result = create();
    if (userLikeId != null) {
      $result.userLikeId = userLikeId;
    }
    if (superLikeMessage != null) {
      $result.superLikeMessage = superLikeMessage;
    }
    if (simplifiedPersonalitySummary != null) {
      $result.simplifiedPersonalitySummary = simplifiedPersonalitySummary;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (appealedAt != null) {
      $result.appealedAt = appealedAt;
    }
    return $result;
  }
  Like._() : super();
  factory Like.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Like.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Like', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userLikeId')
    ..aOS(2, _omitFieldNames ? '' : 'superLikeMessage')
    ..aOS(3, _omitFieldNames ? '' : 'simplifiedPersonalitySummary')
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'appealedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Like clone() => Like()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Like copyWith(void Function(Like) updates) => super.copyWith((message) => updates(message as Like)) as Like;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Like create() => Like._();
  Like createEmptyInstance() => create();
  static $pb.PbList<Like> createRepeated() => $pb.PbList<Like>();
  @$core.pragma('dart2js:noInline')
  static Like getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Like>(create);
  static Like? _defaultInstance;

  /// いいねID
  @$pb.TagNumber(1)
  $core.String get userLikeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userLikeId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserLikeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserLikeId() => clearField(1);

  /// スーパーライクメッセージ
  @$pb.TagNumber(2)
  $core.String get superLikeMessage => $_getSZ(1);
  @$pb.TagNumber(2)
  set superLikeMessage($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuperLikeMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuperLikeMessage() => clearField(2);

  /// 簡易人格サマリ
  @$pb.TagNumber(3)
  $core.String get simplifiedPersonalitySummary => $_getSZ(2);
  @$pb.TagNumber(3)
  set simplifiedPersonalitySummary($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSimplifiedPersonalitySummary() => $_has(2);
  @$pb.TagNumber(3)
  void clearSimplifiedPersonalitySummary() => clearField(3);

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

  /// アピール日時（アピールは一度きり）
  @$pb.TagNumber(5)
  $109.Timestamp get appealedAt => $_getN(4);
  @$pb.TagNumber(5)
  set appealedAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAppealedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearAppealedAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureAppealedAt() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
