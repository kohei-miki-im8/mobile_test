import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/get_favorite_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';

/// お気に入り関連のRepository Interface
abstract class IFavoriteRepository {
  /// お気に入りユーザー群を取得
  Future<GetFavoriteUsersResponse> getFavoriteUsers(GetFavoriteUsersRequest request);

  /// お気に入り状態を更新
  Future<UpdateUserFavoriteResponse> updateUserFavorite(UpdateUserFavoriteRequest request);
}
