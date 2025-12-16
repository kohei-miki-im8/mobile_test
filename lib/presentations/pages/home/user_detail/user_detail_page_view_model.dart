import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/signed_image_urls.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/matching/v1/create_like.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/matching.dart';
import 'package:econa_mobile_app/presentations/pages/home/matching_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page_state.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ユーザー詳細ページのViewModel
class UserDetailPageViewModel extends AutoDisposeNotifier<UserDetailPageState> {
  @override
  UserDetailPageState build() => const UserDetailPageState();

  /// ユーザーを設定
  void setUser(UserDetail user) {
    state = state.copyWith(userDetail: user).clearError();
  }

  /// ローディング状態を設定
  void setLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  /// エラーを設定
  void setError(EconaError error) {
    state = state.setError(error).copyWith(isLoading: false);
  }

  /// 状態をリセット
  void reset() {
    state = const UserDetailPageState();
  }

  /// エラー状態をクリア
  void clearError() {
    state = state.clearError();
  }

  /// メッセージ付きいいねアクションを実行
  Future<Matching?> onMessageLike(UserDetail userDetail, String message) async {
    try {
      if (!state.hasUser) {
        return null;
      }

      final matchingRepository = ref.read(matchingRepositoryProvider);

      // メッセージ付きいいねリクエストを作成
      final request = CreateLikeRequest(
        toUserId: userDetail.profile.userId,
        superLikeMessage: message,
      );

      final response = await matchingRepository.createLike(request);
      if (!response.hasChatRoomId()) {
        return null;
      }
      return Matching(
        chatRoomId: response.chatRoomId,
        myUserId: await ref.read(currentUserIdProvider.future),
        toUserId: userDetail.profile.userId,
        toUserBestImageUrl:
        userDetail.profile.getBestImageUrl(ImageSize.largeThumbnailWebp) ??
            '',
        isToUserMale: userDetail.profile.isMale,
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
      setError(econaError);
      return null;
    }
  }

  /// いいねアクションを実行
  Future<Matching?> onLike(UserDetail userDetail) async {
    try {
      if (!state.hasUser) {
        return null;
      }

      final matchingRepository = ref.read(matchingRepositoryProvider);

      // いいねリクエストを作成
      final request = CreateLikeRequest(
        toUserId: userDetail.profile.userId,
      );

      final response = await matchingRepository.createLike(request);
      if (!response.hasChatRoomId()) {
        return null;
      }
      return Matching(
        chatRoomId: response.chatRoomId,
        myUserId: await ref.read(currentUserIdProvider.future),
        toUserId: userDetail.profile.userId,
        toUserBestImageUrl:
            userDetail.profile.getBestImageUrl(ImageSize.largeThumbnailWebp) ??
                '',
        isToUserMale: userDetail.profile.isMale,
      );
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.like,
      );
      setError(econaError);
      return null;
    }
  }
}

final userDetailPageViewModelProvider =
    AutoDisposeNotifierProvider<UserDetailPageViewModel, UserDetailPageState>(
  UserDetailPageViewModel.new,
);
