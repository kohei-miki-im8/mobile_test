//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/delete_question_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 質問に対する回答を削除
class DeleteQuestionAnswerRequest extends $pb.GeneratedMessage {
  factory DeleteQuestionAnswerRequest({
    $core.String? questionId,
  }) {
    final $result = create();
    if (questionId != null) {
      $result.questionId = questionId;
    }
    return $result;
  }
  DeleteQuestionAnswerRequest._() : super();
  factory DeleteQuestionAnswerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteQuestionAnswerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteQuestionAnswerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'questionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteQuestionAnswerRequest clone() => DeleteQuestionAnswerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteQuestionAnswerRequest copyWith(void Function(DeleteQuestionAnswerRequest) updates) => super.copyWith((message) => updates(message as DeleteQuestionAnswerRequest)) as DeleteQuestionAnswerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteQuestionAnswerRequest create() => DeleteQuestionAnswerRequest._();
  DeleteQuestionAnswerRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteQuestionAnswerRequest> createRepeated() => $pb.PbList<DeleteQuestionAnswerRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteQuestionAnswerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteQuestionAnswerRequest>(create);
  static DeleteQuestionAnswerRequest? _defaultInstance;

  /// 質問ID
  @$pb.TagNumber(1)
  $core.String get questionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set questionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionId() => clearField(1);
}

/// 質問に対する回答を削除
class DeleteQuestionAnswerResponse extends $pb.GeneratedMessage {
  factory DeleteQuestionAnswerResponse() => create();
  DeleteQuestionAnswerResponse._() : super();
  factory DeleteQuestionAnswerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteQuestionAnswerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteQuestionAnswerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteQuestionAnswerResponse clone() => DeleteQuestionAnswerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteQuestionAnswerResponse copyWith(void Function(DeleteQuestionAnswerResponse) updates) => super.copyWith((message) => updates(message as DeleteQuestionAnswerResponse)) as DeleteQuestionAnswerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteQuestionAnswerResponse create() => DeleteQuestionAnswerResponse._();
  DeleteQuestionAnswerResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteQuestionAnswerResponse> createRepeated() => $pb.PbList<DeleteQuestionAnswerResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteQuestionAnswerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteQuestionAnswerResponse>(create);
  static DeleteQuestionAnswerResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
