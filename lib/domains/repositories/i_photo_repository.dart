import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/delete_profile_photo.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_caption.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/photo/v1/update_profile_photo_display_order.pb.dart';

/// Photo関連のRepositoryインターフェース
abstract class IPhotoRepository {
  /// プロフィール写真のキャプションを更新
  Future<UpdateProfilePhotoCaptionResponse> updateCaption(
    UpdateProfilePhotoCaptionRequest request,
  );

  /// プロフィール写真の表示順序を更新
  Future<UpdateProfilePhotoDisplayOrderResponse> updateDisplayOrder(
    UpdateProfilePhotoDisplayOrderRequest request,
  );

  /// プロフィール写真を削除
  Future<DeleteProfilePhotoResponse> deleteProfilePhoto(
    DeleteProfilePhotoRequest request,
  );
}


