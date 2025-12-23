import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/subscription_status.dart';

class CurrentPlanPageState {
  const CurrentPlanPageState({
    this.subscriptionStatus,
    this.isLoading = false,
    this.error,
  });

  final SubscriptionStatus? subscriptionStatus;
  final bool isLoading;
  final EconaError? error;

  static const _unset = Object();

  CurrentPlanPageState copyWith({
    SubscriptionStatus? subscriptionStatus,
    bool? isLoading,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return CurrentPlanPageState(
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      isLoading: isLoading ?? this.isLoading,
      error: newError,
    );
  }
}