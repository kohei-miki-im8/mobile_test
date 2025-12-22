//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/approve_answer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// 回答承認リクエスト (EDEV-892)
class ApproveAnswerRequest extends $pb.GeneratedMessage {
  factory ApproveAnswerRequest({
    $core.String? userQuestionId,
    $core.String? approvedAnswer,
  }) {
    final $result = create();
    if (userQuestionId != null) {
      $result.userQuestionId = userQuestionId;
    }
    if (approvedAnswer != null) {
      $result.approvedAnswer = approvedAnswer;
    }
    return $result;
  }
  ApproveAnswerRequest._() : super();
  factory ApproveAnswerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveAnswerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveAnswerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userQuestionId')
    ..aOS(2, _omitFieldNames ? '' : 'approvedAnswer')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveAnswerRequest clone() => ApproveAnswerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveAnswerRequest copyWith(void Function(ApproveAnswerRequest) updates) => super.copyWith((message) => updates(message as ApproveAnswerRequest)) as ApproveAnswerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveAnswerRequest create() => ApproveAnswerRequest._();
  ApproveAnswerRequest createEmptyInstance() => create();
  static $pb.PbList<ApproveAnswerRequest> createRepeated() => $pb.PbList<ApproveAnswerRequest>();
  @$core.pragma('dart2js:noInline')
  static ApproveAnswerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveAnswerRequest>(create);
  static ApproveAnswerRequest? _defaultInstance;

  /// 質問ID
  @$pb.TagNumber(1)
  $core.String get userQuestionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userQuestionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserQuestionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserQuestionId() => clearField(1);

  /// 承認対象の回答テキスト（サーバー側で最新のAI承認済みモデレーション記録と完全一致検証）
  @$pb.TagNumber(2)
  $core.String get approvedAnswer => $_getSZ(1);
  @$pb.TagNumber(2)
  set approvedAnswer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApprovedAnswer() => $_has(1);
  @$pb.TagNumber(2)
  void clearApprovedAnswer() => clearField(2);
}

/// 回答承認レスポンス (EDEV-892)
class ApproveAnswerResponse extends $pb.GeneratedMessage {
  factory ApproveAnswerResponse({
    $core.bool? isSuccessful,
  }) {
    final $result = create();
    if (isSuccessful != null) {
      $result.isSuccessful = isSuccessful;
    }
    return $result;
  }
  ApproveAnswerResponse._() : super();
  factory ApproveAnswerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ApproveAnswerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ApproveAnswerResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isSuccessful')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ApproveAnswerResponse clone() => ApproveAnswerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ApproveAnswerResponse copyWith(void Function(ApproveAnswerResponse) updates) => super.copyWith((message) => updates(message as ApproveAnswerResponse)) as ApproveAnswerResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApproveAnswerResponse create() => ApproveAnswerResponse._();
  ApproveAnswerResponse createEmptyInstance() => create();
  static $pb.PbList<ApproveAnswerResponse> createRepeated() => $pb.PbList<ApproveAnswerResponse>();
  @$core.pragma('dart2js:noInline')
  static ApproveAnswerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApproveAnswerResponse>(create);
  static ApproveAnswerResponse? _defaultInstance;

  /// 成功フラグ
  @$pb.TagNumber(1)
  $core.bool get isSuccessful => $_getBF(0);
  @$pb.TagNumber(1)
  set isSuccessful($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsSuccessful() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSuccessful() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
