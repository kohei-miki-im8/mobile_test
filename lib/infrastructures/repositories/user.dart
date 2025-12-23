import 'dart:async';

import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_external_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_external_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_inquiries.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_point_history.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_private_mode.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/upsert_user_private_mode.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/withdraw_user.pb.dart';
import 'package:econa_mobile_app/domains/repositories/i_user_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

/// ユーザー関連のRepository実装クラス
class UserRepository implements IUserRepository {
  UserRepository(this._apiClient) {
    _client = _apiClient.createClient(UserServiceClient.new);
  }

  final ApiClient _apiClient;
  late final UserServiceClient _client;

  @override
  Future<CreateUserAgreementLogResponse> createUserAgreementLog(
      CreateUserAgreementLogRequest request,) async {
    try {
      final result = await _apiClient.call<CreateUserAgreementLogResponse>(
        client: _client,
        method: ApiMethodUnary.createUserAgreementLog,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create UserAgreementLog: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create UserAgreementLog: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create UserAgreementLog: $e');
    }
  }

  @override
  Future<CreateUserBoostResponse> createUserBoost(
      CreateUserBoostRequest request,) async {
    try {
      final result = await _apiClient.call<CreateUserBoostResponse>(
        client: _client,
        method: ApiMethodUnary.createUserBoost,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create UserBoost: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create UserBoost: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create UserBoost: $e');
    }
  }

  @override
  Future<GetUserAgreementLogResponse> getUserAgreementLog(
      GetUserAgreementLogRequest request,) async {
    try {
      final result = await _apiClient.call<GetUserAgreementLogResponse>(
        client: _client,
        method: ApiMethodUnary.getUserAgreementLog,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserAgreementLog: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserAgreementLog: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserAgreementLog: $e');
    }
  }

  @override
  Future<GetUserBoostResponse> getUserBoost(GetUserBoostRequest request) async {
    try {
      final result = await _apiClient.call<GetUserBoostResponse>(
        client: _client,
        method: ApiMethodUnary.getUserBoost,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserBoost: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserBoost: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserBoost: $e');
    }
  }

  @override
  Future<GetUserInquiriesResponse> getUserInquiries(
      GetUserInquiriesRequest request,) async {
    try {
      final result = await _apiClient.call<GetUserInquiriesResponse>(
        client: _client,
        method: ApiMethodUnary.getUserInquiries,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserInquiries: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserInquiries: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserInquiries: $e');
    }
  }

  @override
  Future<GetUserPointsResponse> getUserPoints(
      GetUserPointsRequest request,) async {
    try {
      final result = await _apiClient.call<GetUserPointsResponse>(
        client: _client,
        method: ApiMethodUnary.getUserPoints,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserPoints: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserPoints: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserPoints: $e');
    }
  }

  @override
  Future<GetUserPointHistoryResponse> getUserPointHistory(
      GetUserPointHistoryRequest request,) async {
    try {
      final result = await _apiClient.call<GetUserPointHistoryResponse>(
        client: _client,
        method: ApiMethodUnary.getUserPointHistory,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserPointHistory: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserPointHistory: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserPointHistory: $e');
    }
  }

  @override
  Future<GetUserSettingsResponse> getUserSettings(
      GetUserSettingsRequest request,) async {
    try {
      final result = await _apiClient.call<GetUserSettingsResponse>(
        client: _client,
        method: ApiMethodUnary.getUserSettings,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserSettings: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserSettings: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserSettings: $e');
    }
  }

  @override
  Future<GetUserPrivateModeResponse> getUserPrivateMode(
      GetUserPrivateModeRequest request,) async {
    try {
      final result = await _apiClient.call<GetUserPrivateModeResponse>(
        client: _client,
        method: ApiMethodUnary.getUserPrivateMode,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserPrivateMode: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserPrivateMode: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserPrivateMode: $e');
    }
  }

  @override
  Future<GetUserStatusResponse> getUserStatus(
      GetUserStatusRequest request,) async {
    try {
      final result = await _apiClient.call<GetUserStatusResponse>(
        client: _client,
        method: ApiMethodUnary.getUserStatus,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get UserStatus: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get UserStatus: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get UserStatus: $e');
    }
  }

  // 外部ユーザー取得
  @override
  Future<GetExternalUserResponse> getExternalUser(
      GetExternalUserRequest request,) async {
    try {
      final result = await _apiClient.call<GetExternalUserResponse>(
        client: _client,
        method: ApiMethodUnary.getExternalUser,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get ExternalUser: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get ExternalUser: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get ExternalUser: $e');
    }
  }

  // 外部ユーザー作成
  @override
  Future<CreateExternalUserResponse> createExternalUser(
      CreateExternalUserRequest request,) async {
    try {
      final result = await _apiClient.call<CreateExternalUserResponse>(
        client: _client,
        method: ApiMethodUnary.createExternalUser,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create ExternalUser: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create ExternalUser: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create ExternalUser: $e');
    }
  }

  @override
  Future<UpdateUserSettingsResponse> updateUserSettings(
      UpdateUserSettingsRequest request,) async {
    try {
      final result = await _apiClient.call<UpdateUserSettingsResponse>(
        client: _client,
        method: ApiMethodUnary.updateUserSettings,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update UserSettings: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update UserSettings: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update UserSettings: $e');
    }
  }

  @override
  Future<UpdateUserStatusResponse> updateUserStatus(
      UpdateUserStatusRequest request,) async {
    try {
      final result = await _apiClient.call<UpdateUserStatusResponse>(
        client: _client,
        method: ApiMethodUnary.updateUserStatus,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update UserStatus: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update UserStatus: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update UserStatus: $e');
    }
  }

  @override
  Future<UpsertUserPrivateModeResponse> upsertUserPrivateMode(
      UpsertUserPrivateModeRequest request,) async {
    try {
      final result = await _apiClient.call<UpsertUserPrivateModeResponse>(
        client: _client,
        method: ApiMethodUnary.upsertUserPrivateMode,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed upsert UserPrivateMode: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed upsert UserPrivateMode: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed upsert UserPrivateMode: $e');
    }
  }

  @override
  Future<WithdrawUserResponse> withdrawUser(WithdrawUserRequest request) async {
    try {
      final result = await _apiClient.call<WithdrawUserResponse>(
        client: _client,
        method: ApiMethodUnary.withdrawUser,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed withdraw User: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed withdraw User: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed withdraw User: $e');
    }
  }
}

/// UserRepositoryの実装インスタンスを提供
@riverpod
IUserRepository userRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return UserRepository(apiClient);
}
