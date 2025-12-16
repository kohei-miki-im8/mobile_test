import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/update_user_block.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/update_user_hide.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/block.dart';
import 'package:econa_mobile_app/infrastructures/repositories/hide.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/components/options_modal_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final logger = Logger();

/// OptionsModalのViewModel
class OptionsModalViewModel extends AutoDisposeNotifier<OptionsModalState> {
  @override
  OptionsModalState build() {
    return const OptionsModalState();
  }

  /// エラー状態をクリア
  void clearError() {
    state = state.clearError();
  }

  /// ユーザーを非表示にする
  Future<void> hideUser(String userId) async {
    try {
      // エラー状態をクリア
      clearError();

      final hideRepository = ref.read(hideRepositoryProvider);

      // ユーザー非表示リクエストを作成
      final request = UpdateUserHideRequest(
        toUserId: userId,
        hide: true,
      );

      await hideRepository.updateUserHide(request);
      AdjustEventTracker.trackHide();
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.hide,
      );
      state = state.setError(econaError);
    }
  }

  /// ユーザーをブロックする
  Future<void> blockUser(String userId) async {
    try {
      // エラー状態をクリア
      clearError();

      final blockRepository = ref.read(blockRepositoryProvider);

      // ユーザーブロックリクエストを作成
      final request = UpdateUserBlockRequest(
        toUserId: userId,
        block: true,
      );

      await blockRepository.updateUserBlock(request);
      AdjustEventTracker.trackBlock();
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.block,
      );
      state = state.setError(econaError);
    }
  }
}

final optionsModalViewModelProvider =
    AutoDisposeNotifierProvider<OptionsModalViewModel, OptionsModalState>(
  OptionsModalViewModel.new,
);
