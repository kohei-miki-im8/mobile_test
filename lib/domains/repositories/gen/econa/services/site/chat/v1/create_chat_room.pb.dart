//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/create_chat_room.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../../enums/ai_agent_code.pbenum.dart' as $148;

/// チャットルーム作成リクエスト
class CreateChatRoomRequest extends $pb.GeneratedMessage {
  factory CreateChatRoomRequest({
    $core.String? toUserId,
    $148.AiAgentCode? aiAgentCode,
    $core.String? anonymizeDummyNickname,
    $core.String? dummyPhotoId,
  }) {
    final $result = create();
    if (toUserId != null) {
      $result.toUserId = toUserId;
    }
    if (aiAgentCode != null) {
      $result.aiAgentCode = aiAgentCode;
    }
    if (anonymizeDummyNickname != null) {
      $result.anonymizeDummyNickname = anonymizeDummyNickname;
    }
    if (dummyPhotoId != null) {
      $result.dummyPhotoId = dummyPhotoId;
    }
    return $result;
  }
  CreateChatRoomRequest._() : super();
  factory CreateChatRoomRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatRoomRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatRoomRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'toUserId')
    ..e<$148.AiAgentCode>(2, _omitFieldNames ? '' : 'aiAgentCode', $pb.PbFieldType.OE, defaultOrMaker: $148.AiAgentCode.AI_AGENT_CODE_UNSPECIFIED, valueOf: $148.AiAgentCode.valueOf, enumValues: $148.AiAgentCode.values)
    ..aOS(3, _omitFieldNames ? '' : 'anonymizeDummyNickname')
    ..aOS(4, _omitFieldNames ? '' : 'dummyPhotoId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatRoomRequest clone() => CreateChatRoomRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatRoomRequest copyWith(void Function(CreateChatRoomRequest) updates) => super.copyWith((message) => updates(message as CreateChatRoomRequest)) as CreateChatRoomRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatRoomRequest create() => CreateChatRoomRequest._();
  CreateChatRoomRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChatRoomRequest> createRepeated() => $pb.PbList<CreateChatRoomRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChatRoomRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatRoomRequest>(create);
  static CreateChatRoomRequest? _defaultInstance;

  /// お相手のユーザーID（カウンセラーの場合は自身のユーザーIDを指定）
  @$pb.TagNumber(1)
  $core.String get toUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set toUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUserId() => clearField(1);

  /// AIエージェントコード
  @$pb.TagNumber(2)
  $148.AiAgentCode get aiAgentCode => $_getN(1);
  @$pb.TagNumber(2)
  set aiAgentCode($148.AiAgentCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAiAgentCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearAiAgentCode() => clearField(2);

  /// 匿名化用ダミーニックネーム
  @$pb.TagNumber(3)
  $core.String get anonymizeDummyNickname => $_getSZ(2);
  @$pb.TagNumber(3)
  set anonymizeDummyNickname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAnonymizeDummyNickname() => $_has(2);
  @$pb.TagNumber(3)
  void clearAnonymizeDummyNickname() => clearField(3);

  /// ダミーPhotoID
  @$pb.TagNumber(4)
  $core.String get dummyPhotoId => $_getSZ(3);
  @$pb.TagNumber(4)
  set dummyPhotoId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDummyPhotoId() => $_has(3);
  @$pb.TagNumber(4)
  void clearDummyPhotoId() => clearField(4);
}

/// チャットルーム作成レスポンス
class CreateChatRoomResponse extends $pb.GeneratedMessage {
  factory CreateChatRoomResponse({
    $core.String? chatRoomId,
    $core.bool? isForceReadPurchased,
  }) {
    final $result = create();
    if (chatRoomId != null) {
      $result.chatRoomId = chatRoomId;
    }
    if (isForceReadPurchased != null) {
      $result.isForceReadPurchased = isForceReadPurchased;
    }
    return $result;
  }
  CreateChatRoomResponse._() : super();
  factory CreateChatRoomResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatRoomResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatRoomResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.services.site.chat.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chatRoomId')
    ..aOB(2, _omitFieldNames ? '' : 'isForceReadPurchased')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatRoomResponse clone() => CreateChatRoomResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatRoomResponse copyWith(void Function(CreateChatRoomResponse) updates) => super.copyWith((message) => updates(message as CreateChatRoomResponse)) as CreateChatRoomResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatRoomResponse create() => CreateChatRoomResponse._();
  CreateChatRoomResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChatRoomResponse> createRepeated() => $pb.PbList<CreateChatRoomResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChatRoomResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatRoomResponse>(create);
  static CreateChatRoomResponse? _defaultInstance;

  /// チャットルームID
  @$pb.TagNumber(1)
  $core.String get chatRoomId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatRoomId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRoomId() => clearField(1);

  /// 既読開放購入済みフラグ
  @$pb.TagNumber(2)
  $core.bool get isForceReadPurchased => $_getBF(1);
  @$pb.TagNumber(2)
  set isForceReadPurchased($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsForceReadPurchased() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsForceReadPurchased() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
