//
//  Generated code. Do not modify.
//  source: econa/services/site/block/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_blocked_users.pb.dart" as econaservicessiteblockv1get_blocked_users;
import "service.connect.spec.dart" as specs;
import "update_user_block.pb.dart" as econaservicessiteblockv1update_user_block;

/// ブロック機能を提供するサービスです。
extension type BlockServiceClient (connect.Transport _transport) {
  /// GetBlockedUsers:ブロック済みユーザー群を取得します。
  Future<econaservicessiteblockv1get_blocked_users.GetBlockedUsersResponse> getBlockedUsers(
    econaservicessiteblockv1get_blocked_users.GetBlockedUsersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BlockService.getBlockedUsers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateUserBlock:ブロック状態を更新します。
  Future<econaservicessiteblockv1update_user_block.UpdateUserBlockResponse> updateUserBlock(
    econaservicessiteblockv1update_user_block.UpdateUserBlockRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BlockService.updateUserBlock,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
