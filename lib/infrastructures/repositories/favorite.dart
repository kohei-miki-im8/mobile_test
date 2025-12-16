import 'package:econa_mobile_app/domains/entities/favorite_user.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/get_favorite_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite.g.dart';

/// FavoriteRepositoryのインスタンスを提供する
class FavoriteRepository {
  FavoriteRepository(this._apiClient) {
    _favoriteClient = _apiClient.createClient(FavoriteServiceClient.new);
  }

  final ApiClient _apiClient;
  late final FavoriteServiceClient _favoriteClient;

  /// お気に入りユーザー群を取得
  Future<List<FavoriteUser>> getFavoriteUsers(
    GetFavoriteUsersRequest request,
  ) async {
    try {
      final result = await _apiClient.call<GetFavoriteUsersResponse>(
        client: _favoriteClient,
        method: ApiMethodUnary.getFavoriteUsers,
        request: request,
      );

      if (result.isError) {
        throw Exception('API call failed: ${result.error}');
      }

      if (result.data == null) {
        throw Exception('API response data is null');
      }

      return result.data!.thumbnailUsers
          .map(FavoriteUser.fromResponse)
          .toList();
    } catch (e) {
      throw Exception('\n$e');
    }
  }

  /// お気に入りユーザーを追加取得
  Future<GetFavoriteUsersResponse> getFavoriteUsersRawData(
    GetFavoriteUsersRequest request,
  ) async {
    try {
      final result = await _apiClient.call<GetFavoriteUsersResponse>(
        client: _favoriteClient,
        method: ApiMethodUnary.getFavoriteUsers,
        request: request,
      );
      if (result.isError) {
        throw Exception('API call failed: ${result.error}');
      }
      if (result.data == null) {
        throw Exception('API response data is null');
      }
      return result.data!;
    } catch (e) {
      throw Exception('\n$e');
    }
  }

  /// お気に入り状態を更新
  Future<UpdateUserFavoriteResponse> updateUserFavorite(
    UpdateUserFavoriteRequest request,
  ) async {
    try {
      final result = await _apiClient.call<UpdateUserFavoriteResponse>(
        client: _favoriteClient,
        method: ApiMethodUnary.updateUserFavorite,
        request: request,
      );

      if (result.isError) {
        throw Exception('API call failed: ${result.error}');
      }

      if (result.data == null) {
        throw Exception('API response data is null');
      }

      return result.data!;
    } catch (e) {
      throw Exception('\n$e');
    }
  }
}

/// FavoriteRepository
@riverpod
FavoriteRepository favoriteRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return FavoriteRepository(apiClient);
}
