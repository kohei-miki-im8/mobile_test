import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_appeal.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_like.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/delete_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_likes.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_skips.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/i_matching_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'matching.g.dart';

/// マッチング関連のRepository実装クラス
class MatchingRepository implements IMatchingRepository {
  MatchingRepository(this._apiClient) {
    _client = _apiClient.createClient(MatchingServiceClient.new);
  }

  final ApiClient _apiClient;
  late final MatchingServiceClient _client;

  @override
  Future<CreateAppealResponse> createAppeal(CreateAppealRequest request) async {
    try {
      final result = await _apiClient.call<CreateAppealResponse>(
        client: _client,
        method: ApiMethodUnary.createAppeal,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create Appeal: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create Appeal: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create Appeal: $e');
    }
  }

  @override
  Future<CreateLikeResponse> createLike(CreateLikeRequest request) async {
    try {
      final result = await _apiClient.call<CreateLikeResponse>(
        client: _client,
        method: ApiMethodUnary.createLike,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create Like: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create Like: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create Like: $e');
    }
  }

  @override
  Future<CreateSkipResponse> createSkip(CreateSkipRequest request) async {
    try {
      final result = await _apiClient.call<CreateSkipResponse>(
        client: _client,
        method: ApiMethodUnary.createSkip,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create Skip: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create Skip: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create Skip: $e');
    }
  }

  @override
  Future<GetLikesResponse> getLikes(GetLikesRequest request) async {
    try {
      final result = await _apiClient.call<GetLikesResponse>(
        client: _client,
        method: ApiMethodUnary.getLikes,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get Likes: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get Likes: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get Likes: $e');
    }
  }

  @override
  Future<GetSkipsResponse> getSkips(GetSkipsRequest request) async {
    try {
      final result = await _apiClient.call<GetSkipsResponse>(
        client: _client,
        method: ApiMethodUnary.getSkips,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get Skips: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get Skips: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get Skips: $e');
    }
  }

  @override
  Future<DeleteSkipResponse> deleteSkip(DeleteSkipRequest request) async {
    try {
      final result = await _apiClient.call<DeleteSkipResponse>(
        client: _client,
        method: ApiMethodUnary.deleteSkip,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed delete Skip: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed delete Skip: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed delete Skip: $e');
    }
  }
}

/// MatchingRepositoryのProvider
@riverpod
MatchingRepository matchingRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return MatchingRepository(apiClient);
}
