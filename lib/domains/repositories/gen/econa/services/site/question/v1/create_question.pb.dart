//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/create_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 質問作成リクエスト
class CreateQuestionRequest extends $pb.GeneratedMessage {
  factory CreateQuestionRequest({
    $core.String? toUserId,
    $core.String? rawQuestion,
    $core.String? userQuestionId,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (rawQuestion != null) {
      $result.rawQuestion = rawQuestion;
    }
    if (userQuestionId != null) {
      $result.userQuestionId = userQuestionId;
    }
    return $result;
  }
  CreateQuestionRequest._() : super();
  factory CreateQuestionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateQuestionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateQuestionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..aOS(2, _omitFieldNames ? '' : 'rawQuestion')
    ..aOS(3, _omitFieldNames ? '' : 'userQuestionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateQuestionRequest clone() => CreateQuestionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateQuestionRequest copyWith(void Function(CreateQuestionRequest) updates) => super.copyWith((message) => updates(message as CreateQuestionRequest)) as CreateQuestionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateQuestionRequest create() => CreateQuestionRequest._();
  CreateQuestionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateQuestionRequest> createRepeated() => $pb.PbList<CreateQuestionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateQuestionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateQuestionRequest>(create);
  static CreateQuestionRequest? _defaultInstance;

  /// お相手のユーザーID
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// 質問原文
  @$pb.TagNumber(2)
  $core.String get rawQuestion => $_getSZ(1);
  @$pb.TagNumber(2)
  set rawQuestion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRawQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearRawQuestion() => clearField(2);

  /// 任意の質問ID（冪等化用）。空の場合はサーバーがUUIDv7を発行する
  @$pb.TagNumber(3)
  $core.String get userQuestionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userQuestionId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserQuestionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserQuestionId() => clearField(3);
}

/// 質問作成レスポンス
class CreateQuestionResponse extends $pb.GeneratedMessage {
  factory CreateQuestionResponse({
    $core.String? userQuestionId,
  }) {
    final $result = create();
    if (userQuestionId != null) {
      $result.userQuestionId = userQuestionId;
    }
    return $result;
  }
  CreateQuestionResponse._() : super();
  factory CreateQuestionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateQuestionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateQuestionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userQuestionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateQuestionResponse clone() => CreateQuestionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateQuestionResponse copyWith(void Function(CreateQuestionResponse) updates) => super.copyWith((message) => updates(message as CreateQuestionResponse)) as CreateQuestionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateQuestionResponse create() => CreateQuestionResponse._();
  CreateQuestionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateQuestionResponse> createRepeated() => $pb.PbList<CreateQuestionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateQuestionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateQuestionResponse>(create);
  static CreateQuestionResponse? _defaultInstance;

  /// 質問ID（成功時のみ）
  @$pb.TagNumber(1)
  $core.String get userQuestionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userQuestionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserQuestionId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
