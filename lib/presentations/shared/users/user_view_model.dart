import 'dart:async';
// import 'package:econa_mobile_app/domains/repositories/i_user_repository.dart';
// import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_agreement_type.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_settings.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/update_user_status.pb.dart';
// import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/setting.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:econa_mobile_app/presentations/routes/econa_path.dart';

part 'user_view_model.g.dart';

/// ユーザー状態管理クラス
class UserState {
  const UserState({
    this.hasAgreed,
    this.settingKeyValuePairs,
    this.userStatus,
  });

  final bool? hasAgreed;
  final List<GetUserSettingsResponse_UnifiedSettingKeyValuePair>? settingKeyValuePairs;
  final UserStatus? userStatus;

  UserState copyWith({
    bool? hasAgreed,
    List<GetUserSettingsResponse_UnifiedSettingKeyValuePair>? settingKeyValuePairs,
    UserStatus? userStatus,
  }) {
    return UserState(
      hasAgreed: hasAgreed ?? this.hasAgreed,
      settingKeyValuePairs: settingKeyValuePairs ?? this.settingKeyValuePairs,
      userStatus: userStatus ?? this.userStatus,
    );
  }
}

@riverpod
class UserViewModel extends _$UserViewModel {
  @override
  Future<UserState> build() async {
    // 初期状態は空の状態で開始
    return const UserState();
  }

  /// ユーザー同意ログ作成
  Future<void> createUserAgreementLog(CreateUserAgreementLogRequest request) async {
    final previousState = state;
    try {
      await ref.read(userRepositoryProvider).createUserAgreementLog(request);
    } on Object catch (e, stack) {
      state = AsyncError<UserState>(e, stack).copyWithPrevious(previousState);
    }
  }

  /// ユーザー同意ログ取得
  Future<GetUserAgreementLogResponse> getUserAgreementLogWithResponse(GetUserAgreementLogRequest request) async {
    final previousState = state;
    try {
      final response = await ref.read(userRepositoryProvider).getUserAgreementLog(request);
      final oldState = previousState.valueOrNull ?? const UserState();

      state = AsyncData(oldState.copyWith(
        hasAgreed: response.hasAgreed,
      ));
      
      return response;
    } on Object catch (e, stack) {
      state = AsyncError<UserState>(e, stack).copyWithPrevious(previousState);
      rethrow;
    }
  }

  /// ユーザー設定取得
  Future<void> getUserSettings(GetUserSettingsRequest request) async {
    final previousState = state;
    try {
      final response = await ref.read(userRepositoryProvider).getUserSettings(request);
      final oldState = previousState.valueOrNull ?? const UserState();

      state = AsyncData(oldState.copyWith(
        settingKeyValuePairs: response.settingKeyValuePairs,
      ));
    } on Object catch (e, stack) {
      state = AsyncError<UserState>(e, stack).copyWithPrevious(previousState);
    }
  }

  /// ユーザーステータス取得（戻り値付き）
  Future<UserStatus?> getUserStatus(GetUserStatusRequest request) async {
    final previousState = state;
    try {
      final response = await ref.read(userRepositoryProvider).getUserStatus(request);
      final oldState = previousState.valueOrNull ?? const UserState();

      state = AsyncData(oldState.copyWith(
        userStatus: response.userStatus,
      ));
      
      // UserStatusを直接返す
      return response.userStatus;
    } on Object catch (e, stack) {
      state = AsyncError<UserState>(e, stack).copyWithPrevious(previousState);
      return null;
    }
  }

  /// ユーザー設定更新
  Future<void> updateUserSettings(UpdateUserSettingsRequest request) async {
    final previousState = state;
    try {
      await ref.read(userRepositoryProvider).updateUserSettings(request);
    } on Object catch (e, stack) {
      state = AsyncError<UserState>(e, stack).copyWithPrevious(previousState);
    }
  }

  /// ユーザーステータス更新
  Future<void> updateUserStatus(UpdateUserStatusRequest request) async {
    final previousState = state;
    try {
      await ref.read(userRepositoryProvider).updateUserStatus(request);
    } on Object catch (e, stack) {
      state = AsyncError<UserState>(e, stack).copyWithPrevious(previousState);
    }
  }
}

