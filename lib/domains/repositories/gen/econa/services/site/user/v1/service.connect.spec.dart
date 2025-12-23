//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_external_user.pb.dart" as econaservicessiteuserv1create_external_user;
import "create_user_agreement_log.pb.dart" as econaservicessiteuserv1create_user_agreement_log;
import "create_user_boost.pb.dart" as econaservicessiteuserv1create_user_boost;
import "enable_device_change_mode.pb.dart" as econaservicessiteuserv1enable_device_change_mode;
import "exchange_matching_to_like.pb.dart" as econaservicessiteuserv1exchange_matching_to_like;
import "get_external_user.pb.dart" as econaservicessiteuserv1get_external_user;
import "get_user_agreement_log.pb.dart" as econaservicessiteuserv1get_user_agreement_log;
import "get_user_boost.pb.dart" as econaservicessiteuserv1get_user_boost;
import "get_user_inquiries.pb.dart" as econaservicessiteuserv1get_user_inquiries;
import "get_user_point_history.pb.dart" as econaservicessiteuserv1get_user_point_history;
import "get_user_points.pb.dart" as econaservicessiteuserv1get_user_points;
import "get_user_private_mode.pb.dart" as econaservicessiteuserv1get_user_private_mode;
import "get_user_settings.pb.dart" as econaservicessiteuserv1get_user_settings;
import "get_user_status.pb.dart" as econaservicessiteuserv1get_user_status;
import "update_user_settings.pb.dart" as econaservicessiteuserv1update_user_settings;
import "update_user_status.pb.dart" as econaservicessiteuserv1update_user_status;
import "upsert_user_private_mode.pb.dart" as econaservicessiteuserv1upsert_user_private_mode;
import "withdraw_user.pb.dart" as econaservicessiteuserv1withdraw_user;

/// ユーザー機能を提供するサービスです。
abstract final class UserService {
  /// Fully-qualified name of the UserService service.
  static const name = 'econa.services.site.user.v1.UserService';

  /// CreateExternalUser: 外部用ユーザーを作成
  static const createExternalUser = connect.Spec(
    '/$name/CreateExternalUser',
    connect.StreamType.unary,
    econaservicessiteuserv1create_external_user.CreateExternalUserRequest.new,
    econaservicessiteuserv1create_external_user.CreateExternalUserResponse.new,
  );

  /// CreateUserAgreementLog: ユーザー利用規約同意ログを作成
  static const createUserAgreementLog = connect.Spec(
    '/$name/CreateUserAgreementLog',
    connect.StreamType.unary,
    econaservicessiteuserv1create_user_agreement_log.CreateUserAgreementLogRequest.new,
    econaservicessiteuserv1create_user_agreement_log.CreateUserAgreementLogResponse.new,
  );

  /// CreateUserBoost: ユーザーブーストを有効化
  static const createUserBoost = connect.Spec(
    '/$name/CreateUserBoost',
    connect.StreamType.unary,
    econaservicessiteuserv1create_user_boost.CreateUserBoostRequest.new,
    econaservicessiteuserv1create_user_boost.CreateUserBoostResponse.new,
  );

  /// EnableDeviceChangeMode: 機種変更モードを有効化
  static const enableDeviceChangeMode = connect.Spec(
    '/$name/EnableDeviceChangeMode',
    connect.StreamType.unary,
    econaservicessiteuserv1enable_device_change_mode.EnableDeviceChangeModeRequest.new,
    econaservicessiteuserv1enable_device_change_mode.EnableDeviceChangeModeResponse.new,
  );

  /// ExchangeMatchingToLike: マッチングポイントをいいねポイントに交換
  static const exchangeMatchingToLike = connect.Spec(
    '/$name/ExchangeMatchingToLike',
    connect.StreamType.unary,
    econaservicessiteuserv1exchange_matching_to_like.ExchangeMatchingToLikeRequest.new,
    econaservicessiteuserv1exchange_matching_to_like.ExchangeMatchingToLikeResponse.new,
  );

  /// GetExternalUser: 外部用ユーザーを取得
  static const getExternalUser = connect.Spec(
    '/$name/GetExternalUser',
    connect.StreamType.unary,
    econaservicessiteuserv1get_external_user.GetExternalUserRequest.new,
    econaservicessiteuserv1get_external_user.GetExternalUserResponse.new,
  );

  /// GetUserAgreementLog: ユーザー利用規約同意ログを取得
  static const getUserAgreementLog = connect.Spec(
    '/$name/GetUserAgreementLog',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_agreement_log.GetUserAgreementLogRequest.new,
    econaservicessiteuserv1get_user_agreement_log.GetUserAgreementLogResponse.new,
  );

  /// GetUserBoost: ユーザーブーストを取得
  static const getUserBoost = connect.Spec(
    '/$name/GetUserBoost',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_boost.GetUserBoostRequest.new,
    econaservicessiteuserv1get_user_boost.GetUserBoostResponse.new,
  );

  /// GetUserInquiries: ユーザー関連の通報・懲戒処分一覧を取得
  static const getUserInquiries = connect.Spec(
    '/$name/GetUserInquiries',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_inquiries.GetUserInquiriesRequest.new,
    econaservicessiteuserv1get_user_inquiries.GetUserInquiriesResponse.new,
  );

  /// GetUserPointHistory: ユーザーポイント履歴を取得
  static const getUserPointHistory = connect.Spec(
    '/$name/GetUserPointHistory',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_point_history.GetUserPointHistoryRequest.new,
    econaservicessiteuserv1get_user_point_history.GetUserPointHistoryResponse.new,
  );

  /// GetUserPoints: ユーザーポイントを取得
  static const getUserPoints = connect.Spec(
    '/$name/GetUserPoints',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_points.GetUserPointsRequest.new,
    econaservicessiteuserv1get_user_points.GetUserPointsResponse.new,
  );

  /// GetUserPrivateMode: プライベートモード状態を取得
  static const getUserPrivateMode = connect.Spec(
    '/$name/GetUserPrivateMode',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_private_mode.GetUserPrivateModeRequest.new,
    econaservicessiteuserv1get_user_private_mode.GetUserPrivateModeResponse.new,
  );

  /// GetUserSettings: ユーザー設定を取得
  static const getUserSettings = connect.Spec(
    '/$name/GetUserSettings',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_settings.GetUserSettingsRequest.new,
    econaservicessiteuserv1get_user_settings.GetUserSettingsResponse.new,
  );

  /// GetUserStatus: ユーザーステータスを取得
  static const getUserStatus = connect.Spec(
    '/$name/GetUserStatus',
    connect.StreamType.unary,
    econaservicessiteuserv1get_user_status.GetUserStatusRequest.new,
    econaservicessiteuserv1get_user_status.GetUserStatusResponse.new,
  );

  /// UpdateUserSettings: ユーザー設定を更新
  static const updateUserSettings = connect.Spec(
    '/$name/UpdateUserSettings',
    connect.StreamType.unary,
    econaservicessiteuserv1update_user_settings.UpdateUserSettingsRequest.new,
    econaservicessiteuserv1update_user_settings.UpdateUserSettingsResponse.new,
  );

  /// UpdateUserStatus: ユーザーステータスを更新
  static const updateUserStatus = connect.Spec(
    '/$name/UpdateUserStatus',
    connect.StreamType.unary,
    econaservicessiteuserv1update_user_status.UpdateUserStatusRequest.new,
    econaservicessiteuserv1update_user_status.UpdateUserStatusResponse.new,
  );

  /// UpsertUserPrivateMode: プライベートモードを有効化
  static const upsertUserPrivateMode = connect.Spec(
    '/$name/UpsertUserPrivateMode',
    connect.StreamType.unary,
    econaservicessiteuserv1upsert_user_private_mode.UpsertUserPrivateModeRequest.new,
    econaservicessiteuserv1upsert_user_private_mode.UpsertUserPrivateModeResponse.new,
  );

  /// WithdrawUser: ユーザーを退会させる
  static const withdrawUser = connect.Spec(
    '/$name/WithdrawUser',
    connect.StreamType.unary,
    econaservicessiteuserv1withdraw_user.WithdrawUserRequest.new,
    econaservicessiteuserv1withdraw_user.WithdrawUserResponse.new,
  );
}
