import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/get_blocked_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/update_user_block.pb.dart';

/// ブロック関連のRepository Interface
abstract class IBlockRepository {
  /// ブロックユーザー一覧取得
  Future<GetBlockedUsersResponse> getBlockedUsers(GetBlockedUsersRequest request);

  /// ユーザーブロック状態更新
  Future<UpdateUserBlockResponse> updateUserBlock(UpdateUserBlockRequest request);
}
