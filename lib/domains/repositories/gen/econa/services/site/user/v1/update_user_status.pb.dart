//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/update_user_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/account_status_code.pbenum.dart' as $136;
import '../../../../enums/certificate_level_code.pbenum.dart' as $138;

enum UpdateUserStatusRequest_Status {
  accountStatusCode, 
  certificateLevelCode, 
  notSet
}

/// ユーザーステータス更新リクエスト
class UpdateUserStatusRequest extends $pb.GeneratedMessage {
  factory UpdateUserStatusRequest({
    $136.AccountStatusCode? accountStatusCode,
    $138.CertificateLevelCode? certificateLevelCode,
  }) {
    final $result = create();
    if (accountStatusCode != null) {
      $result.accountStatusCode = accountStatusCode;
    }
    if (certificateLevelCode != null) {
      $result.certificateLevelCode = certificateLevelCode;
    }
    return $result;
  }
  UpdateUserStatusRequest._() : super();
  factory UpdateUserStatusRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserStatusRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpdateUserStatusRequest_Status> _UpdateUserStatusRequest_StatusByTag = {
    1 : UpdateUserStatusRequest_Status.accountStatusCode,
    2 : UpdateUserStatusRequest_Status.certificateLevelCode,
    0 : UpdateUserStatusRequest_Status.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserStatusRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$136.AccountStatusCode>(1, _omitFieldNames ? '' : 'accountStatusCode', $pb.PbFieldType.OE, defaultOrMaker: $136.AccountStatusCode.ACCOUNT_STATUS_CODE_UNSPECIFIED, valueOf: $136.AccountStatusCode.valueOf, enumValues: $136.AccountStatusCode.values)
    ..e<$138.CertificateLevelCode>(2, _omitFieldNames ? '' : 'certificateLevelCode', $pb.PbFieldType.OE, defaultOrMaker: $138.CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNSPECIFIED, valueOf: $138.CertificateLevelCode.valueOf, enumValues: $138.CertificateLevelCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserStatusRequest clone() => UpdateUserStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserStatusRequest copyWith(void Function(UpdateUserStatusRequest) updates) => super.copyWith((message) => updates(message as UpdateUserStatusRequest)) as UpdateUserStatusRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserStatusRequest create() => UpdateUserStatusRequest._();
  UpdateUserStatusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserStatusRequest> createRepeated() => $pb.PbList<UpdateUserStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserStatusRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserStatusRequest>(create);
  static UpdateUserStatusRequest? _defaultInstance;

  UpdateUserStatusRequest_Status whichStatus() => _UpdateUserStatusRequest_StatusByTag[$_whichOneof(0)]!;
  void clearStatus() => clearField($_whichOneof(0));

  /// アカウントステータス
  @$pb.TagNumber(1)
  $136.AccountStatusCode get accountStatusCode => $_getN(0);
  @$pb.TagNumber(1)
  set accountStatusCode($136.AccountStatusCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountStatusCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountStatusCode() => clearField(1);

  /// 本人確認レベル
  @$pb.TagNumber(2)
  $138.CertificateLevelCode get certificateLevelCode => $_getN(1);
  @$pb.TagNumber(2)
  set certificateLevelCode($138.CertificateLevelCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCertificateLevelCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCertificateLevelCode() => clearField(2);
}

/// ユーザーステータス更新レスポンス
class UpdateUserStatusResponse extends $pb.GeneratedMessage {
  factory UpdateUserStatusResponse() => create();
  UpdateUserStatusResponse._() : super();
  factory UpdateUserStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserStatusResponse clone() => UpdateUserStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserStatusResponse copyWith(void Function(UpdateUserStatusResponse) updates) => super.copyWith((message) => updates(message as UpdateUserStatusResponse)) as UpdateUserStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserStatusResponse create() => UpdateUserStatusResponse._();
  UpdateUserStatusResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserStatusResponse> createRepeated() => $pb.PbList<UpdateUserStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserStatusResponse>(create);
  static UpdateUserStatusResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
