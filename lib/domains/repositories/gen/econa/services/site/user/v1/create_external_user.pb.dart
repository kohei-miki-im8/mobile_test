//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/create_external_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/external_service_code.pbenum.dart' as $183;

/// 外部用ユーザーを作成リクエスト
class CreateExternalUserRequest extends $pb.GeneratedMessage {
  factory CreateExternalUserRequest({
    $183.ExternalServiceCode? externalServiceCode,
    $core.String? externalUniqueId,
  }) {
    final $result = create();
    if (externalServiceCode != null) {
      $result.externalServiceCode = externalServiceCode;
    }
    if (externalUniqueId != null) {
      $result.externalUniqueId = externalUniqueId;
    }
    return $result;
  }
  CreateExternalUserRequest._() : super();
  factory CreateExternalUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateExternalUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateExternalUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..e<$183.ExternalServiceCode>(1, _omitFieldNames ? '' : 'externalServiceCode', $pb.PbFieldType.OE, defaultOrMaker: $183.ExternalServiceCode.EXTERNAL_SERVICE_CODE_UNSPECIFIED, valueOf: $183.ExternalServiceCode.valueOf, enumValues: $183.ExternalServiceCode.values)
    ..aOS(2, _omitFieldNames ? '' : 'externalUniqueId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateExternalUserRequest clone() => CreateExternalUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateExternalUserRequest copyWith(void Function(CreateExternalUserRequest) updates) => super.copyWith((message) => updates(message as CreateExternalUserRequest)) as CreateExternalUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateExternalUserRequest create() => CreateExternalUserRequest._();
  CreateExternalUserRequest createEmptyInstance() => create();
  static $pb.PbList<CreateExternalUserRequest> createRepeated() => $pb.PbList<CreateExternalUserRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateExternalUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateExternalUserRequest>(create);
  static CreateExternalUserRequest? _defaultInstance;

  /// 外部サービスコード
  @$pb.TagNumber(1)
  $183.ExternalServiceCode get externalServiceCode => $_getN(0);
  @$pb.TagNumber(1)
  set externalServiceCode($183.ExternalServiceCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExternalServiceCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearExternalServiceCode() => clearField(1);

  /// 外部サービスで生成されたユニークID
  @$pb.TagNumber(2)
  $core.String get externalUniqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set externalUniqueId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExternalUniqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExternalUniqueId() => clearField(2);
}

/// 外部用ユーザーを作成レスポンス
class CreateExternalUserResponse extends $pb.GeneratedMessage {
  factory CreateExternalUserResponse({
    $core.String? externalUserId,
  }) {
    final $result = create();
    if (externalUserId != null) {
      $result.externalUserId = externalUserId;
    }
    return $result;
  }
  CreateExternalUserResponse._() : super();
  factory CreateExternalUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateExternalUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateExternalUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'externalUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateExternalUserResponse clone() => CreateExternalUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateExternalUserResponse copyWith(void Function(CreateExternalUserResponse) updates) => super.copyWith((message) => updates(message as CreateExternalUserResponse)) as CreateExternalUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateExternalUserResponse create() => CreateExternalUserResponse._();
  CreateExternalUserResponse createEmptyInstance() => create();
  static $pb.PbList<CreateExternalUserResponse> createRepeated() => $pb.PbList<CreateExternalUserResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateExternalUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateExternalUserResponse>(create);
  static CreateExternalUserResponse? _defaultInstance;

  /// 外部用ユーザーID
  @$pb.TagNumber(1)
  $core.String get externalUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set externalUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExternalUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExternalUserId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
