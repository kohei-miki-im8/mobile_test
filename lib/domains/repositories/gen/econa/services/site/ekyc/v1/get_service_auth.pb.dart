//
//  Generated code. Do not modify.
//  source: econa/services/site/ekyc/v1/get_service_auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// GMO顔認証サービス認証リクエスト
class GetServiceAuthRequest extends $pb.GeneratedMessage {
  factory GetServiceAuthRequest() => create();
  GetServiceAuthRequest._() : super();
  factory GetServiceAuthRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetServiceAuthRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetServiceAuthRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.ekyc.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetServiceAuthRequest clone() => GetServiceAuthRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetServiceAuthRequest copyWith(void Function(GetServiceAuthRequest) updates) => super.copyWith((message) => updates(message as GetServiceAuthRequest)) as GetServiceAuthRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServiceAuthRequest create() => GetServiceAuthRequest._();
  GetServiceAuthRequest createEmptyInstance() => create();
  static $pb.PbList<GetServiceAuthRequest> createRepeated() => $pb.PbList<GetServiceAuthRequest>();
  @$core.pragma('dart2js:noInline')
  static GetServiceAuthRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetServiceAuthRequest>(create);
  static GetServiceAuthRequest? _defaultInstance;
}

/// GMO顔認証サービス認証レスポンス
class GetServiceAuthResponse extends $pb.GeneratedMessage {
  factory GetServiceAuthResponse({
    $core.String? accessToken,
    $core.String? errorCode,
    $core.bool? isAlreadyVerified,
    $core.String? ekycStatus,
    $core.String? failureReason,
  }) {
    final $result = create();
    if (accessToken != null) {
      $result.accessToken = accessToken;
    }
    if (errorCode != null) {
      $result.errorCode = errorCode;
    }
    if (isAlreadyVerified != null) {
      $result.isAlreadyVerified = isAlreadyVerified;
    }
    if (ekycStatus != null) {
      $result.ekycStatus = ekycStatus;
    }
    if (failureReason != null) {
      $result.failureReason = failureReason;
    }
    return $result;
  }
  GetServiceAuthResponse._() : super();
  factory GetServiceAuthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetServiceAuthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetServiceAuthResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.ekyc.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accessToken')
    ..aOS(2, _omitFieldNames ? '' : 'errorCode')
    ..aOB(3, _omitFieldNames ? '' : 'isAlreadyVerified')
    ..aOS(4, _omitFieldNames ? '' : 'ekycStatus')
    ..aOS(5, _omitFieldNames ? '' : 'failureReason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetServiceAuthResponse clone() => GetServiceAuthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetServiceAuthResponse copyWith(void Function(GetServiceAuthResponse) updates) => super.copyWith((message) => updates(message as GetServiceAuthResponse)) as GetServiceAuthResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServiceAuthResponse create() => GetServiceAuthResponse._();
  GetServiceAuthResponse createEmptyInstance() => create();
  static $pb.PbList<GetServiceAuthResponse> createRepeated() => $pb.PbList<GetServiceAuthResponse>();
  @$core.pragma('dart2js:noInline')
  static GetServiceAuthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetServiceAuthResponse>(create);
  static GetServiceAuthResponse? _defaultInstance;

  /// GMOから発行されたJWTアクセストークン
  @$pb.TagNumber(1)
  $core.String get accessToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set accessToken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccessToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccessToken() => clearField(1);

  /// エラーコード
  @$pb.TagNumber(2)
  $core.String get errorCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => clearField(2);

  /// eKYC認証が既に完了している場合にtrue
  @$pb.TagNumber(3)
  $core.bool get isAlreadyVerified => $_getBF(2);
  @$pb.TagNumber(3)
  set isAlreadyVerified($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsAlreadyVerified() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsAlreadyVerified() => clearField(3);

  /// eKYCステータス（NONE/PENDING/COMPLETED/FAILED）
  @$pb.TagNumber(4)
  $core.String get ekycStatus => $_getSZ(3);
  @$pb.TagNumber(4)
  set ekycStatus($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEkycStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearEkycStatus() => clearField(4);

  /// 失敗理由カテゴリ（失敗時のみ設定）
  @$pb.TagNumber(5)
  $core.String get failureReason => $_getSZ(4);
  @$pb.TagNumber(5)
  set failureReason($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFailureReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearFailureReason() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
