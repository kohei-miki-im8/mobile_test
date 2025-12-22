//
//  Generated code. Do not modify.
//  source: econa/services/site/favorite/v1/get_favorite_users.proto
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

/// お気に入りユーザー取得リクエスト
class GetFavoriteUsersRequest extends $pb.GeneratedMessage {
  factory GetFavoriteUsersRequest({
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetFavoriteUsersRequest._() : super();
  factory GetFavoriteUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFavoriteUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFavoriteUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.favorite.v1'), createEmptyInstance: create)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFavoriteUsersRequest clone() => GetFavoriteUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFavoriteUsersRequest copyWith(void Function(GetFavoriteUsersRequest) updates) => super.copyWith((message) => updates(message as GetFavoriteUsersRequest)) as GetFavoriteUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFavoriteUsersRequest create() => GetFavoriteUsersRequest._();
  GetFavoriteUsersRequest createEmptyInstance() => create();
  static $pb.PbList<GetFavoriteUsersRequest> createRepeated() => $pb.PbList<GetFavoriteUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFavoriteUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFavoriteUsersRequest>(create);
  static GetFavoriteUsersRequest? _defaultInstance;

  /// カーソル
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

/// お気に入りユーザー取得レスポンス
class GetFavoriteUsersResponse extends $pb.GeneratedMessage {
  factory GetFavoriteUsersResponse({
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
  GetFavoriteUsersResponse._() : super();
  factory GetFavoriteUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFavoriteUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFavoriteUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.favorite.v1'), createEmptyInstance: create)
    ..pc<$147.ThumbnailUser>(1, _omitFieldNames ? '' : 'thumbnailUsers', $pb.PbFieldType.PM, subBuilder: $147.ThumbnailUser.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFavoriteUsersResponse clone() => GetFavoriteUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFavoriteUsersResponse copyWith(void Function(GetFavoriteUsersResponse) updates) => super.copyWith((message) => updates(message as GetFavoriteUsersResponse)) as GetFavoriteUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFavoriteUsersResponse create() => GetFavoriteUsersResponse._();
  GetFavoriteUsersResponse createEmptyInstance() => create();
  static $pb.PbList<GetFavoriteUsersResponse> createRepeated() => $pb.PbList<GetFavoriteUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFavoriteUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFavoriteUsersResponse>(create);
  static GetFavoriteUsersResponse? _defaultInstance;

  /// お気に入りユーザー群
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
