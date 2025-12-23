//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/update_profile_photo_caption.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/profile_photo.pb.dart' as $169;

/// プロフィール写真のキャプションを更新するリクエストです。
class UpdateProfilePhotoCaptionRequest extends $pb.GeneratedMessage {
  factory UpdateProfilePhotoCaptionRequest({
    $core.String? userProfilePhotoId,
    $core.String? caption,
  }) {
    final $result = create();
    if (userProfilePhotoId != null) {
      $result.userProfilePhotoId = userProfilePhotoId;
    }
    if (caption != null) {
      $result.caption = caption;
    }
    return $result;
  }
  UpdateProfilePhotoCaptionRequest._() : super();
  factory UpdateProfilePhotoCaptionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfilePhotoCaptionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfilePhotoCaptionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userProfilePhotoId')
    ..aOS(2, _omitFieldNames ? '' : 'caption')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoCaptionRequest clone() => UpdateProfilePhotoCaptionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoCaptionRequest copyWith(void Function(UpdateProfilePhotoCaptionRequest) updates) => super.copyWith((message) => updates(message as UpdateProfilePhotoCaptionRequest)) as UpdateProfilePhotoCaptionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoCaptionRequest create() => UpdateProfilePhotoCaptionRequest._();
  UpdateProfilePhotoCaptionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProfilePhotoCaptionRequest> createRepeated() => $pb.PbList<UpdateProfilePhotoCaptionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoCaptionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfilePhotoCaptionRequest>(create);
  static UpdateProfilePhotoCaptionRequest? _defaultInstance;

  /// プロフィール写真ID
  @$pb.TagNumber(1)
  $core.String get userProfilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userProfilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserProfilePhotoId() => clearField(1);

  /// キャプション（最大200文字、NULLABLE）
  /// - null: キャプションを未設定に戻す
  /// - "": キャプションを明示的に削除
  /// - "text": キャプションを設定
  @$pb.TagNumber(2)
  $core.String get caption => $_getSZ(1);
  @$pb.TagNumber(2)
  set caption($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCaption() => $_has(1);
  @$pb.TagNumber(2)
  void clearCaption() => clearField(2);
}

/// プロフィール写真のキャプションを更新するレスポンスです。
class UpdateProfilePhotoCaptionResponse extends $pb.GeneratedMessage {
  factory UpdateProfilePhotoCaptionResponse({
    $169.ProfilePhoto? profilePhoto,
  }) {
    final $result = create();
    if (profilePhoto != null) {
      $result.profilePhoto = profilePhoto;
    }
    return $result;
  }
  UpdateProfilePhotoCaptionResponse._() : super();
  factory UpdateProfilePhotoCaptionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfilePhotoCaptionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfilePhotoCaptionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..aOM<$169.ProfilePhoto>(1, _omitFieldNames ? '' : 'profilePhoto', subBuilder: $169.ProfilePhoto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoCaptionResponse clone() => UpdateProfilePhotoCaptionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoCaptionResponse copyWith(void Function(UpdateProfilePhotoCaptionResponse) updates) => super.copyWith((message) => updates(message as UpdateProfilePhotoCaptionResponse)) as UpdateProfilePhotoCaptionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoCaptionResponse create() => UpdateProfilePhotoCaptionResponse._();
  UpdateProfilePhotoCaptionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProfilePhotoCaptionResponse> createRepeated() => $pb.PbList<UpdateProfilePhotoCaptionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoCaptionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfilePhotoCaptionResponse>(create);
  static UpdateProfilePhotoCaptionResponse? _defaultInstance;

  /// 更新されたプロフィール写真情報
  @$pb.TagNumber(1)
  $169.ProfilePhoto get profilePhoto => $_getN(0);
  @$pb.TagNumber(1)
  set profilePhoto($169.ProfilePhoto v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfilePhoto() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePhoto() => clearField(1);
  @$pb.TagNumber(1)
  $169.ProfilePhoto ensureProfilePhoto() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
