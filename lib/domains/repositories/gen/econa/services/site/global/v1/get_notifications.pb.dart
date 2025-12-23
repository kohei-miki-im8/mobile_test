//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/get_notifications.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/notification_type.pbenum.dart' as $161;
import '../../../../shared/notification.pb.dart' as $162;
import '../../../../shared/pager_cursor.pb.dart' as $146;

/// GetNotifications:通知一覧取得リクエスト
class GetNotificationsRequest extends $pb.GeneratedMessage {
  factory GetNotificationsRequest({
    $161.NotificationType? notificationType,
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (notificationType != null) {
      $result.notificationType = notificationType;
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetNotificationsRequest._() : super();
  factory GetNotificationsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..e<$161.NotificationType>(1, _omitFieldNames ? '' : 'notificationType', $pb.PbFieldType.OE, defaultOrMaker: $161.NotificationType.NOTIFICATION_TYPE_UNSPECIFIED, valueOf: $161.NotificationType.valueOf, enumValues: $161.NotificationType.values)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationsRequest clone() => GetNotificationsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationsRequest copyWith(void Function(GetNotificationsRequest) updates) => super.copyWith((message) => updates(message as GetNotificationsRequest)) as GetNotificationsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationsRequest create() => GetNotificationsRequest._();
  GetNotificationsRequest createEmptyInstance() => create();
  static $pb.PbList<GetNotificationsRequest> createRepeated() => $pb.PbList<GetNotificationsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationsRequest>(create);
  static GetNotificationsRequest? _defaultInstance;

  /// 通知タイプでフィルタリング
  @$pb.TagNumber(1)
  $161.NotificationType get notificationType => $_getN(0);
  @$pb.TagNumber(1)
  set notificationType($161.NotificationType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNotificationType() => $_has(0);
  @$pb.TagNumber(1)
  void clearNotificationType() => clearField(1);

  /// ページネーションカーソル
  @$pb.TagNumber(15)
  $146.PagerRequestCursor get cursor => $_getN(1);
  @$pb.TagNumber(15)
  set cursor($146.PagerRequestCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerRequestCursor ensureCursor() => $_ensure(1);
}

/// GetNotifications:通知一覧取得レスポンス
class GetNotificationsResponse extends $pb.GeneratedMessage {
  factory GetNotificationsResponse({
    $core.Iterable<$162.Notification>? notifications,
    $core.int? unreadCount,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (notifications != null) {
      $result.notifications.addAll(notifications);
    }
    if (unreadCount != null) {
      $result.unreadCount = unreadCount;
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetNotificationsResponse._() : super();
  factory GetNotificationsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNotificationsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNotificationsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..pc<$162.Notification>(1, _omitFieldNames ? '' : 'notifications', $pb.PbFieldType.PM, subBuilder: $162.Notification.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'unreadCount', $pb.PbFieldType.O3)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNotificationsResponse clone() => GetNotificationsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNotificationsResponse copyWith(void Function(GetNotificationsResponse) updates) => super.copyWith((message) => updates(message as GetNotificationsResponse)) as GetNotificationsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNotificationsResponse create() => GetNotificationsResponse._();
  GetNotificationsResponse createEmptyInstance() => create();
  static $pb.PbList<GetNotificationsResponse> createRepeated() => $pb.PbList<GetNotificationsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNotificationsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNotificationsResponse>(create);
  static GetNotificationsResponse? _defaultInstance;

  /// 通知一覧
  @$pb.TagNumber(1)
  $core.List<$162.Notification> get notifications => $_getList(0);

  /// 未読通知数
  @$pb.TagNumber(2)
  $core.int get unreadCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set unreadCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnreadCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnreadCount() => clearField(2);

  /// ページネーションカーソル
  @$pb.TagNumber(15)
  $146.PagerResponseCursor get cursor => $_getN(2);
  @$pb.TagNumber(15)
  set cursor($146.PagerResponseCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(2);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerResponseCursor ensureCursor() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
