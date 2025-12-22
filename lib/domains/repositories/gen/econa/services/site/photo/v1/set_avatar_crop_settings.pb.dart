//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/set_avatar_crop_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/photo_crop_settings.pb.dart' as $165;

/// SetAvatarCropSettingsRequest: アバター画像クロップ設定リクエスト
class SetAvatarCropSettingsRequest extends $pb.GeneratedMessage {
  factory SetAvatarCropSettingsRequest({
    $core.String? profilePhotoId,
    $165.PhotoCropSettings? cropSettings,
  }) {
    final $result = create();
    if (profilePhotoId != null) {
      $result.profilePhotoId = profilePhotoId;
    }
    if (cropSettings != null) {
      $result.cropSettings = cropSettings;
    }
    return $result;
  }
  SetAvatarCropSettingsRequest._() : super();
  factory SetAvatarCropSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAvatarCropSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetAvatarCropSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'profilePhotoId')
    ..aOM<$165.PhotoCropSettings>(2, _omitFieldNames ? '' : 'cropSettings', subBuilder: $165.PhotoCropSettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAvatarCropSettingsRequest clone() => SetAvatarCropSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAvatarCropSettingsRequest copyWith(void Function(SetAvatarCropSettingsRequest) updates) => super.copyWith((message) => updates(message as SetAvatarCropSettingsRequest)) as SetAvatarCropSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetAvatarCropSettingsRequest create() => SetAvatarCropSettingsRequest._();
  SetAvatarCropSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<SetAvatarCropSettingsRequest> createRepeated() => $pb.PbList<SetAvatarCropSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static SetAvatarCropSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAvatarCropSettingsRequest>(create);
  static SetAvatarCropSettingsRequest? _defaultInstance;

  /// プロフィール写真ID
  @$pb.TagNumber(1)
  $core.String get profilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set profilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePhotoId() => clearField(1);

  /// クロップ設定
  @$pb.TagNumber(2)
  $165.PhotoCropSettings get cropSettings => $_getN(1);
  @$pb.TagNumber(2)
  set cropSettings($165.PhotoCropSettings v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCropSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearCropSettings() => clearField(2);
  @$pb.TagNumber(2)
  $165.PhotoCropSettings ensureCropSettings() => $_ensure(1);
}

/// SetAvatarCropSettingsResponse: アバター画像クロップ設定レスポンス
class SetAvatarCropSettingsResponse extends $pb.GeneratedMessage {
  factory SetAvatarCropSettingsResponse() => create();
  SetAvatarCropSettingsResponse._() : super();
  factory SetAvatarCropSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAvatarCropSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetAvatarCropSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAvatarCropSettingsResponse clone() => SetAvatarCropSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAvatarCropSettingsResponse copyWith(void Function(SetAvatarCropSettingsResponse) updates) => super.copyWith((message) => updates(message as SetAvatarCropSettingsResponse)) as SetAvatarCropSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetAvatarCropSettingsResponse create() => SetAvatarCropSettingsResponse._();
  SetAvatarCropSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<SetAvatarCropSettingsResponse> createRepeated() => $pb.PbList<SetAvatarCropSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static SetAvatarCropSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAvatarCropSettingsResponse>(create);
  static SetAvatarCropSettingsResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
