//
//  Generated code. Do not modify.
//  source: econa/services/site/favorite/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_favorite_users.pb.dart" as econaservicessitefavoritev1get_favorite_users;
import "service.connect.spec.dart" as specs;
import "update_user_favorite.pb.dart" as econaservicessitefavoritev1update_user_favorite;

/// お気に入り機能を提供するサービスです。
extension type FavoriteServiceClient (connect.Transport _transport) {
  /// GetFavoriteUsers:お気に入りユーザー群を取得します。
  Future<econaservicessitefavoritev1get_favorite_users.GetFavoriteUsersResponse> getFavoriteUsers(
    econaservicessitefavoritev1get_favorite_users.GetFavoriteUsersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.FavoriteService.getFavoriteUsers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateUserFavorite:お気に入り状態を更新します。
  Future<econaservicessitefavoritev1update_user_favorite.UpdateUserFavoriteResponse> updateUserFavorite(
    econaservicessitefavoritev1update_user_favorite.UpdateUserFavoriteRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.FavoriteService.updateUserFavorite,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
