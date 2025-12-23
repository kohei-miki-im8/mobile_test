//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/approve_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../shared/question.pb.dart' as $171;

/// 質問を承認
class ApproveQuestionRequest extends $pb.GeneratedMessage {
  factory ApproveQuestionRequest({
    $core.String? userQuestionId,
    $core.String? approvedQuestion,
  }) {
    final $result = create();
    if (userQuestionId != null) {
      $result.userQuestionId = userQuestionId;
    }
    if (approvedQuestion != null) {
      $result.approvedQuestion = approvedQuestion;
    }
    return $result;
  }
  ApproveQuestionRequest._() : super();
  factory ApproveQuestionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveQuestionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveQuestionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userQuestionId')
    ..aOS(2, _omitFieldNames ? '' : 'approvedQuestion')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveQuestionRequest clone() => ApproveQuestionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveQuestionRequest copyWith(void Function(ApproveQuestionRequest) updates) => super.copyWith((message) => updates(message as ApproveQuestionRequest)) as ApproveQuestionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveQuestionRequest create() => ApproveQuestionRequest._();
  ApproveQuestionRequest createEmptyInstance() => create();
  static $pb.PbList<ApproveQuestionRequest> createRepeated() => $pb.PbList<ApproveQuestionRequest>();
  @$core.pragma('dart2js:noInline')
  static ApproveQuestionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveQuestionRequest>(create);
  static ApproveQuestionRequest? _defaultInstance;

  /// 質問ID
  @$pb.TagNumber(1)
  $core.String get userQuestionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userQuestionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserQuestionId() => clearField(1);

  /// 承認する質問文（AI提案を受けてユーザーが最終調整した内容）
  @$pb.TagNumber(2)
  $core.String get approvedQuestion => $_getSZ(1);
  @$pb.TagNumber(2)
  set approvedQuestion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApprovedQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearApprovedQuestion() => clearField(2);
}

/// 質問を承認
class ApproveQuestionResponse extends $pb.GeneratedMessage {
  factory ApproveQuestionResponse({
    $171.Question? question,
  }) {
    final $result = create();
    if (question != null) {
      $result.question = question;
    }
    return $result;
  }
  ApproveQuestionResponse._() : super();
  factory ApproveQuestionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveQuestionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveQuestionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOM<$171.Question>(1, _omitFieldNames ? '' : 'question', subBuilder: $171.Question.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveQuestionResponse clone() => ApproveQuestionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveQuestionResponse copyWith(void Function(ApproveQuestionResponse) updates) => super.copyWith((message) => updates(message as ApproveQuestionResponse)) as ApproveQuestionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveQuestionResponse create() => ApproveQuestionResponse._();
  ApproveQuestionResponse createEmptyInstance() => create();
  static $pb.PbList<ApproveQuestionResponse> createRepeated() => $pb.PbList<ApproveQuestionResponse>();
  @$core.pragma('dart2js:noInline')
  static ApproveQuestionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveQuestionResponse>(create);
  static ApproveQuestionResponse? _defaultInstance;

  /// 承認された質問
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
