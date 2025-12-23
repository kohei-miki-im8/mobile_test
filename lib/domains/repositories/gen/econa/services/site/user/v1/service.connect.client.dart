//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_external_user.pb.dart" as econaservicessiteuserv1create_external_user;
import "service.connect.spec.dart" as specs;
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
extension type UserServiceClient (connect.Transport _transport) {
  /// CreateExternalUser: 外部用ユーザーを作成
  Future<econaservicessiteuserv1create_external_user.CreateExternalUserResponse> createExternalUser(
    econaservicessiteuserv1create_external_user.CreateExternalUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.createExternalUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreateUserAgreementLog: ユーザー利用規約同意ログを作成
  Future<econaservicessiteuserv1create_user_agreement_log.CreateUserAgreementLogResponse> createUserAgreementLog(
    econaservicessiteuserv1create_user_agreement_log.CreateUserAgreementLogRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.createUserAgreementLog,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreateUserBoost: ユーザーブーストを有効化
  Future<econaservicessiteuserv1create_user_boost.CreateUserBoostResponse> createUserBoost(
    econaservicessiteuserv1create_user_boost.CreateUserBoostRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.createUserBoost,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// EnableDeviceChangeMode: 機種変更モードを有効化
  Future<econaservicessiteuserv1enable_device_change_mode.EnableDeviceChangeModeResponse> enableDeviceChangeMode(
    econaservicessiteuserv1enable_device_change_mode.EnableDeviceChangeModeRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.enableDeviceChangeMode,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// ExchangeMatchingToLike: マッチングポイントをいいねポイントに交換
  Future<econaservicessiteuserv1exchange_matching_to_like.ExchangeMatchingToLikeResponse> exchangeMatchingToLike(
    econaservicessiteuserv1exchange_matching_to_like.ExchangeMatchingToLikeRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.exchangeMatchingToLike,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetExternalUser: 外部用ユーザーを取得
  Future<econaservicessiteuserv1get_external_user.GetExternalUserResponse> getExternalUser(
    econaservicessiteuserv1get_external_user.GetExternalUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getExternalUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserAgreementLog: ユーザー利用規約同意ログを取得
  Future<econaservicessiteuserv1get_user_agreement_log.GetUserAgreementLogResponse> getUserAgreementLog(
    econaservicessiteuserv1get_user_agreement_log.GetUserAgreementLogRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserAgreementLog,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserBoost: ユーザーブーストを取得
  Future<econaservicessiteuserv1get_user_boost.GetUserBoostResponse> getUserBoost(
    econaservicessiteuserv1get_user_boost.GetUserBoostRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserBoost,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserInquiries: ユーザー関連の通報・懲戒処分一覧を取得
  Future<econaservicessiteuserv1get_user_inquiries.GetUserInquiriesResponse> getUserInquiries(
    econaservicessiteuserv1get_user_inquiries.GetUserInquiriesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserInquiries,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserPointHistory: ユーザーポイント履歴を取得
  Future<econaservicessiteuserv1get_user_point_history.GetUserPointHistoryResponse> getUserPointHistory(
    econaservicessiteuserv1get_user_point_history.GetUserPointHistoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserPointHistory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserPoints: ユーザーポイントを取得
  Future<econaservicessiteuserv1get_user_points.GetUserPointsResponse> getUserPoints(
    econaservicessiteuserv1get_user_points.GetUserPointsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserPoints,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserPrivateMode: プライベートモード状態を取得
  Future<econaservicessiteuserv1get_user_private_mode.GetUserPrivateModeResponse> getUserPrivateMode(
    econaservicessiteuserv1get_user_private_mode.GetUserPrivateModeRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserPrivateMode,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserSettings: ユーザー設定を取得
  Future<econaservicessiteuserv1get_user_settings.GetUserSettingsResponse> getUserSettings(
    econaservicessiteuserv1get_user_settings.GetUserSettingsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserSettings,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetUserStatus: ユーザーステータスを取得
  Future<econaservicessiteuserv1get_user_status.GetUserStatusResponse> getUserStatus(
    econaservicessiteuserv1get_user_status.GetUserStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUserStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateUserSettings: ユーザー設定を更新
  Future<econaservicessiteuserv1update_user_settings.UpdateUserSettingsResponse> updateUserSettings(
    econaservicessiteuserv1update_user_settings.UpdateUserSettingsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.updateUserSettings,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateUserStatus: ユーザーステータスを更新
  Future<econaservicessiteuserv1update_user_status.UpdateUserStatusResponse> updateUserStatus(
    econaservicessiteuserv1update_user_status.UpdateUserStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.updateUserStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpsertUserPrivateMode: プライベートモードを有効化
  Future<econaservicessiteuserv1upsert_user_private_mode.UpsertUserPrivateModeResponse> upsertUserPrivateMode(
    econaservicessiteuserv1upsert_user_private_mode.UpsertUserPrivateModeRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.upsertUserPrivateMode,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// WithdrawUser: ユーザーを退会させる
  Future<econaservicessiteuserv1withdraw_user.WithdrawUserResponse> withdrawUser(
    econaservicessiteuserv1withdraw_user.WithdrawUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.withdrawUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
