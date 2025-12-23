//
//  Generated code. Do not modify.
//  source: econa/services/site/hide/v1/get_hidden_users.proto
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

/// 非表示ユーザー取得リクエスト
class GetHiddenUsersRequest extends $pb.GeneratedMessage {
  factory GetHiddenUsersRequest({
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
  GetHiddenUsersRequest._() : super();
  factory GetHiddenUsersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHiddenUsersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetHiddenUsersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.hide.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHiddenUsersRequest clone() => GetHiddenUsersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHiddenUsersRequest copyWith(void Function(GetHiddenUsersRequest) updates) => super.copyWith((message) => updates(message as GetHiddenUsersRequest)) as GetHiddenUsersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHiddenUsersRequest create() => GetHiddenUsersRequest._();
  GetHiddenUsersRequest createEmptyInstance() => create();
  static $pb.PbList<GetHiddenUsersRequest> createRepeated() => $pb.PbList<GetHiddenUsersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetHiddenUsersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHiddenUsersRequest>(create);
  static GetHiddenUsersRequest? _defaultInstance;

  /// お相手のユーザーID（特定のユーザーを非表示にしているかどうかを取得する場合に指定）
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

/// 非表示ユーザー取得レスポンス
class GetHiddenUsersResponse extends $pb.GeneratedMessage {
  factory GetHiddenUsersResponse({
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
  GetHiddenUsersResponse._() : super();
  factory GetHiddenUsersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHiddenUsersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetHiddenUsersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.hide.v1'), createEmptyInstance: create)
    ..pc<$147.ThumbnailUser>(1, _omitFieldNames ? '' : 'thumbnailUsers', $pb.PbFieldType.PM, subBuilder: $147.ThumbnailUser.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHiddenUsersResponse clone() => GetHiddenUsersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHiddenUsersResponse copyWith(void Function(GetHiddenUsersResponse) updates) => super.copyWith((message) => updates(message as GetHiddenUsersResponse)) as GetHiddenUsersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHiddenUsersResponse create() => GetHiddenUsersResponse._();
  GetHiddenUsersResponse createEmptyInstance() => create();
  static $pb.PbList<GetHiddenUsersResponse> createRepeated() => $pb.PbList<GetHiddenUsersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetHiddenUsersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHiddenUsersResponse>(create);
  static GetHiddenUsersResponse? _defaultInstance;

  /// 非表示ユーザー群
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
