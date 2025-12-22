//
//  Generated code. Do not modify.
//  source: econa/services/site/profile/v1/create_profile.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/gender_code.pbenum.dart' as $115;
import '../../../../shared/profile.pb.dart' as $140;

/// プロフィール作成リクエスト
class CreateProfileRequest extends $pb.GeneratedMessage {
  factory CreateProfileRequest({
    $115.GenderCode? genderCode,
    $140.UpdatableProfile? updatableProfile,
  }) {
    final $result = create();
    if (genderCode != null) {
      $result.genderCode = genderCode;
    }
    if (updatableProfile != null) {
      $result.updatableProfile = updatableProfile;
    }
    return $result;
  }
  CreateProfileRequest._() : super();
  factory CreateProfileRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProfileRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateProfileRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.profile.v1'), createEmptyInstance: create)
    ..e<$115.GenderCode>(1, _omitFieldNames ? '' : 'genderCode', $pb.PbFieldType.OE, defaultOrMaker: $115.GenderCode.GENDER_CODE_UNSPECIFIED, valueOf: $115.GenderCode.valueOf, enumValues: $115.GenderCode.values)
    ..aOM<$140.UpdatableProfile>(2, _omitFieldNames ? '' : 'updatableProfile', subBuilder: $140.UpdatableProfile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateProfileRequest clone() => CreateProfileRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateProfileRequest copyWith(void Function(CreateProfileRequest) updates) => super.copyWith((message) => updates(message as CreateProfileRequest)) as CreateProfileRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProfileRequest create() => CreateProfileRequest._();
  CreateProfileRequest createEmptyInstance() => create();
  static $pb.PbList<CreateProfileRequest> createRepeated() => $pb.PbList<CreateProfileRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateProfileRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateProfileRequest>(create);
  static CreateProfileRequest? _defaultInstance;

  /// 性別コード
  @$pb.TagNumber(1)
  $115.GenderCode get genderCode => $_getN(0);
  @$pb.TagNumber(1)
  set genderCode($115.GenderCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGenderCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearGenderCode() => clearField(1);

  /// 更新可能なプロフィール
  @$pb.TagNumber(2)
  $140.UpdatableProfile get updatableProfile => $_getN(1);
  @$pb.TagNumber(2)
  set updatableProfile($140.UpdatableProfile v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatableProfile() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatableProfile() => clearField(2);
  @$pb.TagNumber(2)
  $140.UpdatableProfile ensureUpdatableProfile() => $_ensure(1);
}

/// プロフィール作成レスポンス
class CreateProfileResponse extends $pb.GeneratedMessage {
  factory CreateProfileResponse() => create();
  CreateProfileResponse._() : super();
  factory CreateProfileResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateProfileResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateProfileResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.profile.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateProfileResponse clone() => CreateProfileResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateProfileResponse copyWith(void Function(CreateProfileResponse) updates) => super.copyWith((message) => updates(message as CreateProfileResponse)) as CreateProfileResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateProfileResponse create() => CreateProfileResponse._();
  CreateProfileResponse createEmptyInstance() => create();
  static $pb.PbList<CreateProfileResponse> createRepeated() => $pb.PbList<CreateProfileResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateProfileResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateProfileResponse>(create);
  static CreateProfileResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
