//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'delete_profile_photo.pb.dart' as $59;
import 'set_avatar_crop_settings.pb.dart' as $60;
import 'update_profile_photo_caption.pb.dart' as $57;
import 'update_profile_photo_display_order.pb.dart' as $58;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.photo.v1.PhotoService')
class PhotoServiceClient extends $grpc.Client {
  static final _$updateProfilePhotoCaption = $grpc.ClientMethod<$57.UpdateProfilePhotoCaptionRequest, $57.UpdateProfilePhotoCaptionResponse>(
      '/econa.services.site.photo.v1.PhotoService/UpdateProfilePhotoCaption',
      ($57.UpdateProfilePhotoCaptionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $57.UpdateProfilePhotoCaptionResponse.fromBuffer(value));
  static final _$updateProfilePhotoDisplayOrder = $grpc.ClientMethod<$58.UpdateProfilePhotoDisplayOrderRequest, $58.UpdateProfilePhotoDisplayOrderResponse>(
      '/econa.services.site.photo.v1.PhotoService/UpdateProfilePhotoDisplayOrder',
      ($58.UpdateProfilePhotoDisplayOrderRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $58.UpdateProfilePhotoDisplayOrderResponse.fromBuffer(value));
  static final _$deleteProfilePhoto = $grpc.ClientMethod<$59.DeleteProfilePhotoRequest, $59.DeleteProfilePhotoResponse>(
      '/econa.services.site.photo.v1.PhotoService/DeleteProfilePhoto',
      ($59.DeleteProfilePhotoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $59.DeleteProfilePhotoResponse.fromBuffer(value));
  static final _$setAvatarCropSettings = $grpc.ClientMethod<$60.SetAvatarCropSettingsRequest, $60.SetAvatarCropSettingsResponse>(
      '/econa.services.site.photo.v1.PhotoService/SetAvatarCropSettings',
      ($60.SetAvatarCropSettingsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $60.SetAvatarCropSettingsResponse.fromBuffer(value));

  PhotoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$57.UpdateProfilePhotoCaptionResponse> updateProfilePhotoCaption($57.UpdateProfilePhotoCaptionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfilePhotoCaption, request, options: options);
  }

  $grpc.ResponseFuture<$58.UpdateProfilePhotoDisplayOrderResponse> updateProfilePhotoDisplayOrder($58.UpdateProfilePhotoDisplayOrderRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfilePhotoDisplayOrder, request, options: options);
  }

  $grpc.ResponseFuture<$59.DeleteProfilePhotoResponse> deleteProfilePhoto($59.DeleteProfilePhotoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteProfilePhoto, request, options: options);
  }

  $grpc.ResponseFuture<$60.SetAvatarCropSettingsResponse> setAvatarCropSettings($60.SetAvatarCropSettingsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setAvatarCropSettings, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.photo.v1.PhotoService')
abstract class PhotoServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.photo.v1.PhotoService';

  PhotoServiceBase() {
    $addMethod($grpc.ServiceMethod<$57.UpdateProfilePhotoCaptionRequest, $57.UpdateProfilePhotoCaptionResponse>(
        'UpdateProfilePhotoCaption',
        updateProfilePhotoCaption_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $57.UpdateProfilePhotoCaptionRequest.fromBuffer(value),
        ($57.UpdateProfilePhotoCaptionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$58.UpdateProfilePhotoDisplayOrderRequest, $58.UpdateProfilePhotoDisplayOrderResponse>(
        'UpdateProfilePhotoDisplayOrder',
        updateProfilePhotoDisplayOrder_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $58.UpdateProfilePhotoDisplayOrderRequest.fromBuffer(value),
        ($58.UpdateProfilePhotoDisplayOrderResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$59.DeleteProfilePhotoRequest, $59.DeleteProfilePhotoResponse>(
        'DeleteProfilePhoto',
        deleteProfilePhoto_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $59.DeleteProfilePhotoRequest.fromBuffer(value),
        ($59.DeleteProfilePhotoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$60.SetAvatarCropSettingsRequest, $60.SetAvatarCropSettingsResponse>(
        'SetAvatarCropSettings',
        setAvatarCropSettings_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $60.SetAvatarCropSettingsRequest.fromBuffer(value),
        ($60.SetAvatarCropSettingsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$57.UpdateProfilePhotoCaptionResponse> updateProfilePhotoCaption_Pre($grpc.ServiceCall call, $async.Future<$57.UpdateProfilePhotoCaptionRequest> request) async {
    return updateProfilePhotoCaption(call, await request);
  }

  $async.Future<$58.UpdateProfilePhotoDisplayOrderResponse> updateProfilePhotoDisplayOrder_Pre($grpc.ServiceCall call, $async.Future<$58.UpdateProfilePhotoDisplayOrderRequest> request) async {
    return updateProfilePhotoDisplayOrder(call, await request);
  }

  $async.Future<$59.DeleteProfilePhotoResponse> deleteProfilePhoto_Pre($grpc.ServiceCall call, $async.Future<$59.DeleteProfilePhotoRequest> request) async {
    return deleteProfilePhoto(call, await request);
  }

  $async.Future<$60.SetAvatarCropSettingsResponse> setAvatarCropSettings_Pre($grpc.ServiceCall call, $async.Future<$60.SetAvatarCropSettingsRequest> request) async {
    return setAvatarCropSettings(call, await request);
  }

  $async.Future<$57.UpdateProfilePhotoCaptionResponse> updateProfilePhotoCaption($grpc.ServiceCall call, $57.UpdateProfilePhotoCaptionRequest request);
  $async.Future<$58.UpdateProfilePhotoDisplayOrderResponse> updateProfilePhotoDisplayOrder($grpc.ServiceCall call, $58.UpdateProfilePhotoDisplayOrderRequest request);
  $async.Future<$59.DeleteProfilePhotoResponse> deleteProfilePhoto($grpc.ServiceCall call, $59.DeleteProfilePhotoRequest request);
  $async.Future<$60.SetAvatarCropSettingsResponse> setAvatarCropSettings($grpc.ServiceCall call, $60.SetAvatarCropSettingsRequest request);
}
