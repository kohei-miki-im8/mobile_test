//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/get_common_tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/user_tag.pb.dart' as $180;

/// 共通タグ取得リクエスト
/// ログインユーザーと対象ユーザー間の共通タグを取得
class GetCommonTagsRequest extends $pb.GeneratedMessage {
  factory GetCommonTagsRequest({
    $core.String? toUserId,
    $core.int? limit,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  GetCommonTagsRequest._() : super();
  factory GetCommonTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCommonTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCommonTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCommonTagsRequest clone() => GetCommonTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCommonTagsRequest copyWith(void Function(GetCommonTagsRequest) updates) => super.copyWith((message) => updates(message as GetCommonTagsRequest)) as GetCommonTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommonTagsRequest create() => GetCommonTagsRequest._();
  GetCommonTagsRequest createEmptyInstance() => create();
  static $pb.PbList<GetCommonTagsRequest> createRepeated() => $pb.PbList<GetCommonTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCommonTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCommonTagsRequest>(create);
  static GetCommonTagsRequest? _defaultInstance;

  /// 対象ユーザーID
  /// from_user_idは認証コンテキストから自動取得
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// 取得件数（1〜20）
  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

/// 共通タグ取得レスポンス
class GetCommonTagsResponse extends $pb.GeneratedMessage {
  factory GetCommonTagsResponse({
    $core.Iterable<$180.UserTag>? commonTags,
  }) {
    final $result = create();
    if (commonTags != null) {
      $result.commonTags.addAll(commonTags);
    }
    return $result;
  }
  GetCommonTagsResponse._() : super();
  factory GetCommonTagsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCommonTagsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCommonTagsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..pc<$180.UserTag>(1, _omitFieldNames ? '' : 'commonTags', $pb.PbFieldType.PM, subBuilder: $180.UserTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCommonTagsResponse clone() => GetCommonTagsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCommonTagsResponse copyWith(void Function(GetCommonTagsResponse) updates) => super.copyWith((message) => updates(message as GetCommonTagsResponse)) as GetCommonTagsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommonTagsResponse create() => GetCommonTagsResponse._();
  GetCommonTagsResponse createEmptyInstance() => create();
  static $pb.PbList<GetCommonTagsResponse> createRepeated() => $pb.PbList<GetCommonTagsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCommonTagsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCommonTagsResponse>(create);
  static GetCommonTagsResponse? _defaultInstance;

  /// 共通タグの配列
  /// 両ユーザーが共通して保有するタグ
  /// sort_order順でソート済み
  @$pb.TagNumber(1)
  $core.List<$180.UserTag> get commonTags => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
