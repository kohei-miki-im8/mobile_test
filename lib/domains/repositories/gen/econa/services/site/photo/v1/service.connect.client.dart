//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "update_profile_photo_caption.pb.dart" as econaservicessitephotov1update_profile_photo_caption;
import "service.connect.spec.dart" as specs;
import "update_profile_photo_display_order.pb.dart" as econaservicessitephotov1update_profile_photo_display_order;
import "delete_profile_photo.pb.dart" as econaservicessitephotov1delete_profile_photo;
import "set_avatar_crop_settings.pb.dart" as econaservicessitephotov1set_avatar_crop_settings;

/// 写真機能を提供するサービスです。
extension type PhotoServiceClient (connect.Transport _transport) {
  /// UpdateProfilePhotoCaption:プロフィール写真のキャプションを更新
  Future<econaservicessitephotov1update_profile_photo_caption.UpdateProfilePhotoCaptionResponse> updateProfilePhotoCaption(
    econaservicessitephotov1update_profile_photo_caption.UpdateProfilePhotoCaptionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PhotoService.updateProfilePhotoCaption,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateProfilePhotoDisplayOrder:プロフィール写真の表示順序を更新
  Future<econaservicessitephotov1update_profile_photo_display_order.UpdateProfilePhotoDisplayOrderResponse> updateProfilePhotoDisplayOrder(
    econaservicessitephotov1update_profile_photo_display_order.UpdateProfilePhotoDisplayOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PhotoService.updateProfilePhotoDisplayOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// DeleteProfilePhoto:プロフィール写真を削除
  Future<econaservicessitephotov1delete_profile_photo.DeleteProfilePhotoResponse> deleteProfilePhoto(
    econaservicessitephotov1delete_profile_photo.DeleteProfilePhotoRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PhotoService.deleteProfilePhoto,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// SetAvatarCropSettings:アバター画像のクロップ設定を保存してPyProcへ送信
  Future<econaservicessitephotov1set_avatar_crop_settings.SetAvatarCropSettingsResponse> setAvatarCropSettings(
    econaservicessitephotov1set_avatar_crop_settings.SetAvatarCropSettingsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PhotoService.setAvatarCropSettings,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
