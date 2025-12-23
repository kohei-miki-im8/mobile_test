import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/matching_reason.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/favorite/v1/update_user_favorite.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_affinity_recommendation_users.pb.dart'
    as pb;
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/tag/v1/get_user_tags.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/user_tag.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/favorite.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/infrastructures/repositories/search.dart';
import 'package:econa_mobile_app/infrastructures/repositories/tag.dart';
import 'package:econa_mobile_app/presentations/components/loading_state.dart';
import 'package:econa_mobile_app/presentations/pages/rashisa_match/rashisa_match_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RashisaMatchPageViewModel
    extends AutoDisposeNotifier<RashisaMatchPageState> {
  @override
  RashisaMatchPageState build() {
    // 初期化処理を非同期で実行
    Future.microtask(getRashisaMatchUsers);
    return const RashisaMatchPageState();
  }

  Future<void> getRashisaMatchUsers({bool regenerate = false}) async {
    // 進捗をリセット
    ref.read(loadingProgressProvider.notifier).reset();
    state = state.copyWith(isLoading: true, error: null);

    // 進捗: 10% - らしさマッチユーザー取得開始
    ref.read(loadingProgressProvider.notifier).updateProgress(10);

    try {
      // らしさマッチユーザーIDとマッチング理由を取得
      final affinityResponse = await ref
          .read(searchRepositoryProvider)
          .getAffinityRecommendationUsers(
            pb.GetAffinityRecommendationUsersRequest(
              regenerate: regenerate,
              limit: 5,
            ),
          );

      // 進捗: 30% - らしさマッチユーザーID取得完了
      ref.read(loadingProgressProvider.notifier).updateProgress(30);

      // 各ユーザーのプロフィールとタグを並列で取得
      final userDetails = await Future.wait(
        affinityResponse.users.map((affinityUser) async {
          // プロフィールとタグを並列で取得
          final profileFuture = ref
              .read(profileRepositoryProvider)
              .getProfile(GetProfileRequest(toUserId: affinityUser.userId));
          final tagsFuture = ref
              .read(tagRepositoryProvider)
              .getUserTags(GetUserTagsRequest(userId: affinityUser.userId));

          final profileResponse = await profileFuture;
          // getUserTagsが失敗した場合はnullを返す（画面上ではタグのみ表示をしない）
          List<UserTag>? tags;
          try {
            tags = (await tagsFuture).userTags;
          } on Exception {
            tags = null;
          }

          // MatchingReasonエンティティを作成（protobufから変換）
          final matchingReason = affinityUser.hasMatchingReason()
              ? MatchingReason.fromProto(affinityUser.matchingReason)
              : null;

          // UserDetailエンティティを作成
          return UserDetail.fromProfileResponse(
            profileResponse,
            affinityUser.userId,
            matchingReason: matchingReason,
            tags: tags,
          );
        }),
      );

      // 進捗: 80% - らしさマッチユーザー取得完了
      ref.read(loadingProgressProvider.notifier).updateProgress(80);

      state = state.copyWith(
        rashisaMatchUsers: userDetails,
        isLoading: false,
        error: null,
      );

      // 進捗: 100% - 完了
      ref.read(loadingProgressProvider.notifier).updateProgress(100);
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.rashisaMatchUsersFetch,
      );
      state = state.copyWith(
        isLoading: false,
        error: econaError,
      );
    }
  }

  Future<void> updateUserFavorite({
    required String toUserId,
    required bool favorite,
  }) async {
    try {
      await ref.read(favoriteRepositoryProvider).updateUserFavorite(
            UpdateUserFavoriteRequest(
              toUserId: toUserId,
              favorite: favorite,
            ),
          );

      // ローカルの状態を更新してUIに反映
      final updatedUsers = state.rashisaMatchUsers.map((user) {
        if (user.profile.userId == toUserId) {
          return user.copyWith(
            profile: user.profile.copyWith(isFavorite: favorite),
          );
        }
        return user;
      }).toList();

      state = state.copyWith(rashisaMatchUsers: updatedUsers);
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.favoriteUsersFetch,
      );
      state = state.copyWith(error: econaError);
    }
  }
}

final rashisaMatchPageViewModelProvider = AutoDisposeNotifierProvider<
    RashisaMatchPageViewModel, RashisaMatchPageState>(
  RashisaMatchPageViewModel.new,
);
