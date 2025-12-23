//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/update_profile_photo_display_order.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/profile.pb.dart' as $140;

/// プロフィール写真の表示順序を更新するリクエストです。（承認不要）
class UpdateProfilePhotoDisplayOrderRequest extends $pb.GeneratedMessage {
  factory UpdateProfilePhotoDisplayOrderRequest({
    $core.String? userProfilePhotoId,
    $core.int? displayOrder,
  }) {
    final $result = create();
    if (userProfilePhotoId != null) {
      $result.userProfilePhotoId = userProfilePhotoId;
    }
    if (displayOrder != null) {
      $result.displayOrder = displayOrder;
    }
    return $result;
  }
  UpdateProfilePhotoDisplayOrderRequest._() : super();
  factory UpdateProfilePhotoDisplayOrderRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfilePhotoDisplayOrderRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfilePhotoDisplayOrderRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userProfilePhotoId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'displayOrder', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoDisplayOrderRequest clone() => UpdateProfilePhotoDisplayOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoDisplayOrderRequest copyWith(void Function(UpdateProfilePhotoDisplayOrderRequest) updates) => super.copyWith((message) => updates(message as UpdateProfilePhotoDisplayOrderRequest)) as UpdateProfilePhotoDisplayOrderRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoDisplayOrderRequest create() => UpdateProfilePhotoDisplayOrderRequest._();
  UpdateProfilePhotoDisplayOrderRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProfilePhotoDisplayOrderRequest> createRepeated() => $pb.PbList<UpdateProfilePhotoDisplayOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoDisplayOrderRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfilePhotoDisplayOrderRequest>(create);
  static UpdateProfilePhotoDisplayOrderRequest? _defaultInstance;

  /// プロフィール写真ID
  @$pb.TagNumber(1)
  $core.String get userProfilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userProfilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserProfilePhotoId() => clearField(1);

  /// 表示順序
  @$pb.TagNumber(2)
  $core.int get displayOrder => $_getIZ(1);
  @$pb.TagNumber(2)
  set displayOrder($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayOrder() => clearField(2);
}

/// プロフィール写真の表示順序を更新するレスポンスです。（承認不要）
class UpdateProfilePhotoDisplayOrderResponse extends $pb.GeneratedMessage {
  factory UpdateProfilePhotoDisplayOrderResponse({
    $core.Iterable<$140.RequiringReviewProfilePhoto>? profilePhotos,
  }) {
    final $result = create();
    if (profilePhotos != null) {
      $result.profilePhotos.addAll(profilePhotos);
    }
    return $result;
  }
  UpdateProfilePhotoDisplayOrderResponse._() : super();
  factory UpdateProfilePhotoDisplayOrderResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfilePhotoDisplayOrderResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfilePhotoDisplayOrderResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..pc<$140.RequiringReviewProfilePhoto>(1, _omitFieldNames ? '' : 'profilePhotos', $pb.PbFieldType.PM, subBuilder: $140.RequiringReviewProfilePhoto.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoDisplayOrderResponse clone() => UpdateProfilePhotoDisplayOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfilePhotoDisplayOrderResponse copyWith(void Function(UpdateProfilePhotoDisplayOrderResponse) updates) => super.copyWith((message) => updates(message as UpdateProfilePhotoDisplayOrderResponse)) as UpdateProfilePhotoDisplayOrderResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoDisplayOrderResponse create() => UpdateProfilePhotoDisplayOrderResponse._();
  UpdateProfilePhotoDisplayOrderResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProfilePhotoDisplayOrderResponse> createRepeated() => $pb.PbList<UpdateProfilePhotoDisplayOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfilePhotoDisplayOrderResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfilePhotoDisplayOrderResponse>(create);
  static UpdateProfilePhotoDisplayOrderResponse? _defaultInstance;

  /// プロフィール写真群
  @$pb.TagNumber(1)
  $core.List<$140.RequiringReviewProfilePhoto> get profilePhotos => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
