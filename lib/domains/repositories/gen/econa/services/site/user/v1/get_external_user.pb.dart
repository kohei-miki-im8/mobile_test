//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_external_user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/external_service_code.pbenum.dart' as $183;

/// 外部ユーザーを取得リクエスト
class GetExternalUserRequest extends $pb.GeneratedMessage {
  factory GetExternalUserRequest({
    $183.ExternalServiceCode? externalServiceCode,
  }) {
    final $result = create();
    if (externalServiceCode != null) {
      $result.externalServiceCode = externalServiceCode;
    }
    return $result;
  }
  GetExternalUserRequest._() : super();
  factory GetExternalUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetExternalUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetExternalUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..e<$183.ExternalServiceCode>(1, _omitFieldNames ? '' : 'externalServiceCode', $pb.PbFieldType.OE, defaultOrMaker: $183.ExternalServiceCode.EXTERNAL_SERVICE_CODE_UNSPECIFIED, valueOf: $183.ExternalServiceCode.valueOf, enumValues: $183.ExternalServiceCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetExternalUserRequest clone() => GetExternalUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetExternalUserRequest copyWith(void Function(GetExternalUserRequest) updates) => super.copyWith((message) => updates(message as GetExternalUserRequest)) as GetExternalUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetExternalUserRequest create() => GetExternalUserRequest._();
  GetExternalUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetExternalUserRequest> createRepeated() => $pb.PbList<GetExternalUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetExternalUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetExternalUserRequest>(create);
  static GetExternalUserRequest? _defaultInstance;

  /// 外部サービスコード
  @$pb.TagNumber(1)
  $183.ExternalServiceCode get externalServiceCode => $_getN(0);
  @$pb.TagNumber(1)
  set externalServiceCode($183.ExternalServiceCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExternalServiceCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearExternalServiceCode() => clearField(1);
}

/// 外部ユーザーを取得レスポンス
class GetExternalUserResponse extends $pb.GeneratedMessage {
  factory GetExternalUserResponse({
    $core.String? externalUserId,
    $core.String? externalUniqueId,
  }) {
    final $result = create();
    if (externalUserId != null) {
      $result.externalUserId = externalUserId;
    }
    if (externalUniqueId != null) {
      $result.externalUniqueId = externalUniqueId;
    }
    return $result;
  }
  GetExternalUserResponse._() : super();
  factory GetExternalUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetExternalUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetExternalUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'externalUserId')
    ..aOS(2, _omitFieldNames ? '' : 'externalUniqueId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetExternalUserResponse clone() => GetExternalUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetExternalUserResponse copyWith(void Function(GetExternalUserResponse) updates) => super.copyWith((message) => updates(message as GetExternalUserResponse)) as GetExternalUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetExternalUserResponse create() => GetExternalUserResponse._();
  GetExternalUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetExternalUserResponse> createRepeated() => $pb.PbList<GetExternalUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetExternalUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetExternalUserResponse>(create);
  static GetExternalUserResponse? _defaultInstance;

  /// 外部用ユーザーID
  @$pb.TagNumber(1)
  $core.String get externalUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set externalUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExternalUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExternalUserId() => clearField(1);

  /// 外部用ユニークID
  @$pb.TagNumber(2)
  $core.String get externalUniqueId => $_getSZ(1);
  @$pb.TagNumber(2)
  set externalUniqueId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExternalUniqueId() => $_has(1);
  @$pb.TagNumber(2)
  void clearExternalUniqueId() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
