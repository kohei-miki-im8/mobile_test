//
//  Generated code. Do not modify.
//  source: econa/shared/recommendation.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;

/// レコメンデーションスコア情報
class RecommendationScore extends $pb.GeneratedMessage {
  factory RecommendationScore({
    $core.double? baseScore,
    $core.double? boostMultiplier,
    $core.double? finalScore,
    $109.Timestamp? boostExpiresAt,
  }) {
    final $result = create();
    if (baseScore != null) {
      $result.baseScore = baseScore;
    }
    if (boostMultiplier != null) {
      $result.boostMultiplier = boostMultiplier;
    }
    if (finalScore != null) {
      $result.finalScore = finalScore;
    }
    if (boostExpiresAt != null) {
      $result.boostExpiresAt = boostExpiresAt;
    }
    return $result;
  }
  RecommendationScore._() : super();
  factory RecommendationScore.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecommendationScore.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RecommendationScore', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'baseScore', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'boostMultiplier', $pb.PbFieldType.OD)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'finalScore', $pb.PbFieldType.OD)
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'boostExpiresAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecommendationScore clone() => RecommendationScore()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecommendationScore copyWith(void Function(RecommendationScore) updates) => super.copyWith((message) => updates(message as RecommendationScore)) as RecommendationScore;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecommendationScore create() => RecommendationScore._();
  RecommendationScore createEmptyInstance() => create();
  static $pb.PbList<RecommendationScore> createRepeated() => $pb.PbList<RecommendationScore>();
  @$core.pragma('dart2js:noInline')
  static RecommendationScore getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecommendationScore>(create);
  static RecommendationScore? _defaultInstance;

  /// RecBole基本スコア
  @$pb.TagNumber(1)
  $core.double get baseScore => $_getN(0);
  @$pb.TagNumber(1)
  set baseScore($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseScore() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseScore() => clearField(1);

  /// ブースト倍率（ブースト中の場合のみ）
  @$pb.TagNumber(2)
  $core.double get boostMultiplier => $_getN(1);
  @$pb.TagNumber(2)
  set boostMultiplier($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoostMultiplier() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoostMultiplier() => clearField(2);

  /// 最終スコア（base_score × boost_multiplier）
  @$pb.TagNumber(3)
  $core.double get finalScore => $_getN(2);
  @$pb.TagNumber(3)
  set finalScore($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFinalScore() => $_has(2);
  @$pb.TagNumber(3)
  void clearFinalScore() => clearField(3);

  /// ブースト有効期限（ブースト中の場合のみ）
  @$pb.TagNumber(5)
  $109.Timestamp get boostExpiresAt => $_getN(3);
  @$pb.TagNumber(5)
  set boostExpiresAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasBoostExpiresAt() => $_has(3);
  @$pb.TagNumber(5)
  void clearBoostExpiresAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureBoostExpiresAt() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
