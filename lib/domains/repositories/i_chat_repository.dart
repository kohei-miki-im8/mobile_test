import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_greeting.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_reply.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_messages.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_scheduled_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_simulator_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_simulator_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/purchase_force_read_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_pinned_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_push_notice_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_visible_status.pb.dart';

/// チャット関連のRepository Interface
abstract class IChatRepository {
  /// チャットルーム作成
  Future<CreateChatRoomResponse> createChatRoom(CreateChatRoomRequest request);

  /// チャットルーム一覧取得
  Future<GetChatRoomsResponse> getChatRooms(GetChatRoomsRequest request);

  /// 作成がスケジュールされたチャットルーム一覧取得
  Future<GetScheduledChatRoomsResponse> getScheduledChatRooms(GetScheduledChatRoomsRequest request);

  /// シミュレーターチャットルーム取得
  Future<GetSimulatorChatRoomsResponse> getSimulatorChatRooms(GetSimulatorChatRoomsRequest request);

  /// シミュレーターチャットルーム退出
  Future<LeaveSimulatorChatRoomResponse> leaveSimulatorChatRoom(LeaveSimulatorChatRoomRequest request);

  /// カウンセリングチャットルーム取得
  Future<GetCounselingChatRoomResponse> getCounselingChatRoom(GetCounselingChatRoomRequest request);

  /// 既読表示機能購入
  Future<PurchaseForceReadStatusResponse> purchaseForceReadStatus(PurchaseForceReadStatusRequest request);

  /// カウンセリングチャットルーム退出
  Future<LeaveCounselingChatRoomResponse> leaveCounselingChatRoom(LeaveCounselingChatRoomRequest request);

  /// プッシュ通知ステータス更新
  Future<void> updatePushNoticeStatus(UpdatePushNoticeStatusRequest request);

  /// 表示ステータス更新
  Future<void> updateVisibleStatus(UpdateVisibleStatusRequest request);

  /// チャットトピック作成
  Future<CreateChatTopicsResponse> createChatTopics(CreateChatTopicsRequest request);

  /// ペルソナ挨拶作成
  Future<CreatePersonaGreetingResponse> createPersonaGreeting(CreatePersonaGreetingRequest request);

  /// ペルソナ返信作成
  Future<CreatePersonaReplyResponse> createPersonaReply(CreatePersonaReplyRequest request);

  /// チャットトピック取得
  Future<GetChatTopicsResponse> getChatTopics(GetChatTopicsRequest request);

  /// デート意向取得
  Future<GetDateIntentionResponse> getDateIntention(GetDateIntentionRequest request);

  /// メッセージ取得
  Future<GetMessagesResponse> getMessages(GetMessagesRequest request);

  /// チャットメッセージ送信
  Future<PublishChatMessageResponse> publishChatMessage(PublishChatMessageRequest request);

  /// チャットセッション購読開始
  Stream<SubscribeChatSessionResponse> subscribeChatSession(SubscribeChatSessionRequest request);

  /// チャットセッション切断
  Future<PublishDisconnectChatSessionResponse> publishDisconnectChatSession(PublishDisconnectChatSessionRequest request);

  /// デート意向更新
  Future<UpdateDateIntentionResponse> updateDateIntention(UpdateDateIntentionRequest request);

  /// メッセージピン留め状態更新
  Future<UpdatePinnedChatMessageResponse> updatePinnedChatMessage(UpdatePinnedChatMessageRequest request);
}