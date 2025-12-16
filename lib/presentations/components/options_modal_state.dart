import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:flutter/foundation.dart';

/// OptionsModalのエラー状態を管理するクラス
@immutable
class OptionsModalState {
  const OptionsModalState({
    this.error,
  });

  /// エラー情報
  final EconaError? error;

  /// エラーを設定する
  OptionsModalState setError(EconaError error) {
    return OptionsModalState(
      error: error,
    );
  }

  /// エラーをクリアする
  OptionsModalState clearError() {
    return const OptionsModalState(
      error: null,
    );
  }

  /// エラーが発生しているかどうか
  bool get hasError => error != null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OptionsModalState && other.error == error;
  }

  @override
  int get hashCode {
    return error.hashCode;
  }

  @override
  String toString() {
    return 'OptionsModalState(error: $error)';
  }
}
