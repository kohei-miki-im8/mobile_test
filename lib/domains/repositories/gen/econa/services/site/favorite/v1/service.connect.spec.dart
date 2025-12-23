//
//  Generated code. Do not modify.
//  source: econa/services/site/favorite/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_favorite_users.pb.dart" as econaservicessitefavoritev1get_favorite_users;
import "update_user_favorite.pb.dart" as econaservicessitefavoritev1update_user_favorite;

/// お気に入り機能を提供するサービスです。
abstract final class FavoriteService {
  /// Fully-qualified name of the FavoriteService service.
  static const name = 'econa.services.site.favorite.v1.FavoriteService';

  /// GetFavoriteUsers:お気に入りユーザー群を取得します。
  static const getFavoriteUsers = connect.Spec(
    '/$name/GetFavoriteUsers',
    connect.StreamType.unary,
    econaservicessitefavoritev1get_favorite_users.GetFavoriteUsersRequest.new,
    econaservicessitefavoritev1get_favorite_users.GetFavoriteUsersResponse.new,
  );

  /// UpdateUserFavorite:お気に入り状態を更新します。
  static const updateUserFavorite = connect.Spec(
    '/$name/UpdateUserFavorite',
    connect.StreamType.unary,
    econaservicessitefavoritev1update_user_favorite.UpdateUserFavoriteRequest.new,
    econaservicessitefavoritev1update_user_favorite.UpdateUserFavoriteResponse.new,
  );
}
