//
//  Generated code. Do not modify.
//  source: econa/services/site/photo/v1/delete_profile_photo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// プロフィール写真を削除するリクエストです。
class DeleteProfilePhotoRequest extends $pb.GeneratedMessage {
  factory DeleteProfilePhotoRequest({
    $core.String? userProfilePhotoId,
  }) {
    final $result = create();
    if (userProfilePhotoId != null) {
      $result.userProfilePhotoId = userProfilePhotoId;
    }
    return $result;
  }
  DeleteProfilePhotoRequest._() : super();
  factory DeleteProfilePhotoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteProfilePhotoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteProfilePhotoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userProfilePhotoId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteProfilePhotoRequest clone() => DeleteProfilePhotoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteProfilePhotoRequest copyWith(void Function(DeleteProfilePhotoRequest) updates) => super.copyWith((message) => updates(message as DeleteProfilePhotoRequest)) as DeleteProfilePhotoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProfilePhotoRequest create() => DeleteProfilePhotoRequest._();
  DeleteProfilePhotoRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteProfilePhotoRequest> createRepeated() => $pb.PbList<DeleteProfilePhotoRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteProfilePhotoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteProfilePhotoRequest>(create);
  static DeleteProfilePhotoRequest? _defaultInstance;

  /// プロフィール写真ID
  @$pb.TagNumber(1)
  $core.String get userProfilePhotoId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userProfilePhotoId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserProfilePhotoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserProfilePhotoId() => clearField(1);
}

/// プロフィール写真を削除するレスポンスです。
class DeleteProfilePhotoResponse extends $pb.GeneratedMessage {
  factory DeleteProfilePhotoResponse() => create();
  DeleteProfilePhotoResponse._() : super();
  factory DeleteProfilePhotoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteProfilePhotoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteProfilePhotoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.photo.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteProfilePhotoResponse clone() => DeleteProfilePhotoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteProfilePhotoResponse copyWith(void Function(DeleteProfilePhotoResponse) updates) => super.copyWith((message) => updates(message as DeleteProfilePhotoResponse)) as DeleteProfilePhotoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProfilePhotoResponse create() => DeleteProfilePhotoResponse._();
  DeleteProfilePhotoResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteProfilePhotoResponse> createRepeated() => $pb.PbList<DeleteProfilePhotoResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteProfilePhotoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteProfilePhotoResponse>(create);
  static DeleteProfilePhotoResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
