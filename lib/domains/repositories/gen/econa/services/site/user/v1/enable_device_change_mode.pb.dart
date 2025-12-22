//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/enable_device_change_mode.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../../google/protobuf/timestamp.pb.dart' as $109;

/// EnableDeviceChangeModeRequest: 機種変更モード有効化リクエスト
class EnableDeviceChangeModeRequest extends $pb.GeneratedMessage {
  factory EnableDeviceChangeModeRequest() => create();
  EnableDeviceChangeModeRequest._() : super();
  factory EnableDeviceChangeModeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnableDeviceChangeModeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EnableDeviceChangeModeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnableDeviceChangeModeRequest clone() => EnableDeviceChangeModeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnableDeviceChangeModeRequest copyWith(void Function(EnableDeviceChangeModeRequest) updates) => super.copyWith((message) => updates(message as EnableDeviceChangeModeRequest)) as EnableDeviceChangeModeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnableDeviceChangeModeRequest create() => EnableDeviceChangeModeRequest._();
  EnableDeviceChangeModeRequest createEmptyInstance() => create();
  static $pb.PbList<EnableDeviceChangeModeRequest> createRepeated() => $pb.PbList<EnableDeviceChangeModeRequest>();
  @$core.pragma('dart2js:noInline')
  static EnableDeviceChangeModeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnableDeviceChangeModeRequest>(create);
  static EnableDeviceChangeModeRequest? _defaultInstance;
}

/// EnableDeviceChangeModeResponse: 機種変更モード有効化レスポンス
class EnableDeviceChangeModeResponse extends $pb.GeneratedMessage {
  factory EnableDeviceChangeModeResponse({
    $109.Timestamp? enabledAt,
    $109.Timestamp? expiresAt,
  }) {
    final $result = create();
    if (enabledAt != null) {
      $result.enabledAt = enabledAt;
    }
    if (expiresAt != null) {
      $result.expiresAt = expiresAt;
    }
    return $result;
  }
  EnableDeviceChangeModeResponse._() : super();
  factory EnableDeviceChangeModeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnableDeviceChangeModeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EnableDeviceChangeModeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..aOM<$109.Timestamp>(1, _omitFieldNames ? '' : 'enabledAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(2, _omitFieldNames ? '' : 'expiresAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnableDeviceChangeModeResponse clone() => EnableDeviceChangeModeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnableDeviceChangeModeResponse copyWith(void Function(EnableDeviceChangeModeResponse) updates) => super.copyWith((message) => updates(message as EnableDeviceChangeModeResponse)) as EnableDeviceChangeModeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnableDeviceChangeModeResponse create() => EnableDeviceChangeModeResponse._();
  EnableDeviceChangeModeResponse createEmptyInstance() => create();
  static $pb.PbList<EnableDeviceChangeModeResponse> createRepeated() => $pb.PbList<EnableDeviceChangeModeResponse>();
  @$core.pragma('dart2js:noInline')
  static EnableDeviceChangeModeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnableDeviceChangeModeResponse>(create);
  static EnableDeviceChangeModeResponse? _defaultInstance;

  /// 機種変更モード有効化日時
  @$pb.TagNumber(1)
  $109.Timestamp get enabledAt => $_getN(0);
  @$pb.TagNumber(1)
  set enabledAt($109.Timestamp v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabledAt() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabledAt() => clearField(1);
  @$pb.TagNumber(1)
  $109.Timestamp ensureEnabledAt() => $_ensure(0);

  /// 機種変更モード有効期限（24時間後）
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
