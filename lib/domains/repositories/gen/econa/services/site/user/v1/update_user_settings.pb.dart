//
//  Generated code. Do not modify.
//  source: econa/services/site/user/v1/update_user_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/unified_setting_key.pbenum.dart' as $188;

enum UpdateUserSettingsRequest_ValueContent {
  value, 
  flag, 
  notSet
}

/// ユーザー設定更新リクエスト
class UpdateUserSettingsRequest extends $pb.GeneratedMessage {
  factory UpdateUserSettingsRequest({
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
  UpdateUserSettingsRequest._() : super();
  factory UpdateUserSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpdateUserSettingsRequest_ValueContent> _UpdateUserSettingsRequest_ValueContentByTag = {
    3 : UpdateUserSettingsRequest_ValueContent.value,
    4 : UpdateUserSettingsRequest_ValueContent.flag,
    0 : UpdateUserSettingsRequest_ValueContent.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..e<$188.UnifiedSettingKey>(1, _omitFieldNames ? '' : 'settingKey', $pb.PbFieldType.OE, defaultOrMaker: $188.UnifiedSettingKey.UNIFIED_SETTING_KEY_UNSPECIFIED, valueOf: $188.UnifiedSettingKey.valueOf, enumValues: $188.UnifiedSettingKey.values)
    ..aOS(3, _omitFieldNames ? '' : 'value')
    ..aOB(4, _omitFieldNames ? '' : 'flag')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserSettingsRequest clone() => UpdateUserSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserSettingsRequest copyWith(void Function(UpdateUserSettingsRequest) updates) => super.copyWith((message) => updates(message as UpdateUserSettingsRequest)) as UpdateUserSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserSettingsRequest create() => UpdateUserSettingsRequest._();
  UpdateUserSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserSettingsRequest> createRepeated() => $pb.PbList<UpdateUserSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserSettingsRequest>(create);
  static UpdateUserSettingsRequest? _defaultInstance;

  UpdateUserSettingsRequest_ValueContent whichValueContent() => _UpdateUserSettingsRequest_ValueContentByTag[$_whichOneof(0)]!;
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

  @$pb.TagNumber(3)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(3)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get flag => $_getBF(2);
  @$pb.TagNumber(4)
  set flag($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasFlag() => $_has(2);
  @$pb.TagNumber(4)
  void clearFlag() => clearField(4);
}

/// ユーザー設定更新レスポンス
class UpdateUserSettingsResponse extends $pb.GeneratedMessage {
  factory UpdateUserSettingsResponse() => create();
  UpdateUserSettingsResponse._() : super();
  factory UpdateUserSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.user.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserSettingsResponse clone() => UpdateUserSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserSettingsResponse copyWith(void Function(UpdateUserSettingsResponse) updates) => super.copyWith((message) => updates(message as UpdateUserSettingsResponse)) as UpdateUserSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserSettingsResponse create() => UpdateUserSettingsResponse._();
  UpdateUserSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserSettingsResponse> createRepeated() => $pb.PbList<UpdateUserSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserSettingsResponse>(create);
  static UpdateUserSettingsResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
