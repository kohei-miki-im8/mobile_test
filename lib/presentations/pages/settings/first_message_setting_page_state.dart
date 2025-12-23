import 'package:econa_mobile_app/core/errors/econa_error.dart';

class FirstMessageSettingPageState {
  const FirstMessageSettingPageState({
    this.greeting = '',
    this.isPersonaGreetingDefault = false,
    this.error,
  });

  final String greeting;
  final bool isPersonaGreetingDefault;
  final EconaError? error;

  static const _unset = Object();

  FirstMessageSettingPageState copyWith({
    String? greeting,
    bool? isPersonaGreetingDefault,
    Object? error = _unset,
  }) {
    final newError = identical(error, _unset) ? this.error : error as EconaError?;
    return FirstMessageSettingPageState(
      greeting: greeting ?? this.greeting,
      isPersonaGreetingDefault:
      isPersonaGreetingDefault ?? this.isPersonaGreetingDefault,
      error: newError,
    );
  }
}