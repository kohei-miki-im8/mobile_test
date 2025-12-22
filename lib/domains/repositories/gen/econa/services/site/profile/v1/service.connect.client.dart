//
//  Generated code. Do not modify.
//  source: econa/services/site/profile/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_profile.pb.dart" as econaservicessiteprofilev1create_profile;
import "service.connect.spec.dart" as specs;
import "get_profile.pb.dart" as econaservicessiteprofilev1get_profile;
import "update_profile.pb.dart" as econaservicessiteprofilev1update_profile;

/// プロフィール機能を提供するサービスです。
extension type ProfileServiceClient (connect.Transport _transport) {
  /// CreateProfile:プロフィールを作成します。
  Future<econaservicessiteprofilev1create_profile.CreateProfileResponse> createProfile(
    econaservicessiteprofilev1create_profile.CreateProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProfileService.createProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetProfile:プロフィールを取得します。
  Future<econaservicessiteprofilev1get_profile.GetProfileResponse> getProfile(
    econaservicessiteprofilev1get_profile.GetProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProfileService.getProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateProfile:プロフィールを更新します。
  Future<econaservicessiteprofilev1update_profile.UpdateProfileResponse> updateProfile(
    econaservicessiteprofilev1update_profile.UpdateProfileRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProfileService.updateProfile,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
