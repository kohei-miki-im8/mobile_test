import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/message_content_type.pb.dart';
import 'package:flutter/foundation.dart';

@immutable
class ChatSessionParams {
  const ChatSessionParams({
    required this.chatRoomId,
    required this.mode,
    this.toUserId,
    this.defaultContentType = MessageContentType.MESSAGE_CONTENT_TYPE_TEXT,
    this.aiAgentCode = AiAgentCode.AI_AGENT_CODE_UNSPECIFIED,
    this.capabilities = const <ChatCapability>{ChatCapability.text},
    this.anonymizeDummyNickname,
    this.dummyPhotoId,
  });

  final String chatRoomId;
  final ChatMode mode;
  final String? toUserId;
  final MessageContentType defaultContentType;
  final AiAgentCode aiAgentCode;
  final Set<ChatCapability> capabilities;
  final String? anonymizeDummyNickname;
  final String? dummyPhotoId;
}

enum ChatMode {
  chat,
  counseling,
  simulation,
  question,
}

enum ChatCapability {
  text,
  photo,
  topic,
  personaGreeting,
  personaReply,
}


