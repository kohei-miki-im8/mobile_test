import 'package:econa_mobile_app/domains/entities/user_detail.dart';

/// ユーザー詳細を提供する共通インターフェース
abstract interface class UserDetailsProvider {
  /// ユーザー詳細のリスト
  List<UserDetail> get userDetails;
}
