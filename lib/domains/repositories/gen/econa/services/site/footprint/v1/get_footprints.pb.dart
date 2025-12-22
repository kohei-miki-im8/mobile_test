//
//  Generated code. Do not modify.
//  source: econa/services/site/footprint/v1/get_footprints.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/pager_cursor.pb.dart' as $146;
import '../../../../shared/thumbnail_user.pb.dart' as $147;

/// 足跡取得リクエスト
class GetFootprintsRequest extends $pb.GeneratedMessage {
  factory GetFootprintsRequest({
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetFootprintsRequest._() : super();
  factory GetFootprintsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFootprintsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFootprintsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.footprint.v1'), createEmptyInstance: create)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFootprintsRequest clone() => GetFootprintsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFootprintsRequest copyWith(void Function(GetFootprintsRequest) updates) => super.copyWith((message) => updates(message as GetFootprintsRequest)) as GetFootprintsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFootprintsRequest create() => GetFootprintsRequest._();
  GetFootprintsRequest createEmptyInstance() => create();
  static $pb.PbList<GetFootprintsRequest> createRepeated() => $pb.PbList<GetFootprintsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFootprintsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFootprintsRequest>(create);
  static GetFootprintsRequest? _defaultInstance;

  /// カーソル情報（limit / cursor_id を内包）
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

/// 足跡取得レスポンス
class GetFootprintsResponse extends $pb.GeneratedMessage {
  factory GetFootprintsResponse({
    $core.Iterable<$147.ThumbnailUser>? thumbnailUsers,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (thumbnailUsers != null) {
      $result.thumbnailUsers.addAll(thumbnailUsers);
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetFootprintsResponse._() : super();
  factory GetFootprintsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFootprintsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFootprintsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.footprint.v1'), createEmptyInstance: create)
    ..pc<$147.ThumbnailUser>(1, _omitFieldNames ? '' : 'thumbnailUsers', $pb.PbFieldType.PM, subBuilder: $147.ThumbnailUser.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFootprintsResponse clone() => GetFootprintsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFootprintsResponse copyWith(void Function(GetFootprintsResponse) updates) => super.copyWith((message) => updates(message as GetFootprintsResponse)) as GetFootprintsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFootprintsResponse create() => GetFootprintsResponse._();
  GetFootprintsResponse createEmptyInstance() => create();
  static $pb.PbList<GetFootprintsResponse> createRepeated() => $pb.PbList<GetFootprintsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFootprintsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFootprintsResponse>(create);
  static GetFootprintsResponse? _defaultInstance;

  /// 足跡ユーザー一覧
  @$pb.TagNumber(1)
  $core.List<$147.ThumbnailUser> get thumbnailUsers => $_getList(0);

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
