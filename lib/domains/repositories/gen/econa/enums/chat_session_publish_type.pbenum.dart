//
//  Generated code. Do not modify.
//  source: econa/enums/chat_session_publish_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// チャットセッションメッセージ発行タイプ
class ChatSessionPublishType extends $pb.ProtobufEnum {
  static const ChatSessionPublishType CHAT_SESSION_PUBLISH_TYPE_UNSPECIFIED = ChatSessionPublishType._(0, _omitEnumNames ? '' : 'CHAT_SESSION_PUBLISH_TYPE_UNSPECIFIED');
  static const ChatSessionPublishType CHAT_SESSION_PUBLISH_TYPE_CHAT_MESSAGE = ChatSessionPublishType._(1, _omitEnumNames ? '' : 'CHAT_SESSION_PUBLISH_TYPE_CHAT_MESSAGE');
  static const ChatSessionPublishType CHAT_SESSION_PUBLISH_TYPE_EDITING_CHAT_MESSAGE = ChatSessionPublishType._(2, _omitEnumNames ? '' : 'CHAT_SESSION_PUBLISH_TYPE_EDITING_CHAT_MESSAGE');
  static const ChatSessionPublishType CHAT_SESSION_PUBLISH_TYPE_EDITABLE_CHAT_TOPICS = ChatSessionPublishType._(3, _omitEnumNames ? '' : 'CHAT_SESSION_PUBLISH_TYPE_EDITABLE_CHAT_TOPICS');
  static const ChatSessionPublishType CHAT_SESSION_PUBLISH_TYPE_READ_CHAT_MESSAGE_ID = ChatSessionPublishType._(4, _omitEnumNames ? '' : 'CHAT_SESSION_PUBLISH_TYPE_READ_CHAT_MESSAGE_ID');
  static const ChatSessionPublishType CHAT_SESSION_PUBLISH_TYPE_IS_TO_USER_TYPING = ChatSessionPublishType._(5, _omitEnumNames ? '' : 'CHAT_SESSION_PUBLISH_TYPE_IS_TO_USER_TYPING');
  static const ChatSessionPublishType CHAT_SESSION_PUBLISH_TYPE_DISCONNECT = ChatSessionPublishType._(15, _omitEnumNames ? '' : 'CHAT_SESSION_PUBLISH_TYPE_DISCONNECT');

  static const $core.List<ChatSessionPublishType> values = <ChatSessionPublishType> [
    CHAT_SESSION_PUBLISH_TYPE_UNSPECIFIED,
    CHAT_SESSION_PUBLISH_TYPE_CHAT_MESSAGE,
    CHAT_SESSION_PUBLISH_TYPE_EDITING_CHAT_MESSAGE,
    CHAT_SESSION_PUBLISH_TYPE_EDITABLE_CHAT_TOPICS,
    CHAT_SESSION_PUBLISH_TYPE_READ_CHAT_MESSAGE_ID,
    CHAT_SESSION_PUBLISH_TYPE_IS_TO_USER_TYPING,
    CHAT_SESSION_PUBLISH_TYPE_DISCONNECT,
  ];

  static final $core.Map<$core.int, ChatSessionPublishType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatSessionPublishType? valueOf($core.int value) => _byValue[value];

  const ChatSessionPublishType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
