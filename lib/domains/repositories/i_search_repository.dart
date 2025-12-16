import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_affinity_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_latest_user_search_conditions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_search_users.pb.dart';

/// 検索関連のRepository Interface
abstract class ISearchRepository {
  /// らしさマッチにて抽出したユーザー取得
  Future<GetAffinityRecommendationUsersResponse> getAffinityRecommendationUsers(
      GetAffinityRecommendationUsersRequest request,);

  /// 通常のおすすめユーザー取得
  Future<GetRecommendationUsersResponse> getRecommendationUsers(
      GetRecommendationUsersRequest request,);

  /// 最新の検索設定を取得
  Future<GetLatestUserSearchConditionsResponse> getLatestUserSearchConditions(
      GetLatestUserSearchConditionsRequest request,);

  /// ユーザー検索
  Future<GetSearchUsersResponse> getSearchUsers(GetSearchUsersRequest request);
}
