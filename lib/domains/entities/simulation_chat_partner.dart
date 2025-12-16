import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_simulator_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/signed_url.pb.dart';
import 'package:flutter/foundation.dart';

@immutable
class SimulationChatPartner {
  const SimulationChatPartner({
    required this.chatRoomId,
    required this.userId,
    required this.anonymizeDummyNickname,
    required this.imageUrls,
    required this.birthday,
    required this.simplifiedPersonalitySummary,
  });

  factory SimulationChatPartner.fromSimulatorChatRoom(
      SimulatorChatRoom simulationChatRoom,
      ) {
    return SimulationChatPartner(
      chatRoomId: simulationChatRoom.chatRoomId,
      userId: simulationChatRoom.toUserId,
      anonymizeDummyNickname: simulationChatRoom.anonymizeDummyNickname,
      imageUrls: simulationChatRoom.dummyProfilePhotoUrls,
      birthday: simulationChatRoom.birthday.toDateTime(),
      simplifiedPersonalitySummary: simulationChatRoom.simplifiedPersonalitySummary,
    );
  }

  final String chatRoomId;
  final String userId;
  final String anonymizeDummyNickname;
  final SignedImageUrls imageUrls;
  final DateTime birthday;
  final String simplifiedPersonalitySummary;
}