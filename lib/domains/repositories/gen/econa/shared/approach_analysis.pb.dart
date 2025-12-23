//
//  Generated code. Do not modify.
//  source: econa/shared/approach_analysis.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;

/// 恋愛アドバイス「アプローチ分析」
class ApproachAnalysis extends $pb.GeneratedMessage {
  factory ApproachAnalysis({
    $core.String? advise,
    $core.Iterable<FootprintTransition>? footprintTransitions,
    $core.Iterable<LikeTransition>? likeTransitions,
  }) {
    final $result = create();
    if (advise != null) {
      $result.advise = advise;
    }
    if (footprintTransitions != null) {
      $result.footprintTransitions.addAll(footprintTransitions);
    }
    if (likeTransitions != null) {
      $result.likeTransitions.addAll(likeTransitions);
    }
    return $result;
  }
  ApproachAnalysis._() : super();
  factory ApproachAnalysis.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproachAnalysis.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproachAnalysis', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'advise')
    ..pc<FootprintTransition>(2, _omitFieldNames ? '' : 'footprintTransitions', $pb.PbFieldType.PM, subBuilder: FootprintTransition.create)
    ..pc<LikeTransition>(3, _omitFieldNames ? '' : 'likeTransitions', $pb.PbFieldType.PM, subBuilder: LikeTransition.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproachAnalysis clone() => ApproachAnalysis()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproachAnalysis copyWith(void Function(ApproachAnalysis) updates) => super.copyWith((message) => updates(message as ApproachAnalysis)) as ApproachAnalysis;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproachAnalysis create() => ApproachAnalysis._();
  ApproachAnalysis createEmptyInstance() => create();
  static $pb.PbList<ApproachAnalysis> createRepeated() => $pb.PbList<ApproachAnalysis>();
  @$core.pragma('dart2js:noInline')
  static ApproachAnalysis getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproachAnalysis>(create);
  static ApproachAnalysis? _defaultInstance;

  /// アドバイス
  @$pb.TagNumber(1)
  $core.String get advise => $_getSZ(0);
  @$pb.TagNumber(1)
  set advise($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdvise() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdvise() => clearField(1);

  /// 足跡推移(過去7日間)
  @$pb.TagNumber(2)
  $core.List<FootprintTransition> get footprintTransitions => $_getList(1);

  /// いいね推移(過去7日間)
  @$pb.TagNumber(3)
  $core.List<LikeTransition> get likeTransitions => $_getList(2);
}

/// 足跡推移
class FootprintTransition extends $pb.GeneratedMessage {
  factory FootprintTransition({
    $109.Timestamp? date,
    $core.int? footprintCount,
  }) {
    final $result = create();
    if (date != null) {
      $result.date = date;
    }
    if (footprintCount != null) {
      $result.footprintCount = footprintCount;
    }
    return $result;
  }
  FootprintTransition._() : super();
  factory FootprintTransition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FootprintTransition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FootprintTransition', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'date', subBuilder: $109.Timestamp.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'footprintCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FootprintTransition clone() => FootprintTransition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FootprintTransition copyWith(void Function(FootprintTransition) updates) => super.copyWith((message) => updates(message as FootprintTransition)) as FootprintTransition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FootprintTransition create() => FootprintTransition._();
  FootprintTransition createEmptyInstance() => create();
  static $pb.PbList<FootprintTransition> createRepeated() => $pb.PbList<FootprintTransition>();
  @$core.pragma('dart2js:noInline')
  static FootprintTransition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FootprintTransition>(create);
  static FootprintTransition? _defaultInstance;

  @$pb.TagNumber(1)
  $109.Timestamp get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get footprintCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set footprintCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFootprintCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearFootprintCount() => clearField(2);
}

/// いいね推移
class LikeTransition extends $pb.GeneratedMessage {
  factory LikeTransition({
    $109.Timestamp? date,
    $core.int? likeCount,
  }) {
    final $result = create();
    if (date != null) {
      $result.date = date;
    }
    if (likeCount != null) {
      $result.likeCount = likeCount;
    }
    return $result;
  }
  LikeTransition._() : super();
  factory LikeTransition.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LikeTransition.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LikeTransition', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'date', subBuilder: $109.Timestamp.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'likeCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LikeTransition clone() => LikeTransition()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LikeTransition copyWith(void Function(LikeTransition) updates) => super.copyWith((message) => updates(message as LikeTransition)) as LikeTransition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LikeTransition create() => LikeTransition._();
  LikeTransition createEmptyInstance() => create();
  static $pb.PbList<LikeTransition> createRepeated() => $pb.PbList<LikeTransition>();
  @$core.pragma('dart2js:noInline')
  static LikeTransition getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LikeTransition>(create);
  static LikeTransition? _defaultInstance;

  @$pb.TagNumber(1)
  $109.Timestamp get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get likeCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set likeCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLikeCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikeCount() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
