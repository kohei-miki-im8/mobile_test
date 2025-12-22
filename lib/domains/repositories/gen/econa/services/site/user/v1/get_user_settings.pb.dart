//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/get_user_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/unified_setting_key.pbenum.dart' as $188;

/// ユーザー設定取得リクエスト
class GetUserSettingsRequest extends $pb.GeneratedMessage {
  factory GetUserSettingsRequest({
    $core.Iterable<$188.UnifiedSettingKey>? settingKeys,
  }) {
    final $result = create();
    if (settingKeys != null) {
      $result.settingKeys.addAll(settingKeys);
    }
    return $result;
  }
  GetUserSettingsRequest._() : super();
  factory GetUserSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..pc<$188.UnifiedSettingKey>(1, _omitFieldNames ? '' : 'settingKeys', $pb.PbFieldType.KE, valueOf: $188.UnifiedSettingKey.valueOf, enumValues: $188.UnifiedSettingKey.values, defaultEnumValue: $188.UnifiedSettingKey.UNIFIED_SETTING_KEY_UNSPECIFIED)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserSettingsRequest clone() => GetUserSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserSettingsRequest copyWith(void Function(GetUserSettingsRequest) updates) => super.copyWith((message) => updates(message as GetUserSettingsRequest)) as GetUserSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserSettingsRequest create() => GetUserSettingsRequest._();
  GetUserSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserSettingsRequest> createRepeated() => $pb.PbList<GetUserSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserSettingsRequest>(create);
  static GetUserSettingsRequest? _defaultInstance;

  /// 汎用設定キー
  @$pb.TagNumber(1)
  $core.List<$188.UnifiedSettingKey> get settingKeys => $_getList(0);
}

enum GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContent {
  value, 
  flag, 
  notSet
}

class GetUserSettingsResponse_UnifiedSettingKeyValuePair extends $pb.GeneratedMessage {
  factory GetUserSettingsResponse_UnifiedSettingKeyValuePair({
    $188.UnifiedSettingKey? settingKey,
    $core.String? value,
    $core.bool? flag,
  }) {
    final $result = create();
    if (settingKey != null) {
      $result.settingKey = settingKey;
    }
    if (value != null) {
      $result.value = value;
    }
    if (flag != null) {
      $result.flag = flag;
    }
    return $result;
  }
  GetUserSettingsResponse_UnifiedSettingKeyValuePair._() : super();
  factory GetUserSettingsResponse_UnifiedSettingKeyValuePair.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserSettingsResponse_UnifiedSettingKeyValuePair.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContent> _GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContentByTag = {
    2 : GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContent.value,
    3 : GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContent.flag,
    0 : GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContent.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserSettingsResponse.UnifiedSettingKeyValuePair', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<$188.UnifiedSettingKey>(1, _omitFieldNames ? '' : 'settingKey', $pb.PbFieldType.OE, defaultOrMaker: $188.UnifiedSettingKey.UNIFIED_SETTING_KEY_UNSPECIFIED, valueOf: $188.UnifiedSettingKey.valueOf, enumValues: $188.UnifiedSettingKey.values)
    ..aOS(2, _omitFieldNames ? '' : 'value')
    ..aOB(3, _omitFieldNames ? '' : 'flag')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserSettingsResponse_UnifiedSettingKeyValuePair clone() => GetUserSettingsResponse_UnifiedSettingKeyValuePair()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserSettingsResponse_UnifiedSettingKeyValuePair copyWith(void Function(GetUserSettingsResponse_UnifiedSettingKeyValuePair) updates) => super.copyWith((message) => updates(message as GetUserSettingsResponse_UnifiedSettingKeyValuePair)) as GetUserSettingsResponse_UnifiedSettingKeyValuePair;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserSettingsResponse_UnifiedSettingKeyValuePair create() => GetUserSettingsResponse_UnifiedSettingKeyValuePair._();
  GetUserSettingsResponse_UnifiedSettingKeyValuePair createEmptyInstance() => create();
  static $pb.PbList<GetUserSettingsResponse_UnifiedSettingKeyValuePair> createRepeated() => $pb.PbList<GetUserSettingsResponse_UnifiedSettingKeyValuePair>();
  @$core.pragma('dart2js:noInline')
  static GetUserSettingsResponse_UnifiedSettingKeyValuePair getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserSettingsResponse_UnifiedSettingKeyValuePair>(create);
  static GetUserSettingsResponse_UnifiedSettingKeyValuePair? _defaultInstance;

  GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContent whichValueContent() => _GetUserSettingsResponse_UnifiedSettingKeyValuePair_ValueContentByTag[$_whichOneof(0)]!;
  void clearValueContent() => clearField($_whichOneof(0));

  /// 汎用設定キー
  @$pb.TagNumber(1)
  $188.UnifiedSettingKey get settingKey => $_getN(0);
  @$pb.TagNumber(1)
  set settingKey($188.UnifiedSettingKey v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSettingKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSettingKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get flag => $_getBF(2);
  @$pb.TagNumber(3)
  set flag($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFlag() => $_has(2);
  @$pb.TagNumber(3)
  void clearFlag() => clearField(3);
}

/// ユーザー設定取得レスポンス
class GetUserSettingsResponse extends $pb.GeneratedMessage {
  factory GetUserSettingsResponse({
    $core.Iterable<GetUserSettingsResponse_UnifiedSettingKeyValuePair>? settingKeyValuePairs,
  }) {
    final $result = create();
    if (settingKeyValuePairs != null) {
      $result.settingKeyValuePairs.addAll(settingKeyValuePairs);
    }
    return $result;
  }
  GetUserSettingsResponse._() : super();
  factory GetUserSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..pc<GetUserSettingsResponse_UnifiedSettingKeyValuePair>(1, _omitFieldNames ? '' : 'settingKeyValuePairs', $pb.PbFieldType.PM, subBuilder: GetUserSettingsResponse_UnifiedSettingKeyValuePair.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserSettingsResponse clone() => GetUserSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserSettingsResponse copyWith(void Function(GetUserSettingsResponse) updates) => super.copyWith((message) => updates(message as GetUserSettingsResponse)) as GetUserSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserSettingsResponse create() => GetUserSettingsResponse._();
  GetUserSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserSettingsResponse> createRepeated() => $pb.PbList<GetUserSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserSettingsResponse>(create);
  static GetUserSettingsResponse? _defaultInstance;

  /// 汎用設定値
  @$pb.TagNumber(1)
  $core.List<GetUserSettingsResponse_UnifiedSettingKeyValuePair> get settingKeyValuePairs => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
