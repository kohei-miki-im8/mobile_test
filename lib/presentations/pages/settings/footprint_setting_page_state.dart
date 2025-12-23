import 'package:econa_mobile_app/core/errors/econa_error.dart';

class FootprintSettingPageState {
  const FootprintSettingPageState({
    this.enableFootprint = true,
    this.error,
  });

  final bool enableFootprint;
  final EconaError? error;

  static const _unset = Object();

  FootprintSettingPageState copyWith({
    bool? enableFootprint,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return FootprintSettingPageState(
      enableFootprint: enableFootprint ?? this.enableFootprint,
      error: newError,
    );
  }
}