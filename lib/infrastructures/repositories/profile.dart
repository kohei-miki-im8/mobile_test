import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/update_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/create_profile.pb.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile.g.dart';

/// ProfileRepositoryのインスタンスを提供する
class ProfileRepository {
  ProfileRepository(this._apiClient) {
    _profileClient = _apiClient.createClient(ProfileServiceClient.new);
  }

  final ApiClient _apiClient;
  late final ProfileServiceClient _profileClient;

  // プロフィール取得
  Future<GetProfileResponse> getProfile(GetProfileRequest request) async {
    try {
      final result = await _apiClient.call<GetProfileResponse>(
        client: _profileClient,
        method: ApiMethodUnary.getProfile,
        request: request,
      );

      if (result.error != null) {
        throw Exception('failed get Profile: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get Profile: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get Profile: $e');
    }
  }

  // プロフィール作成
  Future<CreateProfileResponse> createProfile(
    CreateProfileRequest request,
  ) async {
    try {
      final result = await _apiClient.call<CreateProfileResponse>(
        client: _profileClient,
        method: ApiMethodUnary.createProfile,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create Profile: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create Profile: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create Profile: $e');
    }
  }

  // プロフィール更新
  Future<UpdateProfileResponse> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      final result = await _apiClient.call<UpdateProfileResponse>(
        client: _profileClient,
        method: ApiMethodUnary.updateProfile,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update Profile: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update Profile: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update Profile: $e');
    }
  }
}

/// ProfileRepository
@riverpod
ProfileRepository profileRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProfileRepository(apiClient);
}
