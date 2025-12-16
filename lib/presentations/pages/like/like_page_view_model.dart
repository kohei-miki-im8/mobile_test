import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/like.dart' as entity;
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/newbie_tag.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/skip_source_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/get_favorite_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_appeal.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_like.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_likes.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/get_skips.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/favorite.dart';
import 'package:econa_mobile_app/infrastructures/repositories/matching.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/like_event_service.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/like/like_page_state.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikePageViewModel extends StateNotifier<LikePageState> {
  LikePageViewModel(this.ref) : super(const LikePageState()) {
    _loadInitial();
  }

  final Ref ref;

  /// 初回ロード
  Future<void> _loadInitial() async {
    await Future.wait([
      // お相手からのLIKE
      loadMoreReceivedLikes(null),
      // 自分からのLIKE（「あなたから」タブ）
      loadMoreSentLikes(null),
      // お気に入り
      _loadInitialFavorites(),
      // プロフィール入力率
      _loadMyProfileInputRate(),
    ]);
  }

  /// ユーザー詳細を設定（UserDetailPageで使用）
  Future<void> setUserDetail({required String userId}) async {
    if (userId.isEmpty) {
      return;
    }

    try {
      // 相手ユーザーのプロフィール詳細を取得
      final response = await ref.read(profileRepositoryProvider).getProfile(
        GetProfileRequest(toUserId: userId),
      );

      // GetProfileResponse から UserDetail を組み立て（Profile + ProfileDetail 両方）
      final detail = UserDetail.fromProfileResponse(
        response,
        userId,
      );

      state = state.copyWith(
        userDetails: <UserDetail>[detail],
      );
    } on Exception {
      // 取得失敗時はエラーを保持（UI側で必要に応じて表示）
      // フォールバックは実装しない（chat_pageとは異なり、like_pageではThumbnailUserがないため）
    }
  }

  /// タブの切り替え処理
  void updateSelectedTabIndex(int index) {
    state = state.copyWith(selectedTabIndex: index);
    // お気に入りは毎回更新
    _loadInitialFavorites();
    // SWR: 表示は維持しつつバックグラウンドで取得
    if (index == 0) {
      _refreshReceivedLikesSWR();
    } else if (index == 1) {
      _refreshSentLikesSWR();
    } else if (index == 2) {
      _refreshSkippedUsersSWR();
    }
  }

  /// SWR: 受信いいねをバックグラウンドで更新
  Future<void> _refreshReceivedLikesSWR() async {
    // 既存の表示を保ちつつ、リフレッシュフラグのみON
    state = state.copyWith(isRefreshingReceived: true, error: null);
    // 先頭から取り直し
    final prevBadges = state.receivedLikesBadgeByUserId;
    final prevVerified = state.receivedLikesVerifiedBadgesByUserId;
    try {
      // 先頭ページ取得
      final repo = ref.read(matchingRepositoryProvider);
      final res = await repo.getLikes(
        GetLikesRequest(
          isSentByMe: false,
          cursor: PagerRequestCursor(limit: 20),
        ),
      );
      // 受信: 相手からのreceived_likeがあり、かつ自分からのlikeが未送信のみ表示
      final filteredUsers = res.thumbnailUsers.toList();
      final newItems = filteredUsers.map<entity.Like>(_convertToLike).toList();
      final Map<String, String> badgeMap = {
        for (final u in res.thumbnailUsers) u.userId: _newbieBadgeText(u)
      }..removeWhere((k, v) => v.isEmpty);
      final Map<String, List<String>> verifiedMap = {
        for (final u in res.thumbnailUsers)
          u.userId: _verifiedBadgesFromCertificateLevel(u)
      }..removeWhere((k, v) => v.isEmpty);
      state = state.copyWith(
        isRefreshingReceived: false,
        receivedLikes: newItems,
        receivedLikesCursorId:
            res.cursor.hasNextCursorId() ? res.cursor.nextCursorId : null,
        receivedLikesBadgeByUserId: {...prevBadges, ...badgeMap},
        receivedLikesVerifiedBadgesByUserId: {...prevVerified, ...verifiedMap},
      );
    } catch (e) {
      state = state.copyWith(
        isRefreshingReceived: false,
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// SWR: 送信いいねをバックグラウンドで更新
  Future<void> _refreshSentLikesSWR() async {
    state = state.copyWith(isRefreshingSent: true, error: null);
    final prevVerified = state.sentLikesVerifiedBadgesByUserId;
    try {
      final repo = ref.read(matchingRepositoryProvider);
      final res = await repo.getLikes(
        GetLikesRequest(
          isSentByMe: true,
          cursor: PagerRequestCursor(limit: 20),
        ),
      );
      // 送信: 自分のlikeがあり、かつ相手からのreceived_likeが未設定（未マッチ）
      final filteredUsers = res.thumbnailUsers.toList();
      final newItems = filteredUsers.map<entity.Like>(_convertToLike).toList();
      // appealed済みの収集
      final appealed = {
        for (final u in filteredUsers)
          if (u.hasLike() && u.like.hasAppealedAt()) u.like.userLikeId
      }..removeWhere((e) => e.isEmpty);
      final Map<String, List<String>> verifiedMap = {
        for (final u in res.thumbnailUsers)
          u.userId: _verifiedBadgesFromCertificateLevel(u)
      }..removeWhere((k, v) => v.isEmpty);
      state = state.copyWith(
        isRefreshingSent: false,
        sentLikes: newItems,
        sentLikesCursorId:
            res.cursor.hasNextCursorId() ? res.cursor.nextCursorId : null,
        sentLikesVerifiedBadgesByUserId: {...prevVerified, ...verifiedMap},
        appealedUserLikeIds:
            appealed.isNotEmpty ? appealed : state.appealedUserLikeIds,
      );
    } catch (e) {
      state = state.copyWith(
        isRefreshingSent: false,
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// SWR: スキップ一覧をバックグラウンドで更新
  Future<void> _refreshSkippedUsersSWR() async {
    state = state.copyWith(isRefreshingSkipped: true, error: null);
    final prevVerified = state.skippedVerifiedBadgesByUserId;
    try {
      final repo = ref.read(matchingRepositoryProvider);
      final res = await repo.getSkips(
        GetSkipsRequest(cursor: PagerRequestCursor(limit: 20)),
      );
      final newItems =
          res.thumbnailUsers.map<entity.Like>(_convertToLike).toList();
      final Map<String, List<String>> verifiedMap = {
        for (final u in res.thumbnailUsers)
          u.userId: _verifiedBadgesFromCertificateLevel(u)
      }..removeWhere((k, v) => v.isEmpty);
      state = state.copyWith(
        isRefreshingSkipped: false,
        skippedUsers: newItems,
        skippedCursorId:
            res.cursor.hasNextCursorId() ? res.cursor.nextCursorId : null,
        skippedVerifiedBadgesByUserId: {...prevVerified, ...verifiedMap},
      );
    } catch (e) {
      state = state.copyWith(
        isRefreshingSkipped: false,
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// 受信いいねのリフレッシュ（毎回最新を取得）
  Future<void> refreshReceivedLikes() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      receivedLikes: <entity.Like>[],
      receivedLikesCursorId: null,
    );
    await loadMoreReceivedLikes(null);
  }

  /// 送信いいねのリフレッシュ
  Future<void> refreshSentLikes() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      sentLikes: <entity.Like>[],
      sentLikesCursorId: null,
    );
    await loadMoreSentLikes(null);
  }

  /// スキップ一覧のリフレッシュ
  Future<void> refreshSkippedUsers() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      skippedUsers: <entity.Like>[],
      skippedCursorId: null,
    );
    await loadMoreSkipped(null);
  }

  /// お気に入りしているユーザー一覧を取得
  Future<void> _loadInitialFavorites() async {
    try {
      final repo = ref.read(favoriteRepositoryProvider);
      final res = await repo.getFavoriteUsers(GetFavoriteUsersRequest(
        cursor: PagerRequestCursor(limit: 20),
      ));
      final ids = res.map((e) => e.id).toSet();
      state = state.copyWith(favoriteUserIds: ids);
    } catch (e) {
      // 取得失敗時はエラーを保持（UI側で必要に応じて表示）
      state = state.copyWith(
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// ページのリロード(未使用：エラー実装時に使用する)
  Future<void> reload() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      receivedLikes: <entity.Like>[],
      receivedLikesCursorId: null,
    );
    await Future.wait([
      loadMoreReceivedLikes(null),
      _loadMyProfileInputRate(),
    ]);
  }

  /// プロフィール入力率を取得
  Future<void> _loadMyProfileInputRate() async {
    try {
      final repo = ref.read(profileRepositoryProvider);
      final res = await repo.getProfile(GetProfileRequest());
      int rate = 0;
      if (res.hasProfile() && res.profile.hasProfileInputRate()) {
        rate = res.profile.profileInputRate;
      }
      state = state.copyWith(myProfileInputRate: rate);
    } catch (e) {
      // 取得失敗時は5秒後に再試行
      Future.delayed(const Duration(seconds: 5), _loadMyProfileInputRate);
    }
  }

  /// お相手からのいいねを取得
  Future<void> loadMoreReceivedLikes(String? cursorId) async {
    try {
      if (cursorId == state.receivedLikesCursorId && cursorId != null) {
        // nullまたは同じカーソルなら何もしない
        return;
      }
      state = state.copyWith(isLoading: true, error: null);
      final repo = ref.read(matchingRepositoryProvider);
      final res = await repo.getLikes(
        GetLikesRequest(
          isSentByMe: false,
          cursor: (cursorId != null)
              ? (PagerRequestCursor(cursorId: cursorId, limit: 20))
              : PagerRequestCursor(limit: 20),
        ),
      );

      final likes =
          res.thumbnailUsers.map<entity.Like>(_convertToLike).toList();

      // NewbieTagを表示用バッジラベルに変換し、userId→labelのMapを構築
      final Map<String, String> badgeMap = {
        for (final u in res.thumbnailUsers) u.userId: _newbieBadgeText(u)
      }..removeWhere((key, value) => value.isEmpty);

      // certificateレベルを表示用バッジラベル配列に変換し、userId→labelsのMapを構築
      final Map<String, List<String>> verifiedBadgesMap = {
        for (final u in res.thumbnailUsers)
          u.userId: _verifiedBadgesFromCertificateLevel(u),
      }..removeWhere((key, value) => value.isEmpty);

      state = state.copyWith(
        isLoading: false,
        receivedLikes: [...state.receivedLikes, ...likes],
        receivedLikesCursorId:
            res.cursor.hasNextCursorId() ? res.cursor.nextCursorId : null,
        receivedLikesBadgeByUserId: {
          ...state.receivedLikesBadgeByUserId,
          ...badgeMap,
        },
        receivedLikesVerifiedBadgesByUserId: {
          ...state.receivedLikesVerifiedBadgesByUserId,
          ...verifiedBadgesMap,
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// 自分からのいいねを取得
  Future<void> loadMoreSentLikes(String? cursorId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final repo = ref.read(matchingRepositoryProvider);
      final res = await repo.getLikes(
        GetLikesRequest(
          isSentByMe: true,
          cursor: (cursorId != null)
              ? (PagerRequestCursor(cursorId: cursorId, limit: 20))
              : PagerRequestCursor(limit: 20),
        ),
      );
      final filteredUsers = res.thumbnailUsers
          .where((u) => u.hasLike() && !u.hasReceivedLike())
          .toList();
      final newItems = filteredUsers.map<entity.Like>(_convertToLike).toList();
      final appealed = {
        for (final u in filteredUsers)
          if (u.hasLike() && u.like.hasAppealedAt()) u.like.userLikeId
      }..removeWhere((e) => e.isEmpty);

      // eKYCレベルを表示用バッジラベル配列に変換し、userId→labelsのMapを構築
      final Map<String, List<String>> verifiedBadgesMap = {
        for (final u in res.thumbnailUsers)
          u.userId: _verifiedBadgesFromCertificateLevel(u)
      }..removeWhere((key, value) => value.isEmpty);

      state = state.copyWith(
        isLoading: false,
        sentLikes: [...state.sentLikes, ...newItems],
        sentLikesCursorId:
            res.cursor.hasNextCursorId() ? res.cursor.nextCursorId : null,
        sentLikesVerifiedBadgesByUserId: {
          ...state.sentLikesVerifiedBadgesByUserId,
          ...verifiedBadgesMap,
        },
        appealedUserLikeIds: {
          ...state.appealedUserLikeIds,
          ...appealed,
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// スキップしたユーザー一覧を取得
  Future<void> loadMoreSkipped(String? cursorId) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      final repo = ref.read(matchingRepositoryProvider);
      final res = await repo.getSkips(
        GetSkipsRequest(
          cursor: (cursorId != null)
              ? (PagerRequestCursor(cursorId: cursorId, limit: 20))
              : PagerRequestCursor(limit: 20),
        ),
      );

      final newItems =
          res.thumbnailUsers.map<entity.Like>(_convertToLike).toList();

      // eKYCレベルを表示用バッジラベル配列に変換し、userId→labelsのMapを構築
      final Map<String, List<String>> verifiedBadgesMap = {
        for (final u in res.thumbnailUsers)
          u.userId: _verifiedBadgesFromCertificateLevel(u)
      }..removeWhere((key, value) => value.isEmpty);

      state = state.copyWith(
        isLoading: false,
        skippedUsers: [...state.skippedUsers, ...newItems],
        skippedCursorId:
            res.cursor.hasNextCursorId() ? res.cursor.nextCursorId : null,
        skippedVerifiedBadgesByUserId: {
          ...state.skippedVerifiedBadgesByUserId,
          ...verifiedBadgesMap,
        },
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// いいね送信
  Future<Matching?> createLike({
    required entity.Like toUserLike,
    bool fromSkipTab = false,
    String? superLikeMessage,
  }) async {
    try {
      state = state.copyWith(error: null);
      final repo = ref.read(matchingRepositoryProvider);
      final fromUserId = await ref.read(currentUserIdProvider.future);
      final response = await repo.createLike(
        CreateLikeRequest(
          toUserId: toUserLike.userId,
          superLikeMessage: superLikeMessage,
        ),
      );

      // 送信成功時は該当ユーザーを受信リストから取り除き、likedとして記録
      final updatedLikedIds = Set<String>.from(state.likedUserIds)
        ..add(toUserLike.userId);
      state = state.copyWith(
        receivedLikes: state.receivedLikes
            .where((e) => e.userId != toUserLike.userId)
            .toList(),
        likedUserIds: updatedLikedIds,
      );

      if (fromSkipTab) {
        AdjustEventTracker.trackLikeThanks();
      } else {
        AdjustEventTracker.trackLike();
      }
      if (!response.hasChatRoomId()) {
        return null;
      }
      // Push 通知用のいいねイベントを記録（失敗してもアプリの挙動には影響させない）
      // fire-and-forget でよいため、await はしない
      // ignore: discarded_futures
      LikeEventService.logLikeEvent(
        fromUserId: fromUserId,
        toUserId: toUserLike.userId,
      );
      AdjustEventTracker.trackMatching();
      return Matching(
        myUserId: fromUserId,
        chatRoomId: response.chatRoomId,
        toUserId: toUserLike.userId,
        toUserBestImageUrl:
            toUserLike.getBestImageUrl(ImageSize.largeThumbnailWebp) ?? '',
        isToUserMale: toUserLike.isMale,
      );
    } on Exception catch (e) {
      final EconaError econaError;
      if (e.toString().contains('insufficient points')) {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.lackOfMp,
        );
      } else if (e.toString().contains('already_exists') || e.toString().contains('already exists')) {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.likeAlreadyExists,
        );
      } else {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.like,
        );
      }
      // エラーはstateに反映（画面はそのまま）
      state = state.copyWith(error: econaError);
      return null;
    }
  }

  /// スキップ送信
  Future<void> createSkip({required String toUserId}) async {
    try {
      final repo = ref.read(matchingRepositoryProvider);
      await repo.createSkip(
        CreateSkipRequest(
          toUserId: toUserId,
          skipSource: SkipSourceCode.SKIP_SOURCE_CODE_INCOMING_LIKES,
        ),
      );
      // 成功時は該当ユーザーを受信から取り除く
      state = state.copyWith(
        receivedLikes:
            state.receivedLikes.where((e) => e.userId != toUserId).toList(),
      );
      AdjustEventTracker.trackSkip();
    } catch (e) {
      state = state.copyWith(
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// アピールを送信
  Future<void> createAppeal({required String userLikeId}) async {
    try {
      // 先にエラーだけクリア
      state = state.copyWith(error: null);

      final repo = ref.read(matchingRepositoryProvider);
      await repo.createAppeal(
        CreateAppealRequest(userLikeId: userLikeId),
      );
      AdjustEventTracker.trackAppeal();

      // 成功したときだけ appealedUserLikeIds に追加（ここで初めてボタンが非活性になる）
      final updatedAppealedIds = {
        ...state.appealedUserLikeIds,
        userLikeId,
      };
      state = state.copyWith(appealedUserLikeIds: updatedAppealedIds);
    } on Exception catch (e) {
      final EconaError econaError;
      if (e.toString().contains('insufficient points')) {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.lackOfMp,
        );
      } else {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.unknown,
        );
      }
      state = state.copyWith(error: econaError);
    }
  }

  /// お気に入り更新
  Future<void> updateFavorite(
      {required String userId, required bool favorite}) async {
    try {
      final repo = ref.read(favoriteRepositoryProvider);
      await repo.updateUserFavorite(UpdateUserFavoriteRequest(
        toUserId: userId,
        favorite: favorite,
      ));
      final updatedFavoriteUserIds = Set<String>.from(state.favoriteUserIds);
      if (favorite) {
        updatedFavoriteUserIds.add(userId);
      } else {
        updatedFavoriteUserIds.remove(userId);
      }
      state = state.copyWith(favoriteUserIds: updatedFavoriteUserIds);
    } catch (e) {
      state = state.copyWith(
        error: EconaError.fromException(
          e is Exception ? e : Exception(e.toString()),
          operation: EconaErrorOperation.likeFetch,
        ),
      );
    }
  }

  /// ブーストアクションを実行
  Future<void> onBoost() async {
    try {
      state = state.copyWith(error: null);
      final userRepository = ref.read(userRepositoryProvider);

      // ブーストリクエストを作成
      final request = CreateUserBoostRequest();

      await userRepository.createUserBoost(request);
      AdjustEventTracker.trackBoost();
    } on Exception catch (e) {
      final EconaError econaError;
      if (e.toString().contains('insufficient points')) {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.lackOfMp,
        );
      } else {
        econaError = EconaError.fromException(
          e,
          operation: EconaErrorOperation.boost,
        );
      }
      state = state.copyWith(error: econaError);
    }
  }

  /// ThumbnailUserをドメインエンティティ(Like)に変換
  entity.Like _convertToLike(ThumbnailUser user) {
    // 共通の変換ロジック（eKYCバッジ含む）はEntity側に集約
    return entity.Like.fromProto(user);
  }

  /// NewbieTagを表示用バッジラベルに変換
  String _newbieBadgeText(ThumbnailUser u) {
    return switch (u.newbieTag) {
      NewbieTag.NEWBIE_TAG_2_WEEKS => 'NEW',
      NewbieTag.NEWBIE_TAG_1_MONTH => '今月入会',
      NewbieTag.NEWBIE_TAG_UNSPECIFIED => '',
      NewbieTag() => '',
    };
  }

  /// Certificateレベルを表示用バッジラベル配列に変換
  List<String> _verifiedBadgesFromCertificateLevel(ThumbnailUser u) {
    final badges = <String>[];
    final code = u.userStatus.certificateLevelCode;
    switch (code) {
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_VERIFIED:
        badges.add('本人確認');
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED:
        badges.addAll(['本人確認', '独身証明']);
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNSPECIFIED:
      case CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNVERIFIED:
    }
    return badges;
  }
}

final likePageViewModelProvider =
    StateNotifierProvider<LikePageViewModel, LikePageState>(
        LikePageViewModel.new);
