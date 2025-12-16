import 'package:econa_mobile_app/core/errors/econa_error.dart';

class OfflineSettingPageState {
  const OfflineSettingPageState({
    this.enableOfflineMode = false,
    this.error,
  });

  final bool enableOfflineMode;
  final EconaError? error;

  static const _unset = Object();

  OfflineSettingPageState copyWith({
    bool? enableOfflineMode,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset) ? this.error : error as EconaError?;
    return OfflineSettingPageState(
      enableOfflineMode: enableOfflineMode ?? this.enableOfflineMode,
      error: newError,
    );
  }
}
