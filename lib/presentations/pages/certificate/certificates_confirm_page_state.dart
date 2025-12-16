/// 証明書確認ページの状態（State分離）
class CertificateConfirmState {
  const CertificateConfirmState({
    this.upperCheckBoxValue = false,
    this.lowerCheckBoxValue = false,
    this.error,
  });

  /// チェックボックス1の状態
  final bool upperCheckBoxValue;

  /// チェックボックス2の状態
  final bool lowerCheckBoxValue;

  /// エラーメッセージ
  final String? error;

  /// 両方のチェックボックスがチェックされているか
  bool get isBothChecked => upperCheckBoxValue && lowerCheckBoxValue;

  CertificateConfirmState copyWith({
    bool? upperCheckBoxValue,
    bool? lowerCheckBoxValue,
    String? error,
  }) {
    return CertificateConfirmState(
      upperCheckBoxValue: upperCheckBoxValue ?? this.upperCheckBoxValue,
      lowerCheckBoxValue: lowerCheckBoxValue ?? this.lowerCheckBoxValue,
      error: error ?? this.error,
    );
  }
}


