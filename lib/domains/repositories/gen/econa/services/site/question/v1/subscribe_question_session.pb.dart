//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/subscribe_question_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/question_session_publish_type.pbenum.dart' as $173;
import '../../../../shared/question.pb.dart' as $171;

/// 質問セッション購読リクエスト
class SubscribeQuestionSessionRequest extends $pb.GeneratedMessage {
  factory SubscribeQuestionSessionRequest({
    $core.String? userQuestionId,
  }) {
    final $result = create();
    if (userQuestionId != null) {
      $result.userQuestionId = userQuestionId;
    }
    return $result;
  }
  SubscribeQuestionSessionRequest._() : super();
  factory SubscribeQuestionSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeQuestionSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeQuestionSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userQuestionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeQuestionSessionRequest clone() => SubscribeQuestionSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeQuestionSessionRequest copyWith(void Function(SubscribeQuestionSessionRequest) updates) => super.copyWith((message) => updates(message as SubscribeQuestionSessionRequest)) as SubscribeQuestionSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeQuestionSessionRequest create() => SubscribeQuestionSessionRequest._();
  SubscribeQuestionSessionRequest createEmptyInstance() => create();
  static $pb.PbList<SubscribeQuestionSessionRequest> createRepeated() => $pb.PbList<SubscribeQuestionSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static SubscribeQuestionSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeQuestionSessionRequest>(create);
  static SubscribeQuestionSessionRequest? _defaultInstance;

  /// 質問ID（user_question_idに統一）
  @$pb.TagNumber(1)
  $core.String get userQuestionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userQuestionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserQuestionId() => clearField(1);
}

enum SubscribeQuestionSessionResponse_Response {
  editingQuestion, 
  postedQuestion, 
  editingAnswer, 
  postedAnswer, 
  notSet
}

/// 質問セッション購読レスポンス
class SubscribeQuestionSessionResponse extends $pb.GeneratedMessage {
  factory SubscribeQuestionSessionResponse({
    $core.String? publishedUserId,
    $173.QuestionSessionPublishType? publishType,
    $171.EditingQuestion? editingQuestion,
    $171.PostedQuestion? postedQuestion,
    $171.EditingAnswer? editingAnswer,
    $171.PostedAnswer? postedAnswer,
    $core.bool? isSuccessful,
  }) {
    final $result = create();
    if (publishedUserId != null) {
      $result.publishedUserId = publishedUserId;
    }
    if (publishType != null) {
      $result.publishType = publishType;
    }
    if (editingQuestion != null) {
      $result.editingQuestion = editingQuestion;
    }
    if (postedQuestion != null) {
      $result.postedQuestion = postedQuestion;
    }
    if (editingAnswer != null) {
      $result.editingAnswer = editingAnswer;
    }
    if (postedAnswer != null) {
      $result.postedAnswer = postedAnswer;
    }
    if (isSuccessful != null) {
      $result.isSuccessful = isSuccessful;
    }
    return $result;
  }
  SubscribeQuestionSessionResponse._() : super();
  factory SubscribeQuestionSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SubscribeQuestionSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, SubscribeQuestionSessionResponse_Response> _SubscribeQuestionSessionResponse_ResponseByTag = {
    3 : SubscribeQuestionSessionResponse_Response.editingQuestion,
    4 : SubscribeQuestionSessionResponse_Response.postedQuestion,
    5 : SubscribeQuestionSessionResponse_Response.editingAnswer,
    6 : SubscribeQuestionSessionResponse_Response.postedAnswer,
    0 : SubscribeQuestionSessionResponse_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SubscribeQuestionSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6])
    ..aOS(1, _omitFieldNames ? '' : 'publishedUserId')
    ..e<$173.QuestionSessionPublishType>(2, _omitFieldNames ? '' : 'publishType', $pb.PbFieldType.OE, defaultOrMaker: $173.QuestionSessionPublishType.QUESTION_SESSION_PUBLISH_TYPE_UNSPECIFIED, valueOf: $173.QuestionSessionPublishType.valueOf, enumValues: $173.QuestionSessionPublishType.values)
    ..aOM<$171.EditingQuestion>(3, _omitFieldNames ? '' : 'editingQuestion', subBuilder: $171.EditingQuestion.create)
    ..aOM<$171.PostedQuestion>(4, _omitFieldNames ? '' : 'postedQuestion', subBuilder: $171.PostedQuestion.create)
    ..aOM<$171.EditingAnswer>(5, _omitFieldNames ? '' : 'editingAnswer', subBuilder: $171.EditingAnswer.create)
    ..aOM<$171.PostedAnswer>(6, _omitFieldNames ? '' : 'postedAnswer', subBuilder: $171.PostedAnswer.create)
    ..aOB(15, _omitFieldNames ? '' : 'isSuccessful')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SubscribeQuestionSessionResponse clone() => SubscribeQuestionSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SubscribeQuestionSessionResponse copyWith(void Function(SubscribeQuestionSessionResponse) updates) => super.copyWith((message) => updates(message as SubscribeQuestionSessionResponse)) as SubscribeQuestionSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubscribeQuestionSessionResponse create() => SubscribeQuestionSessionResponse._();
  SubscribeQuestionSessionResponse createEmptyInstance() => create();
  static $pb.PbList<SubscribeQuestionSessionResponse> createRepeated() => $pb.PbList<SubscribeQuestionSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static SubscribeQuestionSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SubscribeQuestionSessionResponse>(create);
  static SubscribeQuestionSessionResponse? _defaultInstance;

  SubscribeQuestionSessionResponse_Response whichResponse() => _SubscribeQuestionSessionResponse_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  /// 発行ユーザーID
  @$pb.TagNumber(1)
  $core.String get publishedUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set publishedUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublishedUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublishedUserId() => clearField(1);

  /// 発行タイプ
  @$pb.TagNumber(2)
  $173.QuestionSessionPublishType get publishType => $_getN(1);
  @$pb.TagNumber(2)
  set publishType($173.QuestionSessionPublishType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPublishType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPublishType() => clearField(2);

  /// 編集中の質問
  @$pb.TagNumber(3)
  $171.EditingQuestion get editingQuestion => $_getN(2);
  @$pb.TagNumber(3)
  set editingQuestion($171.EditingQuestion v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasEditingQuestion() => $_has(2);
  @$pb.TagNumber(3)
  void clearEditingQuestion() => clearField(3);
  @$pb.TagNumber(3)
  $171.EditingQuestion ensureEditingQuestion() => $_ensure(2);

  /// 投稿された質問
  @$pb.TagNumber(4)
  $171.PostedQuestion get postedQuestion => $_getN(3);
  @$pb.TagNumber(4)
  set postedQuestion($171.PostedQuestion v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPostedQuestion() => $_has(3);
  @$pb.TagNumber(4)
  void clearPostedQuestion() => clearField(4);
  @$pb.TagNumber(4)
  $171.PostedQuestion ensurePostedQuestion() => $_ensure(3);

  /// 編集中の回答 (EDEV-892)
  @$pb.TagNumber(5)
  $171.EditingAnswer get editingAnswer => $_getN(4);
  @$pb.TagNumber(5)
  set editingAnswer($171.EditingAnswer v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEditingAnswer() => $_has(4);
  @$pb.TagNumber(5)
  void clearEditingAnswer() => clearField(5);
  @$pb.TagNumber(5)
  $171.EditingAnswer ensureEditingAnswer() => $_ensure(4);

  /// 投稿された回答 (EDEV-892)
  @$pb.TagNumber(6)
  $171.PostedAnswer get postedAnswer => $_getN(5);
  @$pb.TagNumber(6)
  set postedAnswer($171.PostedAnswer v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPostedAnswer() => $_has(5);
  @$pb.TagNumber(6)
  void clearPostedAnswer() => clearField(6);
  @$pb.TagNumber(6)
  $171.PostedAnswer ensurePostedAnswer() => $_ensure(5);

  /// 成功フラグ
  @$pb.TagNumber(15)
  $core.bool get isSuccessful => $_getBF(6);
  @$pb.TagNumber(15)
  set isSuccessful($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsSuccessful() => $_has(6);
  @$pb.TagNumber(15)
  void clearIsSuccessful() => clearField(15);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
