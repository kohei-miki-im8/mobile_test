//
//  Generated code. Do not modify.
//  source: econa/services/site/karte/v1/get_karte.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../../../shared/pager_cursor.pb.dart' as $146;

/// カルテ取得リクエスト
class GetKarteRequest extends $pb.GeneratedMessage {
  factory GetKarteRequest({
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetKarteRequest._() : super();
  factory GetKarteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetKarteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetKarteRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.karte.v1'), createEmptyInstance: create)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetKarteRequest clone() => GetKarteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetKarteRequest copyWith(void Function(GetKarteRequest) updates) => super.copyWith((message) => updates(message as GetKarteRequest)) as GetKarteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetKarteRequest create() => GetKarteRequest._();
  GetKarteRequest createEmptyInstance() => create();
  static $pb.PbList<GetKarteRequest> createRepeated() => $pb.PbList<GetKarteRequest>();
  @$core.pragma('dart2js:noInline')
  static GetKarteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetKarteRequest>(create);
  static GetKarteRequest? _defaultInstance;

  /// ページネーション
  @$pb.TagNumber(15)
  $146.PagerRequestCursor get cursor => $_getN(0);
  @$pb.TagNumber(15)
  set cursor($146.PagerRequestCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(0);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerRequestCursor ensureCursor() => $_ensure(0);
}

/// ユーザー分析データ
class GetKarteResponse_UserAnalysis extends $pb.GeneratedMessage {
  factory GetKarteResponse_UserAnalysis({
    $core.String? philosophyOnLove,
    $core.String? potentialNeeds,
    $core.String? compatibilityFeatures,
    $core.String? comprehensiveAnalysis,
    $109.Timestamp? createdAt,
  }) {
    final $result = create();
    if (philosophyOnLove != null) {
      $result.philosophyOnLove = philosophyOnLove;
    }
    if (potentialNeeds != null) {
      $result.potentialNeeds = potentialNeeds;
    }
    if (compatibilityFeatures != null) {
      $result.compatibilityFeatures = compatibilityFeatures;
    }
    if (comprehensiveAnalysis != null) {
      $result.comprehensiveAnalysis = comprehensiveAnalysis;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  GetKarteResponse_UserAnalysis._() : super();
  factory GetKarteResponse_UserAnalysis.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetKarteResponse_UserAnalysis.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetKarteResponse.UserAnalysis', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.karte.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'philosophyOnLove')
    ..aOS(2, _omitFieldNames ? '' : 'potentialNeeds')
    ..aOS(3, _omitFieldNames ? '' : 'compatibilityFeatures')
    ..aOS(4, _omitFieldNames ? '' : 'comprehensiveAnalysis')
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetKarteResponse_UserAnalysis clone() => GetKarteResponse_UserAnalysis()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetKarteResponse_UserAnalysis copyWith(void Function(GetKarteResponse_UserAnalysis) updates) => super.copyWith((message) => updates(message as GetKarteResponse_UserAnalysis)) as GetKarteResponse_UserAnalysis;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetKarteResponse_UserAnalysis create() => GetKarteResponse_UserAnalysis._();
  GetKarteResponse_UserAnalysis createEmptyInstance() => create();
  static $pb.PbList<GetKarteResponse_UserAnalysis> createRepeated() => $pb.PbList<GetKarteResponse_UserAnalysis>();
  @$core.pragma('dart2js:noInline')
  static GetKarteResponse_UserAnalysis getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetKarteResponse_UserAnalysis>(create);
  static GetKarteResponse_UserAnalysis? _defaultInstance;

  /// あなたの恋愛観
  @$pb.TagNumber(1)
  $core.String get philosophyOnLove => $_getSZ(0);
  @$pb.TagNumber(1)
  set philosophyOnLove($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhilosophyOnLove() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhilosophyOnLove() => clearField(1);

  /// あなたの潜在的な欲求
  @$pb.TagNumber(2)
  $core.String get potentialNeeds => $_getSZ(1);
  @$pb.TagNumber(2)
  set potentialNeeds($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPotentialNeeds() => $_has(1);
  @$pb.TagNumber(2)
  void clearPotentialNeeds() => clearField(2);

  /// 相性が良いお相手の特徴
  @$pb.TagNumber(3)
  $core.String get compatibilityFeatures => $_getSZ(2);
  @$pb.TagNumber(3)
  set compatibilityFeatures($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCompatibilityFeatures() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompatibilityFeatures() => clearField(3);

  /// 総合的な分析
  @$pb.TagNumber(4)
  $core.String get comprehensiveAnalysis => $_getSZ(3);
  @$pb.TagNumber(4)
  set comprehensiveAnalysis($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComprehensiveAnalysis() => $_has(3);
  @$pb.TagNumber(4)
  void clearComprehensiveAnalysis() => clearField(4);

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
}

/// カルテ取得レスポンス
class GetKarteResponse extends $pb.GeneratedMessage {
  factory GetKarteResponse({
    $core.Iterable<GetKarteResponse_UserAnalysis>? userAnalyses,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (userAnalyses != null) {
      $result.userAnalyses.addAll(userAnalyses);
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetKarteResponse._() : super();
  factory GetKarteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetKarteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetKarteResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.karte.v1'), createEmptyInstance: create)
    ..pc<GetKarteResponse_UserAnalysis>(1, _omitFieldNames ? '' : 'userAnalyses', $pb.PbFieldType.PM, subBuilder: GetKarteResponse_UserAnalysis.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetKarteResponse clone() => GetKarteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetKarteResponse copyWith(void Function(GetKarteResponse) updates) => super.copyWith((message) => updates(message as GetKarteResponse)) as GetKarteResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetKarteResponse create() => GetKarteResponse._();
  GetKarteResponse createEmptyInstance() => create();
  static $pb.PbList<GetKarteResponse> createRepeated() => $pb.PbList<GetKarteResponse>();
  @$core.pragma('dart2js:noInline')
  static GetKarteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetKarteResponse>(create);
  static GetKarteResponse? _defaultInstance;

  /// ユーザー分析データ
  @$pb.TagNumber(1)
  $core.List<GetKarteResponse_UserAnalysis> get userAnalyses => $_getList(0);

  /// 次ページカーソル
  @$pb.TagNumber(15)
  $146.PagerResponseCursor get cursor => $_getN(1);
  @$pb.TagNumber(15)
  set cursor($146.PagerResponseCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerResponseCursor ensureCursor() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
