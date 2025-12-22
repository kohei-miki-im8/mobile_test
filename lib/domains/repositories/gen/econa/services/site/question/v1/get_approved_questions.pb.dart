//
//  Generated code. Do not modify.
//  source: econa/services/site/question/v1/get_approved_questions.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/moderation_status.pbenum.dart' as $172;
import '../../../../shared/pager_cursor.pb.dart' as $146;
import '../../../../shared/question.pb.dart' as $171;

/// 認証済み質問群リクエスト
class GetApprovedQuestionsRequest extends $pb.GeneratedMessage {
  factory GetApprovedQuestionsRequest({
    $core.bool? isFromMe,
    $core.String? toUserId,
    $172.ModerationStatusCode? moderationStatusCode,
    $146.PagerRequestCursor? cursor,
  }) {
    final $result = create();
    if (isFromMe != null) {
      $result.isFromMe = isFromMe;
    }
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (moderationStatusCode != null) {
      $result.moderationStatusCode = moderationStatusCode;
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetApprovedQuestionsRequest._() : super();
  factory GetApprovedQuestionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovedQuestionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetApprovedQuestionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isFromMe')
    ..aOS(2, _omitFieldNames ? '' : 'toUserId')
    ..e<$172.ModerationStatusCode>(3, _omitFieldNames ? '' : 'moderationStatusCode', $pb.PbFieldType.OE, defaultOrMaker: $172.ModerationStatusCode.MODERATION_STATUS_CODE_UNSPECIFIED, valueOf: $172.ModerationStatusCode.valueOf, enumValues: $172.ModerationStatusCode.values)
    ..aOM<$146.PagerRequestCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerRequestCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApprovedQuestionsRequest clone() => GetApprovedQuestionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApprovedQuestionsRequest copyWith(void Function(GetApprovedQuestionsRequest) updates) => super.copyWith((message) => updates(message as GetApprovedQuestionsRequest)) as GetApprovedQuestionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetApprovedQuestionsRequest create() => GetApprovedQuestionsRequest._();
  GetApprovedQuestionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetApprovedQuestionsRequest> createRepeated() => $pb.PbList<GetApprovedQuestionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetApprovedQuestionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApprovedQuestionsRequest>(create);
  static GetApprovedQuestionsRequest? _defaultInstance;

  /// 自分が送った質問かどうか（必須）
  @$pb.TagNumber(1)
  $core.bool get isFromMe => $_getBF(0);
  @$pb.TagNumber(1)
  set isFromMe($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsFromMe() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsFromMe() => clearField(1);

  /// お相手のユーザーID（is_from_me=false時のみ指定可能、Target Receivedモード用）
  @$pb.TagNumber(2)
  $core.String get toUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set toUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUserId() => clearField(2);

  /// モデレーションステータスコード（only MODERATION_STATUS_CODE_APPROVED）
  @$pb.TagNumber(3)
  $172.ModerationStatusCode get moderationStatusCode => $_getN(2);
  @$pb.TagNumber(3)
  set moderationStatusCode($172.ModerationStatusCode v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasModerationStatusCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearModerationStatusCode() => clearField(3);

  /// ページネーションリクエストカーソル
  @$pb.TagNumber(15)
  $146.PagerRequestCursor get cursor => $_getN(3);
  @$pb.TagNumber(15)
  set cursor($146.PagerRequestCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(3);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerRequestCursor ensureCursor() => $_ensure(3);
}

/// 認証済み質問群レスポンス
class GetApprovedQuestionsResponse extends $pb.GeneratedMessage {
  factory GetApprovedQuestionsResponse({
    $core.Iterable<$171.Question>? questions,
    $146.PagerResponseCursor? cursor,
  }) {
    final $result = create();
    if (questions != null) {
      $result.questions.addAll(questions);
    }
    if (cursor != null) {
      $result.cursor = cursor;
    }
    return $result;
  }
  GetApprovedQuestionsResponse._() : super();
  factory GetApprovedQuestionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetApprovedQuestionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetApprovedQuestionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.question.v1'), createEmptyInstance: create)
    ..pc<$171.Question>(1, _omitFieldNames ? '' : 'questions', $pb.PbFieldType.PM, subBuilder: $171.Question.create)
    ..aOM<$146.PagerResponseCursor>(15, _omitFieldNames ? '' : 'cursor', subBuilder: $146.PagerResponseCursor.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetApprovedQuestionsResponse clone() => GetApprovedQuestionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetApprovedQuestionsResponse copyWith(void Function(GetApprovedQuestionsResponse) updates) => super.copyWith((message) => updates(message as GetApprovedQuestionsResponse)) as GetApprovedQuestionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetApprovedQuestionsResponse create() => GetApprovedQuestionsResponse._();
  GetApprovedQuestionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetApprovedQuestionsResponse> createRepeated() => $pb.PbList<GetApprovedQuestionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetApprovedQuestionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetApprovedQuestionsResponse>(create);
  static GetApprovedQuestionsResponse? _defaultInstance;

  /// 質問群
  @$pb.TagNumber(1)
  $core.List<$171.Question> get questions => $_getList(0);

  /// ページネーションレスポンスカーソル
  @$pb.TagNumber(15)
  $146.PagerResponseCursor get cursor => $_getN(1);
  @$pb.TagNumber(15)
  set cursor($146.PagerResponseCursor v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasCursor() => $_has(1);
  @$pb.TagNumber(15)
  void clearCursor() => clearField(15);
  @$pb.TagNumber(15)
  $146.PagerResponseCursor ensureCursor() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
