//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/search_session_types.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import 'get_affinity_recommendation_users.pbenum.dart' as $76;

export 'search_session_types.pbenum.dart';

/// らしさマッチング完了通知
/// SC-002: Notification delivered within 1 second of AI processing completion
class AffinityRecommendationCompletedNotification extends $pb.GeneratedMessage {
  factory AffinityRecommendationCompletedNotification({
    $core.String? userId,
    $core.int? recommendationCount,
    $76.CacheStatus? cacheStatus,
    $fixnum.Int64? generationTimeMs,
    $core.bool? isSuccessful,
    $109.Timestamp? completedAt,
    $core.String? requestId,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (recommendationCount != null) {
      $result.recommendationCount = recommendationCount;
    }
    if (cacheStatus != null) {
      $result.cacheStatus = cacheStatus;
    }
    if (generationTimeMs != null) {
      $result.generationTimeMs = generationTimeMs;
    }
    if (isSuccessful != null) {
      $result.isSuccessful = isSuccessful;
    }
    if (completedAt != null) {
      $result.completedAt = completedAt;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    return $result;
  }
  AffinityRecommendationCompletedNotification._() : super();
  factory AffinityRecommendationCompletedNotification.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AffinityRecommendationCompletedNotification.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AffinityRecommendationCompletedNotification', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'recommendationCount', $pb.PbFieldType.O3)
    ..e<$76.CacheStatus>(3, _omitFieldNames ? '' : 'cacheStatus', $pb.PbFieldType.OE, defaultOrMaker: $76.CacheStatus.CACHE_STATUS_UNSPECIFIED, valueOf: $76.CacheStatus.valueOf, enumValues: $76.CacheStatus.values)
    ..aInt64(4, _omitFieldNames ? '' : 'generationTimeMs')
    ..aOB(5, _omitFieldNames ? '' : 'isSuccessful')
    ..aOM<$109.Timestamp>(6, _omitFieldNames ? '' : 'completedAt', subBuilder: $109.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'requestId')
    ..aOS(8, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AffinityRecommendationCompletedNotification clone() => AffinityRecommendationCompletedNotification()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AffinityRecommendationCompletedNotification copyWith(void Function(AffinityRecommendationCompletedNotification) updates) => super.copyWith((message) => updates(message as AffinityRecommendationCompletedNotification)) as AffinityRecommendationCompletedNotification;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AffinityRecommendationCompletedNotification create() => AffinityRecommendationCompletedNotification._();
  AffinityRecommendationCompletedNotification createEmptyInstance() => create();
  static $pb.PbList<AffinityRecommendationCompletedNotification> createRepeated() => $pb.PbList<AffinityRecommendationCompletedNotification>();
  @$core.pragma('dart2js:noInline')
  static AffinityRecommendationCompletedNotification getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AffinityRecommendationCompletedNotification>(create);
  static AffinityRecommendationCompletedNotification? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// 推薦ユーザー数
  @$pb.TagNumber(2)
  $core.int get recommendationCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set recommendationCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRecommendationCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearRecommendationCount() => clearField(2);

  /// キャッシュステータス
  @$pb.TagNumber(3)
  $76.CacheStatus get cacheStatus => $_getN(2);
  @$pb.TagNumber(3)
  set cacheStatus($76.CacheStatus v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCacheStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearCacheStatus() => clearField(3);

  /// 生成時間（ミリ秒）
  @$pb.TagNumber(4)
  $fixnum.Int64 get generationTimeMs => $_getI64(3);
  @$pb.TagNumber(4)
  set generationTimeMs($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGenerationTimeMs() => $_has(3);
  @$pb.TagNumber(4)
  void clearGenerationTimeMs() => clearField(4);

  /// 成功フラグ
  @$pb.TagNumber(5)
  $core.bool get isSuccessful => $_getBF(4);
  @$pb.TagNumber(5)
  set isSuccessful($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsSuccessful() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsSuccessful() => clearField(5);

  /// 完了時刻
  @$pb.TagNumber(6)
  $109.Timestamp get completedAt => $_getN(5);
  @$pb.TagNumber(6)
  set completedAt($109.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCompletedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCompletedAt() => clearField(6);
  @$pb.TagNumber(6)
  $109.Timestamp ensureCompletedAt() => $_ensure(5);

  /// リクエストID（冪等性トレーシング用）
  @$pb.TagNumber(7)
  $core.String get requestId => $_getSZ(6);
  @$pb.TagNumber(7)
  set requestId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRequestId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRequestId() => clearField(7);

  /// エラーメッセージ（失敗時のみ）
  @$pb.TagNumber(8)
  $core.String get errorMessage => $_getSZ(7);
  @$pb.TagNumber(8)
  set errorMessage($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasErrorMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearErrorMessage() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
