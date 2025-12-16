import 'package:econa_mobile_app/core/errors/econa_error.dart';

class AutoMatchingSettingPageState {
  const AutoMatchingSettingPageState({
    this.enableAutoMatching = false,
    this.error,
  });

  final bool enableAutoMatching;
  final EconaError? error;

  static const _unset = Object();

  AutoMatchingSettingPageState copyWith({
    bool? enableAutoMatching,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return AutoMatchingSettingPageState(
      enableAutoMatching: enableAutoMatching ?? this.enableAutoMatching,
      error: newError,
    );
  }
}
