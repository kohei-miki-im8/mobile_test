//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/mark_notifications_as_read.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// MarkNotificationsAsRead:通知既読更新リクエスト
class MarkNotificationsAsReadRequest extends $pb.GeneratedMessage {
  factory MarkNotificationsAsReadRequest({
    $core.Iterable<$core.String>? notificationIds,
  }) {
    final $result = create();
    if (notificationIds != null) {
      $result.notificationIds.addAll(notificationIds);
    }
    return $result;
  }
  MarkNotificationsAsReadRequest._() : super();
  factory MarkNotificationsAsReadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkNotificationsAsReadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkNotificationsAsReadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'notificationIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkNotificationsAsReadRequest clone() => MarkNotificationsAsReadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkNotificationsAsReadRequest copyWith(void Function(MarkNotificationsAsReadRequest) updates) => super.copyWith((message) => updates(message as MarkNotificationsAsReadRequest)) as MarkNotificationsAsReadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkNotificationsAsReadRequest create() => MarkNotificationsAsReadRequest._();
  MarkNotificationsAsReadRequest createEmptyInstance() => create();
  static $pb.PbList<MarkNotificationsAsReadRequest> createRepeated() => $pb.PbList<MarkNotificationsAsReadRequest>();
  @$core.pragma('dart2js:noInline')
  static MarkNotificationsAsReadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkNotificationsAsReadRequest>(create);
  static MarkNotificationsAsReadRequest? _defaultInstance;

  /// 既読にする通知IDリスト
  @$pb.TagNumber(1)
  $core.List<$core.String> get notificationIds => $_getList(0);
}

/// MarkNotificationsAsRead:通知既読更新レスポンス
class MarkNotificationsAsReadResponse extends $pb.GeneratedMessage {
  factory MarkNotificationsAsReadResponse({
    $core.int? updatedCount,
  }) {
    final $result = create();
    if (updatedCount != null) {
      $result.updatedCount = updatedCount;
    }
    return $result;
  }
  MarkNotificationsAsReadResponse._() : super();
  factory MarkNotificationsAsReadResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkNotificationsAsReadResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MarkNotificationsAsReadResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'updatedCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkNotificationsAsReadResponse clone() => MarkNotificationsAsReadResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkNotificationsAsReadResponse copyWith(void Function(MarkNotificationsAsReadResponse) updates) => super.copyWith((message) => updates(message as MarkNotificationsAsReadResponse)) as MarkNotificationsAsReadResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkNotificationsAsReadResponse create() => MarkNotificationsAsReadResponse._();
  MarkNotificationsAsReadResponse createEmptyInstance() => create();
  static $pb.PbList<MarkNotificationsAsReadResponse> createRepeated() => $pb.PbList<MarkNotificationsAsReadResponse>();
  @$core.pragma('dart2js:noInline')
  static MarkNotificationsAsReadResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkNotificationsAsReadResponse>(create);
  static MarkNotificationsAsReadResponse? _defaultInstance;

  /// 更新された通知数
  @$pb.TagNumber(1)
  $core.int get updatedCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set updatedCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUpdatedCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUpdatedCount() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
