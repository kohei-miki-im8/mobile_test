//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/sync_user_tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// SyncUserTagRequest: ユーザータグの同期リクエスト
/// 認証ユーザーのタグを1つ追加または削除する
class SyncUserTagRequest extends $pb.GeneratedMessage {
  factory SyncUserTagRequest({
    $core.String? tagId,
    $core.bool? isAttached,
  }) {
    final $result = create();
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (isAttached != null) {
      $result.isAttached = isAttached;
    }
    return $result;
  }
  SyncUserTagRequest._() : super();
  factory SyncUserTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncUserTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncUserTagRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tagId')
    ..aOB(2, _omitFieldNames ? '' : 'isAttached')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncUserTagRequest clone() => SyncUserTagRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncUserTagRequest copyWith(void Function(SyncUserTagRequest) updates) => super.copyWith((message) => updates(message as SyncUserTagRequest)) as SyncUserTagRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncUserTagRequest create() => SyncUserTagRequest._();
  SyncUserTagRequest createEmptyInstance() => create();
  static $pb.PbList<SyncUserTagRequest> createRepeated() => $pb.PbList<SyncUserTagRequest>();
  @$core.pragma('dart2js:noInline')
  static SyncUserTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncUserTagRequest>(create);
  static SyncUserTagRequest? _defaultInstance;

  /// タグID（必須、UUID形式）
  @$pb.TagNumber(1)
  $core.String get tagId => $_getSZ(0);
  @$pb.TagNumber(1)
  set tagId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTagId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTagId() => clearField(1);

  /// タグを付けるか外すか
  /// true: タグを付ける（既に付いている場合は何もしない）
  /// false: タグを外す（既に外れている場合は何もしない）
  @$pb.TagNumber(2)
  $core.bool get isAttached => $_getBF(1);
  @$pb.TagNumber(2)
  set isAttached($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsAttached() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsAttached() => clearField(2);
}

/// SyncUserTagResponse: ユーザータグの同期レスポンス
/// 操作は常に成功を返す（冪等性）
class SyncUserTagResponse extends $pb.GeneratedMessage {
  factory SyncUserTagResponse() => create();
  SyncUserTagResponse._() : super();
  factory SyncUserTagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncUserTagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SyncUserTagResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncUserTagResponse clone() => SyncUserTagResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncUserTagResponse copyWith(void Function(SyncUserTagResponse) updates) => super.copyWith((message) => updates(message as SyncUserTagResponse)) as SyncUserTagResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncUserTagResponse create() => SyncUserTagResponse._();
  SyncUserTagResponse createEmptyInstance() => create();
  static $pb.PbList<SyncUserTagResponse> createRepeated() => $pb.PbList<SyncUserTagResponse>();
  @$core.pragma('dart2js:noInline')
  static SyncUserTagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncUserTagResponse>(create);
  static SyncUserTagResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
