import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_inquiries.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_point_history.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_private_mode.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_external_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_external_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/upsert_user_private_mode.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/withdraw_user.pb.dart';

/// ユーザー情報・設定関連のRepository Interface
abstract class IUserRepository {
  /// ユーザー同意ログ作成
  Future<CreateUserAgreementLogResponse> createUserAgreementLog(
      CreateUserAgreementLogRequest request,);

  /// ユーザーブースト作成
  Future<CreateUserBoostResponse> createUserBoost(
      CreateUserBoostRequest request,);

  /// ユーザー同意ログ取得
  Future<GetUserAgreementLogResponse> getUserAgreementLog(
      GetUserAgreementLogRequest request,);

  /// ユーザーブースト取得
  Future<GetUserBoostResponse> getUserBoost(GetUserBoostRequest request);

  /// ユーザー関連の通報・懲戒処分一覧取得
  Future<GetUserInquiriesResponse> getUserInquiries(
      GetUserInquiriesRequest request,);

  /// プライベートモード状態取得
  Future<GetUserPrivateModeResponse> getUserPrivateMode(
      GetUserPrivateModeRequest request,);

  /// ユーザーポイント取得
  Future<GetUserPointsResponse> getUserPoints(GetUserPointsRequest request);

  /// ユーザーポイント履歴取得
  Future<GetUserPointHistoryResponse> getUserPointHistory(
    GetUserPointHistoryRequest request,
  );

  /// ユーザー設定取得
  Future<GetUserSettingsResponse> getUserSettings(
      GetUserSettingsRequest request,);

  /// ユーザーステータス取得
  Future<GetUserStatusResponse> getUserStatus(GetUserStatusRequest request);

  /// 外部ユーザー取得
  Future<GetExternalUserResponse> getExternalUser(GetExternalUserRequest request);

  /// 外部ユーザー作成
  Future<CreateExternalUserResponse> createExternalUser(CreateExternalUserRequest request);

  /// ユーザー設定更新
  Future<UpdateUserSettingsResponse> updateUserSettings(
      UpdateUserSettingsRequest request,);

  /// ユーザーステータス更新
  Future<UpdateUserStatusResponse> updateUserStatus(
      UpdateUserStatusRequest request,);

  /// プライベートモード有効化/更新
  Future<UpsertUserPrivateModeResponse> upsertUserPrivateMode(
      UpsertUserPrivateModeRequest request,);

  /// 退会
  Future<WithdrawUserResponse> withdrawUser(WithdrawUserRequest request);
}
