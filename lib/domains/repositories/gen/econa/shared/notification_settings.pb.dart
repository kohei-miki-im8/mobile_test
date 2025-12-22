//
//  Generated code. Do not modify.
//  source: econa/shared/notification_settings.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 通知設定（プッシュ通知）
class NotificationSettings extends $pb.GeneratedMessage {
  factory NotificationSettings({
    $core.bool? enablePushNotification,
    $core.bool? enablePushLikeNotification,
    $core.bool? enablePushMatchNotification,
    $core.bool? enablePushMessageNotification,
    $core.bool? enablePushAnnouncementNotification,
  }) {
    final $result = create();
    if (enablePushNotification != null) {
      $result.enablePushNotification = enablePushNotification;
    }
    if (enablePushLikeNotification != null) {
      $result.enablePushLikeNotification = enablePushLikeNotification;
    }
    if (enablePushMatchNotification != null) {
      $result.enablePushMatchNotification = enablePushMatchNotification;
    }
    if (enablePushMessageNotification != null) {
      $result.enablePushMessageNotification = enablePushMessageNotification;
    }
    if (enablePushAnnouncementNotification != null) {
      $result.enablePushAnnouncementNotification = enablePushAnnouncementNotification;
    }
    return $result;
  }
  NotificationSettings._() : super();
  factory NotificationSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotificationSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotificationSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enablePushNotification')
    ..aOB(2, _omitFieldNames ? '' : 'enablePushLikeNotification')
    ..aOB(3, _omitFieldNames ? '' : 'enablePushMatchNotification')
    ..aOB(4, _omitFieldNames ? '' : 'enablePushMessageNotification')
    ..aOB(5, _omitFieldNames ? '' : 'enablePushAnnouncementNotification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotificationSettings clone() => NotificationSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotificationSettings copyWith(void Function(NotificationSettings) updates) => super.copyWith((message) => updates(message as NotificationSettings)) as NotificationSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotificationSettings create() => NotificationSettings._();
  NotificationSettings createEmptyInstance() => create();
  static $pb.PbList<NotificationSettings> createRepeated() => $pb.PbList<NotificationSettings>();
  @$core.pragma('dart2js:noInline')
  static NotificationSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotificationSettings>(create);
  static NotificationSettings? _defaultInstance;

  /// プッシュ通知の有効フラグ
  @$pb.TagNumber(1)
  $core.bool get enablePushNotification => $_getBF(0);
  @$pb.TagNumber(1)
  set enablePushNotification($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnablePushNotification() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnablePushNotification() => clearField(1);

  /// プッシュ通知でのいいね通知の有効フラグ
  @$pb.TagNumber(2)
  $core.bool get enablePushLikeNotification => $_getBF(1);
  @$pb.TagNumber(2)
  set enablePushLikeNotification($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnablePushLikeNotification() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnablePushLikeNotification() => clearField(2);

  /// プッシュ通知でのマッチング通知の有効フラグ
  @$pb.TagNumber(3)
  $core.bool get enablePushMatchNotification => $_getBF(2);
  @$pb.TagNumber(3)
  set enablePushMatchNotification($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnablePushMatchNotification() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnablePushMatchNotification() => clearField(3);

  /// プッシュ通知でのメッセージ通知の有効フラグ
  @$pb.TagNumber(4)
  $core.bool get enablePushMessageNotification => $_getBF(3);
  @$pb.TagNumber(4)
  set enablePushMessageNotification($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEnablePushMessageNotification() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnablePushMessageNotification() => clearField(4);

  /// プッシュ通知でのお知らせ通知の有効フラグ
  @$pb.TagNumber(5)
  $core.bool get enablePushAnnouncementNotification => $_getBF(4);
  @$pb.TagNumber(5)
  set enablePushAnnouncementNotification($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEnablePushAnnouncementNotification() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnablePushAnnouncementNotification() => clearField(5);
}

/// メール通知設定
class EmailNotificationSettings extends $pb.GeneratedMessage {
  factory EmailNotificationSettings({
    $core.String? email,
    $core.bool? enableEmailLikeNotification,
    $core.bool? enableEmailMatchNotification,
    $core.bool? enableEmailMessageNotification,
    $core.bool? enableEmailAnnouncementNotification,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (enableEmailLikeNotification != null) {
      $result.enableEmailLikeNotification = enableEmailLikeNotification;
    }
    if (enableEmailMatchNotification != null) {
      $result.enableEmailMatchNotification = enableEmailMatchNotification;
    }
    if (enableEmailMessageNotification != null) {
      $result.enableEmailMessageNotification = enableEmailMessageNotification;
    }
    if (enableEmailAnnouncementNotification != null) {
      $result.enableEmailAnnouncementNotification = enableEmailAnnouncementNotification;
    }
    return $result;
  }
  EmailNotificationSettings._() : super();
  factory EmailNotificationSettings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EmailNotificationSettings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EmailNotificationSettings', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOB(2, _omitFieldNames ? '' : 'enableEmailLikeNotification')
    ..aOB(3, _omitFieldNames ? '' : 'enableEmailMatchNotification')
    ..aOB(4, _omitFieldNames ? '' : 'enableEmailMessageNotification')
    ..aOB(5, _omitFieldNames ? '' : 'enableEmailAnnouncementNotification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EmailNotificationSettings clone() => EmailNotificationSettings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EmailNotificationSettings copyWith(void Function(EmailNotificationSettings) updates) => super.copyWith((message) => updates(message as EmailNotificationSettings)) as EmailNotificationSettings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EmailNotificationSettings create() => EmailNotificationSettings._();
  EmailNotificationSettings createEmptyInstance() => create();
  static $pb.PbList<EmailNotificationSettings> createRepeated() => $pb.PbList<EmailNotificationSettings>();
  @$core.pragma('dart2js:noInline')
  static EmailNotificationSettings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EmailNotificationSettings>(create);
  static EmailNotificationSettings? _defaultInstance;

  /// メールアドレス
  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  /// メールでのいいね通知の有効フラグ
  @$pb.TagNumber(2)
  $core.bool get enableEmailLikeNotification => $_getBF(1);
  @$pb.TagNumber(2)
  set enableEmailLikeNotification($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnableEmailLikeNotification() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnableEmailLikeNotification() => clearField(2);

  /// メールでのマッチング通知の有効フラグ
  @$pb.TagNumber(3)
  $core.bool get enableEmailMatchNotification => $_getBF(2);
  @$pb.TagNumber(3)
  set enableEmailMatchNotification($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEnableEmailMatchNotification() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnableEmailMatchNotification() => clearField(3);

  /// メールでのメッセージ通知の有効フラグ
  @$pb.TagNumber(4)
  $core.bool get enableEmailMessageNotification => $_getBF(3);
  @$pb.TagNumber(4)
  set enableEmailMessageNotification($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEnableEmailMessageNotification() => $_has(3);
  @$pb.TagNumber(4)
  void clearEnableEmailMessageNotification() => clearField(4);

  /// メールでのお知らせ通知の有効フラグ
  @$pb.TagNumber(5)
  $core.bool get enableEmailAnnouncementNotification => $_getBF(4);
  @$pb.TagNumber(5)
  set enableEmailAnnouncementNotification($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEnableEmailAnnouncementNotification() => $_has(4);
  @$pb.TagNumber(5)
  void clearEnableEmailAnnouncementNotification() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
