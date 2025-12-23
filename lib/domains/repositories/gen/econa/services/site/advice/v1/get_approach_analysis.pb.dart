//
//  Generated code. Do not modify.
//  source: econa/services/site/advice/v1/get_approach_analysis.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// アプローチ分析取得リクエスト
class GetApproachAnalysisRequest extends $pb.GeneratedMessage {
  factory GetApproachAnalysisRequest() => create();
  GetApproachAnalysisRequest._() : super();
  factory GetApproachAnalysisRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApproachAnalysisRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetApproachAnalysisRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.advice.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisRequest clone() => GetApproachAnalysisRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisRequest copyWith(void Function(GetApproachAnalysisRequest) updates) => super.copyWith((message) => updates(message as GetApproachAnalysisRequest)) as GetApproachAnalysisRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisRequest create() => GetApproachAnalysisRequest._();
  GetApproachAnalysisRequest createEmptyInstance() => create();
  static $pb.PbList<GetApproachAnalysisRequest> createRepeated() => $pb.PbList<GetApproachAnalysisRequest>();
  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApproachAnalysisRequest>(create);
  static GetApproachAnalysisRequest? _defaultInstance;
}

/// 足跡履歴
class GetApproachAnalysisResponse_FootprintHistory extends $pb.GeneratedMessage {
  factory GetApproachAnalysisResponse_FootprintHistory({
    $109.Timestamp? historyDate,
    $core.int? footprintAmount,
  }) {
    final $result = create();
    if (historyDate != null) {
      $result.historyDate = historyDate;
    }
    if (footprintAmount != null) {
      $result.footprintAmount = footprintAmount;
    }
    return $result;
  }
  GetApproachAnalysisResponse_FootprintHistory._() : super();
  factory GetApproachAnalysisResponse_FootprintHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApproachAnalysisResponse_FootprintHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetApproachAnalysisResponse.FootprintHistory', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.advice.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'historyDate', subBuilder: $109.Timestamp.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'footprintAmount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisResponse_FootprintHistory clone() => GetApproachAnalysisResponse_FootprintHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisResponse_FootprintHistory copyWith(void Function(GetApproachAnalysisResponse_FootprintHistory) updates) => super.copyWith((message) => updates(message as GetApproachAnalysisResponse_FootprintHistory)) as GetApproachAnalysisResponse_FootprintHistory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisResponse_FootprintHistory create() => GetApproachAnalysisResponse_FootprintHistory._();
  GetApproachAnalysisResponse_FootprintHistory createEmptyInstance() => create();
  static $pb.PbList<GetApproachAnalysisResponse_FootprintHistory> createRepeated() => $pb.PbList<GetApproachAnalysisResponse_FootprintHistory>();
  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisResponse_FootprintHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApproachAnalysisResponse_FootprintHistory>(create);
  static GetApproachAnalysisResponse_FootprintHistory? _defaultInstance;

  /// 履歴日時
  @$pb.TagNumber(1)
  $109.Timestamp get historyDate => $_getN(0);
  @$pb.TagNumber(1)
  set historyDate($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHistoryDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearHistoryDate() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureHistoryDate() => $_ensure(0);

  /// 足跡数
  @$pb.TagNumber(2)
  $core.int get footprintAmount => $_getIZ(1);
  @$pb.TagNumber(2)
  set footprintAmount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFootprintAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearFootprintAmount() => clearField(2);
}

/// いいね履歴
class GetApproachAnalysisResponse_LikeHistory extends $pb.GeneratedMessage {
  factory GetApproachAnalysisResponse_LikeHistory({
    $109.Timestamp? historyDate,
    $core.int? likeAmount,
  }) {
    final $result = create();
    if (historyDate != null) {
      $result.historyDate = historyDate;
    }
    if (likeAmount != null) {
      $result.likeAmount = likeAmount;
    }
    return $result;
  }
  GetApproachAnalysisResponse_LikeHistory._() : super();
  factory GetApproachAnalysisResponse_LikeHistory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApproachAnalysisResponse_LikeHistory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetApproachAnalysisResponse.LikeHistory', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.advice.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'historyDate', subBuilder: $109.Timestamp.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'likeAmount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisResponse_LikeHistory clone() => GetApproachAnalysisResponse_LikeHistory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisResponse_LikeHistory copyWith(void Function(GetApproachAnalysisResponse_LikeHistory) updates) => super.copyWith((message) => updates(message as GetApproachAnalysisResponse_LikeHistory)) as GetApproachAnalysisResponse_LikeHistory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisResponse_LikeHistory create() => GetApproachAnalysisResponse_LikeHistory._();
  GetApproachAnalysisResponse_LikeHistory createEmptyInstance() => create();
  static $pb.PbList<GetApproachAnalysisResponse_LikeHistory> createRepeated() => $pb.PbList<GetApproachAnalysisResponse_LikeHistory>();
  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisResponse_LikeHistory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApproachAnalysisResponse_LikeHistory>(create);
  static GetApproachAnalysisResponse_LikeHistory? _defaultInstance;

  /// 履歴日時
  @$pb.TagNumber(1)
  $109.Timestamp get historyDate => $_getN(0);
  @$pb.TagNumber(1)
  set historyDate($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasHistoryDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearHistoryDate() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureHistoryDate() => $_ensure(0);

  /// いいね数
  @$pb.TagNumber(2)
  $core.int get likeAmount => $_getIZ(1);
  @$pb.TagNumber(2)
  set likeAmount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLikeAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearLikeAmount() => clearField(2);
}

/// アプローチ分析取得レスポンス
class GetApproachAnalysisResponse extends $pb.GeneratedMessage {
  factory GetApproachAnalysisResponse({
    $core.String? adviceMessage,
    $core.Iterable<GetApproachAnalysisResponse_FootprintHistory>? footprintHistories,
    $core.Iterable<GetApproachAnalysisResponse_LikeHistory>? likeHistories,
  }) {
    final $result = create();
    if (adviceMessage != null) {
      $result.adviceMessage = adviceMessage;
    }
    if (footprintHistories != null) {
      $result.footprintHistories.addAll(footprintHistories);
    }
    if (likeHistories != null) {
      $result.likeHistories.addAll(likeHistories);
    }
    return $result;
  }
  GetApproachAnalysisResponse._() : super();
  factory GetApproachAnalysisResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApproachAnalysisResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetApproachAnalysisResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.advice.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'adviceMessage')
    ..pc<GetApproachAnalysisResponse_FootprintHistory>(2, _omitFieldNames ? '' : 'footprintHistories', $pb.PbFieldType.PM, subBuilder: GetApproachAnalysisResponse_FootprintHistory.create)
    ..pc<GetApproachAnalysisResponse_LikeHistory>(3, _omitFieldNames ? '' : 'likeHistories', $pb.PbFieldType.PM, subBuilder: GetApproachAnalysisResponse_LikeHistory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisResponse clone() => GetApproachAnalysisResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApproachAnalysisResponse copyWith(void Function(GetApproachAnalysisResponse) updates) => super.copyWith((message) => updates(message as GetApproachAnalysisResponse)) as GetApproachAnalysisResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisResponse create() => GetApproachAnalysisResponse._();
  GetApproachAnalysisResponse createEmptyInstance() => create();
  static $pb.PbList<GetApproachAnalysisResponse> createRepeated() => $pb.PbList<GetApproachAnalysisResponse>();
  @$core.pragma('dart2js:noInline')
  static GetApproachAnalysisResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApproachAnalysisResponse>(create);
  static GetApproachAnalysisResponse? _defaultInstance;

  /// アドバイスメッセージ
  @$pb.TagNumber(1)
  $core.String get adviceMessage => $_getSZ(0);
  @$pb.TagNumber(1)
  set adviceMessage($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdviceMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdviceMessage() => clearField(1);

  /// 足跡履歴
  @$pb.TagNumber(2)
  $core.List<GetApproachAnalysisResponse_FootprintHistory> get footprintHistories => $_getList(1);

  /// いいね履歴
  @$pb.TagNumber(3)
  $core.List<GetApproachAnalysisResponse_LikeHistory> get likeHistories => $_getList(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
