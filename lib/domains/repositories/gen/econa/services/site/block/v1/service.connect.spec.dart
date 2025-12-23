//
//  Generated code. Do not modify.
//  source: econa/services/site/block/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_blocked_users.pb.dart" as econaservicessiteblockv1get_blocked_users;
import "update_user_block.pb.dart" as econaservicessiteblockv1update_user_block;

/// ブロック機能を提供するサービスです。
abstract final class BlockService {
  /// Fully-qualified name of the BlockService service.
  static const name = 'econa.services.site.block.v1.BlockService';

  /// GetBlockedUsers:ブロック済みユーザー群を取得します。
  static const getBlockedUsers = connect.Spec(
    '/$name/GetBlockedUsers',
    connect.StreamType.unary,
    econaservicessiteblockv1get_blocked_users.GetBlockedUsersRequest.new,
    econaservicessiteblockv1get_blocked_users.GetBlockedUsersResponse.new,
  );

  /// UpdateUserBlock:ブロック状態を更新します。
  static const updateUserBlock = connect.Spec(
    '/$name/UpdateUserBlock',
    connect.StreamType.unary,
    econaservicessiteblockv1update_user_block.UpdateUserBlockRequest.new,
    econaservicessiteblockv1update_user_block.UpdateUserBlockResponse.new,
  );
}
