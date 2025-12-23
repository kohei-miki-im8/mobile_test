import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_affinity_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_latest_user_search_conditions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_search_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/i_search_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

/// 検索関連のRepository実装クラス
class SearchRepository implements ISearchRepository {
  SearchRepository(this._apiClient) {
    _client = _apiClient.createClient(SearchServiceClient.new);
  }

  final ApiClient _apiClient;
  late final SearchServiceClient _client;

  @override
  Future<GetAffinityRecommendationUsersResponse> getAffinityRecommendationUsers(
      GetAffinityRecommendationUsersRequest request,) async {
    try {
      final result =
          await _apiClient.call<GetAffinityRecommendationUsersResponse>(
        client: _client,
        method: ApiMethodUnary.getAffinityRecommendationUsers,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get AffinityRecommendationUsers: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get AffinityRecommendationUsers: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get AffinityRecommendationUsers: $e');
    }
  }

  @override
  Future<GetRecommendationUsersResponse> getRecommendationUsers(
      GetRecommendationUsersRequest request,) async {
    try {
      final result = await _apiClient.call<GetRecommendationUsersResponse>(
        client: _client,
        method: ApiMethodUnary.getRecommendationUsers,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get RecommendationUsers: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get RecommendationUsers: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get RecommendationUsers: $e');
    }
  }

  @override
  Future<GetLatestUserSearchConditionsResponse> getLatestUserSearchConditions(
      GetLatestUserSearchConditionsRequest request,) async {
    try {
      final result =
          await _apiClient.call<GetLatestUserSearchConditionsResponse>(
        client: _client,
        method: ApiMethodUnary.getLatestUserSearchConditions,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get LatestUserSearchConditions: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get LatestUserSearchConditions: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get LatestUserSearchConditions: $e');
    }
  }

  @override
  Future<GetSearchUsersResponse> getSearchUsers(
      GetSearchUsersRequest request,) async {
    try {
      final result = await _apiClient.call<GetSearchUsersResponse>(
        client: _client,
        method: ApiMethodUnary.getSearchUsers,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get SearchUsers: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get SearchUsers: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get SearchUsers: $e');
    }
  }
}

/// SearchRepositoryのProvider
@riverpod
SearchRepository searchRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return SearchRepository(apiClient);
}
