import 'package:econa_mobile_app/core/errors/econa_error.dart';

class WithdrawalPageState {
  const WithdrawalPageState({
    this.confirmedSubscriptionStopped = false,
    this.isLoading = false,
    this.error,
  });

  final bool confirmedSubscriptionStopped;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  WithdrawalPageState copyWith({
    bool? confirmedSubscriptionStopped,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return WithdrawalPageState(
      confirmedSubscriptionStopped: confirmedSubscriptionStopped ?? this.confirmedSubscriptionStopped,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}