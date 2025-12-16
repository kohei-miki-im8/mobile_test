class EmailLinkAuthState {
  const EmailLinkAuthState({
    this.email,
    this.error,
  });

  final String? email;
  final String? error;

  EmailLinkAuthState copyWith({
    String? email,
    String? error,
  }) {
    return EmailLinkAuthState(
      email: email ?? this.email,
      error: error,
    );
  }
}


