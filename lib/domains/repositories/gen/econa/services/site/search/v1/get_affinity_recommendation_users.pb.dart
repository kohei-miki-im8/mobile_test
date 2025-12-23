//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/get_affinity_recommendation_users.proto
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
import 'get_affinity_recommendation_users.pbenum.dart';

export 'get_affinity_recommendation_users.pbenum.dart';

/// らしさマッチングリクエスト
class GetAffinityRecommendationUsersRequest extends $pb.GeneratedMessage {
  factory GetAffinityRecommendationUsersRequest({
    $core.bool? regenerate,
    $core.int? limit,
    $core.String? requestId,
  }) {
    final $result = create();
    if (regenerate != null) {
      $result.regenerate = regenerate;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (requestId != null) {
      $result.requestId = requestId;
    }
    return $result;
  }
  GetAffinityRecommendationUsersRequest._() : super();
  factory GetAffinityRecommendationUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAffinityRecommendationUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAffinityRecommendationUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'regenerate')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'requestId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAffinityRecommendationUsersRequest clone() => GetAffinityRecommendationUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAffinityRecommendationUsersRequest copyWith(void Function(GetAffinityRecommendationUsersRequest) updates) => super.copyWith((message) => updates(message as GetAffinityRecommendationUsersRequest)) as GetAffinityRecommendationUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAffinityRecommendationUsersRequest create() => GetAffinityRecommendationUsersRequest._();
  GetAffinityRecommendationUsersRequest createEmptyInstance() => create();
  static $pb.PbList<GetAffinityRecommendationUsersRequest> createRepeated() => $pb.PbList<GetAffinityRecommendationUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAffinityRecommendationUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAffinityRecommendationUsersRequest>(create);
  static GetAffinityRecommendationUsersRequest? _defaultInstance;

  /// 再生成フラグ（true:キャッシュを無視して再生成、false:キャッシュ優先）
  @$pb.TagNumber(1)
  $core.bool get regenerate => $_getBF(0);
  @$pb.TagNumber(1)
  set regenerate($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRegenerate() => $_has(0);
  @$pb.TagNumber(1)
  void clearRegenerate() => clearField(1);

  /// 取得件数（1-5件）
  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  /// リクエストID（冪等性保証用、最大64文字）
  @$pb.TagNumber(3)
  $core.String get requestId => $_getSZ(2);
  @$pb.TagNumber(3)
  set requestId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRequestId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestId() => clearField(3);
}

/// らしさマッチングユーザー情報
class AffinityRecommendationUser extends $pb.GeneratedMessage {
  factory AffinityRecommendationUser({
    $core.String? userId,
    MatchingReason? matchingReason,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (matchingReason != null) {
      $result.matchingReason = matchingReason;
    }
    return $result;
  }
  AffinityRecommendationUser._() : super();
  factory AffinityRecommendationUser.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AffinityRecommendationUser.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AffinityRecommendationUser', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOM<MatchingReason>(2, _omitFieldNames ? '' : 'matchingReason', subBuilder: MatchingReason.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AffinityRecommendationUser clone() => AffinityRecommendationUser()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AffinityRecommendationUser copyWith(void Function(AffinityRecommendationUser) updates) => super.copyWith((message) => updates(message as AffinityRecommendationUser)) as AffinityRecommendationUser;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AffinityRecommendationUser create() => AffinityRecommendationUser._();
  AffinityRecommendationUser createEmptyInstance() => create();
  static $pb.PbList<AffinityRecommendationUser> createRepeated() => $pb.PbList<AffinityRecommendationUser>();
  @$core.pragma('dart2js:noInline')
  static AffinityRecommendationUser getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AffinityRecommendationUser>(create);
  static AffinityRecommendationUser? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// マッチング理由
  @$pb.TagNumber(2)
  MatchingReason get matchingReason => $_getN(1);
  @$pb.TagNumber(2)
  set matchingReason(MatchingReason v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMatchingReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearMatchingReason() => clearField(2);
  @$pb.TagNumber(2)
  MatchingReason ensureMatchingReason() => $_ensure(1);
}

/// マッチング理由（3テーブル構造）
class MatchingReason extends $pb.GeneratedMessage {
  factory MatchingReason({
    $core.String? mainTitle,
    $core.String? mainContent,
    $core.Iterable<ReasonDetail>? reasonDetails,
  }) {
    final $result = create();
    if (mainTitle != null) {
      $result.mainTitle = mainTitle;
    }
    if (mainContent != null) {
      $result.mainContent = mainContent;
    }
    if (reasonDetails != null) {
      $result.reasonDetails.addAll(reasonDetails);
    }
    return $result;
  }
  MatchingReason._() : super();
  factory MatchingReason.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MatchingReason.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MatchingReason', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'mainTitle')
    ..aOS(2, _omitFieldNames ? '' : 'mainContent')
    ..pc<ReasonDetail>(3, _omitFieldNames ? '' : 'reasonDetails', $pb.PbFieldType.PM, subBuilder: ReasonDetail.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MatchingReason clone() => MatchingReason()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MatchingReason copyWith(void Function(MatchingReason) updates) => super.copyWith((message) => updates(message as MatchingReason)) as MatchingReason;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MatchingReason create() => MatchingReason._();
  MatchingReason createEmptyInstance() => create();
  static $pb.PbList<MatchingReason> createRepeated() => $pb.PbList<MatchingReason>();
  @$core.pragma('dart2js:noInline')
  static MatchingReason getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MatchingReason>(create);
  static MatchingReason? _defaultInstance;

  /// メインタイトル（最大26文字）
  @$pb.TagNumber(1)
  $core.String get mainTitle => $_getSZ(0);
  @$pb.TagNumber(1)
  set mainTitle($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMainTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearMainTitle() => clearField(1);

  /// メインコンテンツ（最大200文字）
  @$pb.TagNumber(2)
  $core.String get mainContent => $_getSZ(1);
  @$pb.TagNumber(2)
  set mainContent($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMainContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearMainContent() => clearField(2);

  /// サブコンテンツの配列（最大5件）
  @$pb.TagNumber(3)
  $core.List<ReasonDetail> get reasonDetails => $_getList(2);
}

/// サブコンテンツ詳細
class ReasonDetail extends $pb.GeneratedMessage {
  factory ReasonDetail({
    $core.String? title,
    $core.String? content,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  ReasonDetail._() : super();
  factory ReasonDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReasonDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReasonDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReasonDetail clone() => ReasonDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReasonDetail copyWith(void Function(ReasonDetail) updates) => super.copyWith((message) => updates(message as ReasonDetail)) as ReasonDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReasonDetail create() => ReasonDetail._();
  ReasonDetail createEmptyInstance() => create();
  static $pb.PbList<ReasonDetail> createRepeated() => $pb.PbList<ReasonDetail>();
  @$core.pragma('dart2js:noInline')
  static ReasonDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReasonDetail>(create);
  static ReasonDetail? _defaultInstance;

  /// サブタイトル（最大50文字）
  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  /// サブコンテンツ（最大200文字）
  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

/// らしさマッチングレスポンス
class GetAffinityRecommendationUsersResponse extends $pb.GeneratedMessage {
  factory GetAffinityRecommendationUsersResponse({
    $core.Iterable<AffinityRecommendationUser>? users,
    CacheStatus? cacheStatus,
    $fixnum.Int64? generationTimeMs,
    $109.Timestamp? generatedAt,
  }) {
    final $result = create();
    if (users != null) {
      $result.users.addAll(users);
    }
    if (cacheStatus != null) {
      $result.cacheStatus = cacheStatus;
    }
    if (generationTimeMs != null) {
      $result.generationTimeMs = generationTimeMs;
    }
    if (generatedAt != null) {
      $result.generatedAt = generatedAt;
    }
    return $result;
  }
  GetAffinityRecommendationUsersResponse._() : super();
  factory GetAffinityRecommendationUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAffinityRecommendationUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAffinityRecommendationUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..pc<AffinityRecommendationUser>(1, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: AffinityRecommendationUser.create)
    ..e<CacheStatus>(2, _omitFieldNames ? '' : 'cacheStatus', $pb.PbFieldType.OE, defaultOrMaker: CacheStatus.CACHE_STATUS_UNSPECIFIED, valueOf: CacheStatus.valueOf, enumValues: CacheStatus.values)
    ..aInt64(3, _omitFieldNames ? '' : 'generationTimeMs')
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'generatedAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAffinityRecommendationUsersResponse clone() => GetAffinityRecommendationUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAffinityRecommendationUsersResponse copyWith(void Function(GetAffinityRecommendationUsersResponse) updates) => super.copyWith((message) => updates(message as GetAffinityRecommendationUsersResponse)) as GetAffinityRecommendationUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAffinityRecommendationUsersResponse create() => GetAffinityRecommendationUsersResponse._();
  GetAffinityRecommendationUsersResponse createEmptyInstance() => create();
  static $pb.PbList<GetAffinityRecommendationUsersResponse> createRepeated() => $pb.PbList<GetAffinityRecommendationUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAffinityRecommendationUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAffinityRecommendationUsersResponse>(create);
  static GetAffinityRecommendationUsersResponse? _defaultInstance;

  /// らしさマッチングユーザーリスト
  @$pb.TagNumber(1)
  $core.List<AffinityRecommendationUser> get users => $_getList(0);

  /// キャッシュステータス
  @$pb.TagNumber(2)
  CacheStatus get cacheStatus => $_getN(1);
  @$pb.TagNumber(2)
  set cacheStatus(CacheStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCacheStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearCacheStatus() => clearField(2);

  /// 生成時間（ミリ秒）
  @$pb.TagNumber(3)
  $fixnum.Int64 get generationTimeMs => $_getI64(2);
  @$pb.TagNumber(3)
  set generationTimeMs($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGenerationTimeMs() => $_has(2);
  @$pb.TagNumber(3)
  void clearGenerationTimeMs() => clearField(3);

  /// 生成日時
  @$pb.TagNumber(4)
  $109.Timestamp get generatedAt => $_getN(3);
  @$pb.TagNumber(4)
  set generatedAt($109.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGeneratedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearGeneratedAt() => clearField(4);
  @$pb.TagNumber(4)
  $109.Timestamp ensureGeneratedAt() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
