//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/get_user_tags.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/user_tag.pb.dart' as $180;

class GetUserTagsRequest extends $pb.GeneratedMessage {
  factory GetUserTagsRequest({
    $core.String? userId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  GetUserTagsRequest._() : super();
  factory GetUserTagsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserTagsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserTagsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserTagsRequest clone() => GetUserTagsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserTagsRequest copyWith(void Function(GetUserTagsRequest) updates) => super.copyWith((message) => updates(message as GetUserTagsRequest)) as GetUserTagsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserTagsRequest create() => GetUserTagsRequest._();
  GetUserTagsRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserTagsRequest> createRepeated() => $pb.PbList<GetUserTagsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserTagsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserTagsRequest>(create);
  static GetUserTagsRequest? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class GetUserTagsResponse extends $pb.GeneratedMessage {
  factory GetUserTagsResponse({
    $core.Iterable<$180.UserTag>? userTags,
  }) {
    final $result = create();
    if (userTags != null) {
      $result.userTags.addAll(userTags);
    }
    return $result;
  }
  GetUserTagsResponse._() : super();
  factory GetUserTagsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserTagsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserTagsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..pc<$180.UserTag>(1, _omitFieldNames ? '' : 'userTags', $pb.PbFieldType.PM, subBuilder: $180.UserTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserTagsResponse clone() => GetUserTagsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserTagsResponse copyWith(void Function(GetUserTagsResponse) updates) => super.copyWith((message) => updates(message as GetUserTagsResponse)) as GetUserTagsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserTagsResponse create() => GetUserTagsResponse._();
  GetUserTagsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserTagsResponse> createRepeated() => $pb.PbList<GetUserTagsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserTagsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserTagsResponse>(create);
  static GetUserTagsResponse? _defaultInstance;

  /// ユーザーのタグ群
  @$pb.TagNumber(1)
  $core.List<$180.UserTag> get userTags => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
