//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "update_profile_photo_caption.pb.dart" as econaservicessitephotov1update_profile_photo_caption;
import "update_profile_photo_display_order.pb.dart" as econaservicessitephotov1update_profile_photo_display_order;
import "delete_profile_photo.pb.dart" as econaservicessitephotov1delete_profile_photo;
import "set_avatar_crop_settings.pb.dart" as econaservicessitephotov1set_avatar_crop_settings;

/// 写真機能を提供するサービスです。
abstract final class PhotoService {
  /// Fully-qualified name of the PhotoService service.
  static const name = 'econa.services.site.photo.v1.PhotoService';

  /// UpdateProfilePhotoCaption:プロフィール写真のキャプションを更新
  static const updateProfilePhotoCaption = connect.Spec(
    '/$name/UpdateProfilePhotoCaption',
    connect.StreamType.unary,
    econaservicessitephotov1update_profile_photo_caption.UpdateProfilePhotoCaptionRequest.new,
    econaservicessitephotov1update_profile_photo_caption.UpdateProfilePhotoCaptionResponse.new,
  );

  /// UpdateProfilePhotoDisplayOrder:プロフィール写真の表示順序を更新
  static const updateProfilePhotoDisplayOrder = connect.Spec(
    '/$name/UpdateProfilePhotoDisplayOrder',
    connect.StreamType.unary,
    econaservicessitephotov1update_profile_photo_display_order.UpdateProfilePhotoDisplayOrderRequest.new,
    econaservicessitephotov1update_profile_photo_display_order.UpdateProfilePhotoDisplayOrderResponse.new,
  );

  /// DeleteProfilePhoto:プロフィール写真を削除
  static const deleteProfilePhoto = connect.Spec(
    '/$name/DeleteProfilePhoto',
    connect.StreamType.unary,
    econaservicessitephotov1delete_profile_photo.DeleteProfilePhotoRequest.new,
    econaservicessitephotov1delete_profile_photo.DeleteProfilePhotoResponse.new,
  );

  /// SetAvatarCropSettings:アバター画像のクロップ設定を保存してPyProcへ送信
  static const setAvatarCropSettings = connect.Spec(
    '/$name/SetAvatarCropSettings',
    connect.StreamType.unary,
    econaservicessitephotov1set_avatar_crop_settings.SetAvatarCropSettingsRequest.new,
    econaservicessitephotov1set_avatar_crop_settings.SetAvatarCropSettingsResponse.new,
  );
}
