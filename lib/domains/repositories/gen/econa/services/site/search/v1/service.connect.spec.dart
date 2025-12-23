//
//  Generated code. Do not modify.
//  source: econa/services/site/search/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_affinity_recommendation.pb.dart" as econaservicessitesearchv1create_affinity_recommendation;
import "subscribe_search_session.pb.dart" as econaservicessitesearchv1subscribe_search_session;
import "get_affinity_recommendation_users.pb.dart" as econaservicessitesearchv1get_affinity_recommendation_users;
import "get_recommendation_users.pb.dart" as econaservicessitesearchv1get_recommendation_users;
import "get_latest_user_search_conditions.pb.dart" as econaservicessitesearchv1get_latest_user_search_conditions;
import "get_search_users.pb.dart" as econaservicessitesearchv1get_search_users;

/// 検索機能を提供するサービスです。
abstract final class SearchService {
  /// Fully-qualified name of the SearchService service.
  static const name = 'econa.services.site.search.v1.SearchService';

  /// CreateAffinityRecommendation:らしさマッチ非同期リクエスト（即座に空レスポンス返却）
  static const createAffinityRecommendation = connect.Spec(
    '/$name/CreateAffinityRecommendation',
    connect.StreamType.unary,
    econaservicessitesearchv1create_affinity_recommendation.CreateAffinityRecommendationRequest.new,
    econaservicessitesearchv1create_affinity_recommendation.CreateAffinityRecommendationResponse.new,
  );

  /// SubscribeSearchSession:検索セッション購読（リアルタイム通知ストリーム）
  static const subscribeSearchSession = connect.Spec(
    '/$name/SubscribeSearchSession',
    connect.StreamType.server,
    econaservicessitesearchv1subscribe_search_session.SubscribeSearchSessionRequest.new,
    econaservicessitesearchv1subscribe_search_session.SubscribeSearchSessionResponse.new,
  );

  /// GetAffinityRecommendUsers:らしさマッチにて抽出したユーザー
  static const getAffinityRecommendationUsers = connect.Spec(
    '/$name/GetAffinityRecommendationUsers',
    connect.StreamType.unary,
    econaservicessitesearchv1get_affinity_recommendation_users.GetAffinityRecommendationUsersRequest.new,
    econaservicessitesearchv1get_affinity_recommendation_users.GetAffinityRecommendationUsersResponse.new,
  );

  /// GetRecommendationUsers:通常のおすすめユーザー
  static const getRecommendationUsers = connect.Spec(
    '/$name/GetRecommendationUsers',
    connect.StreamType.unary,
    econaservicessitesearchv1get_recommendation_users.GetRecommendationUsersRequest.new,
    econaservicessitesearchv1get_recommendation_users.GetRecommendationUsersResponse.new,
  );

  /// GetLatestUserSearchConditions:最新の検索設定を取得
  static const getLatestUserSearchConditions = connect.Spec(
    '/$name/GetLatestUserSearchConditions',
    connect.StreamType.unary,
    econaservicessitesearchv1get_latest_user_search_conditions.GetLatestUserSearchConditionsRequest.new,
    econaservicessitesearchv1get_latest_user_search_conditions.GetLatestUserSearchConditionsResponse.new,
  );

  /// GetSearchUsers:ユーザー検索
  static const getSearchUsers = connect.Spec(
    '/$name/GetSearchUsers',
    connect.StreamType.unary,
    econaservicessitesearchv1get_search_users.GetSearchUsersRequest.new,
    econaservicessitesearchv1get_search_users.GetSearchUsersResponse.new,
  );
}
