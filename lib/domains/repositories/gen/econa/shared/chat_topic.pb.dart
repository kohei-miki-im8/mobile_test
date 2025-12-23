//
//  Generated code. Do not modify.
//  source: econa/shared/chat_topic.proto
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

/// 話題群
class ChatTopics extends $pb.GeneratedMessage {
  factory ChatTopics({
    $core.Iterable<ChatTopic>? chatTopics,
    $148.AiAgentCode? processedAiAgentCode,
  }) {
    final $result = create();
    if (chatTopics != null) {
      $result.chatTopics.addAll(chatTopics);
    }
    if (processedAiAgentCode != null) {
      $result.processedAiAgentCode = processedAiAgentCode;
    }
    return $result;
  }
  ChatTopics._() : super();
  factory ChatTopics.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatTopics.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatTopics', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..pc<ChatTopic>(1, _omitFieldNames ? '' : 'chatTopics', $pb.PbFieldType.PM, subBuilder: ChatTopic.create)
    ..e<$148.AiAgentCode>(2, _omitFieldNames ? '' : 'processedAiAgentCode', $pb.PbFieldType.OE, defaultOrMaker: $148.AiAgentCode.AI_AGENT_CODE_UNSPECIFIED, valueOf: $148.AiAgentCode.valueOf, enumValues: $148.AiAgentCode.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatTopics clone() => ChatTopics()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatTopics copyWith(void Function(ChatTopics) updates) => super.copyWith((message) => updates(message as ChatTopics)) as ChatTopics;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatTopics create() => ChatTopics._();
  ChatTopics createEmptyInstance() => create();
  static $pb.PbList<ChatTopics> createRepeated() => $pb.PbList<ChatTopics>();
  @$core.pragma('dart2js:noInline')
  static ChatTopics getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatTopics>(create);
  static ChatTopics? _defaultInstance;

  /// 話題群
  @$pb.TagNumber(1)
  $core.List<ChatTopic> get chatTopics => $_getList(0);

  /// 生成処理を行ったAIエージェントコード
  @$pb.TagNumber(2)
  $148.AiAgentCode get processedAiAgentCode => $_getN(1);
  @$pb.TagNumber(2)
  set processedAiAgentCode($148.AiAgentCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProcessedAiAgentCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearProcessedAiAgentCode() => clearField(2);
}

enum ChatTopic_ChatTopicContent {
  photoId, 
  tagId, 
  notSet
}

/// 話題
class ChatTopic extends $pb.GeneratedMessage {
  factory ChatTopic({
    $core.String? chatTopicId,
    $core.String? photoId,
    $core.String? tagId,
    $core.String? message,
    $109.Timestamp? createdAt,
  }) {
    final $result = create();
    if (chatTopicId != null) {
      $result.chatTopicId = chatTopicId;
    }
    if (photoId != null) {
      $result.photoId = photoId;
    }
    if (tagId != null) {
      $result.tagId = tagId;
    }
    if (message != null) {
      $result.message = message;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  ChatTopic._() : super();
  factory ChatTopic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatTopic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ChatTopic_ChatTopicContent> _ChatTopic_ChatTopicContentByTag = {
    2 : ChatTopic_ChatTopicContent.photoId,
    3 : ChatTopic_ChatTopicContent.tagId,
    0 : ChatTopic_ChatTopicContent.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatTopic', package: const $pb.PackageName(_omitMessageNames ? '' : 'econa.shared'), createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'chatTopicId')
    ..aOS(2, _omitFieldNames ? '' : 'photoId')
    ..aOS(3, _omitFieldNames ? '' : 'tagId')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..aOM<$109.Timestamp>(5, _omitFieldNames ? '' : 'createdAt', subBuilder: $109.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatTopic clone() => ChatTopic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatTopic copyWith(void Function(ChatTopic) updates) => super.copyWith((message) => updates(message as ChatTopic)) as ChatTopic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatTopic create() => ChatTopic._();
  ChatTopic createEmptyInstance() => create();
  static $pb.PbList<ChatTopic> createRepeated() => $pb.PbList<ChatTopic>();
  @$core.pragma('dart2js:noInline')
  static ChatTopic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatTopic>(create);
  static ChatTopic? _defaultInstance;

  ChatTopic_ChatTopicContent whichChatTopicContent() => _ChatTopic_ChatTopicContentByTag[$_whichOneof(0)]!;
  void clearChatTopicContent() => clearField($_whichOneof(0));

  /// 話題ID
  @$pb.TagNumber(1)
  $core.String get chatTopicId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chatTopicId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatTopicId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatTopicId() => clearField(1);

  /// 写真ID
  @$pb.TagNumber(2)
  $core.String get photoId => $_getSZ(1);
  @$pb.TagNumber(2)
  set photoId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhotoId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhotoId() => clearField(2);

  /// タグID
  @$pb.TagNumber(3)
  $core.String get tagId => $_getSZ(2);
  @$pb.TagNumber(3)
  set tagId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTagId() => $_has(2);
  @$pb.TagNumber(3)
  void clearTagId() => clearField(3);

  /// メッセージ
  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  /// 作成日時
  @$pb.TagNumber(5)
  $109.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($109.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $109.Timestamp ensureCreatedAt() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
