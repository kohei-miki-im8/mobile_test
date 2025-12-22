//
//  Generated code. Do not modify.
//  source: econa/services/site/hide/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_hidden_users.pb.dart" as econaservicessitehidev1get_hidden_users;
import "service.connect.spec.dart" as specs;
import "update_user_hide.pb.dart" as econaservicessitehidev1update_user_hide;

/// 非表示機能を提供するサービスです。
extension type HideServiceClient (connect.Transport _transport) {
  /// GetHiddenUsers:非表示ユーザー群を取得します。
  Future<econaservicessitehidev1get_hidden_users.GetHiddenUsersResponse> getHiddenUsers(
    econaservicessitehidev1get_hidden_users.GetHiddenUsersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.HideService.getHiddenUsers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateUserHide:非表示状態を更新します。
  Future<econaservicessitehidev1update_user_hide.UpdateUserHideResponse> updateUserHide(
    econaservicessitehidev1update_user_hide.UpdateUserHideRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.HideService.updateUserHide,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
