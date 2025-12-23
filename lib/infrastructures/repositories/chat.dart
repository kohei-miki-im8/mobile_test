import 'dart:async';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_counseling_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_simulator_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/i_chat_repository.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_greeting.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_persona_reply.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_topics.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_messages.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_scheduled_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_simulator_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/publish_disconnect_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/purchase_force_read_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/service.connect.client.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/subscribe_chat_session.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_date_intention.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_pinned_chat_message.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_push_notice_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/update_visible_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/constants/api_constants.dart';
import 'package:econa_mobile_app/infrastructures/repositories/api_client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat.g.dart';

/// チャット関連のRepository実装クラス
class ChatRepository implements IChatRepository {
  ChatRepository(this._apiClient) {
    _client = _apiClient.createClient(ChatServiceClient.new);
  }

  final ApiClient _apiClient;
  late final ChatServiceClient _client;

  @override
  Future<CreateChatRoomResponse> createChatRoom(CreateChatRoomRequest request) async {
    try {
      final result = await _apiClient.call<CreateChatRoomResponse>(
        client: _client,
        method: ApiMethodUnary.createChatRoom,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create ChatRooms: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create ChatRooms: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create ChatRooms: ${e.toString()}');
    }
  }

  @override
  Future<GetChatRoomsResponse> getChatRooms(GetChatRoomsRequest request) async {
    try {
      final result = await _apiClient.call<GetChatRoomsResponse>(
        client: _client,
        method: ApiMethodUnary.getChatRooms,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get ChatRooms: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get ChatRooms: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get ChatRooms: $e');
    }
  }

  @override
  Future<GetScheduledChatRoomsResponse> getScheduledChatRooms(GetScheduledChatRoomsRequest request) async {
    try {
      final result = await _apiClient.call<GetScheduledChatRoomsResponse>(
        client: _client,
        method: ApiMethodUnary.getScheduledChatRooms,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get ScheduledChatRooms: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get ScheduledChatRooms: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get ScheduledChatRooms: $e');
    }
  }

  @override
  Future<GetCounselingChatRoomResponse> getCounselingChatRoom(
      GetCounselingChatRoomRequest request) async {
    try {
      final result = await _apiClient.call<GetCounselingChatRoomResponse>(
        client: _client,
        method: ApiMethodUnary.getCounselingChatRoom,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get CounselingChatRoom: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get CounselingChatRoom: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get CounselingChatRoom: $e');
    }
  }

  @override
  Future<GetSimulatorChatRoomsResponse> getSimulatorChatRooms(
      GetSimulatorChatRoomsRequest request) async {
    try {
      final result = await _apiClient.call<GetSimulatorChatRoomsResponse>(
        client: _client,
        method: ApiMethodUnary.getSimulatorChatRooms,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get SimulatorChatRooms: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get SimulatorChatRooms: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get SimulatorChatRooms: $e');
    }
  }

  @override
  Future<PurchaseForceReadStatusResponse> purchaseForceReadStatus(
      PurchaseForceReadStatusRequest request) async {
    try {
      final result = await _apiClient.call<PurchaseForceReadStatusResponse>(
        client: _client,
        method: ApiMethodUnary.purchaseForceReadStatus,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed purchase ForceReadStatus: ${result.error}');
      }
      return result.data ??
          (throw Exception(
              'failed purchase ForceReadStatus: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed purchase ForceReadStatus: $e');
    }
  }

  @override
  Future<LeaveCounselingChatRoomResponse> leaveCounselingChatRoom(LeaveCounselingChatRoomRequest request) async {
    try {
      final result = await _apiClient.call<LeaveCounselingChatRoomResponse>(
        client: _client,
        method: ApiMethodUnary.leaveCounselingChatRoom,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed leave CounselingChatRoom: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed leave CounselingChatRoom: response data is null'));
    } catch (e) {
      throw Exception('failed leave CounselingChatRoom: $e');
    }
  }

  @override
  Future<LeaveSimulatorChatRoomResponse> leaveSimulatorChatRoom(LeaveSimulatorChatRoomRequest request) async {
    try {
      final result = await _apiClient.call<LeaveSimulatorChatRoomResponse>(
        client: _client,
        method: ApiMethodUnary.leaveSimulatorChatRoom,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed leave SimulatorChatRoom: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed leave SimulatorChatRoom: response data is null'));
    } catch (e) {
      throw Exception('failed leave SimulatorChatRoom: $e');
    }
  }

  @override
  Future<void> updatePushNoticeStatus(UpdatePushNoticeStatusRequest request) async {
    try {
      final result = await _apiClient.call<UpdatePushNoticeStatusResponse>(
        client: _client,
        method: ApiMethodUnary.updatePushNoticeStatus,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update PushNoticeStatus: ${result.error}');
      }
    } catch (e) {
      throw Exception('failed update PushNoticeStatus: $e');
    }
  }

  @override
  Future<void> updateVisibleStatus(UpdateVisibleStatusRequest request) async {
    try {
      final result = await _apiClient.call<UpdateVisibleStatusResponse>(
        client: _client,
        method: ApiMethodUnary.updateVisibleStatus,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update VisibleStatus: ${result.error}');
      }
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update VisibleStatus: $e');
    }
  }

  @override
  Future<CreateChatTopicsResponse> createChatTopics(CreateChatTopicsRequest request) async {
    try {
      final result = await _apiClient.call<CreateChatTopicsResponse>(
        client: _client,
        method: ApiMethodUnary.createChatTopics,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create ChatTopics: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create ChatTopics: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create ChatTopics: $e');
    }
  }

  @override
  Future<CreatePersonaGreetingResponse> createPersonaGreeting(CreatePersonaGreetingRequest request) async {
    try {
      final result = await _apiClient.call<CreatePersonaGreetingResponse>(
        client: _client,
        method: ApiMethodUnary.createPersonaGreeting,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create PersonaGreeting: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create PersonaGreeting: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create PersonaGreeting: $e');
    }
  }

  @override
  Future<CreatePersonaReplyResponse> createPersonaReply(CreatePersonaReplyRequest request) async {
    try {
      final result = await _apiClient.call<CreatePersonaReplyResponse>(
        client: _client,
        method: ApiMethodUnary.createPersonaReply,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed create PersonaReply: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed create PersonaReply: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed create PersonaReply: $e');
    }
  }

  @override
  Future<GetChatTopicsResponse> getChatTopics(GetChatTopicsRequest request) async {
    try {
      final result = await _apiClient.call<GetChatTopicsResponse>(
        client: _client,
        method: ApiMethodUnary.getChatTopics,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get ChatTopics: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get ChatTopics: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get ChatTopics: $e');
    }
  }

  @override
  Future<GetDateIntentionResponse> getDateIntention(GetDateIntentionRequest request) async {
    try {
      final result = await _apiClient.call<GetDateIntentionResponse>(
        client: _client,
        method: ApiMethodUnary.getDateIntention,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get DateIntention: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get DateIntention: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get DateIntention: $e');
    }
  }

  @override
  Future<GetMessagesResponse> getMessages(GetMessagesRequest request) async {
    try {
      final result = await _apiClient.call<GetMessagesResponse>(
        client: _client,
        method: ApiMethodUnary.getMessages,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed get Messages: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed get Messages: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed get Messages: $e');
    }
  }

  @override
  Future<PublishChatMessageResponse> publishChatMessage(PublishChatMessageRequest request) async {
    try {
      final result = await _apiClient.call<PublishChatMessageResponse>(
        client: _client,
        method: ApiMethodUnary.publishChatMessage,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed publish ChatMessage: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed publish ChatMessage: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed publish ChatMessage: $e');
    }
  }

  @override
  Stream<SubscribeChatSessionResponse> subscribeChatSession(SubscribeChatSessionRequest request) {
    try {
      final apiResultStream = _apiClient.callStream<SubscribeChatSessionResponse>(
        client: _client,
        method: ApiMethodStream.subscribeChatSession,
        request: request,
      );
      return apiResultStream.map((result) {
        if(result.isSuccess) {
          return result.data ??
              (throw Exception('failed subscribe ChatSession: response data is null'));
        } else {
          /// Todo: エンジンが動き次第ハンドリングを追加
          final errorText = result.error ?? '';
          throw Exception('failed subscribe ChatSession: $errorText');
        }
      });
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed subscribe ChatSession: $e');
    }
  }

  @override
  Future<PublishDisconnectChatSessionResponse> publishDisconnectChatSession(PublishDisconnectChatSessionRequest request) async {
    try {
      final result =
      await _apiClient.call<PublishDisconnectChatSessionResponse>(
        client: _client,
        method: ApiMethodUnary.publishDisconnectChatSession,
        request: request,
      );

      if (result.error != null) {
        throw Exception('failed publish DisconnectChatSession: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed publish DisconnectChatSession: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed publish DisconnectChatSession: $e');
    }
  }

  @override
  Future<UpdateDateIntentionResponse> updateDateIntention(UpdateDateIntentionRequest request) async {
    try {
      final result = await _apiClient.call<UpdateDateIntentionResponse>(
        client: _client,
        method: ApiMethodUnary.updateDateIntention,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update DateIntention: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update DateIntention: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update DateIntention: $e');
    }
  }

  @override
  Future<UpdatePinnedChatMessageResponse> updatePinnedChatMessage(UpdatePinnedChatMessageRequest request) async {
    try {
      final result = await _apiClient.call<UpdatePinnedChatMessageResponse>(
        client: _client,
        method: ApiMethodUnary.updatePinnedChatMessage,
        request: request,
      );
      if (result.error != null) {
        throw Exception('failed update PinnedChatMessage: ${result.error}');
      }
      return result.data ??
          (throw Exception('failed update PinnedChatMessage: response data is null'));
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception('failed update PinnedChatMessage: $e');
    }
  }
}

/// ChatRepositoryの実装インスタンスを提供
@riverpod
IChatRepository chatRepository(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ChatRepository(apiClient);
}