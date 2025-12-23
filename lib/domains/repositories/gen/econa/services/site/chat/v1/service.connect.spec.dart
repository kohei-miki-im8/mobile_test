//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "create_chat_room.pb.dart" as econaservicessitechatv1create_chat_room;
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
abstract final class ChatService {
  /// Fully-qualified name of the ChatService service.
  static const name = 'econa.services.site.chat.v1.ChatService';

  /// CreateChatRoom:チャットルーム作成
  static const createChatRoom = connect.Spec(
    '/$name/CreateChatRoom',
    connect.StreamType.unary,
    econaservicessitechatv1create_chat_room.CreateChatRoomRequest.new,
    econaservicessitechatv1create_chat_room.CreateChatRoomResponse.new,
  );

  /// CreateChatTopics:チャット話題作成
  static const createChatTopics = connect.Spec(
    '/$name/CreateChatTopics',
    connect.StreamType.unary,
    econaservicessitechatv1create_chat_topics.CreateChatTopicsRequest.new,
    econaservicessitechatv1create_chat_topics.CreateChatTopicsResponse.new,
  );

  /// CreatePersonaGreeting:なりきり挨拶作成
  static const createPersonaGreeting = connect.Spec(
    '/$name/CreatePersonaGreeting',
    connect.StreamType.unary,
    econaservicessitechatv1create_persona_greeting.CreatePersonaGreetingRequest.new,
    econaservicessitechatv1create_persona_greeting.CreatePersonaGreetingResponse.new,
  );

  /// CreatePersonaReply:なりきり返信作成
  static const createPersonaReply = connect.Spec(
    '/$name/CreatePersonaReply',
    connect.StreamType.unary,
    econaservicessitechatv1create_persona_reply.CreatePersonaReplyRequest.new,
    econaservicessitechatv1create_persona_reply.CreatePersonaReplyResponse.new,
  );

  /// GetChatTopics:チャット話題取得
  static const getChatTopics = connect.Spec(
    '/$name/GetChatTopics',
    connect.StreamType.unary,
    econaservicessitechatv1get_chat_topics.GetChatTopicsRequest.new,
    econaservicessitechatv1get_chat_topics.GetChatTopicsResponse.new,
  );

  /// GetChatRooms:チャットルーム取得
  static const getChatRooms = connect.Spec(
    '/$name/GetChatRooms',
    connect.StreamType.unary,
    econaservicessitechatv1get_chat_rooms.GetChatRoomsRequest.new,
    econaservicessitechatv1get_chat_rooms.GetChatRoomsResponse.new,
  );

  /// GetDateIntention:デート意向取得
  static const getDateIntention = connect.Spec(
    '/$name/GetDateIntention',
    connect.StreamType.unary,
    econaservicessitechatv1get_date_intention.GetDateIntentionRequest.new,
    econaservicessitechatv1get_date_intention.GetDateIntentionResponse.new,
  );

  /// GetMessages:メッセージ取得
  static const getMessages = connect.Spec(
    '/$name/GetMessages',
    connect.StreamType.unary,
    econaservicessitechatv1get_messages.GetMessagesRequest.new,
    econaservicessitechatv1get_messages.GetMessagesResponse.new,
  );

  /// GetScheduledChatRooms:予約チャットルーム取得
  static const getScheduledChatRooms = connect.Spec(
    '/$name/GetScheduledChatRooms',
    connect.StreamType.unary,
    econaservicessitechatv1get_scheduled_chat_rooms.GetScheduledChatRoomsRequest.new,
    econaservicessitechatv1get_scheduled_chat_rooms.GetScheduledChatRoomsResponse.new,
  );

  /// GetSimulatorChatRooms:シミュレーターチャットルーム一覧取得
  static const getSimulatorChatRooms = connect.Spec(
    '/$name/GetSimulatorChatRooms',
    connect.StreamType.unary,
    econaservicessitechatv1get_simulator_chat_rooms.GetSimulatorChatRoomsRequest.new,
    econaservicessitechatv1get_simulator_chat_rooms.GetSimulatorChatRoomsResponse.new,
  );

  /// LeaveSimulatorChatRoom:シミュレーターチャットルーム退出
  static const leaveSimulatorChatRoom = connect.Spec(
    '/$name/LeaveSimulatorChatRoom',
    connect.StreamType.unary,
    econaservicessitechatv1leave_simulator_chat_room.LeaveSimulatorChatRoomRequest.new,
    econaservicessitechatv1leave_simulator_chat_room.LeaveSimulatorChatRoomResponse.new,
  );

  /// LeaveCounselingChatRoom:カウンセリングチャットルーム退出
  static const leaveCounselingChatRoom = connect.Spec(
    '/$name/LeaveCounselingChatRoom',
    connect.StreamType.unary,
    econaservicessitechatv1leave_counseling_chat_room.LeaveCounselingChatRoomRequest.new,
    econaservicessitechatv1leave_counseling_chat_room.LeaveCounselingChatRoomResponse.new,
  );

  /// GetCounselingChatRoom:カウンセリングチャットルーム取得
  static const getCounselingChatRoom = connect.Spec(
    '/$name/GetCounselingChatRoom',
    connect.StreamType.unary,
    econaservicessitechatv1get_counseling_chat_room.GetCounselingChatRoomRequest.new,
    econaservicessitechatv1get_counseling_chat_room.GetCounselingChatRoomResponse.new,
  );

  /// UpdateDateIntention:デート意向更新
  static const updateDateIntention = connect.Spec(
    '/$name/UpdateDateIntention',
    connect.StreamType.unary,
    econaservicessitechatv1update_date_intention.UpdateDateIntentionRequest.new,
    econaservicessitechatv1update_date_intention.UpdateDateIntentionResponse.new,
  );

  /// UpdatePinnedChatMessage:メッセージピン留め状態更新
  static const updatePinnedChatMessage = connect.Spec(
    '/$name/UpdatePinnedChatMessage',
    connect.StreamType.unary,
    econaservicessitechatv1update_pinned_chat_message.UpdatePinnedChatMessageRequest.new,
    econaservicessitechatv1update_pinned_chat_message.UpdatePinnedChatMessageResponse.new,
  );

  /// UpdatePushNoticeStatus:プッシュ通知ステータス更新
  static const updatePushNoticeStatus = connect.Spec(
    '/$name/UpdatePushNoticeStatus',
    connect.StreamType.unary,
    econaservicessitechatv1update_push_notice_status.UpdatePushNoticeStatusRequest.new,
    econaservicessitechatv1update_push_notice_status.UpdatePushNoticeStatusResponse.new,
  );

  /// UpdateVisibleStatus:表示ステータス更新
  static const updateVisibleStatus = connect.Spec(
    '/$name/UpdateVisibleStatus',
    connect.StreamType.unary,
    econaservicessitechatv1update_visible_status.UpdateVisibleStatusRequest.new,
    econaservicessitechatv1update_visible_status.UpdateVisibleStatusResponse.new,
  );

  /// DeleteChatTopic:チャット話題削除
  static const deleteChatTopic = connect.Spec(
    '/$name/DeleteChatTopic',
    connect.StreamType.unary,
    econaservicessitechatv1delete_chat_topic.DeleteChatTopicRequest.new,
    econaservicessitechatv1delete_chat_topic.DeleteChatTopicResponse.new,
  );

  /// PublishChatMessage:チャットメッセージ送信（アプリケーション専用）
  static const publishChatMessage = connect.Spec(
    '/$name/PublishChatMessage',
    connect.StreamType.unary,
    econaservicessitechatv1publish_chat_message.PublishChatMessageRequest.new,
    econaservicessitechatv1publish_chat_message.PublishChatMessageResponse.new,
  );

  /// PublishDisconnectChatSession:チャットセッション切断（アプリケーション専用）
  static const publishDisconnectChatSession = connect.Spec(
    '/$name/PublishDisconnectChatSession',
    connect.StreamType.unary,
    econaservicessitechatv1publish_disconnect_chat_session.PublishDisconnectChatSessionRequest.new,
    econaservicessitechatv1publish_disconnect_chat_session.PublishDisconnectChatSessionResponse.new,
  );

  /// SubscribeChatSession:チャットセッション購読
  static const subscribeChatSession = connect.Spec(
    '/$name/SubscribeChatSession',
    connect.StreamType.server,
    econaservicessitechatv1subscribe_chat_session.SubscribeChatSessionRequest.new,
    econaservicessitechatv1subscribe_chat_session.SubscribeChatSessionResponse.new,
  );

  /// PurchaseForceReadStatus:既読表示機能購入
  static const purchaseForceReadStatus = connect.Spec(
    '/$name/PurchaseForceReadStatus',
    connect.StreamType.unary,
    econaservicessitechatv1purchase_force_read_status.PurchaseForceReadStatusRequest.new,
    econaservicessitechatv1purchase_force_read_status.PurchaseForceReadStatusResponse.new,
  );
}
