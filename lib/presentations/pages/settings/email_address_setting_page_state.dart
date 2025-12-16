import 'package:econa_mobile_app/core/errors/econa_error.dart';

class EmailAddressSettingPageState {
  const EmailAddressSettingPageState({
    this.eMailAddress = '',
    this.error,
  });

  final String eMailAddress;
  final EconaError? error;

  static const _unset = Object();

  EmailAddressSettingPageState copyWith({
    String? eMailAddress,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset)
        ? this.error
        : error as EconaError?;

    return EmailAddressSettingPageState(
      eMailAddress: eMailAddress ?? this.eMailAddress,
      error: newError,
    );
  }
}
