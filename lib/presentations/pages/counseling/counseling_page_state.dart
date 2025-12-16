import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/counseling.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/chat_room.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user.pb.dart';

/// カウンセリング画面用の状態
class CounselingPageState {
  const CounselingPageState({
    this.chatRoom,
    this.session,
    this.profile,
    this.userStatus,
    this.isCreatingRoom = false,      // チャットルーム作成中フラグ
    this.isFetchingMessages = false,  // メッセージ取得中フラグ
    this.isSubscribing = false,       // Stream接続フラグ
    this.isReconnecting = false,      // Stream接続中フラグ
    this.isPublishing = false,        // Publish中フラグ
    this.isLoading = false,           // 画面全体のローディング
    this.error,
  });

  final ChatRoom? chatRoom;
  final CounselingSession? session;
  final Profile? profile;
  final UserStatus? userStatus;
  final bool isCreatingRoom;
  final bool isFetchingMessages;
  final bool isSubscribing;
  final bool isReconnecting;
  final bool isPublishing;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  CounselingPageState copyWith({
    ChatRoom? chatRoom,
    CounselingSession? session,
    Profile? profile,
    UserStatus? userStatus,
    bool? isCreatingRoom,
    bool? isFetchingMessages,
    bool? isSubscribing,
    bool? isReconnecting,
    bool? isPublishing,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return CounselingPageState(
      chatRoom: chatRoom ?? this.chatRoom,
      session: session ?? this.session,
      profile: profile ?? this.profile,
      userStatus: userStatus ?? this.userStatus,
      isCreatingRoom: isCreatingRoom ?? this.isCreatingRoom,
      isFetchingMessages: isFetchingMessages ?? this.isFetchingMessages,
      isSubscribing: isSubscribing ?? this.isSubscribing,
      isReconnecting: isReconnecting ?? this.isReconnecting,
      isPublishing: isPublishing ?? this.isPublishing,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}