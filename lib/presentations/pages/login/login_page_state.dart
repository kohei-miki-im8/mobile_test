/// LoginPageのUI状態
class LoginPageState {
  const LoginPageState({
    this.isLoading = false,
    this.error,
  });

  final bool isLoading;
  final String? error;

  LoginPageState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return LoginPageState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}


