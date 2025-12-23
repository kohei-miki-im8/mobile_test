//
//  Generated code. Do not modify.
//  source: econa/shared/question.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $109;
import '../enums/ai_agent_code.pbenum.dart' as $148;
import '../enums/question_content_type.pbenum.dart' as $170;
import 'thumbnail_user.pb.dart' as $147;

enum Question_Contents {
  editingQuestion, 
  postedQuestion, 
  notSet
}

/// 質問
class Question extends $pb.GeneratedMessage {
  factory Question({
    $core.String? questionId,
    $148.AiAgentCode? aiAgentCode,
    $170.QuestionContentType? questionContentType,
    EditingQuestion? editingQuestion,
    PostedQuestion? postedQuestion,
  }) {
    final $result = create();
    if (questionId != null) {
      $result.questionId = questionId;
    }
    if (aiAgentCode != null) {
      $result.aiAgentCode = aiAgentCode;
    }
    if (questionContentType != null) {
      $result.questionContentType = questionContentType;
    }
    if (editingQuestion != null) {
      $result.editingQuestion = editingQuestion;
    }
    if (postedQuestion != null) {
      $result.postedQuestion = postedQuestion;
    }
    return $result;
  }
  Question._() : super();
  factory Question.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Question.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Question_Contents> _Question_ContentsByTag = {
    4 : Question_Contents.editingQuestion,
    5 : Question_Contents.postedQuestion,
    0 : Question_Contents.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Question', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..oo(0, [4, 5])
    ..aOS(1, _omitFieldNames ? '' : 'questionId')
    ..e<$148.AiAgentCode>(2, _omitFieldNames ? '' : 'aiAgentCode', $pb.PbFieldType.OE, defaultOrMaker: $148.AiAgentCode.AI_AGENT_CODE_UNSPECIFIED, valueOf: $148.AiAgentCode.valueOf, enumValues: $148.AiAgentCode.values)
    ..e<$170.QuestionContentType>(3, _omitFieldNames ? '' : 'questionContentType', $pb.PbFieldType.OE, defaultOrMaker: $170.QuestionContentType.QUESTION_CONTENT_TYPE_UNSPECIFIED, valueOf: $170.QuestionContentType.valueOf, enumValues: $170.QuestionContentType.values)
    ..aOM<EditingQuestion>(4, _omitFieldNames ? '' : 'editingQuestion', subBuilder: EditingQuestion.create)
    ..aOM<PostedQuestion>(5, _omitFieldNames ? '' : 'postedQuestion', subBuilder: PostedQuestion.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Question clone() => Question()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Question copyWith(void Function(Question) updates) => super.copyWith((message) => updates(message as Question)) as Question;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Question create() => Question._();
  Question createEmptyInstance() => create();
  static $pb.PbList<Question> createRepeated() => $pb.PbList<Question>();
  @$core.pragma('dart2js:noInline')
  static Question getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Question>(create);
  static Question? _defaultInstance;

  Question_Contents whichContents() => _Question_ContentsByTag[$_whichOneof(0)]!;
  void clearContents() => clearField($_whichOneof(0));

  /// 質問ID
  @$pb.TagNumber(1)
  $core.String get questionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set questionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuestionId() => clearField(1);

  /// AIエージェントコード
  @$pb.TagNumber(2)
  $148.AiAgentCode get aiAgentCode => $_getN(1);
  @$pb.TagNumber(2)
  set aiAgentCode($148.AiAgentCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAiAgentCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAiAgentCode() => clearField(2);

  /// 質問内容の型
  @$pb.TagNumber(3)
  $170.QuestionContentType get questionContentType => $_getN(2);
  @$pb.TagNumber(3)
  set questionContentType($170.QuestionContentType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuestionContentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuestionContentType() => clearField(3);

  /// 編集中の質問
  @$pb.TagNumber(4)
  EditingQuestion get editingQuestion => $_getN(3);
  @$pb.TagNumber(4)
  set editingQuestion(EditingQuestion v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasEditingQuestion() => $_has(3);
  @$pb.TagNumber(4)
  void clearEditingQuestion() => clearField(4);
  @$pb.TagNumber(4)
  EditingQuestion ensureEditingQuestion() => $_ensure(3);

  /// 投稿された質問
  @$pb.TagNumber(5)
  PostedQuestion get postedQuestion => $_getN(4);
  @$pb.TagNumber(5)
  set postedQuestion(PostedQuestion v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPostedQuestion() => $_has(4);
  @$pb.TagNumber(5)
  void clearPostedQuestion() => clearField(5);
  @$pb.TagNumber(5)
  PostedQuestion ensurePostedQuestion() => $_ensure(4);
}

/// 編集中の質問
class EditingQuestion extends $pb.GeneratedMessage {
  factory EditingQuestion({
    $core.String? editingQuestion,
    $core.String? proposedQuestion,
    $core.bool? isRejected,
  }) {
    final $result = create();
    if (editingQuestion != null) {
      $result.editingQuestion = editingQuestion;
    }
    if (proposedQuestion != null) {
      $result.proposedQuestion = proposedQuestion;
    }
    if (isRejected != null) {
      $result.isRejected = isRejected;
    }
    return $result;
  }
  EditingQuestion._() : super();
  factory EditingQuestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditingQuestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditingQuestion', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'editingQuestion')
    ..aOS(2, _omitFieldNames ? '' : 'proposedQuestion')
    ..aOB(3, _omitFieldNames ? '' : 'isRejected')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditingQuestion clone() => EditingQuestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditingQuestion copyWith(void Function(EditingQuestion) updates) => super.copyWith((message) => updates(message as EditingQuestion)) as EditingQuestion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditingQuestion create() => EditingQuestion._();
  EditingQuestion createEmptyInstance() => create();
  static $pb.PbList<EditingQuestion> createRepeated() => $pb.PbList<EditingQuestion>();
  @$core.pragma('dart2js:noInline')
  static EditingQuestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditingQuestion>(create);
  static EditingQuestion? _defaultInstance;

  /// 編集中の質問内容
  @$pb.TagNumber(1)
  $core.String get editingQuestion => $_getSZ(0);
  @$pb.TagNumber(1)
  set editingQuestion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEditingQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearEditingQuestion() => clearField(1);

  /// 提案された質問
  @$pb.TagNumber(2)
  $core.String get proposedQuestion => $_getSZ(1);
  @$pb.TagNumber(2)
  set proposedQuestion($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProposedQuestion() => $_has(1);
  @$pb.TagNumber(2)
  void clearProposedQuestion() => clearField(2);

  /// 規約違反により拒否されたかどうか
  @$pb.TagNumber(3)
  $core.bool get isRejected => $_getBF(2);
  @$pb.TagNumber(3)
  set isRejected($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsRejected() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsRejected() => clearField(3);
}

/// 投稿された質問
class PostedQuestion extends $pb.GeneratedMessage {
  factory PostedQuestion({
    $core.String? moderatedQuestion,
    $core.String? answer,
    $147.ThumbnailUser? thumbnailUser,
    $109.Timestamp? createdAt,
    $109.Timestamp? answeredAt,
  }) {
    final $result = create();
    if (moderatedQuestion != null) {
      $result.moderatedQuestion = moderatedQuestion;
    }
    if (answer != null) {
      $result.answer = answer;
    }
    if (thumbnailUser != null) {
      $result.thumbnailUser = thumbnailUser;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (answeredAt != null) {
      $result.answeredAt = answeredAt;
    }
    return $result;
  }
  PostedQuestion._() : super();
  factory PostedQuestion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostedQuestion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostedQuestion', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'moderatedQuestion')
    ..aOS(2, _omitFieldNames ? '' : 'answer')
    ..aOM<$147.ThumbnailUser>(3, _omitFieldNames ? '' : 'thumbnailUser', subBuilder: $147.ThumbnailUser.create)
    ..aOM<$109.Timestamp>(4, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'answeredAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostedQuestion clone() => PostedQuestion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostedQuestion copyWith(void Function(PostedQuestion) updates) => super.copyWith((message) => updates(message as PostedQuestion)) as PostedQuestion;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostedQuestion create() => PostedQuestion._();
  PostedQuestion createEmptyInstance() => create();
  static $pb.PbList<PostedQuestion> createRepeated() => $pb.PbList<PostedQuestion>();
  @$core.pragma('dart2js:noInline')
  static PostedQuestion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostedQuestion>(create);
  static PostedQuestion? _defaultInstance;

  /// モデレーションされた質問
  @$pb.TagNumber(1)
  $core.String get moderatedQuestion => $_getSZ(0);
  @$pb.TagNumber(1)
  set moderatedQuestion($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasModeratedQuestion() => $_has(0);
  @$pb.TagNumber(1)
  void clearModeratedQuestion() => clearField(1);

  /// 回答
  @$pb.TagNumber(2)
  $core.String get answer => $_getSZ(1);
  @$pb.TagNumber(2)
  set answer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnswer() => clearField(2);

  /// 自身の質問に回答してくれたユーザーのサムネイル情報（お相手からの質問の場合はセットされない）
  @$pb.TagNumber(3)
  $147.ThumbnailUser get thumbnailUser => $_getN(2);
  @$pb.TagNumber(3)
  set thumbnailUser($147.ThumbnailUser v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasThumbnailUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearThumbnailUser() => clearField(3);
  @$pb.TagNumber(3)
  $147.ThumbnailUser ensureThumbnailUser() => $_ensure(2);

  /// 作成日時
  @$pb.TagNumber(4)
  $109.Timestamp get createdAt => $_getN(3);
  @$pb.TagNumber(4)
  set createdAt($109.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedAt() => clearField(4);
  @$pb.TagNumber(4)
  $109.Timestamp ensureCreatedAt() => $_ensure(3);

  /// 回答日時
  @$pb.TagNumber(5)
  $109.Timestamp get answeredAt => $_getN(4);
  @$pb.TagNumber(5)
  set answeredAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasAnsweredAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearAnsweredAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureAnsweredAt() => $_ensure(4);
}

/// 編集中の回答 (EDEV-892)
class EditingAnswer extends $pb.GeneratedMessage {
  factory EditingAnswer({
    $core.String? editingAnswer,
    $core.bool? isRejected,
  }) {
    final $result = create();
    if (editingAnswer != null) {
      $result.editingAnswer = editingAnswer;
    }
    if (isRejected != null) {
      $result.isRejected = isRejected;
    }
    return $result;
  }
  EditingAnswer._() : super();
  factory EditingAnswer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EditingAnswer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EditingAnswer', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'editingAnswer')
    ..aOB(2, _omitFieldNames ? '' : 'isRejected')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EditingAnswer clone() => EditingAnswer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EditingAnswer copyWith(void Function(EditingAnswer) updates) => super.copyWith((message) => updates(message as EditingAnswer)) as EditingAnswer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EditingAnswer create() => EditingAnswer._();
  EditingAnswer createEmptyInstance() => create();
  static $pb.PbList<EditingAnswer> createRepeated() => $pb.PbList<EditingAnswer>();
  @$core.pragma('dart2js:noInline')
  static EditingAnswer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EditingAnswer>(create);
  static EditingAnswer? _defaultInstance;

  /// 編集中の回答内容
  @$pb.TagNumber(1)
  $core.String get editingAnswer => $_getSZ(0);
  @$pb.TagNumber(1)
  set editingAnswer($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEditingAnswer() => $_has(0);
  @$pb.TagNumber(1)
  void clearEditingAnswer() => clearField(1);

  /// 規約違反により拒否されたかどうか
  @$pb.TagNumber(2)
  $core.bool get isRejected => $_getBF(1);
  @$pb.TagNumber(2)
  set isRejected($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsRejected() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsRejected() => clearField(2);
}

/// 投稿された回答 (EDEV-892)
/// AI承認済みで ApproveAnswer 待ちの状態
class PostedAnswer extends $pb.GeneratedMessage {
  factory PostedAnswer({
    $core.String? moderatedAnswer,
  }) {
    final $result = create();
    if (moderatedAnswer != null) {
      $result.moderatedAnswer = moderatedAnswer;
    }
    return $result;
  }
  PostedAnswer._() : super();
  factory PostedAnswer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostedAnswer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PostedAnswer', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'moderatedAnswer')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostedAnswer clone() => PostedAnswer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostedAnswer copyWith(void Function(PostedAnswer) updates) => super.copyWith((message) => updates(message as PostedAnswer)) as PostedAnswer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PostedAnswer create() => PostedAnswer._();
  PostedAnswer createEmptyInstance() => create();
  static $pb.PbList<PostedAnswer> createRepeated() => $pb.PbList<PostedAnswer>();
  @$core.pragma('dart2js:noInline')
  static PostedAnswer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostedAnswer>(create);
  static PostedAnswer? _defaultInstance;

  /// モデレーションされた回答
  @$pb.TagNumber(1)
  $core.String get moderatedAnswer => $_getSZ(0);
  @$pb.TagNumber(1)
  set moderatedAnswer($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasModeratedAnswer() => $_has(0);
  @$pb.TagNumber(1)
  void clearModeratedAnswer() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
