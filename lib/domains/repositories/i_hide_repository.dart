import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/get_hidden_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/update_user_hide.pb.dart';

/// 非表示関連のRepository Interface
abstract class IHideRepository {
  /// 非表示ユーザー一覧取得
  Future<GetHiddenUsersResponse> getHiddenUsers(GetHiddenUsersRequest request);

  /// ユーザー非表示状態更新
  Future<UpdateUserHideResponse> updateUserHide(UpdateUserHideRequest request);
}
