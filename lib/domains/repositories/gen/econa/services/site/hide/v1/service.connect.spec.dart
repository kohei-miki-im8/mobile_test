//
//  Generated code. Do not modify.
//  source: econa/services/site/hide/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "get_hidden_users.pb.dart" as econaservicessitehidev1get_hidden_users;
import "update_user_hide.pb.dart" as econaservicessitehidev1update_user_hide;

/// 非表示機能を提供するサービスです。
abstract final class HideService {
  /// Fully-qualified name of the HideService service.
  static const name = 'econa.services.site.hide.v1.HideService';

  /// GetHiddenUsers:非表示ユーザー群を取得します。
  static const getHiddenUsers = connect.Spec(
    '/$name/GetHiddenUsers',
    connect.StreamType.unary,
    econaservicessitehidev1get_hidden_users.GetHiddenUsersRequest.new,
    econaservicessitehidev1get_hidden_users.GetHiddenUsersResponse.new,
  );

  /// UpdateUserHide:非表示状態を更新します。
  static const updateUserHide = connect.Spec(
    '/$name/UpdateUserHide',
    connect.StreamType.unary,
    econaservicessitehidev1update_user_hide.UpdateUserHideRequest.new,
    econaservicessitehidev1update_user_hide.UpdateUserHideResponse.new,
  );
}
