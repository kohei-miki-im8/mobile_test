import 'package:econa_mobile_app/core/errors/econa_error.dart';

class LikeReceiveSettingPageState {
  const LikeReceiveSettingPageState({
    this.likeReceiveLimitLabel = '無制限',
    this.error,
  });

  final String likeReceiveLimitLabel;
  final EconaError? error;

  static const _unset = Object();

  LikeReceiveSettingPageState copyWith({
    String? likeReceiveLimitLabel,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return LikeReceiveSettingPageState(
      likeReceiveLimitLabel: likeReceiveLimitLabel ?? this.likeReceiveLimitLabel,
      error: newError,
    );
  }
}