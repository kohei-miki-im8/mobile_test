import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/simulation_chat_partner.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/ai_agent_code.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/create_chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_simulator_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/leave_simulator_chat_room.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/presentations/pages/simulation/simulation_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimulationPageViewModel extends StateNotifier<SimulationPageState> {
  SimulationPageViewModel(this.ref) : super(const SimulationPageState());

  final Ref ref;

  Future<void> fetchPartners() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await ref
          .read(chatRepositoryProvider)
          .getSimulatorChatRooms(GetSimulatorChatRoomsRequest());

      final partners = response.simulatorChatRooms
          .map(SimulationChatPartner.fromSimulatorChatRoom)
          .toList(growable: false);

      state = state.copyWith(
        partners: partners,
        simulationChatRooms: response.simulatorChatRooms,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.partnerFetch,
      );
      state = state.copyWith(error: econaError);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<String?> createChatRoom({
    required String dummyChatRoomId,
    required String toUserId,
    required String anonymizeDummyNickname,
    required String dummyPhotoId,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    String chatRoomId = dummyChatRoomId;
    try {
      if(chatRoomId == '00000000-0000-0000-0000-000000000000') {
        final response = await ref.watch(chatRepositoryProvider).createChatRoom(
          CreateChatRoomRequest(
            toUserId: toUserId,
            aiAgentCode: AiAgentCode.AI_AGENT_CODE_CHAT_SIMULATOR,
            anonymizeDummyNickname: anonymizeDummyNickname,
            dummyPhotoId: dummyPhotoId,
          ),
        );
        chatRoomId = response.chatRoomId;
      }

      state = state.copyWith(
        chatRoomId: chatRoomId,
      );

      return chatRoomId;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.simulatorChatRoomCreate,
      );
      state = state.copyWith(error: econaError);
      return null;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final simulationPageViewModelProvider =
StateNotifierProvider.autoDispose<SimulationPageViewModel, SimulationPageState>((ref) {
  return SimulationPageViewModel(ref);
});