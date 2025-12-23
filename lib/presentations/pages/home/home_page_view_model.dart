import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/skip_source_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_like.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/delete_skip.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_latest_user_search_conditions.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_search_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_boost.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/matching.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/search.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/infrastructures/services/like_event_service.dart';
import 'package:econa_mobile_app/presentations/pages/home/home_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_state.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ホームページのViewModel
class HomePageViewModel extends AutoDisposeNotifier<HomePageState> {
  @override
  HomePageState build() {
    // 初期化処理を非同期で実行
    Future.microtask(() async {
      await getRecommendationUsers(
        GetRecommendationUsersRequest(
          cursor: PagerRequestCursor(limit: 20),
        ),
      );
    });
    return const HomePageState();
  }

  /// おすすめユーザーを取得
  Future<void> getRecommendationUsers(
    GetRecommendationUsersRequest request,
  ) async {
    try {
      state = state.copyWith(isLoading: true);
      final searchRepository = ref.read(searchRepositoryProvider);

      final response = await searchRepository.getRecommendationUsers(request);

      // ThumbnailUserをProfileに変換
      final profiles =
          response.thumbnailUsers.map(Profile.fromThumbnailUser).toList();

      // カーソルIDを取得
      final nextCursorId =
          response.hasCursor() && response.cursor.hasNextCursorId()
              ? response.cursor.nextCursorId
              : null;

      // 状態を更新
      state = state.copyWith(
        profiles: profiles,
        isLoading: false,
        nextCursorId: nextCursorId,
        error: null,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.recommendationUsersFetch,
      );
      state = state.copyWith(
        isLoading: false,
        error: econaError,
      );
    }
  }

  /// リバースアクションを実行
  Future<bool> onReverse(int previousIndex) async {
    try {
      if (state.profiles.isEmpty) {
        return false;
      }

      final matchingRepository = ref.read(matchingRepositoryProvider);
      final previousProfile = state.profiles[previousIndex];
      final request = DeleteSkipRequest(
        toUserId: previousProfile.userId,
      );

      await matchingRepository.deleteSkip(request);
      AdjustEventTracker.trackReverse();

      // スキップされたユーザーIDから削除
      final updatedSkippedUserIds = {
        ...state.skippedUserIds,
      }..remove(previousProfile.userId);
      state = state.copyWith(skippedUserIds: updatedSkippedUserIds);
      return true;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.reverse,
      );
      state = state.copyWith(error: econaError);
      return false;
    }
  }

  /// スキップアクションを実行
  Future<void> onSkip(int currentIndex) async {
    try {
      if (state.profiles.isEmpty) {
        return;
      }

      final matchingRepository = ref.read(matchingRepositoryProvider);
      final currentProfile = state.profiles[currentIndex];

      // スキップリクエストを作成
      final request = CreateSkipRequest(
        toUserId: currentProfile.userId,
        skipSource: SkipSourceCode.SKIP_SOURCE_CODE_HOME,
      );

      await matchingRepository.createSkip(request);

      // スキップされたユーザーIDを記録
      final updatedSkippedUserIds = {
        ...state.skippedUserIds,
        currentProfile.userId,
      };
      state = state.copyWith(skippedUserIds: updatedSkippedUserIds);
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.skip,
      );
      state = state.copyWith(error: econaError);
    }
  }

  /// メッセージ付きいいねアクションを実行
  Future<Matching?> onMessageLike(int currentIndex, String message) async {
    try {
      state = state.copyWith(error: null);
      if (state.profiles.isEmpty) {
        return null;
      }

      final matchingRepository = ref.read(matchingRepositoryProvider);
      final currentProfile = state.profiles[currentIndex];
      final fromUserId = await ref.read(currentUserIdProvider.future);

      // メッセージ付きいいねリクエストを作成
      final request = CreateLikeRequest(
        toUserId: currentProfile.userId,
        superLikeMessage: message,
      );

      final response = await matchingRepository.createLike(request);
      AdjustEventTracker.trackLikeWithMessage();

      // Push 通知用のいいねイベントを記録（失敗してもアプリの挙動には影響させない）
      unawaited(
        LikeEventService.logLikeEvent(
          fromUserId: fromUserId,
          toUserId: currentProfile.userId,
        ),
      );

      if (!response.hasChatRoomId()) {
        return null;
      }
      AdjustEventTracker.trackMatching();
      return Matching(
        chatRoomId: response.chatRoomId,
        myUserId: fromUserId,
        toUserId: currentProfile.userId,
        toUserBestImageUrl:
            currentProfile.getBestImageUrl(ImageSize.largeThumbnailWebp) ?? '',
        isToUserMale: currentProfile.isMale,
      );
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
          operation: EconaErrorOperation.messageLike,
        );
      }
      state = state.copyWith(error: econaError);
      return null;
    }
  }

  /// 指定したユーザーIDのプロフィールを現在のカードスタックから削除する
  void removeProfileByUserId(String userId) {
    if (state.profiles.isEmpty) {
      return;
    }

    final updatedProfiles = state.profiles
        .where(
          (profile) => profile.userId != userId,
        )
        .toList();

    state = state.copyWith(
      profiles: updatedProfiles,
    );
  }

  /// いいねアクションを実行
  Future<Matching?> onLike(int currentIndex) async {
    try {
      if (state.profiles.isEmpty) {
        return null;
      }

      final matchingRepository = ref.read(matchingRepositoryProvider);
      final currentProfile = state.profiles[currentIndex];
       final fromUserId = await ref.read(currentUserIdProvider.future);

      // いいねリクエストを作成
      final request = CreateLikeRequest(
        toUserId: currentProfile.userId,
      );

      final response = await matchingRepository.createLike(request);
      AdjustEventTracker.trackLike();

      // Push 通知用のいいねイベントを記録（失敗してもアプリの挙動には影響させない）
      unawaited(
        LikeEventService.logLikeEvent(
          fromUserId: fromUserId,
          toUserId: currentProfile.userId,
        ),
      );

      if (!response.hasChatRoomId()) {
        return null;
      }
      AdjustEventTracker.trackMatching();
      return Matching(
        chatRoomId: response.chatRoomId,
        myUserId: fromUserId,
        toUserId: currentProfile.userId,
        toUserBestImageUrl:
            currentProfile.getBestImageUrl(ImageSize.largeThumbnailWebp) ?? '',
        isToUserMale: currentProfile.isMale,
      );
    } on Exception catch (e) {
      final EconaError econaError;
      if (e.toString().contains('already_exists') || e.toString().contains('already exists')) {
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
      state = state.copyWith(error: econaError);
      return null;
    }
  }

  /// ブーストアクションを実行
  Future<void> onBoost() async {
    try {
      state = state.copyWith(error: null);
      if (state.profiles.isEmpty) {
        return;
      }

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

  Future<void> getSearchUsers(GetSearchUsersRequest request) async {
    try {
      state = state.copyWith(isLoading: true);
      final searchRepository = ref.read(searchRepositoryProvider);

      final response = await searchRepository.getSearchUsers(request);

      // ThumbnailUserをProfileDataに変換
      final profiles =
          response.thumbnailUsers.map(Profile.fromThumbnailUser).toList();

      // 状態を更新
      state = state.copyWith(
        profiles: profiles,
        isLoading: false,
        error: null,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.recommendationUsersFetch,
      );
      state = state.copyWith(
        isLoading: false,
        error: econaError,
      );
    }
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

      // 既存のuserDetailsに追加または更新
      final existingDetails = List<UserDetail>.from(state.userDetails);
      final index = existingDetails.indexWhere(
        (ud) => ud.profile.userId == userId,
      );
      if (index >= 0) {
        existingDetails[index] = detail;
      } else {
        existingDetails.add(detail);
      }

      state = state.copyWith(
        userDetails: existingDetails,
      );
    } on Exception {
      // 取得失敗時はエラーを保持（UI側で必要に応じて表示）
      // フォールバックは実装しない
    }
  }

  /// エラー状態をクリア
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// 前回の検索条件を取得
  Future<GetLatestUserSearchConditionsResponse> getLatestUserSearchConditions(
    GetLatestUserSearchConditionsRequest request,
  ) async {
    try {
      final searchRepository = ref.read(searchRepositoryProvider);

      final response =
          await searchRepository.getLatestUserSearchConditions(request);

      return response;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.latestUserSearchConditionsFetch,
      );
      state = state.copyWith(error: econaError);
      return GetLatestUserSearchConditionsResponse();
    }
  }

  /// LIKEポイントを1ポイント以上持っているか判定
  Future<bool> hasLikePoint() async {
    try {
      final userRepository = ref.read(userRepositoryProvider);
      final response = await userRepository.getUserPoints(
        GetUserPointsRequest(),
      );

      // 無料分＋有料分
      final totalLikePoint = response.freeLikePoint + response.likePoint;
      return totalLikePoint > 0;
    } on Exception {
      // 判定に失敗した場合は「ないもの」とみなすか
      // ひとまず false を返す実装にしている
      return false;
    }
  }
}

final homePageViewModelProvider =
    AutoDisposeNotifierProvider<HomePageViewModel, HomePageState>(
  HomePageViewModel.new,
);
