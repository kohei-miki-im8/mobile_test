import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/withdrawal_reason_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/withdraw_user.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/pages/withdrawal/withdrawal_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WithdrawalPageViewModel extends StateNotifier<WithdrawalPageState> {
  WithdrawalPageViewModel(this.ref) : super(const WithdrawalPageState());

  final Ref ref;

  /// 退会処理
  Future<bool?> withdrawUser({
    required WithdrawalReasonCode reasonCode,
    String? reasonDetail,
  }) async {
    if(state.isLoading) return null;

    state = state.copyWith(isLoading: true, error: null);

    try {
      await ref.read(userRepositoryProvider).withdrawUser(
        WithdrawUserRequest(
          reasonCode: reasonCode,
          reasonDetail: reasonDetail,
          confirmedSubscriptionStopped: state.confirmedSubscriptionStopped,
        ),
      );
      AdjustEventTracker.trackWithdrawal();

      return true;
    } on Exception catch (e) {
      final econaError = EconaError.fromException(
        e,
        operation: EconaErrorOperation.withdrawal,
      );
      state = state.copyWith(error: econaError);

      return false;
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// 有料プランの自動停止確認
  void setConfirmedSubscriptionStopped({
    required bool confirmedSubscriptionStopped,
  }) {
    state = state.copyWith(
      confirmedSubscriptionStopped: confirmedSubscriptionStopped,
    );
  }

}

final withdrawalPageViewModelProvider =
StateNotifierProvider<WithdrawalPageViewModel, WithdrawalPageState>(
  WithdrawalPageViewModel.new,
);