//
//  Generated code. Do not modify.
//  source: econa/services/site/tag/v1/create_user_tag.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateUserTagRequest extends $pb.GeneratedMessage {
  factory CreateUserTagRequest({
    $core.String? userId,
    $core.String? tagId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (tagId != null) {
      $result.tagId = tagId;
    }
    return $result;
  }
  CreateUserTagRequest._() : super();
  factory CreateUserTagRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserTagRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserTagRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'tagId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserTagRequest clone() => CreateUserTagRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserTagRequest copyWith(void Function(CreateUserTagRequest) updates) => super.copyWith((message) => updates(message as CreateUserTagRequest)) as CreateUserTagRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserTagRequest create() => CreateUserTagRequest._();
  CreateUserTagRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserTagRequest> createRepeated() => $pb.PbList<CreateUserTagRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserTagRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserTagRequest>(create);
  static CreateUserTagRequest? _defaultInstance;

  /// ユーザーID
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// タグID
  @$pb.TagNumber(2)
  $core.String get tagId => $_getSZ(1);
  @$pb.TagNumber(2)
  set tagId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTagId() => $_has(1);
  @$pb.TagNumber(2)
  void clearTagId() => clearField(2);
}

class CreateUserTagResponse extends $pb.GeneratedMessage {
  factory CreateUserTagResponse() => create();
  CreateUserTagResponse._() : super();
  factory CreateUserTagResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUserTagResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateUserTagResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.tag.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUserTagResponse clone() => CreateUserTagResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUserTagResponse copyWith(void Function(CreateUserTagResponse) updates) => super.copyWith((message) => updates(message as CreateUserTagResponse)) as CreateUserTagResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserTagResponse create() => CreateUserTagResponse._();
  CreateUserTagResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserTagResponse> createRepeated() => $pb.PbList<CreateUserTagResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserTagResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUserTagResponse>(create);
  static CreateUserTagResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
