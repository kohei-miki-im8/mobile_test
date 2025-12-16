import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/like.dart' as entity;
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/provider_interface.dart';

class LikePageState implements UserDetailsProvider {
  const LikePageState({
    this.selectedTabIndex = 0,
    this.isRefreshingReceived = false,
    this.isRefreshingSent = false,
    this.isRefreshingSkipped = false,
    this.receivedLikes = const [],
    this.receivedLikesCursorId,
    this.receivedLikesBadgeByUserId = const {},
    this.myProfileInputRate,
    this.receivedLikesVerifiedBadgesByUserId = const {},
    this.sentLikes = const [],
    this.sentLikesCursorId,
    this.sentLikesVerifiedBadgesByUserId = const {},
    this.skippedUsers = const [],
    this.skippedCursorId,
    this.skippedVerifiedBadgesByUserId = const {},
    this.favoriteUserIds = const {},
    this.appealedUserLikeIds = const {},
    this.likedUserIds = const {},
    this.userDetails = const [],
    this.isLoading = false,
    this.error,
  });

  final int selectedTabIndex;
  final bool isRefreshingReceived;
  final bool isRefreshingSent;
  final bool isRefreshingSkipped;
  final List<entity.Like> receivedLikes;
  final String? receivedLikesCursorId;
  final Map<String, String> receivedLikesBadgeByUserId;
  final int? myProfileInputRate;
  final Map<String, List<String>> receivedLikesVerifiedBadgesByUserId;
  final List<entity.Like> sentLikes;
  final String? sentLikesCursorId;
  final Map<String, List<String>> sentLikesVerifiedBadgesByUserId;
  final List<entity.Like> skippedUsers;
  final String? skippedCursorId;
  final Map<String, List<String>> skippedVerifiedBadgesByUserId;
  final Set<String> favoriteUserIds;
  final Set<String> appealedUserLikeIds;
  final Set<String> likedUserIds;
  final List<UserDetail> userDetails;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  LikePageState copyWith({
    int? selectedTabIndex,
    bool? isRefreshingReceived,
    bool? isRefreshingSent,
    bool? isRefreshingSkipped,
    List<entity.Like>? receivedLikes,
    String? receivedLikesCursorId,
    Map<String, String>? receivedLikesBadgeByUserId,
    int? myProfileInputRate,
    Map<String, List<String>>? receivedLikesVerifiedBadgesByUserId,
    List<entity.Like>? sentLikes,
    String? sentLikesCursorId,
    Map<String, List<String>>? sentLikesVerifiedBadgesByUserId,
    List<entity.Like>? skippedUsers,
    String? skippedCursorId,
    Map<String, List<String>>? skippedVerifiedBadgesByUserId,
    Set<String>? favoriteUserIds,
    Set<String>? appealedUserLikeIds,
    Set<String>? likedUserIds,
    List<UserDetail>? userDetails,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return LikePageState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      isRefreshingReceived: isRefreshingReceived ?? this.isRefreshingReceived,
      isRefreshingSent: isRefreshingSent ?? this.isRefreshingSent,
      isRefreshingSkipped: isRefreshingSkipped ?? this.isRefreshingSkipped,
      receivedLikes: receivedLikes ?? this.receivedLikes,
      receivedLikesCursorId:
          receivedLikesCursorId ?? this.receivedLikesCursorId,
      receivedLikesBadgeByUserId:
          receivedLikesBadgeByUserId ?? this.receivedLikesBadgeByUserId,
      myProfileInputRate: myProfileInputRate ?? this.myProfileInputRate,
      receivedLikesVerifiedBadgesByUserId:
          receivedLikesVerifiedBadgesByUserId ??
              this.receivedLikesVerifiedBadgesByUserId,
      sentLikes: sentLikes ?? this.sentLikes,
      sentLikesCursorId: sentLikesCursorId ?? this.sentLikesCursorId,
      sentLikesVerifiedBadgesByUserId: sentLikesVerifiedBadgesByUserId ??
          this.sentLikesVerifiedBadgesByUserId,
      skippedUsers: skippedUsers ?? this.skippedUsers,
      skippedCursorId: skippedCursorId ?? this.skippedCursorId,
      skippedVerifiedBadgesByUserId:
          skippedVerifiedBadgesByUserId ?? this.skippedVerifiedBadgesByUserId,
      favoriteUserIds: favoriteUserIds ?? this.favoriteUserIds,
      appealedUserLikeIds: appealedUserLikeIds ?? this.appealedUserLikeIds,
      likedUserIds: likedUserIds ?? this.likedUserIds,
      userDetails: userDetails ?? this.userDetails,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}
