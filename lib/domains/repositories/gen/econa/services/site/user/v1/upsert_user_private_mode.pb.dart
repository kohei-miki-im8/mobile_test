//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/upsert_user_private_mode.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;
import '../../../../enums/service_code.pbenum.dart' as $189;

enum UpsertUserPrivateModeRequest_Request {
  serviceCode, 
  enable, 
  notSet
}

/// プライベートモード有効化リクエスト
class UpsertUserPrivateModeRequest extends $pb.GeneratedMessage {
  factory UpsertUserPrivateModeRequest({
    $189.ServiceCode? serviceCode,
    $core.bool? enable,
  }) {
    final $result = create();
    if (serviceCode != null) {
      $result.serviceCode = serviceCode;
    }
    if (enable != null) {
      $result.enable = enable;
    }
    return $result;
  }
  UpsertUserPrivateModeRequest._() : super();
  factory UpsertUserPrivateModeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertUserPrivateModeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpsertUserPrivateModeRequest_Request> _UpsertUserPrivateModeRequest_RequestByTag = {
    1 : UpsertUserPrivateModeRequest_Request.serviceCode,
    2 : UpsertUserPrivateModeRequest_Request.enable,
    0 : UpsertUserPrivateModeRequest_Request.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertUserPrivateModeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..e<$189.ServiceCode>(1, _omitFieldNames ? '' : 'serviceCode', $pb.PbFieldType.OE, defaultOrMaker: $189.ServiceCode.SERVICE_CODE_UNSPECIFIED, valueOf: $189.ServiceCode.valueOf, enumValues: $189.ServiceCode.values)
    ..aOB(2, _omitFieldNames ? '' : 'enable')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertUserPrivateModeRequest clone() => UpsertUserPrivateModeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertUserPrivateModeRequest copyWith(void Function(UpsertUserPrivateModeRequest) updates) => super.copyWith((message) => updates(message as UpsertUserPrivateModeRequest)) as UpsertUserPrivateModeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertUserPrivateModeRequest create() => UpsertUserPrivateModeRequest._();
  UpsertUserPrivateModeRequest createEmptyInstance() => create();
  static $pb.PbList<UpsertUserPrivateModeRequest> createRepeated() => $pb.PbList<UpsertUserPrivateModeRequest>();
  @$core.pragma('dart2js:noInline')
  static UpsertUserPrivateModeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertUserPrivateModeRequest>(create);
  static UpsertUserPrivateModeRequest? _defaultInstance;

  UpsertUserPrivateModeRequest_Request whichRequest() => _UpsertUserPrivateModeRequest_RequestByTag[$_whichOneof(0)]!;
  void clearRequest() => clearField($_whichOneof(0));

  /// サービスコード（新規購入若しくは延長時に指定）
  @$pb.TagNumber(1)
  $189.ServiceCode get serviceCode => $_getN(0);
  @$pb.TagNumber(1)
  set serviceCode($189.ServiceCode v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceCode() => clearField(1);

  /// プライベートモードを有効にするかどうか（有効期間中での指定を想定）
  @$pb.TagNumber(2)
  $core.bool get enable => $_getBF(1);
  @$pb.TagNumber(2)
  set enable($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnable() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnable() => clearField(2);
}

/// プライベートモード有効化レスポンス
class UpsertUserPrivateModeResponse extends $pb.GeneratedMessage {
  factory UpsertUserPrivateModeResponse({
    $109.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  UpsertUserPrivateModeResponse._() : super();
  factory UpsertUserPrivateModeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpsertUserPrivateModeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpsertUserPrivateModeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpsertUserPrivateModeResponse clone() => UpsertUserPrivateModeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpsertUserPrivateModeResponse copyWith(void Function(UpsertUserPrivateModeResponse) updates) => super.copyWith((message) => updates(message as UpsertUserPrivateModeResponse)) as UpsertUserPrivateModeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpsertUserPrivateModeResponse create() => UpsertUserPrivateModeResponse._();
  UpsertUserPrivateModeResponse createEmptyInstance() => create();
  static $pb.PbList<UpsertUserPrivateModeResponse> createRepeated() => $pb.PbList<UpsertUserPrivateModeResponse>();
  @$core.pragma('dart2js:noInline')
  static UpsertUserPrivateModeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpsertUserPrivateModeResponse>(create);
  static UpsertUserPrivateModeResponse? _defaultInstance;

  /// プライベートモードの有効期限
  @$pb.TagNumber(1)
  $109.Timestamp get expiresAt => $_getN(0);
  @$pb.TagNumber(1)
  set expiresAt($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExpiresAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpiresAt() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureExpiresAt() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
