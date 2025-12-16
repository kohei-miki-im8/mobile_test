import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/simulation_chat_partner.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:flutter/foundation.dart';

@immutable
class SimulationPageState {
  const SimulationPageState({
    this.chatRoomId = '00000000-0000-0000-0000-000000000000',
    this.partners = const [],
    this.simulationChatRooms = const [],
    this.isLoading = false,
    this.error,
  });

  final String chatRoomId;
  final List<SimulationChatPartner> partners;
  final List<SimulatorChatRoom> simulationChatRooms;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  SimulationPageState copyWith({
    String? chatRoomId,
    List<SimulationChatPartner>? partners,
    List<SimulatorChatRoom>? simulationChatRooms,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return SimulationPageState(
      chatRoomId: chatRoomId ?? this.chatRoomId,
      partners: partners ?? this.partners,
      simulationChatRooms: simulationChatRooms ?? this.simulationChatRooms,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}