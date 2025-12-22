//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/get_scheduled_chat_rooms.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/chat_room.pb.dart' as $153;
import '../../../../shared/pager_cursor.pb.dart' as $146;

/// 作成がスケジュールされたチャットルーム一覧取得リクエスト
class GetScheduledChatRoomsRequest extends $pb.GeneratedMessage {
  factory GetScheduledChatRoomsRequest({
    $146.PagerRequestCursor? cursor,
    $core.bool? invisibleMode,
  }) {
    final $result = create();
    if (cursor != null) {
      $result.cursor = cursor;
    }
    if (invisibleMode != null) {
      $result.invisibleMode = invisibleMode;
    }
    return $result;
  }
  GetScheduledChatRoomsRequest._() : super();
  factory GetScheduledChatRoomsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetScheduledChatRoomsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetScheduledChatRoomsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..aOB(16, _omitFieldNames ? '' : 'invisibleMode')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetScheduledChatRoomsRequest clone() => GetScheduledChatRoomsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetScheduledChatRoomsRequest copyWith(void Function(GetScheduledChatRoomsRequest) updates) => super.copyWith((message) => updates(message as GetScheduledChatRoomsRequest)) as GetScheduledChatRoomsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetScheduledChatRoomsRequest create() => GetScheduledChatRoomsRequest._();
  GetScheduledChatRoomsRequest createEmptyInstance() => create();
  static $pb.PbList<GetScheduledChatRoomsRequest> createRepeated() => $pb.PbList<GetScheduledChatRoomsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetScheduledChatRoomsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetScheduledChatRoomsRequest>(create);
  static GetScheduledChatRoomsRequest? _defaultInstance;

  /// ページネーションリクエストカーソル
  @$pb.TagNumber(15)
  $146.PagerRequestCursor get cursor => $_getN(0);
  @$pb.TagNumber(15)
  set cursor($146.PagerRequestCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(0);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerRequestCursor ensureCursor() => $_ensure(0);

  /// EP-1053: 非表示モード
  /// true: 非表示チャットルームのみ取得
  /// false/未設定: 表示状態のチャットルームのみ取得
  @$pb.TagNumber(16)
  $core.bool get invisibleMode => $_getBF(1);
  @$pb.TagNumber(16)
  set invisibleMode($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(16)
  $core.bool hasInvisibleMode() => $_has(1);
  @$pb.TagNumber(16)
  void clearInvisibleMode() => clearField(16);
}

/// 作成がスケジュールされたチャットルーム一覧取得レスポンス
class GetScheduledChatRoomsResponse extends $pb.GeneratedMessage {
  factory GetScheduledChatRoomsResponse({
    $core.Iterable<$153.ScheduledChatRoom>? scheduledChatRooms,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (scheduledChatRooms != null) {
      $result.scheduledChatRooms.addAll(scheduledChatRooms);
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetScheduledChatRoomsResponse._() : super();
  factory GetScheduledChatRoomsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetScheduledChatRoomsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetScheduledChatRoomsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..pc<$153.ScheduledChatRoom>(1, _omitFieldNames ? '' : 'scheduledChatRooms', $pb.PbFieldType.PM, subBuilder: $153.ScheduledChatRoom.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetScheduledChatRoomsResponse clone() => GetScheduledChatRoomsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetScheduledChatRoomsResponse copyWith(void Function(GetScheduledChatRoomsResponse) updates) => super.copyWith((message) => updates(message as GetScheduledChatRoomsResponse)) as GetScheduledChatRoomsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetScheduledChatRoomsResponse create() => GetScheduledChatRoomsResponse._();
  GetScheduledChatRoomsResponse createEmptyInstance() => create();
  static $pb.PbList<GetScheduledChatRoomsResponse> createRepeated() => $pb.PbList<GetScheduledChatRoomsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetScheduledChatRoomsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetScheduledChatRoomsResponse>(create);
  static GetScheduledChatRoomsResponse? _defaultInstance;

  /// 作成がスケジュールされたチャットルーム群
  @$pb.TagNumber(1)
  $core.List<$153.ScheduledChatRoom> get scheduledChatRooms => $_getList(0);

  /// ページネーションレスポンスカーソル
  @$pb.TagNumber(15)
  $146.PagerResponseCursor get cursor => $_getN(1);
  @$pb.TagNumber(15)
  set cursor($146.PagerResponseCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerResponseCursor ensureCursor() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
