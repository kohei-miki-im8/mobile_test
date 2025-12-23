//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/get_notification_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/notification_settings.pb.dart' as $160;

/// GetNotificationSettings:通知設定取得リクエスト
class GetNotificationSettingsRequest extends $pb.GeneratedMessage {
  factory GetNotificationSettingsRequest() => create();
  GetNotificationSettingsRequest._() : super();
  factory GetNotificationSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationSettingsRequest clone() => GetNotificationSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationSettingsRequest copyWith(void Function(GetNotificationSettingsRequest) updates) => super.copyWith((message) => updates(message as GetNotificationSettingsRequest)) as GetNotificationSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationSettingsRequest create() => GetNotificationSettingsRequest._();
  GetNotificationSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<GetNotificationSettingsRequest> createRepeated() => $pb.PbList<GetNotificationSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationSettingsRequest>(create);
  static GetNotificationSettingsRequest? _defaultInstance;
}

/// GetNotificationSettings:通知設定取得レスポンス
class GetNotificationSettingsResponse extends $pb.GeneratedMessage {
  factory GetNotificationSettingsResponse({
    $160.NotificationSettings? settings,
    $160.EmailNotificationSettings? emailSettings,
  }) {
    final $result = create();
    if (settings != null) {
      $result.settings = settings;
    }
    if (emailSettings != null) {
      $result.emailSettings = emailSettings;
    }
    return $result;
  }
  GetNotificationSettingsResponse._() : super();
  factory GetNotificationSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aOM<$160.NotificationSettings>(1, _omitFieldNames ? '' : 'settings', subBuilder: $160.NotificationSettings.create)
    ..aOM<$160.EmailNotificationSettings>(2, _omitFieldNames ? '' : 'emailSettings', subBuilder: $160.EmailNotificationSettings.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationSettingsResponse clone() => GetNotificationSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationSettingsResponse copyWith(void Function(GetNotificationSettingsResponse) updates) => super.copyWith((message) => updates(message as GetNotificationSettingsResponse)) as GetNotificationSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationSettingsResponse create() => GetNotificationSettingsResponse._();
  GetNotificationSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<GetNotificationSettingsResponse> createRepeated() => $pb.PbList<GetNotificationSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationSettingsResponse>(create);
  static GetNotificationSettingsResponse? _defaultInstance;

  /// プッシュ通知設定
  @$pb.TagNumber(1)
  $160.NotificationSettings get settings => $_getN(0);
  @$pb.TagNumber(1)
  set settings($160.NotificationSettings v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSettings() => $_has(0);
  @$pb.TagNumber(1)
  void clearSettings() => clearField(1);
  @$pb.TagNumber(1)
  $160.NotificationSettings ensureSettings() => $_ensure(0);

  /// メール通知設定
  @$pb.TagNumber(2)
  $160.EmailNotificationSettings get emailSettings => $_getN(1);
  @$pb.TagNumber(2)
  set emailSettings($160.EmailNotificationSettings v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmailSettings() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmailSettings() => clearField(2);
  @$pb.TagNumber(2)
  $160.EmailNotificationSettings ensureEmailSettings() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
