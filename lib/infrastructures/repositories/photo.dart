import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/delete_profile_photo.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_caption.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_display_order.pb.dart';
import 'package:econa_mobile_app/domains/repositories/i_photo_repository.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo.g.dart';

/// PhotoRepositoryのインスタンスを提供する
class PhotoRepository implements IPhotoRepository {
  PhotoRepository(this._apiClient) {
    _photoClient = _apiClient.createClient(PhotoServiceClient.new);
  }

  final ApiClient _apiClient;
  late final PhotoServiceClient _photoClient;

  @override
  // キャプション更新
  Future<UpdateProfilePhotoCaptionResponse> updateCaption(
    UpdateProfilePhotoCaptionRequest request,
  ) async {
    try {
      final result = await _apiClient.call<UpdateProfilePhotoCaptionResponse>(
        client: _photoClient,
        method: ApiMethodUnary.updateProfilePhotoCaption,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update ProfilePhotoCaption: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update ProfilePhotoCaption: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update ProfilePhotoCaption: $e');
    }
  }

  @override
  // 表示順序更新
  Future<UpdateProfilePhotoDisplayOrderResponse> updateDisplayOrder(
    UpdateProfilePhotoDisplayOrderRequest request,
  ) async {
    try {
      final result = await _apiClient.call<UpdateProfilePhotoDisplayOrderResponse>(
        client: _photoClient,
        method: ApiMethodUnary.updateProfilePhotoDisplayOrder,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update ProfilePhotoDisplayOrder: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update ProfilePhotoDisplayOrder: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update ProfilePhotoDisplayOrder: $e');
    }
  }

  @override
  // プロフィール写真削除
  Future<DeleteProfilePhotoResponse> deleteProfilePhoto(
    DeleteProfilePhotoRequest request,
  ) async {
    try {
      final result = await _apiClient.call<DeleteProfilePhotoResponse>(
        client: _photoClient,
        method: ApiMethodUnary.deleteProfilePhoto,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed delete ProfilePhoto: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed delete ProfilePhoto: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed delete ProfilePhoto: $e');
    }
  }
}

/// PhotoRepository
@riverpod
PhotoRepository photoRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PhotoRepository(apiClient);
}
