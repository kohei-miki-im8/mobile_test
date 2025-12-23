//
//  Generated code. Do not modify.
//  source: econa/services/site/profile/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_profile.pb.dart" as econaservicessiteprofilev1create_profile;
import "get_profile.pb.dart" as econaservicessiteprofilev1get_profile;
import "update_profile.pb.dart" as econaservicessiteprofilev1update_profile;

/// プロフィール機能を提供するサービスです。
abstract final class ProfileService {
  /// Fully-qualified name of the ProfileService service.
  static const name = 'econa.services.site.profile.v1.ProfileService';

  /// CreateProfile:プロフィールを作成します。
  static const createProfile = connect.Spec(
    '/$name/CreateProfile',
    connect.StreamType.unary,
    econaservicessiteprofilev1create_profile.CreateProfileRequest.new,
    econaservicessiteprofilev1create_profile.CreateProfileResponse.new,
  );

  /// GetProfile:プロフィールを取得します。
  static const getProfile = connect.Spec(
    '/$name/GetProfile',
    connect.StreamType.unary,
    econaservicessiteprofilev1get_profile.GetProfileRequest.new,
    econaservicessiteprofilev1get_profile.GetProfileResponse.new,
  );

  /// UpdateProfile:プロフィールを更新します。
  static const updateProfile = connect.Spec(
    '/$name/UpdateProfile',
    connect.StreamType.unary,
    econaservicessiteprofilev1update_profile.UpdateProfileRequest.new,
    econaservicessiteprofilev1update_profile.UpdateProfileResponse.new,
  );
}
