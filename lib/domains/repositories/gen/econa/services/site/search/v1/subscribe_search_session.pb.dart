//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/subscribe_search_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'search_session_types.pb.dart' as $178;
import 'search_session_types.pbenum.dart' as $178;

/// 検索セッション購読リクエスト
/// Pattern: Similar to SubscribeChatSession (proven async pattern)
class SubscribeSearchSessionRequest extends $pb.GeneratedMessage {
  factory SubscribeSearchSessionRequest() => create();
  SubscribeSearchSessionRequest._() : super();
  factory SubscribeSearchSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeSearchSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeSearchSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeSearchSessionRequest clone() => SubscribeSearchSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeSearchSessionRequest copyWith(void Function(SubscribeSearchSessionRequest) updates) => super.copyWith((message) => updates(message as SubscribeSearchSessionRequest)) as SubscribeSearchSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeSearchSessionRequest create() => SubscribeSearchSessionRequest._();
  SubscribeSearchSessionRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeSearchSessionRequest> createRepeated() => $pb.PbList<SubscribeSearchSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeSearchSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeSearchSessionRequest>(create);
  static SubscribeSearchSessionRequest? _defaultInstance;
}

enum SubscribeSearchSessionResponse_Notification {
  affinityRecommendationCompleted, 
  notSet
}

/// 検索セッション購読レスポンス（ストリーミング）
/// Discriminated union pattern using publish_type enum
class SubscribeSearchSessionResponse extends $pb.GeneratedMessage {
  factory SubscribeSearchSessionResponse({
    $core.String? publishedUserId,
    $178.SearchSessionPublishType? publishType,
    $178.AffinityRecommendationCompletedNotification? affinityRecommendationCompleted,
    $core.bool? isSuccessful,
    $core.String? errorMessage,
  }) {
    final $result = create();
    if (publishedUserId != null) {
      $result.publishedUserId = publishedUserId;
    }
    if (publishType != null) {
      $result.publishType = publishType;
    }
    if (affinityRecommendationCompleted != null) {
      $result.affinityRecommendationCompleted = affinityRecommendationCompleted;
    }
    if (isSuccessful != null) {
      $result.isSuccessful = isSuccessful;
    }
    if (errorMessage != null) {
      $result.errorMessage = errorMessage;
    }
    return $result;
  }
  SubscribeSearchSessionResponse._() : super();
  factory SubscribeSearchSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeSearchSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SubscribeSearchSessionResponse_Notification> _SubscribeSearchSessionResponse_NotificationByTag = {
    3 : SubscribeSearchSessionResponse_Notification.affinityRecommendationCompleted,
    0 : SubscribeSearchSessionResponse_Notification.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeSearchSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.search.v1'), createEmptyInstance: create)
    ..oo(0, [3])
    ..aOS(1, _omitFieldNames ? '' : 'publishedUserId')
    ..e<$178.SearchSessionPublishType>(2, _omitFieldNames ? '' : 'publishType', $pb.PbFieldType.OE, defaultOrMaker: $178.SearchSessionPublishType.SEARCH_SESSION_PUBLISH_TYPE_UNSPECIFIED, valueOf: $178.SearchSessionPublishType.valueOf, enumValues: $178.SearchSessionPublishType.values)
    ..aOM<$178.AffinityRecommendationCompletedNotification>(3, _omitFieldNames ? '' : 'affinityRecommendationCompleted', subBuilder: $178.AffinityRecommendationCompletedNotification.create)
    ..aOB(10, _omitFieldNames ? '' : 'isSuccessful')
    ..aOS(11, _omitFieldNames ? '' : 'errorMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeSearchSessionResponse clone() => SubscribeSearchSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeSearchSessionResponse copyWith(void Function(SubscribeSearchSessionResponse) updates) => super.copyWith((message) => updates(message as SubscribeSearchSessionResponse)) as SubscribeSearchSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeSearchSessionResponse create() => SubscribeSearchSessionResponse._();
  SubscribeSearchSessionResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeSearchSessionResponse> createRepeated() => $pb.PbList<SubscribeSearchSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeSearchSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeSearchSessionResponse>(create);
  static SubscribeSearchSessionResponse? _defaultInstance;

  SubscribeSearchSessionResponse_Notification whichNotification() => _SubscribeSearchSessionResponse_NotificationByTag[$_whichOneof(0)]!;
  void clearNotification() => clearField($_whichOneof(0));

  /// 公開ユーザーID（通知送信元、トレーシング用）
  @$pb.TagNumber(1)
  $core.String get publishedUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set publishedUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublishedUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublishedUserId() => clearField(1);

  /// 公開タイプ（メッセージ種別）
  @$pb.TagNumber(2)
  $178.SearchSessionPublishType get publishType => $_getN(1);
  @$pb.TagNumber(2)
  set publishType($178.SearchSessionPublishType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublishType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublishType() => clearField(2);

  /// らしさマッチング完了通知
  @$pb.TagNumber(3)
  $178.AffinityRecommendationCompletedNotification get affinityRecommendationCompleted => $_getN(2);
  @$pb.TagNumber(3)
  set affinityRecommendationCompleted($178.AffinityRecommendationCompletedNotification v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAffinityRecommendationCompleted() => $_has(2);
  @$pb.TagNumber(3)
  void clearAffinityRecommendationCompleted() => clearField(3);
  @$pb.TagNumber(3)
  $178.AffinityRecommendationCompletedNotification ensureAffinityRecommendationCompleted() => $_ensure(2);

  /// 成功フラグ（エラー伝播用）
  @$pb.TagNumber(10)
  $core.bool get isSuccessful => $_getBF(3);
  @$pb.TagNumber(10)
  set isSuccessful($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsSuccessful() => $_has(3);
  @$pb.TagNumber(10)
  void clearIsSuccessful() => clearField(10);

  /// エラーメッセージ（失敗時のみ）
  @$pb.TagNumber(11)
  $core.String get errorMessage => $_getSZ(4);
  @$pb.TagNumber(11)
  set errorMessage($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(11)
  $core.bool hasErrorMessage() => $_has(4);
  @$pb.TagNumber(11)
  void clearErrorMessage() => clearField(11);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
