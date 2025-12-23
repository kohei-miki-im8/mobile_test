//
//  Generated code. Do not modify.
//  source: econa/services/site/block/v1/get_blocked_users.proto
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

/// ブロック済みユーザー取得リクエスト
class GetBlockedUsersRequest extends $pb.GeneratedMessage {
  factory GetBlockedUsersRequest({
    $core.String? toUserId,
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetBlockedUsersRequest._() : super();
  factory GetBlockedUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockedUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockedUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.block.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockedUsersRequest clone() => GetBlockedUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockedUsersRequest copyWith(void Function(GetBlockedUsersRequest) updates) => super.copyWith((message) => updates(message as GetBlockedUsersRequest)) as GetBlockedUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockedUsersRequest create() => GetBlockedUsersRequest._();
  GetBlockedUsersRequest createEmptyInstance() => create();
  static $pb.PbList<GetBlockedUsersRequest> createRepeated() => $pb.PbList<GetBlockedUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBlockedUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockedUsersRequest>(create);
  static GetBlockedUsersRequest? _defaultInstance;

  /// 特定のユーザーに対するブロック状態を取得する場合に指定
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// カーソル
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

/// ブロック済みユーザー取得レスポンス
class GetBlockedUsersResponse extends $pb.GeneratedMessage {
  factory GetBlockedUsersResponse({
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
  GetBlockedUsersResponse._() : super();
  factory GetBlockedUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBlockedUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBlockedUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.block.v1'), createEmptyInstance: create)
    ..pc<$147.ThumbnailUser>(1, _omitFieldNames ? '' : 'thumbnailUsers', $pb.PbFieldType.PM, subBuilder: $147.ThumbnailUser.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBlockedUsersResponse clone() => GetBlockedUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBlockedUsersResponse copyWith(void Function(GetBlockedUsersResponse) updates) => super.copyWith((message) => updates(message as GetBlockedUsersResponse)) as GetBlockedUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBlockedUsersResponse create() => GetBlockedUsersResponse._();
  GetBlockedUsersResponse createEmptyInstance() => create();
  static $pb.PbList<GetBlockedUsersResponse> createRepeated() => $pb.PbList<GetBlockedUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBlockedUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBlockedUsersResponse>(create);
  static GetBlockedUsersResponse? _defaultInstance;

  /// ブロック済みユーザー群
  @$pb.TagNumber(1)
  $core.List<$147.ThumbnailUser> get thumbnailUsers => $_getList(0);

  /// 次のカーソル
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
