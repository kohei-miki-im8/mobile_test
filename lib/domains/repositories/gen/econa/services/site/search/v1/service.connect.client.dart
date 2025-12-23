//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_affinity_recommendation.pb.dart" as econaservicessitesearchv1create_affinity_recommendation;
import "service.connect.spec.dart" as specs;
import "subscribe_search_session.pb.dart" as econaservicessitesearchv1subscribe_search_session;
import "get_affinity_recommendation_users.pb.dart" as econaservicessitesearchv1get_affinity_recommendation_users;
import "get_recommendation_users.pb.dart" as econaservicessitesearchv1get_recommendation_users;
import "get_latest_user_search_conditions.pb.dart" as econaservicessitesearchv1get_latest_user_search_conditions;
import "get_search_users.pb.dart" as econaservicessitesearchv1get_search_users;

/// 検索機能を提供するサービスです。
extension type SearchServiceClient (connect.Transport _transport) {
  /// CreateAffinityRecommendation:らしさマッチ非同期リクエスト（即座に空レスポンス返却）
  Future<econaservicessitesearchv1create_affinity_recommendation.CreateAffinityRecommendationResponse> createAffinityRecommendation(
    econaservicessitesearchv1create_affinity_recommendation.CreateAffinityRecommendationRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SearchService.createAffinityRecommendation,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// SubscribeSearchSession:検索セッション購読（リアルタイム通知ストリーム）
  Stream<econaservicessitesearchv1subscribe_search_session.SubscribeSearchSessionResponse> subscribeSearchSession(
    econaservicessitesearchv1subscribe_search_session.SubscribeSearchSessionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.SearchService.subscribeSearchSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetAffinityRecommendUsers:らしさマッチにて抽出したユーザー
  Future<econaservicessitesearchv1get_affinity_recommendation_users.GetAffinityRecommendationUsersResponse> getAffinityRecommendationUsers(
    econaservicessitesearchv1get_affinity_recommendation_users.GetAffinityRecommendationUsersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SearchService.getAffinityRecommendationUsers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetRecommendationUsers:通常のおすすめユーザー
  Future<econaservicessitesearchv1get_recommendation_users.GetRecommendationUsersResponse> getRecommendationUsers(
    econaservicessitesearchv1get_recommendation_users.GetRecommendationUsersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SearchService.getRecommendationUsers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetLatestUserSearchConditions:最新の検索設定を取得
  Future<econaservicessitesearchv1get_latest_user_search_conditions.GetLatestUserSearchConditionsResponse> getLatestUserSearchConditions(
    econaservicessitesearchv1get_latest_user_search_conditions.GetLatestUserSearchConditionsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SearchService.getLatestUserSearchConditions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetSearchUsers:ユーザー検索
  Future<econaservicessitesearchv1get_search_users.GetSearchUsersResponse> getSearchUsers(
    econaservicessitesearchv1get_search_users.GetSearchUsersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SearchService.getSearchUsers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
