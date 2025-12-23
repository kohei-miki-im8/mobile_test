//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/subscribe_notification_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/notification.pb.dart' as $162;

/// SubscribeNotificationSession:通知セッション購読リクエスト
class SubscribeNotificationSessionRequest extends $pb.GeneratedMessage {
  factory SubscribeNotificationSessionRequest({
    $core.String? lastNotificationId,
  }) {
    final $result = create();
    if (lastNotificationId != null) {
      $result.lastNotificationId = lastNotificationId;
    }
    return $result;
  }
  SubscribeNotificationSessionRequest._() : super();
  factory SubscribeNotificationSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeNotificationSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeNotificationSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'lastNotificationId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionRequest clone() => SubscribeNotificationSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionRequest copyWith(void Function(SubscribeNotificationSessionRequest) updates) => super.copyWith((message) => updates(message as SubscribeNotificationSessionRequest)) as SubscribeNotificationSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionRequest create() => SubscribeNotificationSessionRequest._();
  SubscribeNotificationSessionRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeNotificationSessionRequest> createRepeated() => $pb.PbList<SubscribeNotificationSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeNotificationSessionRequest>(create);
  static SubscribeNotificationSessionRequest? _defaultInstance;

  /// 最終受信通知ID（再接続時の重複防止用）
  @$pb.TagNumber(1)
  $core.String get lastNotificationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set lastNotificationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastNotificationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastNotificationId() => clearField(1);
}

/// 初期化完了イベント
class SubscribeNotificationSessionResponse_InitializedEvent extends $pb.GeneratedMessage {
  factory SubscribeNotificationSessionResponse_InitializedEvent({
    $core.int? unreadCount,
    $core.String? sessionId,
  }) {
    final $result = create();
    if (unreadCount != null) {
      $result.unreadCount = unreadCount;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  SubscribeNotificationSessionResponse_InitializedEvent._() : super();
  factory SubscribeNotificationSessionResponse_InitializedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeNotificationSessionResponse_InitializedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeNotificationSessionResponse.InitializedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'unreadCount', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_InitializedEvent clone() => SubscribeNotificationSessionResponse_InitializedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_InitializedEvent copyWith(void Function(SubscribeNotificationSessionResponse_InitializedEvent) updates) => super.copyWith((message) => updates(message as SubscribeNotificationSessionResponse_InitializedEvent)) as SubscribeNotificationSessionResponse_InitializedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_InitializedEvent create() => SubscribeNotificationSessionResponse_InitializedEvent._();
  SubscribeNotificationSessionResponse_InitializedEvent createEmptyInstance() => create();
  static $pb.PbList<SubscribeNotificationSessionResponse_InitializedEvent> createRepeated() => $pb.PbList<SubscribeNotificationSessionResponse_InitializedEvent>();
  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_InitializedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeNotificationSessionResponse_InitializedEvent>(create);
  static SubscribeNotificationSessionResponse_InitializedEvent? _defaultInstance;

  /// 現在の未読通知数
  @$pb.TagNumber(1)
  $core.int get unreadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set unreadCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnreadCount() => clearField(1);

  /// セッションID
  @$pb.TagNumber(2)
  $core.String get sessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => clearField(2);
}

/// 新着通知イベント
class SubscribeNotificationSessionResponse_NotificationReceivedEvent extends $pb.GeneratedMessage {
  factory SubscribeNotificationSessionResponse_NotificationReceivedEvent({
    $162.Notification? notification,
  }) {
    final $result = create();
    if (notification != null) {
      $result.notification = notification;
    }
    return $result;
  }
  SubscribeNotificationSessionResponse_NotificationReceivedEvent._() : super();
  factory SubscribeNotificationSessionResponse_NotificationReceivedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeNotificationSessionResponse_NotificationReceivedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeNotificationSessionResponse.NotificationReceivedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aOM<$162.Notification>(1, _omitFieldNames ? '' : 'notification', subBuilder: $162.Notification.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_NotificationReceivedEvent clone() => SubscribeNotificationSessionResponse_NotificationReceivedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_NotificationReceivedEvent copyWith(void Function(SubscribeNotificationSessionResponse_NotificationReceivedEvent) updates) => super.copyWith((message) => updates(message as SubscribeNotificationSessionResponse_NotificationReceivedEvent)) as SubscribeNotificationSessionResponse_NotificationReceivedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_NotificationReceivedEvent create() => SubscribeNotificationSessionResponse_NotificationReceivedEvent._();
  SubscribeNotificationSessionResponse_NotificationReceivedEvent createEmptyInstance() => create();
  static $pb.PbList<SubscribeNotificationSessionResponse_NotificationReceivedEvent> createRepeated() => $pb.PbList<SubscribeNotificationSessionResponse_NotificationReceivedEvent>();
  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_NotificationReceivedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeNotificationSessionResponse_NotificationReceivedEvent>(create);
  static SubscribeNotificationSessionResponse_NotificationReceivedEvent? _defaultInstance;

  /// 通知データ
  @$pb.TagNumber(1)
  $162.Notification get notification => $_getN(0);
  @$pb.TagNumber(1)
  set notification($162.Notification v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotification() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotification() => clearField(1);
  @$pb.TagNumber(1)
  $162.Notification ensureNotification() => $_ensure(0);
}

/// 未読数更新イベント
class SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent extends $pb.GeneratedMessage {
  factory SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent({
    $core.int? unreadCount,
  }) {
    final $result = create();
    if (unreadCount != null) {
      $result.unreadCount = unreadCount;
    }
    return $result;
  }
  SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent._() : super();
  factory SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeNotificationSessionResponse.UnreadCountUpdatedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'unreadCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent clone() => SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent copyWith(void Function(SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent) updates) => super.copyWith((message) => updates(message as SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent)) as SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent create() => SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent._();
  SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent createEmptyInstance() => create();
  static $pb.PbList<SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent> createRepeated() => $pb.PbList<SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent>();
  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent>(create);
  static SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent? _defaultInstance;

  /// 更新後の未読通知数
  @$pb.TagNumber(1)
  $core.int get unreadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set unreadCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnreadCount() => clearField(1);
}

/// 接続維持用pingイベント
class SubscribeNotificationSessionResponse_PingEvent extends $pb.GeneratedMessage {
  factory SubscribeNotificationSessionResponse_PingEvent({
    $fixnum.Int64? timestamp,
  }) {
    final $result = create();
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  SubscribeNotificationSessionResponse_PingEvent._() : super();
  factory SubscribeNotificationSessionResponse_PingEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeNotificationSessionResponse_PingEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeNotificationSessionResponse.PingEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_PingEvent clone() => SubscribeNotificationSessionResponse_PingEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_PingEvent copyWith(void Function(SubscribeNotificationSessionResponse_PingEvent) updates) => super.copyWith((message) => updates(message as SubscribeNotificationSessionResponse_PingEvent)) as SubscribeNotificationSessionResponse_PingEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_PingEvent create() => SubscribeNotificationSessionResponse_PingEvent._();
  SubscribeNotificationSessionResponse_PingEvent createEmptyInstance() => create();
  static $pb.PbList<SubscribeNotificationSessionResponse_PingEvent> createRepeated() => $pb.PbList<SubscribeNotificationSessionResponse_PingEvent>();
  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_PingEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeNotificationSessionResponse_PingEvent>(create);
  static SubscribeNotificationSessionResponse_PingEvent? _defaultInstance;

  /// pingタイムスタンプ
  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);
}

/// 通知抑止イベント
class SubscribeNotificationSessionResponse_NotificationSuppressedEvent extends $pb.GeneratedMessage {
  factory SubscribeNotificationSessionResponse_NotificationSuppressedEvent({
    $core.String? userId,
    $core.String? blockedUserId,
    $core.String? chatRoomId,
    $core.String? suppressedAt,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (blockedUserId != null) {
      $result.blockedUserId = blockedUserId;
    }
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (suppressedAt != null) {
      $result.suppressedAt = suppressedAt;
    }
    return $result;
  }
  SubscribeNotificationSessionResponse_NotificationSuppressedEvent._() : super();
  factory SubscribeNotificationSessionResponse_NotificationSuppressedEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeNotificationSessionResponse_NotificationSuppressedEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeNotificationSessionResponse.NotificationSuppressedEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'blockedUserId')
    ..aOS(3, _omitFieldNames ? '' : 'chatRoomId')
    ..aOS(4, _omitFieldNames ? '' : 'suppressedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_NotificationSuppressedEvent clone() => SubscribeNotificationSessionResponse_NotificationSuppressedEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse_NotificationSuppressedEvent copyWith(void Function(SubscribeNotificationSessionResponse_NotificationSuppressedEvent) updates) => super.copyWith((message) => updates(message as SubscribeNotificationSessionResponse_NotificationSuppressedEvent)) as SubscribeNotificationSessionResponse_NotificationSuppressedEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_NotificationSuppressedEvent create() => SubscribeNotificationSessionResponse_NotificationSuppressedEvent._();
  SubscribeNotificationSessionResponse_NotificationSuppressedEvent createEmptyInstance() => create();
  static $pb.PbList<SubscribeNotificationSessionResponse_NotificationSuppressedEvent> createRepeated() => $pb.PbList<SubscribeNotificationSessionResponse_NotificationSuppressedEvent>();
  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse_NotificationSuppressedEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeNotificationSessionResponse_NotificationSuppressedEvent>(create);
  static SubscribeNotificationSessionResponse_NotificationSuppressedEvent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get blockedUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set blockedUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBlockedUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBlockedUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get chatRoomId => $_getSZ(2);
  @$pb.TagNumber(3)
  set chatRoomId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatRoomId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get suppressedAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set suppressedAt($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSuppressedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuppressedAt() => clearField(4);
}

enum SubscribeNotificationSessionResponse_Event {
  initialized, 
  notificationReceived, 
  unreadCountUpdated, 
  ping, 
  notificationSuppressed, 
  notSet
}

/// SubscribeNotificationSession:通知セッション購読レスポンス
class SubscribeNotificationSessionResponse extends $pb.GeneratedMessage {
  factory SubscribeNotificationSessionResponse({
    SubscribeNotificationSessionResponse_InitializedEvent? initialized,
    SubscribeNotificationSessionResponse_NotificationReceivedEvent? notificationReceived,
    SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent? unreadCountUpdated,
    SubscribeNotificationSessionResponse_PingEvent? ping,
    SubscribeNotificationSessionResponse_NotificationSuppressedEvent? notificationSuppressed,
    $core.bool? isSuccessful,
  }) {
    final $result = create();
    if (initialized != null) {
      $result.initialized = initialized;
    }
    if (notificationReceived != null) {
      $result.notificationReceived = notificationReceived;
    }
    if (unreadCountUpdated != null) {
      $result.unreadCountUpdated = unreadCountUpdated;
    }
    if (ping != null) {
      $result.ping = ping;
    }
    if (notificationSuppressed != null) {
      $result.notificationSuppressed = notificationSuppressed;
    }
    if (isSuccessful != null) {
      $result.isSuccessful = isSuccessful;
    }
    return $result;
  }
  SubscribeNotificationSessionResponse._() : super();
  factory SubscribeNotificationSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeNotificationSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SubscribeNotificationSessionResponse_Event> _SubscribeNotificationSessionResponse_EventByTag = {
    1 : SubscribeNotificationSessionResponse_Event.initialized,
    2 : SubscribeNotificationSessionResponse_Event.notificationReceived,
    3 : SubscribeNotificationSessionResponse_Event.unreadCountUpdated,
    4 : SubscribeNotificationSessionResponse_Event.ping,
    5 : SubscribeNotificationSessionResponse_Event.notificationSuppressed,
    0 : SubscribeNotificationSessionResponse_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeNotificationSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5])
    ..aOM<SubscribeNotificationSessionResponse_InitializedEvent>(1, _omitFieldNames ? '' : 'initialized', subBuilder: SubscribeNotificationSessionResponse_InitializedEvent.create)
    ..aOM<SubscribeNotificationSessionResponse_NotificationReceivedEvent>(2, _omitFieldNames ? '' : 'notificationReceived', subBuilder: SubscribeNotificationSessionResponse_NotificationReceivedEvent.create)
    ..aOM<SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent>(3, _omitFieldNames ? '' : 'unreadCountUpdated', subBuilder: SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent.create)
    ..aOM<SubscribeNotificationSessionResponse_PingEvent>(4, _omitFieldNames ? '' : 'ping', subBuilder: SubscribeNotificationSessionResponse_PingEvent.create)
    ..aOM<SubscribeNotificationSessionResponse_NotificationSuppressedEvent>(5, _omitFieldNames ? '' : 'notificationSuppressed', subBuilder: SubscribeNotificationSessionResponse_NotificationSuppressedEvent.create)
    ..aOB(10, _omitFieldNames ? '' : 'isSuccessful')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse clone() => SubscribeNotificationSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeNotificationSessionResponse copyWith(void Function(SubscribeNotificationSessionResponse) updates) => super.copyWith((message) => updates(message as SubscribeNotificationSessionResponse)) as SubscribeNotificationSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse create() => SubscribeNotificationSessionResponse._();
  SubscribeNotificationSessionResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeNotificationSessionResponse> createRepeated() => $pb.PbList<SubscribeNotificationSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeNotificationSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeNotificationSessionResponse>(create);
  static SubscribeNotificationSessionResponse? _defaultInstance;

  SubscribeNotificationSessionResponse_Event whichEvent() => _SubscribeNotificationSessionResponse_EventByTag[$_whichOneof(0)]!;
  void clearEvent() => clearField($_whichOneof(0));

  /// 初期化完了
  @$pb.TagNumber(1)
  SubscribeNotificationSessionResponse_InitializedEvent get initialized => $_getN(0);
  @$pb.TagNumber(1)
  set initialized(SubscribeNotificationSessionResponse_InitializedEvent v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasInitialized() => $_has(0);
  @$pb.TagNumber(1)
  void clearInitialized() => clearField(1);
  @$pb.TagNumber(1)
  SubscribeNotificationSessionResponse_InitializedEvent ensureInitialized() => $_ensure(0);

  /// 新着通知
  @$pb.TagNumber(2)
  SubscribeNotificationSessionResponse_NotificationReceivedEvent get notificationReceived => $_getN(1);
  @$pb.TagNumber(2)
  set notificationReceived(SubscribeNotificationSessionResponse_NotificationReceivedEvent v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasNotificationReceived() => $_has(1);
  @$pb.TagNumber(2)
  void clearNotificationReceived() => clearField(2);
  @$pb.TagNumber(2)
  SubscribeNotificationSessionResponse_NotificationReceivedEvent ensureNotificationReceived() => $_ensure(1);

  /// 未読数更新
  @$pb.TagNumber(3)
  SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent get unreadCountUpdated => $_getN(2);
  @$pb.TagNumber(3)
  set unreadCountUpdated(SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasUnreadCountUpdated() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnreadCountUpdated() => clearField(3);
  @$pb.TagNumber(3)
  SubscribeNotificationSessionResponse_UnreadCountUpdatedEvent ensureUnreadCountUpdated() => $_ensure(2);

  /// 接続維持用ping
  @$pb.TagNumber(4)
  SubscribeNotificationSessionResponse_PingEvent get ping => $_getN(3);
  @$pb.TagNumber(4)
  set ping(SubscribeNotificationSessionResponse_PingEvent v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPing() => $_has(3);
  @$pb.TagNumber(4)
  void clearPing() => clearField(4);
  @$pb.TagNumber(4)
  SubscribeNotificationSessionResponse_PingEvent ensurePing() => $_ensure(3);

  /// 通知抑止イベント
  @$pb.TagNumber(5)
  SubscribeNotificationSessionResponse_NotificationSuppressedEvent get notificationSuppressed => $_getN(4);
  @$pb.TagNumber(5)
  set notificationSuppressed(SubscribeNotificationSessionResponse_NotificationSuppressedEvent v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasNotificationSuppressed() => $_has(4);
  @$pb.TagNumber(5)
  void clearNotificationSuppressed() => clearField(5);
  @$pb.TagNumber(5)
  SubscribeNotificationSessionResponse_NotificationSuppressedEvent ensureNotificationSuppressed() => $_ensure(4);

  /// 処理の成功可否
  @$pb.TagNumber(10)
  $core.bool get isSuccessful => $_getBF(5);
  @$pb.TagNumber(10)
  set isSuccessful($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(10)
  $core.bool hasIsSuccessful() => $_has(5);
  @$pb.TagNumber(10)
  void clearIsSuccessful() => clearField(10);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
