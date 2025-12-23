import 'dart:async';
import 'dart:io';
import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/chat/v1/get_scheduled_chat_rooms.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/chat.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/pages/chat_room/chat_room_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:protobuf/protobuf.dart';

class ChatRoomPageViewModel extends StateNotifier<ChatRoomPageState> {
  ChatRoomPageViewModel(this.ref) : super(const ChatRoomPageState()) {
    _loadInitial();
  }
  final Ref ref;
  static const int _pageLimit = 20;

  Future<void> _loadInitial() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final chatRepository = ref.read(chatRepositoryProvider);
      final profileRepository = ref.read(profileRepositoryProvider);
      final results = await Future.wait([
        chatRepository.getChatRooms(
          GetChatRoomsRequest(
            cursor: PagerRequestCursor(limit: _pageLimit),
          ),
        ),
        chatRepository.getScheduledChatRooms(
          GetScheduledChatRoomsRequest(
            cursor: PagerRequestCursor(limit: _pageLimit),
          ),
        ),
        profileRepository.getProfile(
          GetProfileRequest(),
        ),
      ]);
      final chatRoomsResponse = results[0] as GetChatRoomsResponse;
      final scheduledChatRoomsResponse = results[1] as GetScheduledChatRoomsResponse;
      final profileResponse = results[2] as GetProfileResponse;

      final genderCode = profileResponse.profile.genderCode;
      final SubscriptionTier tier = await getSubscriptionTier(genderCode: genderCode);
      final bool isSubscribed;
      if(tier == SubscriptionTier.SUBSCRIPTION_TIER_BASIC ||
          tier == SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM) {
        isSubscribed = true;
      } else {
        isSubscribed = false;
      }



      state = state.copyWith(
        isLoading: false,
        chatRooms: chatRoomsResponse.chatRooms,
        scheduledChatRooms: scheduledChatRoomsResponse.scheduledChatRooms,
        chatRoomsCursor:
            chatRoomsResponse.hasCursor() ? chatRoomsResponse.cursor : null,
        scheduledChatRoomsCursor: scheduledChatRoomsResponse.hasCursor()
            ? scheduledChatRoomsResponse.cursor
            : null,
        isSubscribed: isSubscribed,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: EconaError.fromException(
          e,
          operation: EconaErrorOperation.unknown,
        ),
      );
    }
  }

  /// SWR用: 画面のローディングやエラー状態を変えずに最新化だけ行う
  Future<void> revalidateChatRooms() async {
    try {
      final chatRepository = ref.read(chatRepositoryProvider);
      final profileRepository = ref.read(profileRepositoryProvider);
      final results = await Future.wait([
        chatRepository.getChatRooms(
          GetChatRoomsRequest(
            cursor: PagerRequestCursor(limit: _pageLimit),
          ),
        ),
        chatRepository.getScheduledChatRooms(
          GetScheduledChatRoomsRequest(
            cursor: PagerRequestCursor(limit: _pageLimit),
          ),
        ),
        profileRepository.getProfile(
          GetProfileRequest(),
        ),
      ]);
      final chatRoomsResponse = results[0] as GetChatRoomsResponse;
      final scheduledChatRoomsResponse = results[1] as GetScheduledChatRoomsResponse;
      final profileResponse = results[2] as GetProfileResponse;

      final genderCode = profileResponse.profile.genderCode;
      final SubscriptionTier tier = await getSubscriptionTier(genderCode: genderCode);
      final bool isSubscribed;
      if(tier == SubscriptionTier.SUBSCRIPTION_TIER_BASIC ||
          tier == SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM) {
        isSubscribed = true;
      } else {
        isSubscribed = false;
      }

      final currentRooms = state.chatRooms;
      final nextRooms = chatRoomsResponse.chatRooms;
      final currentScheduled = state.scheduledChatRooms;
      final nextScheduled = scheduledChatRoomsResponse.scheduledChatRooms;
      final currentIsSubscribed = state.isSubscribed;
      final nextIsSubscribed = isSubscribed;



      final sameRooms = _isSameChatRooms(currentRooms, nextRooms);
      final sameScheduled = _isSameScheduledChatRooms(currentScheduled, nextScheduled);

      if (sameRooms && sameScheduled && currentIsSubscribed == nextIsSubscribed) {
        // 変化なし: state更新しない（再ビルド抑制）
        return;
      }

      state = state.copyWith(
        chatRooms: nextRooms,
        scheduledChatRooms: nextScheduled,
        chatRoomsCursor:
            chatRoomsResponse.hasCursor() ? chatRoomsResponse.cursor : null,
        scheduledChatRoomsCursor: scheduledChatRoomsResponse.hasCursor()
            ? scheduledChatRoomsResponse.cursor
            : null,
        isSubscribed: nextIsSubscribed,
        // isLoading / error は変更しない
      );
    } catch (_) {
      // バックグラウンド最新化失敗は握りつぶし（キャッシュ表示維持）
    }
  }

  /// チャットルーム一覧のローカル状態に表示ステータスを即時反映
  void updateChatRoomVisibleStatusLocally({
    required String chatRoomId,
    required bool isVisible,
  }) {
    final updatedRooms = state.chatRooms
        .map((room) {
          if (room.chatRoomId == chatRoomId) {
            return room.rebuild((b) => b.isVisible = isVisible);
          }
          return room;
        })
        .toList();

    state = state.copyWith(chatRooms: updatedRooms);
  }

  bool _isSameChatRooms(List<ChatRoom> a, List<ChatRoom> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      final ca = a[i];
      final cb = b[i];
      if (ca.chatRoomId != cb.chatRoomId) return false;
      // バッジの変化はUIに影響するため比較
      if (ca.messengerStatusBadge != cb.messengerStatusBadge) return false;
      final la = ca.hasLatestChatMessage() ? ca.latestChatMessage : null;
      final lb = cb.hasLatestChatMessage() ? cb.latestChatMessage : null;
      if ((la == null) != (lb == null)) return false;
      if (la != null && lb != null) {
        if (la.chatMessageId != lb.chatMessageId) return false;
        // 念のため送信時刻も比較（順序変化検出）
        if (la.sentAt.seconds != lb.sentAt.seconds || la.sentAt.nanos != lb.sentAt.nanos) {
          return false;
        }
      }
    }
    return true;
  }

  bool _isSameScheduledChatRooms(List<ScheduledChatRoom> a, List<ScheduledChatRoom> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i].scheduledChatRoomId != b[i].scheduledChatRoomId) return false;
    }
    return true;
  }

  /// チャットルーム一覧を再取得
  Future<void> refreshChatRooms() async => _loadInitial();

  /// 通常チャットルームのみを再取得
  Future<void> refreshOnlyChatRooms() async {
    try {
      final response = await ref.read(chatRepositoryProvider).getChatRooms(
        GetChatRoomsRequest(
          cursor: PagerRequestCursor(limit: _pageLimit),
        ),
      );
      state = state.copyWith(
        chatRooms: response.chatRooms,
        chatRoomsCursor: response.hasCursor() ? response.cursor : null,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        error: EconaError.fromException(
          e,
          operation: EconaErrorOperation.unknown,
        ),
      );
    }
  }

  /// スケジュール済みチャットルームのみを再取得
  Future<void> refreshOnlyScheduledChatRooms() async {
    try {
      final response = await ref.read(chatRepositoryProvider)
          .getScheduledChatRooms(
        GetScheduledChatRoomsRequest(
          cursor: PagerRequestCursor(limit: _pageLimit),
        ),
      );
      state = state.copyWith(
        scheduledChatRooms: response.scheduledChatRooms,
        scheduledChatRoomsCursor:
            response.hasCursor() ? response.cursor : null,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        error: EconaError.fromException(
          e,
          operation: EconaErrorOperation.unknown,
        ),
      );
    }
  }

  /// チャットルームの追加読み込み
  Future<void> loadMoreChatRooms(String? cursorId) async {
    if (cursorId == null || cursorId.isEmpty) return;

    // 二重リクエスト防止
    if (state.isLoadingMoreChatRooms) return;

    try {
      state = state.copyWith(isLoadingMoreChatRooms: true);

      final response =
          await ref.read(chatRepositoryProvider).getChatRooms(
            GetChatRoomsRequest(
              cursor: PagerRequestCursor(cursorId: cursorId, limit: _pageLimit),
            ),
          );

      final updatedChatRooms = [...state.chatRooms, ...response.chatRooms];

      state = state.copyWith(
        chatRooms: updatedChatRooms,
        chatRoomsCursor: response.hasCursor() ? response.cursor : null,
        isLoadingMoreChatRooms: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingMoreChatRooms: false,
        error: EconaError.fromException(
          e,
          operation: EconaErrorOperation.unknown,
        ),
      );
    }
  }

  /// スケジュールされたチャットルームの追加読み込み
  Future<void> loadMoreScheduledChatRooms(String? cursorId) async {
    if (cursorId == null || cursorId.isEmpty) return;

    // 二重リクエスト防止
    if (state.isLoadingMoreScheduledChatRooms) return;

    try {
      state = state.copyWith(isLoadingMoreScheduledChatRooms: true);

      final response = await ref.read(chatRepositoryProvider)
          .getScheduledChatRooms(
        GetScheduledChatRoomsRequest(
          cursor: PagerRequestCursor(cursorId: cursorId, limit: _pageLimit),
        ),
      );

      final updatedScheduledChatRooms = [
        ...state.scheduledChatRooms,
        ...response.scheduledChatRooms,
      ];

      state = state.copyWith(
        scheduledChatRooms: updatedScheduledChatRooms,
        scheduledChatRoomsCursor:
            response.hasCursor() ? response.cursor : null,
        isLoadingMoreScheduledChatRooms: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoadingMoreScheduledChatRooms: false,
        error: EconaError.fromException(
          e,
          operation: EconaErrorOperation.unknown,
        ),
      );
    }
  }

  /// ナビゲーション処理中のフラグを設定
  void setNavigating({required bool isNavigating}) {
    state = state.copyWith(isNavigating: isNavigating);
  }
}

final chatRoomPageViewModelProvider =
    StateNotifierProvider<ChatRoomPageViewModel, ChatRoomPageState>(
  (ref) => ChatRoomPageViewModel(ref),
);

bool isChatRoomsEmpty(WidgetRef ref) {
  final s = ref.watch(chatRoomPageViewModelProvider);
  return s.chatRooms.isEmpty && s.scheduledChatRooms.isEmpty;
}

int totalChatRoomsCount(WidgetRef ref) {
  final s = ref.watch(chatRoomPageViewModelProvider);
  return s.chatRooms.length + s.scheduledChatRooms.length;
}