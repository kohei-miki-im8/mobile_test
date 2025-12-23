//
//  Generated code. Do not modify.
//  source: econa/services/site/profile/v1/update_profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/profile.pb.dart' as $140;

enum UpdateProfileRequest_Profile {
  updatableProfile, 
  optionalProfile, 
  notSet
}

/// プロフィール更新リクエスト
class UpdateProfileRequest extends $pb.GeneratedMessage {
  factory UpdateProfileRequest({
    $140.UpdatableProfile? updatableProfile,
    $140.OptionalProfile? optionalProfile,
  }) {
    final $result = create();
    if (updatableProfile != null) {
      $result.updatableProfile = updatableProfile;
    }
    if (optionalProfile != null) {
      $result.optionalProfile = optionalProfile;
    }
    return $result;
  }
  UpdateProfileRequest._() : super();
  factory UpdateProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpdateProfileRequest_Profile> _UpdateProfileRequest_ProfileByTag = {
    1 : UpdateProfileRequest_Profile.updatableProfile,
    2 : UpdateProfileRequest_Profile.optionalProfile,
    0 : UpdateProfileRequest_Profile.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.profile.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<$140.UpdatableProfile>(1, _omitFieldNames ? '' : 'updatableProfile', subBuilder: $140.UpdatableProfile.create)
    ..aOM<$140.OptionalProfile>(2, _omitFieldNames ? '' : 'optionalProfile', subBuilder: $140.OptionalProfile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfileRequest clone() => UpdateProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfileRequest copyWith(void Function(UpdateProfileRequest) updates) => super.copyWith((message) => updates(message as UpdateProfileRequest)) as UpdateProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest create() => UpdateProfileRequest._();
  UpdateProfileRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileRequest> createRepeated() => $pb.PbList<UpdateProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileRequest>(create);
  static UpdateProfileRequest? _defaultInstance;

  UpdateProfileRequest_Profile whichProfile() => _UpdateProfileRequest_ProfileByTag[$_whichOneof(0)]!;
  void clearProfile() => clearField($_whichOneof(0));

  /// 更新可能なプロフィール
  @$pb.TagNumber(1)
  $140.UpdatableProfile get updatableProfile => $_getN(0);
  @$pb.TagNumber(1)
  set updatableProfile($140.UpdatableProfile v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatableProfile() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatableProfile() => clearField(1);
  @$pb.TagNumber(1)
  $140.UpdatableProfile ensureUpdatableProfile() => $_ensure(0);

  /// 任意のプロフィール
  @$pb.TagNumber(2)
  $140.OptionalProfile get optionalProfile => $_getN(1);
  @$pb.TagNumber(2)
  set optionalProfile($140.OptionalProfile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOptionalProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearOptionalProfile() => clearField(2);
  @$pb.TagNumber(2)
  $140.OptionalProfile ensureOptionalProfile() => $_ensure(1);
}

/// プロフィール更新レスポンス
class UpdateProfileResponse extends $pb.GeneratedMessage {
  factory UpdateProfileResponse() => create();
  UpdateProfileResponse._() : super();
  factory UpdateProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.profile.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProfileResponse clone() => UpdateProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProfileResponse copyWith(void Function(UpdateProfileResponse) updates) => super.copyWith((message) => updates(message as UpdateProfileResponse)) as UpdateProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse create() => UpdateProfileResponse._();
  UpdateProfileResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProfileResponse> createRepeated() => $pb.PbList<UpdateProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProfileResponse>(create);
  static UpdateProfileResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
