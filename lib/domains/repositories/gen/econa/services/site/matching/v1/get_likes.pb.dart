//
//  Generated code. Do not modify.
//  source: econa/services/site/matching/v1/get_likes.proto
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

/// いいね取得リクエスト
class GetLikesRequest extends $pb.GeneratedMessage {
  factory GetLikesRequest({
    $core.bool? isSentByMe,
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (isSentByMe != null) {
      $result.isSentByMe = isSentByMe;
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetLikesRequest._() : super();
  factory GetLikesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLikesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLikesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSentByMe')
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLikesRequest clone() => GetLikesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLikesRequest copyWith(void Function(GetLikesRequest) updates) => super.copyWith((message) => updates(message as GetLikesRequest)) as GetLikesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLikesRequest create() => GetLikesRequest._();
  GetLikesRequest createEmptyInstance() => create();
  static $pb.PbList<GetLikesRequest> createRepeated() => $pb.PbList<GetLikesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLikesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLikesRequest>(create);
  static GetLikesRequest? _defaultInstance;

  /// 自分が送信したいいねを取得するかどうか（true: 自分が送信した、false: 自分に来た）
  @$pb.TagNumber(1)
  $core.bool get isSentByMe => $_getBF(0);
  @$pb.TagNumber(1)
  set isSentByMe($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsSentByMe() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSentByMe() => clearField(1);

  /// ページネーションリクエストカーソル
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

/// いいね取得レスポンス
class GetLikesResponse extends $pb.GeneratedMessage {
  factory GetLikesResponse({
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
  GetLikesResponse._() : super();
  factory GetLikesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLikesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLikesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.matching.v1'), createEmptyInstance: create)
    ..pc<$147.ThumbnailUser>(1, _omitFieldNames ? '' : 'thumbnailUsers', $pb.PbFieldType.PM, subBuilder: $147.ThumbnailUser.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLikesResponse clone() => GetLikesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLikesResponse copyWith(void Function(GetLikesResponse) updates) => super.copyWith((message) => updates(message as GetLikesResponse)) as GetLikesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLikesResponse create() => GetLikesResponse._();
  GetLikesResponse createEmptyInstance() => create();
  static $pb.PbList<GetLikesResponse> createRepeated() => $pb.PbList<GetLikesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLikesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLikesResponse>(create);
  static GetLikesResponse? _defaultInstance;

  /// いいね群
  @$pb.TagNumber(1)
  $core.List<$147.ThumbnailUser> get thumbnailUsers => $_getList(0);

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
