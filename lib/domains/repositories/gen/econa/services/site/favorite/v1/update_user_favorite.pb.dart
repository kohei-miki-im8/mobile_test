//
//  Generated code. Do not modify.
//  source: econa/services/site/favorite/v1/update_user_favorite.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// お気に入り状態更新リクエスト
class UpdateUserFavoriteRequest extends $pb.GeneratedMessage {
  factory UpdateUserFavoriteRequest({
    $core.String? toUserId,
    $core.bool? favorite,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (favorite != null) {
      $result.favorite = favorite;
    }
    return $result;
  }
  UpdateUserFavoriteRequest._() : super();
  factory UpdateUserFavoriteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserFavoriteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserFavoriteRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.favorite.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOB(2, _omitFieldNames ? '' : 'favorite')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserFavoriteRequest clone() => UpdateUserFavoriteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserFavoriteRequest copyWith(void Function(UpdateUserFavoriteRequest) updates) => super.copyWith((message) => updates(message as UpdateUserFavoriteRequest)) as UpdateUserFavoriteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserFavoriteRequest create() => UpdateUserFavoriteRequest._();
  UpdateUserFavoriteRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserFavoriteRequest> createRepeated() => $pb.PbList<UpdateUserFavoriteRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserFavoriteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserFavoriteRequest>(create);
  static UpdateUserFavoriteRequest? _defaultInstance;

  /// お相手のユーザーID
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// お気に入り状態
  @$pb.TagNumber(2)
  $core.bool get favorite => $_getBF(1);
  @$pb.TagNumber(2)
  set favorite($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFavorite() => $_has(1);
  @$pb.TagNumber(2)
  void clearFavorite() => clearField(2);
}

/// お気に入り状態更新レスポンス
class UpdateUserFavoriteResponse extends $pb.GeneratedMessage {
  factory UpdateUserFavoriteResponse() => create();
  UpdateUserFavoriteResponse._() : super();
  factory UpdateUserFavoriteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserFavoriteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateUserFavoriteResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.favorite.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserFavoriteResponse clone() => UpdateUserFavoriteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserFavoriteResponse copyWith(void Function(UpdateUserFavoriteResponse) updates) => super.copyWith((message) => updates(message as UpdateUserFavoriteResponse)) as UpdateUserFavoriteResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateUserFavoriteResponse create() => UpdateUserFavoriteResponse._();
  UpdateUserFavoriteResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateUserFavoriteResponse> createRepeated() => $pb.PbList<UpdateUserFavoriteResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserFavoriteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserFavoriteResponse>(create);
  static UpdateUserFavoriteResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
