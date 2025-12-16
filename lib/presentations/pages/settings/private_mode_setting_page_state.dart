import 'package:econa_mobile_app/core/errors/econa_error.dart';

class PrivateModeSettingPageState {
  const PrivateModeSettingPageState({
    this.enablePrivateMode = false,
    this.error,
  });

  final bool enablePrivateMode;
  final EconaError? error;

  static const _unset = Object();

  PrivateModeSettingPageState copyWith({
    bool? enablePrivateMode,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset) ? this.error : error as EconaError?;
    return PrivateModeSettingPageState(
      enablePrivateMode: enablePrivateMode ?? this.enablePrivateMode,
      error: newError,
    );
  }
}