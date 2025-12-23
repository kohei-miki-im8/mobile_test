import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/create_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/update_profile.pb.dart';

/// プロフィール関連のRepository Interface
abstract class IProfileRepository {
  /// プロフィール作成
  Future<CreateProfileResponse> createProfile(CreateProfileRequest request);

  /// プロフィール取得
  Future<GetProfileResponse> getProfile(GetProfileRequest request);

  /// プロフィール更新
  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request);
}
