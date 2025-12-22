//
//  Generated code. Do not modify.
//  source: econa/services/site/chat/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'create_chat_room.pb.dart' as $4;
import 'create_chat_topics.pb.dart' as $5;
import 'create_persona_greeting.pb.dart' as $6;
import 'create_persona_reply.pb.dart' as $7;
import 'delete_chat_topic.pb.dart' as $21;
import 'get_chat_rooms.pb.dart' as $9;
import 'get_chat_topics.pb.dart' as $8;
import 'get_counseling_chat_room.pb.dart' as $16;
import 'get_date_intention.pb.dart' as $10;
import 'get_messages.pb.dart' as $11;
import 'get_scheduled_chat_rooms.pb.dart' as $12;
import 'get_simulator_chat_rooms.pb.dart' as $13;
import 'leave_counseling_chat_room.pb.dart' as $15;
import 'leave_simulator_chat_room.pb.dart' as $14;
import 'publish_chat_message.pb.dart' as $22;
import 'publish_disconnect_chat_session.pb.dart' as $23;
import 'purchase_force_read_status.pb.dart' as $25;
import 'subscribe_chat_session.pb.dart' as $24;
import 'update_date_intention.pb.dart' as $17;
import 'update_pinned_chat_message.pb.dart' as $18;
import 'update_push_notice_status.pb.dart' as $19;
import 'update_visible_status.pb.dart' as $20;

export 'service.pb.dart';

@$pb.GrpcServiceName('econa.services.site.chat.v1.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$createChatRoom = $grpc.ClientMethod<$4.CreateChatRoomRequest, $4.CreateChatRoomResponse>(
      '/econa.services.site.chat.v1.ChatService/CreateChatRoom',
      ($4.CreateChatRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.CreateChatRoomResponse.fromBuffer(value));
  static final _$createChatTopics = $grpc.ClientMethod<$5.CreateChatTopicsRequest, $5.CreateChatTopicsResponse>(
      '/econa.services.site.chat.v1.ChatService/CreateChatTopics',
      ($5.CreateChatTopicsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.CreateChatTopicsResponse.fromBuffer(value));
  static final _$createPersonaGreeting = $grpc.ClientMethod<$6.CreatePersonaGreetingRequest, $6.CreatePersonaGreetingResponse>(
      '/econa.services.site.chat.v1.ChatService/CreatePersonaGreeting',
      ($6.CreatePersonaGreetingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.CreatePersonaGreetingResponse.fromBuffer(value));
  static final _$createPersonaReply = $grpc.ClientMethod<$7.CreatePersonaReplyRequest, $7.CreatePersonaReplyResponse>(
      '/econa.services.site.chat.v1.ChatService/CreatePersonaReply',
      ($7.CreatePersonaReplyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $7.CreatePersonaReplyResponse.fromBuffer(value));
  static final _$getChatTopics = $grpc.ClientMethod<$8.GetChatTopicsRequest, $8.GetChatTopicsResponse>(
      '/econa.services.site.chat.v1.ChatService/GetChatTopics',
      ($8.GetChatTopicsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.GetChatTopicsResponse.fromBuffer(value));
  static final _$getChatRooms = $grpc.ClientMethod<$9.GetChatRoomsRequest, $9.GetChatRoomsResponse>(
      '/econa.services.site.chat.v1.ChatService/GetChatRooms',
      ($9.GetChatRoomsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.GetChatRoomsResponse.fromBuffer(value));
  static final _$getDateIntention = $grpc.ClientMethod<$10.GetDateIntentionRequest, $10.GetDateIntentionResponse>(
      '/econa.services.site.chat.v1.ChatService/GetDateIntention',
      ($10.GetDateIntentionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.GetDateIntentionResponse.fromBuffer(value));
  static final _$getMessages = $grpc.ClientMethod<$11.GetMessagesRequest, $11.GetMessagesResponse>(
      '/econa.services.site.chat.v1.ChatService/GetMessages',
      ($11.GetMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.GetMessagesResponse.fromBuffer(value));
  static final _$getScheduledChatRooms = $grpc.ClientMethod<$12.GetScheduledChatRoomsRequest, $12.GetScheduledChatRoomsResponse>(
      '/econa.services.site.chat.v1.ChatService/GetScheduledChatRooms',
      ($12.GetScheduledChatRoomsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $12.GetScheduledChatRoomsResponse.fromBuffer(value));
  static final _$getSimulatorChatRooms = $grpc.ClientMethod<$13.GetSimulatorChatRoomsRequest, $13.GetSimulatorChatRoomsResponse>(
      '/econa.services.site.chat.v1.ChatService/GetSimulatorChatRooms',
      ($13.GetSimulatorChatRoomsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $13.GetSimulatorChatRoomsResponse.fromBuffer(value));
  static final _$leaveSimulatorChatRoom = $grpc.ClientMethod<$14.LeaveSimulatorChatRoomRequest, $14.LeaveSimulatorChatRoomResponse>(
      '/econa.services.site.chat.v1.ChatService/LeaveSimulatorChatRoom',
      ($14.LeaveSimulatorChatRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $14.LeaveSimulatorChatRoomResponse.fromBuffer(value));
  static final _$leaveCounselingChatRoom = $grpc.ClientMethod<$15.LeaveCounselingChatRoomRequest, $15.LeaveCounselingChatRoomResponse>(
      '/econa.services.site.chat.v1.ChatService/LeaveCounselingChatRoom',
      ($15.LeaveCounselingChatRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $15.LeaveCounselingChatRoomResponse.fromBuffer(value));
  static final _$getCounselingChatRoom = $grpc.ClientMethod<$16.GetCounselingChatRoomRequest, $16.GetCounselingChatRoomResponse>(
      '/econa.services.site.chat.v1.ChatService/GetCounselingChatRoom',
      ($16.GetCounselingChatRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $16.GetCounselingChatRoomResponse.fromBuffer(value));
  static final _$updateDateIntention = $grpc.ClientMethod<$17.UpdateDateIntentionRequest, $17.UpdateDateIntentionResponse>(
      '/econa.services.site.chat.v1.ChatService/UpdateDateIntention',
      ($17.UpdateDateIntentionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $17.UpdateDateIntentionResponse.fromBuffer(value));
  static final _$updatePinnedChatMessage = $grpc.ClientMethod<$18.UpdatePinnedChatMessageRequest, $18.UpdatePinnedChatMessageResponse>(
      '/econa.services.site.chat.v1.ChatService/UpdatePinnedChatMessage',
      ($18.UpdatePinnedChatMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $18.UpdatePinnedChatMessageResponse.fromBuffer(value));
  static final _$updatePushNoticeStatus = $grpc.ClientMethod<$19.UpdatePushNoticeStatusRequest, $19.UpdatePushNoticeStatusResponse>(
      '/econa.services.site.chat.v1.ChatService/UpdatePushNoticeStatus',
      ($19.UpdatePushNoticeStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $19.UpdatePushNoticeStatusResponse.fromBuffer(value));
  static final _$updateVisibleStatus = $grpc.ClientMethod<$20.UpdateVisibleStatusRequest, $20.UpdateVisibleStatusResponse>(
      '/econa.services.site.chat.v1.ChatService/UpdateVisibleStatus',
      ($20.UpdateVisibleStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $20.UpdateVisibleStatusResponse.fromBuffer(value));
  static final _$deleteChatTopic = $grpc.ClientMethod<$21.DeleteChatTopicRequest, $21.DeleteChatTopicResponse>(
      '/econa.services.site.chat.v1.ChatService/DeleteChatTopic',
      ($21.DeleteChatTopicRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $21.DeleteChatTopicResponse.fromBuffer(value));
  static final _$publishChatMessage = $grpc.ClientMethod<$22.PublishChatMessageRequest, $22.PublishChatMessageResponse>(
      '/econa.services.site.chat.v1.ChatService/PublishChatMessage',
      ($22.PublishChatMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $22.PublishChatMessageResponse.fromBuffer(value));
  static final _$publishDisconnectChatSession = $grpc.ClientMethod<$23.PublishDisconnectChatSessionRequest, $23.PublishDisconnectChatSessionResponse>(
      '/econa.services.site.chat.v1.ChatService/PublishDisconnectChatSession',
      ($23.PublishDisconnectChatSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $23.PublishDisconnectChatSessionResponse.fromBuffer(value));
  static final _$subscribeChatSession = $grpc.ClientMethod<$24.SubscribeChatSessionRequest, $24.SubscribeChatSessionResponse>(
      '/econa.services.site.chat.v1.ChatService/SubscribeChatSession',
      ($24.SubscribeChatSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $24.SubscribeChatSessionResponse.fromBuffer(value));
  static final _$purchaseForceReadStatus = $grpc.ClientMethod<$25.PurchaseForceReadStatusRequest, $25.PurchaseForceReadStatusResponse>(
      '/econa.services.site.chat.v1.ChatService/PurchaseForceReadStatus',
      ($25.PurchaseForceReadStatusRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $25.PurchaseForceReadStatusResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.CreateChatRoomResponse> createChatRoom($4.CreateChatRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$5.CreateChatTopicsResponse> createChatTopics($5.CreateChatTopicsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChatTopics, request, options: options);
  }

  $grpc.ResponseFuture<$6.CreatePersonaGreetingResponse> createPersonaGreeting($6.CreatePersonaGreetingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPersonaGreeting, request, options: options);
  }

  $grpc.ResponseFuture<$7.CreatePersonaReplyResponse> createPersonaReply($7.CreatePersonaReplyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createPersonaReply, request, options: options);
  }

  $grpc.ResponseFuture<$8.GetChatTopicsResponse> getChatTopics($8.GetChatTopicsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChatTopics, request, options: options);
  }

  $grpc.ResponseFuture<$9.GetChatRoomsResponse> getChatRooms($9.GetChatRoomsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChatRooms, request, options: options);
  }

  $grpc.ResponseFuture<$10.GetDateIntentionResponse> getDateIntention($10.GetDateIntentionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDateIntention, request, options: options);
  }

  $grpc.ResponseFuture<$11.GetMessagesResponse> getMessages($11.GetMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMessages, request, options: options);
  }

  $grpc.ResponseFuture<$12.GetScheduledChatRoomsResponse> getScheduledChatRooms($12.GetScheduledChatRoomsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getScheduledChatRooms, request, options: options);
  }

  $grpc.ResponseFuture<$13.GetSimulatorChatRoomsResponse> getSimulatorChatRooms($13.GetSimulatorChatRoomsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSimulatorChatRooms, request, options: options);
  }

  $grpc.ResponseFuture<$14.LeaveSimulatorChatRoomResponse> leaveSimulatorChatRoom($14.LeaveSimulatorChatRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaveSimulatorChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$15.LeaveCounselingChatRoomResponse> leaveCounselingChatRoom($15.LeaveCounselingChatRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$leaveCounselingChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$16.GetCounselingChatRoomResponse> getCounselingChatRoom($16.GetCounselingChatRoomRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCounselingChatRoom, request, options: options);
  }

  $grpc.ResponseFuture<$17.UpdateDateIntentionResponse> updateDateIntention($17.UpdateDateIntentionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDateIntention, request, options: options);
  }

  $grpc.ResponseFuture<$18.UpdatePinnedChatMessageResponse> updatePinnedChatMessage($18.UpdatePinnedChatMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePinnedChatMessage, request, options: options);
  }

  $grpc.ResponseFuture<$19.UpdatePushNoticeStatusResponse> updatePushNoticeStatus($19.UpdatePushNoticeStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePushNoticeStatus, request, options: options);
  }

  $grpc.ResponseFuture<$20.UpdateVisibleStatusResponse> updateVisibleStatus($20.UpdateVisibleStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateVisibleStatus, request, options: options);
  }

  $grpc.ResponseFuture<$21.DeleteChatTopicResponse> deleteChatTopic($21.DeleteChatTopicRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteChatTopic, request, options: options);
  }

  $grpc.ResponseFuture<$22.PublishChatMessageResponse> publishChatMessage($22.PublishChatMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$publishChatMessage, request, options: options);
  }

  $grpc.ResponseFuture<$23.PublishDisconnectChatSessionResponse> publishDisconnectChatSession($23.PublishDisconnectChatSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$publishDisconnectChatSession, request, options: options);
  }

  $grpc.ResponseStream<$24.SubscribeChatSessionResponse> subscribeChatSession($24.SubscribeChatSessionRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$subscribeChatSession, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$25.PurchaseForceReadStatusResponse> purchaseForceReadStatus($25.PurchaseForceReadStatusRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$purchaseForceReadStatus, request, options: options);
  }
}

@$pb.GrpcServiceName('econa.services.site.chat.v1.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'econa.services.site.chat.v1.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.CreateChatRoomRequest, $4.CreateChatRoomResponse>(
        'CreateChatRoom',
        createChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.CreateChatRoomRequest.fromBuffer(value),
        ($4.CreateChatRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.CreateChatTopicsRequest, $5.CreateChatTopicsResponse>(
        'CreateChatTopics',
        createChatTopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.CreateChatTopicsRequest.fromBuffer(value),
        ($5.CreateChatTopicsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.CreatePersonaGreetingRequest, $6.CreatePersonaGreetingResponse>(
        'CreatePersonaGreeting',
        createPersonaGreeting_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.CreatePersonaGreetingRequest.fromBuffer(value),
        ($6.CreatePersonaGreetingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.CreatePersonaReplyRequest, $7.CreatePersonaReplyResponse>(
        'CreatePersonaReply',
        createPersonaReply_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $7.CreatePersonaReplyRequest.fromBuffer(value),
        ($7.CreatePersonaReplyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetChatTopicsRequest, $8.GetChatTopicsResponse>(
        'GetChatTopics',
        getChatTopics_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetChatTopicsRequest.fromBuffer(value),
        ($8.GetChatTopicsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetChatRoomsRequest, $9.GetChatRoomsResponse>(
        'GetChatRooms',
        getChatRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.GetChatRoomsRequest.fromBuffer(value),
        ($9.GetChatRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.GetDateIntentionRequest, $10.GetDateIntentionResponse>(
        'GetDateIntention',
        getDateIntention_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.GetDateIntentionRequest.fromBuffer(value),
        ($10.GetDateIntentionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.GetMessagesRequest, $11.GetMessagesResponse>(
        'GetMessages',
        getMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.GetMessagesRequest.fromBuffer(value),
        ($11.GetMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$12.GetScheduledChatRoomsRequest, $12.GetScheduledChatRoomsResponse>(
        'GetScheduledChatRooms',
        getScheduledChatRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $12.GetScheduledChatRoomsRequest.fromBuffer(value),
        ($12.GetScheduledChatRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$13.GetSimulatorChatRoomsRequest, $13.GetSimulatorChatRoomsResponse>(
        'GetSimulatorChatRooms',
        getSimulatorChatRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $13.GetSimulatorChatRoomsRequest.fromBuffer(value),
        ($13.GetSimulatorChatRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$14.LeaveSimulatorChatRoomRequest, $14.LeaveSimulatorChatRoomResponse>(
        'LeaveSimulatorChatRoom',
        leaveSimulatorChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $14.LeaveSimulatorChatRoomRequest.fromBuffer(value),
        ($14.LeaveSimulatorChatRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$15.LeaveCounselingChatRoomRequest, $15.LeaveCounselingChatRoomResponse>(
        'LeaveCounselingChatRoom',
        leaveCounselingChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $15.LeaveCounselingChatRoomRequest.fromBuffer(value),
        ($15.LeaveCounselingChatRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$16.GetCounselingChatRoomRequest, $16.GetCounselingChatRoomResponse>(
        'GetCounselingChatRoom',
        getCounselingChatRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $16.GetCounselingChatRoomRequest.fromBuffer(value),
        ($16.GetCounselingChatRoomResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$17.UpdateDateIntentionRequest, $17.UpdateDateIntentionResponse>(
        'UpdateDateIntention',
        updateDateIntention_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $17.UpdateDateIntentionRequest.fromBuffer(value),
        ($17.UpdateDateIntentionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$18.UpdatePinnedChatMessageRequest, $18.UpdatePinnedChatMessageResponse>(
        'UpdatePinnedChatMessage',
        updatePinnedChatMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $18.UpdatePinnedChatMessageRequest.fromBuffer(value),
        ($18.UpdatePinnedChatMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$19.UpdatePushNoticeStatusRequest, $19.UpdatePushNoticeStatusResponse>(
        'UpdatePushNoticeStatus',
        updatePushNoticeStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $19.UpdatePushNoticeStatusRequest.fromBuffer(value),
        ($19.UpdatePushNoticeStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$20.UpdateVisibleStatusRequest, $20.UpdateVisibleStatusResponse>(
        'UpdateVisibleStatus',
        updateVisibleStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $20.UpdateVisibleStatusRequest.fromBuffer(value),
        ($20.UpdateVisibleStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$21.DeleteChatTopicRequest, $21.DeleteChatTopicResponse>(
        'DeleteChatTopic',
        deleteChatTopic_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $21.DeleteChatTopicRequest.fromBuffer(value),
        ($21.DeleteChatTopicResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$22.PublishChatMessageRequest, $22.PublishChatMessageResponse>(
        'PublishChatMessage',
        publishChatMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $22.PublishChatMessageRequest.fromBuffer(value),
        ($22.PublishChatMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$23.PublishDisconnectChatSessionRequest, $23.PublishDisconnectChatSessionResponse>(
        'PublishDisconnectChatSession',
        publishDisconnectChatSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $23.PublishDisconnectChatSessionRequest.fromBuffer(value),
        ($23.PublishDisconnectChatSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$24.SubscribeChatSessionRequest, $24.SubscribeChatSessionResponse>(
        'SubscribeChatSession',
        subscribeChatSession_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $24.SubscribeChatSessionRequest.fromBuffer(value),
        ($24.SubscribeChatSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$25.PurchaseForceReadStatusRequest, $25.PurchaseForceReadStatusResponse>(
        'PurchaseForceReadStatus',
        purchaseForceReadStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $25.PurchaseForceReadStatusRequest.fromBuffer(value),
        ($25.PurchaseForceReadStatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.CreateChatRoomResponse> createChatRoom_Pre($grpc.ServiceCall call, $async.Future<$4.CreateChatRoomRequest> request) async {
    return createChatRoom(call, await request);
  }

  $async.Future<$5.CreateChatTopicsResponse> createChatTopics_Pre($grpc.ServiceCall call, $async.Future<$5.CreateChatTopicsRequest> request) async {
    return createChatTopics(call, await request);
  }

  $async.Future<$6.CreatePersonaGreetingResponse> createPersonaGreeting_Pre($grpc.ServiceCall call, $async.Future<$6.CreatePersonaGreetingRequest> request) async {
    return createPersonaGreeting(call, await request);
  }

  $async.Future<$7.CreatePersonaReplyResponse> createPersonaReply_Pre($grpc.ServiceCall call, $async.Future<$7.CreatePersonaReplyRequest> request) async {
    return createPersonaReply(call, await request);
  }

  $async.Future<$8.GetChatTopicsResponse> getChatTopics_Pre($grpc.ServiceCall call, $async.Future<$8.GetChatTopicsRequest> request) async {
    return getChatTopics(call, await request);
  }

  $async.Future<$9.GetChatRoomsResponse> getChatRooms_Pre($grpc.ServiceCall call, $async.Future<$9.GetChatRoomsRequest> request) async {
    return getChatRooms(call, await request);
  }

  $async.Future<$10.GetDateIntentionResponse> getDateIntention_Pre($grpc.ServiceCall call, $async.Future<$10.GetDateIntentionRequest> request) async {
    return getDateIntention(call, await request);
  }

  $async.Future<$11.GetMessagesResponse> getMessages_Pre($grpc.ServiceCall call, $async.Future<$11.GetMessagesRequest> request) async {
    return getMessages(call, await request);
  }

  $async.Future<$12.GetScheduledChatRoomsResponse> getScheduledChatRooms_Pre($grpc.ServiceCall call, $async.Future<$12.GetScheduledChatRoomsRequest> request) async {
    return getScheduledChatRooms(call, await request);
  }

  $async.Future<$13.GetSimulatorChatRoomsResponse> getSimulatorChatRooms_Pre($grpc.ServiceCall call, $async.Future<$13.GetSimulatorChatRoomsRequest> request) async {
    return getSimulatorChatRooms(call, await request);
  }

  $async.Future<$14.LeaveSimulatorChatRoomResponse> leaveSimulatorChatRoom_Pre($grpc.ServiceCall call, $async.Future<$14.LeaveSimulatorChatRoomRequest> request) async {
    return leaveSimulatorChatRoom(call, await request);
  }

  $async.Future<$15.LeaveCounselingChatRoomResponse> leaveCounselingChatRoom_Pre($grpc.ServiceCall call, $async.Future<$15.LeaveCounselingChatRoomRequest> request) async {
    return leaveCounselingChatRoom(call, await request);
  }

  $async.Future<$16.GetCounselingChatRoomResponse> getCounselingChatRoom_Pre($grpc.ServiceCall call, $async.Future<$16.GetCounselingChatRoomRequest> request) async {
    return getCounselingChatRoom(call, await request);
  }

  $async.Future<$17.UpdateDateIntentionResponse> updateDateIntention_Pre($grpc.ServiceCall call, $async.Future<$17.UpdateDateIntentionRequest> request) async {
    return updateDateIntention(call, await request);
  }

  $async.Future<$18.UpdatePinnedChatMessageResponse> updatePinnedChatMessage_Pre($grpc.ServiceCall call, $async.Future<$18.UpdatePinnedChatMessageRequest> request) async {
    return updatePinnedChatMessage(call, await request);
  }

  $async.Future<$19.UpdatePushNoticeStatusResponse> updatePushNoticeStatus_Pre($grpc.ServiceCall call, $async.Future<$19.UpdatePushNoticeStatusRequest> request) async {
    return updatePushNoticeStatus(call, await request);
  }

  $async.Future<$20.UpdateVisibleStatusResponse> updateVisibleStatus_Pre($grpc.ServiceCall call, $async.Future<$20.UpdateVisibleStatusRequest> request) async {
    return updateVisibleStatus(call, await request);
  }

  $async.Future<$21.DeleteChatTopicResponse> deleteChatTopic_Pre($grpc.ServiceCall call, $async.Future<$21.DeleteChatTopicRequest> request) async {
    return deleteChatTopic(call, await request);
  }

  $async.Future<$22.PublishChatMessageResponse> publishChatMessage_Pre($grpc.ServiceCall call, $async.Future<$22.PublishChatMessageRequest> request) async {
    return publishChatMessage(call, await request);
  }

  $async.Future<$23.PublishDisconnectChatSessionResponse> publishDisconnectChatSession_Pre($grpc.ServiceCall call, $async.Future<$23.PublishDisconnectChatSessionRequest> request) async {
    return publishDisconnectChatSession(call, await request);
  }

  $async.Stream<$24.SubscribeChatSessionResponse> subscribeChatSession_Pre($grpc.ServiceCall call, $async.Future<$24.SubscribeChatSessionRequest> request) async* {
    yield* subscribeChatSession(call, await request);
  }

  $async.Future<$25.PurchaseForceReadStatusResponse> purchaseForceReadStatus_Pre($grpc.ServiceCall call, $async.Future<$25.PurchaseForceReadStatusRequest> request) async {
    return purchaseForceReadStatus(call, await request);
  }

  $async.Future<$4.CreateChatRoomResponse> createChatRoom($grpc.ServiceCall call, $4.CreateChatRoomRequest request);
  $async.Future<$5.CreateChatTopicsResponse> createChatTopics($grpc.ServiceCall call, $5.CreateChatTopicsRequest request);
  $async.Future<$6.CreatePersonaGreetingResponse> createPersonaGreeting($grpc.ServiceCall call, $6.CreatePersonaGreetingRequest request);
  $async.Future<$7.CreatePersonaReplyResponse> createPersonaReply($grpc.ServiceCall call, $7.CreatePersonaReplyRequest request);
  $async.Future<$8.GetChatTopicsResponse> getChatTopics($grpc.ServiceCall call, $8.GetChatTopicsRequest request);
  $async.Future<$9.GetChatRoomsResponse> getChatRooms($grpc.ServiceCall call, $9.GetChatRoomsRequest request);
  $async.Future<$10.GetDateIntentionResponse> getDateIntention($grpc.ServiceCall call, $10.GetDateIntentionRequest request);
  $async.Future<$11.GetMessagesResponse> getMessages($grpc.ServiceCall call, $11.GetMessagesRequest request);
  $async.Future<$12.GetScheduledChatRoomsResponse> getScheduledChatRooms($grpc.ServiceCall call, $12.GetScheduledChatRoomsRequest request);
  $async.Future<$13.GetSimulatorChatRoomsResponse> getSimulatorChatRooms($grpc.ServiceCall call, $13.GetSimulatorChatRoomsRequest request);
  $async.Future<$14.LeaveSimulatorChatRoomResponse> leaveSimulatorChatRoom($grpc.ServiceCall call, $14.LeaveSimulatorChatRoomRequest request);
  $async.Future<$15.LeaveCounselingChatRoomResponse> leaveCounselingChatRoom($grpc.ServiceCall call, $15.LeaveCounselingChatRoomRequest request);
  $async.Future<$16.GetCounselingChatRoomResponse> getCounselingChatRoom($grpc.ServiceCall call, $16.GetCounselingChatRoomRequest request);
  $async.Future<$17.UpdateDateIntentionResponse> updateDateIntention($grpc.ServiceCall call, $17.UpdateDateIntentionRequest request);
  $async.Future<$18.UpdatePinnedChatMessageResponse> updatePinnedChatMessage($grpc.ServiceCall call, $18.UpdatePinnedChatMessageRequest request);
  $async.Future<$19.UpdatePushNoticeStatusResponse> updatePushNoticeStatus($grpc.ServiceCall call, $19.UpdatePushNoticeStatusRequest request);
  $async.Future<$20.UpdateVisibleStatusResponse> updateVisibleStatus($grpc.ServiceCall call, $20.UpdateVisibleStatusRequest request);
  $async.Future<$21.DeleteChatTopicResponse> deleteChatTopic($grpc.ServiceCall call, $21.DeleteChatTopicRequest request);
  $async.Future<$22.PublishChatMessageResponse> publishChatMessage($grpc.ServiceCall call, $22.PublishChatMessageRequest request);
  $async.Future<$23.PublishDisconnectChatSessionResponse> publishDisconnectChatSession($grpc.ServiceCall call, $23.PublishDisconnectChatSessionRequest request);
  $async.Stream<$24.SubscribeChatSessionResponse> subscribeChatSession($grpc.ServiceCall call, $24.SubscribeChatSessionRequest request);
  $async.Future<$25.PurchaseForceReadStatusResponse> purchaseForceReadStatus($grpc.ServiceCall call, $25.PurchaseForceReadStatusRequest request);
}
