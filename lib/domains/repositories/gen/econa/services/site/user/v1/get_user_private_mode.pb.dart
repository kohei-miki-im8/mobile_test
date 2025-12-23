//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_private_mode.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// プライベートモード状態取得リクエスト
class GetUserPrivateModeRequest extends $pb.GeneratedMessage {
  factory GetUserPrivateModeRequest() => create();
  GetUserPrivateModeRequest._() : super();
  factory GetUserPrivateModeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPrivateModeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPrivateModeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPrivateModeRequest clone() => GetUserPrivateModeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPrivateModeRequest copyWith(void Function(GetUserPrivateModeRequest) updates) => super.copyWith((message) => updates(message as GetUserPrivateModeRequest)) as GetUserPrivateModeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPrivateModeRequest create() => GetUserPrivateModeRequest._();
  GetUserPrivateModeRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserPrivateModeRequest> createRepeated() => $pb.PbList<GetUserPrivateModeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserPrivateModeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPrivateModeRequest>(create);
  static GetUserPrivateModeRequest? _defaultInstance;
}

/// プライベートモード状態取得レスポンス
class GetUserPrivateModeResponse extends $pb.GeneratedMessage {
  factory GetUserPrivateModeResponse({
    $core.bool? enabled,
    $109.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  GetUserPrivateModeResponse._() : super();
  factory GetUserPrivateModeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPrivateModeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPrivateModeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOM<$109.Timestamp>(2, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPrivateModeResponse clone() => GetUserPrivateModeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPrivateModeResponse copyWith(void Function(GetUserPrivateModeResponse) updates) => super.copyWith((message) => updates(message as GetUserPrivateModeResponse)) as GetUserPrivateModeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPrivateModeResponse create() => GetUserPrivateModeResponse._();
  GetUserPrivateModeResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserPrivateModeResponse> createRepeated() => $pb.PbList<GetUserPrivateModeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserPrivateModeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPrivateModeResponse>(create);
  static GetUserPrivateModeResponse? _defaultInstance;

  /// 有効区分
  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);

  /// 有効期限（利用経験がない場合はnull、ある場合は最終レコードの有効期限）
  @$pb.TagNumber(2)
  $109.Timestamp get expiresAt => $_getN(1);
  @$pb.TagNumber(2)
  set expiresAt($109.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasExpiresAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearExpiresAt() => clearField(2);
  @$pb.TagNumber(2)
  $109.Timestamp ensureExpiresAt() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
