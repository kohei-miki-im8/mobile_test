//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/update_notification_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/notification_type.pbenum.dart' as $161;

enum UpdateNotificationSettingsRequest_Value {
  email, 
  notificationFlag, 
  notSet
}

/// UpdateNotificationSettings:通知設定個別更新リクエスト
class UpdateNotificationSettingsRequest extends $pb.GeneratedMessage {
  factory UpdateNotificationSettingsRequest({
    $161.NotificationType? notificationType,
    $core.String? email,
    $core.bool? notificationFlag,
  }) {
    final $result = create();
    if (notificationType != null) {
      $result.notificationType = notificationType;
    }
    if (email != null) {
      $result.email = email;
    }
    if (notificationFlag != null) {
      $result.notificationFlag = notificationFlag;
    }
    return $result;
  }
  UpdateNotificationSettingsRequest._() : super();
  factory UpdateNotificationSettingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotificationSettingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UpdateNotificationSettingsRequest_Value> _UpdateNotificationSettingsRequest_ValueByTag = {
    2 : UpdateNotificationSettingsRequest_Value.email,
    3 : UpdateNotificationSettingsRequest_Value.notificationFlag,
    0 : UpdateNotificationSettingsRequest_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNotificationSettingsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..e<$161.NotificationType>(1, _omitFieldNames ? '' : 'notificationType', $pb.PbFieldType.OE, defaultOrMaker: $161.NotificationType.NOTIFICATION_TYPE_UNSPECIFIED, valueOf: $161.NotificationType.valueOf, enumValues: $161.NotificationType.values)
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOB(3, _omitFieldNames ? '' : 'notificationFlag')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotificationSettingsRequest clone() => UpdateNotificationSettingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotificationSettingsRequest copyWith(void Function(UpdateNotificationSettingsRequest) updates) => super.copyWith((message) => updates(message as UpdateNotificationSettingsRequest)) as UpdateNotificationSettingsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNotificationSettingsRequest create() => UpdateNotificationSettingsRequest._();
  UpdateNotificationSettingsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateNotificationSettingsRequest> createRepeated() => $pb.PbList<UpdateNotificationSettingsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotificationSettingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotificationSettingsRequest>(create);
  static UpdateNotificationSettingsRequest? _defaultInstance;

  UpdateNotificationSettingsRequest_Value whichValue() => _UpdateNotificationSettingsRequest_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  /// 設定キー
  @$pb.TagNumber(1)
  $161.NotificationType get notificationType => $_getN(0);
  @$pb.TagNumber(1)
  set notificationType($161.NotificationType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationType() => clearField(1);

  /// メールアドレス用
  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  /// 通知フラグ
  @$pb.TagNumber(3)
  $core.bool get notificationFlag => $_getBF(2);
  @$pb.TagNumber(3)
  set notificationFlag($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNotificationFlag() => $_has(2);
  @$pb.TagNumber(3)
  void clearNotificationFlag() => clearField(3);
}

/// UpdateNotificationSettings:通知設定個別更新レスポンス
class UpdateNotificationSettingsResponse extends $pb.GeneratedMessage {
  factory UpdateNotificationSettingsResponse() => create();
  UpdateNotificationSettingsResponse._() : super();
  factory UpdateNotificationSettingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateNotificationSettingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateNotificationSettingsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateNotificationSettingsResponse clone() => UpdateNotificationSettingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateNotificationSettingsResponse copyWith(void Function(UpdateNotificationSettingsResponse) updates) => super.copyWith((message) => updates(message as UpdateNotificationSettingsResponse)) as UpdateNotificationSettingsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateNotificationSettingsResponse create() => UpdateNotificationSettingsResponse._();
  UpdateNotificationSettingsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateNotificationSettingsResponse> createRepeated() => $pb.PbList<UpdateNotificationSettingsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateNotificationSettingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateNotificationSettingsResponse>(create);
  static UpdateNotificationSettingsResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
