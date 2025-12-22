//
//  Generated code. Do not modify.
//  source: econa/enums/message_content_type.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// メッセージ内容の型
class MessageContentType extends $pb.ProtobufEnum {
  static const MessageContentType MESSAGE_CONTENT_TYPE_UNSPECIFIED = MessageContentType._(0, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_UNSPECIFIED');
  static const MessageContentType MESSAGE_CONTENT_TYPE_SYSTEM = MessageContentType._(1, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_SYSTEM');
  static const MessageContentType MESSAGE_CONTENT_TYPE_TEXT = MessageContentType._(2, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_TEXT');
  static const MessageContentType MESSAGE_CONTENT_TYPE_AI_AGENT = MessageContentType._(3, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_AI_AGENT');
  static const MessageContentType MESSAGE_CONTENT_TYPE_PHOTO = MessageContentType._(4, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_PHOTO');
  static const MessageContentType MESSAGE_CONTENT_TYPE_DATE_INTENTION = MessageContentType._(5, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_DATE_INTENTION');
  static const MessageContentType MESSAGE_CONTENT_TYPE_READ = MessageContentType._(6, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_READ');
  static const MessageContentType MESSAGE_CONTENT_TYPE_IS_TO_USER_TYPING = MessageContentType._(7, _omitEnumNames ? '' : 'MESSAGE_CONTENT_TYPE_IS_TO_USER_TYPING');

  static const $core.List<MessageContentType> values = <MessageContentType> [
    MESSAGE_CONTENT_TYPE_UNSPECIFIED,
    MESSAGE_CONTENT_TYPE_SYSTEM,
    MESSAGE_CONTENT_TYPE_TEXT,
    MESSAGE_CONTENT_TYPE_AI_AGENT,
    MESSAGE_CONTENT_TYPE_PHOTO,
    MESSAGE_CONTENT_TYPE_DATE_INTENTION,
    MESSAGE_CONTENT_TYPE_READ,
    MESSAGE_CONTENT_TYPE_IS_TO_USER_TYPING,
  ];

  static final $core.Map<$core.int, MessageContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageContentType? valueOf($core.int value) => _byValue[value];

  const MessageContentType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
