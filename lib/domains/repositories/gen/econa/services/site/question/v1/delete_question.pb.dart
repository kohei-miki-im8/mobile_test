//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/delete_question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 質問を削除
class DeleteQuestionRequest extends $pb.GeneratedMessage {
  factory DeleteQuestionRequest({
    $core.String? questionId,
  }) {
    final $result = create();
    if (questionId != null) {
      $result.questionId = questionId;
    }
    return $result;
  }
  DeleteQuestionRequest._() : super();
  factory DeleteQuestionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteQuestionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteQuestionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'questionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteQuestionRequest clone() => DeleteQuestionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteQuestionRequest copyWith(void Function(DeleteQuestionRequest) updates) => super.copyWith((message) => updates(message as DeleteQuestionRequest)) as DeleteQuestionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteQuestionRequest create() => DeleteQuestionRequest._();
  DeleteQuestionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteQuestionRequest> createRepeated() => $pb.PbList<DeleteQuestionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteQuestionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteQuestionRequest>(create);
  static DeleteQuestionRequest? _defaultInstance;

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

/// 質問を削除
class DeleteQuestionResponse extends $pb.GeneratedMessage {
  factory DeleteQuestionResponse() => create();
  DeleteQuestionResponse._() : super();
  factory DeleteQuestionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteQuestionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteQuestionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteQuestionResponse clone() => DeleteQuestionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteQuestionResponse copyWith(void Function(DeleteQuestionResponse) updates) => super.copyWith((message) => updates(message as DeleteQuestionResponse)) as DeleteQuestionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteQuestionResponse create() => DeleteQuestionResponse._();
  DeleteQuestionResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteQuestionResponse> createRepeated() => $pb.PbList<DeleteQuestionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteQuestionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteQuestionResponse>(create);
  static DeleteQuestionResponse? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
