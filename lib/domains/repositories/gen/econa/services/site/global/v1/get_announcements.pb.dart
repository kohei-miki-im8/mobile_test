//
//  Generated code. Do not modify.
//  source: econa/services/site/global/v1/get_announcements.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/announcement.pb.dart' as $159;
import '../../../../shared/pager_cursor.pb.dart' as $146;

/// GetAnnouncements:お知らせ一覧取得リクエスト
class GetAnnouncementsRequest extends $pb.GeneratedMessage {
  factory GetAnnouncementsRequest({
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetAnnouncementsRequest._() : super();
  factory GetAnnouncementsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAnnouncementsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAnnouncementsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAnnouncementsRequest clone() => GetAnnouncementsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAnnouncementsRequest copyWith(void Function(GetAnnouncementsRequest) updates) => super.copyWith((message) => updates(message as GetAnnouncementsRequest)) as GetAnnouncementsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAnnouncementsRequest create() => GetAnnouncementsRequest._();
  GetAnnouncementsRequest createEmptyInstance() => create();
  static $pb.PbList<GetAnnouncementsRequest> createRepeated() => $pb.PbList<GetAnnouncementsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAnnouncementsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAnnouncementsRequest>(create);
  static GetAnnouncementsRequest? _defaultInstance;

  /// ページネーションカーソル
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
}

/// GetAnnouncements:お知らせ一覧取得レスポンス
class GetAnnouncementsResponse extends $pb.GeneratedMessage {
  factory GetAnnouncementsResponse({
    $core.Iterable<$159.Announcement>? announcements,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (announcements != null) {
      $result.announcements.addAll(announcements);
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetAnnouncementsResponse._() : super();
  factory GetAnnouncementsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAnnouncementsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAnnouncementsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.global.v1'), createEmptyInstance: create)
    ..pc<$159.Announcement>(1, _omitFieldNames ? '' : 'announcements', $pb.PbFieldType.PM, subBuilder: $159.Announcement.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAnnouncementsResponse clone() => GetAnnouncementsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAnnouncementsResponse copyWith(void Function(GetAnnouncementsResponse) updates) => super.copyWith((message) => updates(message as GetAnnouncementsResponse)) as GetAnnouncementsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAnnouncementsResponse create() => GetAnnouncementsResponse._();
  GetAnnouncementsResponse createEmptyInstance() => create();
  static $pb.PbList<GetAnnouncementsResponse> createRepeated() => $pb.PbList<GetAnnouncementsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAnnouncementsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAnnouncementsResponse>(create);
  static GetAnnouncementsResponse? _defaultInstance;

  /// お知らせ一覧
  @$pb.TagNumber(1)
  $core.List<$159.Announcement> get announcements => $_getList(0);

  /// 次ページカーソル
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
