//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_chat_room.pb.dart" as econaservicessitechatv1create_chat_room;
import "service.connect.spec.dart" as specs;
import "create_chat_topics.pb.dart" as econaservicessitechatv1create_chat_topics;
import "create_persona_greeting.pb.dart" as econaservicessitechatv1create_persona_greeting;
import "create_persona_reply.pb.dart" as econaservicessitechatv1create_persona_reply;
import "get_chat_topics.pb.dart" as econaservicessitechatv1get_chat_topics;
import "get_chat_rooms.pb.dart" as econaservicessitechatv1get_chat_rooms;
import "get_date_intention.pb.dart" as econaservicessitechatv1get_date_intention;
import "get_messages.pb.dart" as econaservicessitechatv1get_messages;
import "get_scheduled_chat_rooms.pb.dart" as econaservicessitechatv1get_scheduled_chat_rooms;
import "get_simulator_chat_rooms.pb.dart" as econaservicessitechatv1get_simulator_chat_rooms;
import "leave_simulator_chat_room.pb.dart" as econaservicessitechatv1leave_simulator_chat_room;
import "leave_counseling_chat_room.pb.dart" as econaservicessitechatv1leave_counseling_chat_room;
import "get_counseling_chat_room.pb.dart" as econaservicessitechatv1get_counseling_chat_room;
import "update_date_intention.pb.dart" as econaservicessitechatv1update_date_intention;
import "update_pinned_chat_message.pb.dart" as econaservicessitechatv1update_pinned_chat_message;
import "update_push_notice_status.pb.dart" as econaservicessitechatv1update_push_notice_status;
import "update_visible_status.pb.dart" as econaservicessitechatv1update_visible_status;
import "delete_chat_topic.pb.dart" as econaservicessitechatv1delete_chat_topic;
import "publish_chat_message.pb.dart" as econaservicessitechatv1publish_chat_message;
import "publish_disconnect_chat_session.pb.dart" as econaservicessitechatv1publish_disconnect_chat_session;
import "subscribe_chat_session.pb.dart" as econaservicessitechatv1subscribe_chat_session;
import "purchase_force_read_status.pb.dart" as econaservicessitechatv1purchase_force_read_status;

/// リアルタイムチャット機能を提供するサービスです。
extension type ChatServiceClient (connect.Transport _transport) {
  /// CreateChatRoom:チャットルーム作成
  Future<econaservicessitechatv1create_chat_room.CreateChatRoomResponse> createChatRoom(
    econaservicessitechatv1create_chat_room.CreateChatRoomRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.createChatRoom,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreateChatTopics:チャット話題作成
  Future<econaservicessitechatv1create_chat_topics.CreateChatTopicsResponse> createChatTopics(
    econaservicessitechatv1create_chat_topics.CreateChatTopicsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.createChatTopics,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreatePersonaGreeting:なりきり挨拶作成
  Future<econaservicessitechatv1create_persona_greeting.CreatePersonaGreetingResponse> createPersonaGreeting(
    econaservicessitechatv1create_persona_greeting.CreatePersonaGreetingRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.createPersonaGreeting,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// CreatePersonaReply:なりきり返信作成
  Future<econaservicessitechatv1create_persona_reply.CreatePersonaReplyResponse> createPersonaReply(
    econaservicessitechatv1create_persona_reply.CreatePersonaReplyRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.createPersonaReply,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetChatTopics:チャット話題取得
  Future<econaservicessitechatv1get_chat_topics.GetChatTopicsResponse> getChatTopics(
    econaservicessitechatv1get_chat_topics.GetChatTopicsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.getChatTopics,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetChatRooms:チャットルーム取得
  Future<econaservicessitechatv1get_chat_rooms.GetChatRoomsResponse> getChatRooms(
    econaservicessitechatv1get_chat_rooms.GetChatRoomsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.getChatRooms,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetDateIntention:デート意向取得
  Future<econaservicessitechatv1get_date_intention.GetDateIntentionResponse> getDateIntention(
    econaservicessitechatv1get_date_intention.GetDateIntentionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.getDateIntention,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetMessages:メッセージ取得
  Future<econaservicessitechatv1get_messages.GetMessagesResponse> getMessages(
    econaservicessitechatv1get_messages.GetMessagesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.getMessages,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetScheduledChatRooms:予約チャットルーム取得
  Future<econaservicessitechatv1get_scheduled_chat_rooms.GetScheduledChatRoomsResponse> getScheduledChatRooms(
    econaservicessitechatv1get_scheduled_chat_rooms.GetScheduledChatRoomsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.getScheduledChatRooms,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetSimulatorChatRooms:シミュレーターチャットルーム一覧取得
  Future<econaservicessitechatv1get_simulator_chat_rooms.GetSimulatorChatRoomsResponse> getSimulatorChatRooms(
    econaservicessitechatv1get_simulator_chat_rooms.GetSimulatorChatRoomsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.getSimulatorChatRooms,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// LeaveSimulatorChatRoom:シミュレーターチャットルーム退出
  Future<econaservicessitechatv1leave_simulator_chat_room.LeaveSimulatorChatRoomResponse> leaveSimulatorChatRoom(
    econaservicessitechatv1leave_simulator_chat_room.LeaveSimulatorChatRoomRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.leaveSimulatorChatRoom,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// LeaveCounselingChatRoom:カウンセリングチャットルーム退出
  Future<econaservicessitechatv1leave_counseling_chat_room.LeaveCounselingChatRoomResponse> leaveCounselingChatRoom(
    econaservicessitechatv1leave_counseling_chat_room.LeaveCounselingChatRoomRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.leaveCounselingChatRoom,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// GetCounselingChatRoom:カウンセリングチャットルーム取得
  Future<econaservicessitechatv1get_counseling_chat_room.GetCounselingChatRoomResponse> getCounselingChatRoom(
    econaservicessitechatv1get_counseling_chat_room.GetCounselingChatRoomRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.getCounselingChatRoom,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateDateIntention:デート意向更新
  Future<econaservicessitechatv1update_date_intention.UpdateDateIntentionResponse> updateDateIntention(
    econaservicessitechatv1update_date_intention.UpdateDateIntentionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.updateDateIntention,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdatePinnedChatMessage:メッセージピン留め状態更新
  Future<econaservicessitechatv1update_pinned_chat_message.UpdatePinnedChatMessageResponse> updatePinnedChatMessage(
    econaservicessitechatv1update_pinned_chat_message.UpdatePinnedChatMessageRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.updatePinnedChatMessage,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdatePushNoticeStatus:プッシュ通知ステータス更新
  Future<econaservicessitechatv1update_push_notice_status.UpdatePushNoticeStatusResponse> updatePushNoticeStatus(
    econaservicessitechatv1update_push_notice_status.UpdatePushNoticeStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.updatePushNoticeStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// UpdateVisibleStatus:表示ステータス更新
  Future<econaservicessitechatv1update_visible_status.UpdateVisibleStatusResponse> updateVisibleStatus(
    econaservicessitechatv1update_visible_status.UpdateVisibleStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.updateVisibleStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// DeleteChatTopic:チャット話題削除
  Future<econaservicessitechatv1delete_chat_topic.DeleteChatTopicResponse> deleteChatTopic(
    econaservicessitechatv1delete_chat_topic.DeleteChatTopicRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.deleteChatTopic,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// PublishChatMessage:チャットメッセージ送信（アプリケーション専用）
  Future<econaservicessitechatv1publish_chat_message.PublishChatMessageResponse> publishChatMessage(
    econaservicessitechatv1publish_chat_message.PublishChatMessageRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.publishChatMessage,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// PublishDisconnectChatSession:チャットセッション切断（アプリケーション専用）
  Future<econaservicessitechatv1publish_disconnect_chat_session.PublishDisconnectChatSessionResponse> publishDisconnectChatSession(
    econaservicessitechatv1publish_disconnect_chat_session.PublishDisconnectChatSessionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.publishDisconnectChatSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// SubscribeChatSession:チャットセッション購読
  Stream<econaservicessitechatv1subscribe_chat_session.SubscribeChatSessionResponse> subscribeChatSession(
    econaservicessitechatv1subscribe_chat_session.SubscribeChatSessionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.ChatService.subscribeChatSession,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// PurchaseForceReadStatus:既読表示機能購入
  Future<econaservicessitechatv1purchase_force_read_status.PurchaseForceReadStatusResponse> purchaseForceReadStatus(
    econaservicessitechatv1purchase_force_read_status.PurchaseForceReadStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ChatService.purchaseForceReadStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
