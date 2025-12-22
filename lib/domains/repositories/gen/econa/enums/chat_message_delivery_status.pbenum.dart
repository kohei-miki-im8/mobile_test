//
//  Generated code. Do not modify.
//  source: econa/enums/chat_message_delivery_status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// チャットメッセージの配信状態
class ChatMessageDeliveryStatus extends $pb.ProtobufEnum {
  static const ChatMessageDeliveryStatus CHAT_MESSAGE_DELIVERY_STATUS_UNSPECIFIED = ChatMessageDeliveryStatus._(0, _omitEnumNames ? '' : 'CHAT_MESSAGE_DELIVERY_STATUS_UNSPECIFIED');
  static const ChatMessageDeliveryStatus CHAT_MESSAGE_DELIVERY_STATUS_DELIVERED = ChatMessageDeliveryStatus._(1, _omitEnumNames ? '' : 'CHAT_MESSAGE_DELIVERY_STATUS_DELIVERED');
  static const ChatMessageDeliveryStatus CHAT_MESSAGE_DELIVERY_STATUS_BLOCKED = ChatMessageDeliveryStatus._(2, _omitEnumNames ? '' : 'CHAT_MESSAGE_DELIVERY_STATUS_BLOCKED');
  static const ChatMessageDeliveryStatus CHAT_MESSAGE_DELIVERY_STATUS_PENDING_FIRST_CHAT_MESSAGE_REVIEW = ChatMessageDeliveryStatus._(3, _omitEnumNames ? '' : 'CHAT_MESSAGE_DELIVERY_STATUS_PENDING_FIRST_CHAT_MESSAGE_REVIEW');
  static const ChatMessageDeliveryStatus CHAT_MESSAGE_DELIVERY_STATUS_FIRST_CHAT_MESSAGE_REJECTED = ChatMessageDeliveryStatus._(4, _omitEnumNames ? '' : 'CHAT_MESSAGE_DELIVERY_STATUS_FIRST_CHAT_MESSAGE_REJECTED');

  static const $core.List<ChatMessageDeliveryStatus> values = <ChatMessageDeliveryStatus> [
    CHAT_MESSAGE_DELIVERY_STATUS_UNSPECIFIED,
    CHAT_MESSAGE_DELIVERY_STATUS_DELIVERED,
    CHAT_MESSAGE_DELIVERY_STATUS_BLOCKED,
    CHAT_MESSAGE_DELIVERY_STATUS_PENDING_FIRST_CHAT_MESSAGE_REVIEW,
    CHAT_MESSAGE_DELIVERY_STATUS_FIRST_CHAT_MESSAGE_REJECTED,
  ];

  static final $core.Map<$core.int, ChatMessageDeliveryStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatMessageDeliveryStatus? valueOf($core.int value) => _byValue[value];

  const ChatMessageDeliveryStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
