//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/update_question_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/question.pb.dart' as $171;

/// 質問に対する回答を更新
class UpdateQuestionAnswerRequest extends $pb.GeneratedMessage {
  factory UpdateQuestionAnswerRequest({
    $core.String? userQuestionId,
    $core.String? rawUserAnswer,
    $core.String? publishedUserId,
  }) {
    final $result = create();
    if (userQuestionId != null) {
      $result.userQuestionId = userQuestionId;
    }
    if (rawUserAnswer != null) {
      $result.rawUserAnswer = rawUserAnswer;
    }
    if (publishedUserId != null) {
      $result.publishedUserId = publishedUserId;
    }
    return $result;
  }
  UpdateQuestionAnswerRequest._() : super();
  factory UpdateQuestionAnswerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateQuestionAnswerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateQuestionAnswerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userQuestionId')
    ..aOS(2, _omitFieldNames ? '' : 'rawUserAnswer')
    ..aOS(3, _omitFieldNames ? '' : 'publishedUserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateQuestionAnswerRequest clone() => UpdateQuestionAnswerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateQuestionAnswerRequest copyWith(void Function(UpdateQuestionAnswerRequest) updates) => super.copyWith((message) => updates(message as UpdateQuestionAnswerRequest)) as UpdateQuestionAnswerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateQuestionAnswerRequest create() => UpdateQuestionAnswerRequest._();
  UpdateQuestionAnswerRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateQuestionAnswerRequest> createRepeated() => $pb.PbList<UpdateQuestionAnswerRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateQuestionAnswerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateQuestionAnswerRequest>(create);
  static UpdateQuestionAnswerRequest? _defaultInstance;

  /// 質問ID（新フィールド名で統一）
  @$pb.TagNumber(1)
  $core.String get userQuestionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userQuestionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserQuestionId() => clearField(1);

  /// 回答
  @$pb.TagNumber(2)
  $core.String get rawUserAnswer => $_getSZ(1);
  @$pb.TagNumber(2)
  set rawUserAnswer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRawUserAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearRawUserAnswer() => clearField(2);

  /// モデレーション用の投稿者ID（質問者/回答者を特定）
  @$pb.TagNumber(3)
  $core.String get publishedUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set publishedUserId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublishedUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublishedUserId() => clearField(3);
}

/// 質問に対する回答を更新
class UpdateQuestionAnswerResponse extends $pb.GeneratedMessage {
  factory UpdateQuestionAnswerResponse({
    $171.Question? question,
  }) {
    final $result = create();
    if (question != null) {
      $result.question = question;
    }
    return $result;
  }
  UpdateQuestionAnswerResponse._() : super();
  factory UpdateQuestionAnswerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateQuestionAnswerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateQuestionAnswerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOM<$171.Question>(1, _omitFieldNames ? '' : 'question', subBuilder: $171.Question.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateQuestionAnswerResponse clone() => UpdateQuestionAnswerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateQuestionAnswerResponse copyWith(void Function(UpdateQuestionAnswerResponse) updates) => super.copyWith((message) => updates(message as UpdateQuestionAnswerResponse)) as UpdateQuestionAnswerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateQuestionAnswerResponse create() => UpdateQuestionAnswerResponse._();
  UpdateQuestionAnswerResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateQuestionAnswerResponse> createRepeated() => $pb.PbList<UpdateQuestionAnswerResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateQuestionAnswerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateQuestionAnswerResponse>(create);
  static UpdateQuestionAnswerResponse? _defaultInstance;

  /// 質問
  @$pb.TagNumber(1)
  $171.Question get question => $_getN(0);
  @$pb.TagNumber(1)
  set question($171.Question v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestion() => clearField(1);
  @$pb.TagNumber(1)
  $171.Question ensureQuestion() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
