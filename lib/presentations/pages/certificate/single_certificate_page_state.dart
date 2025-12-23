import 'package:econa_mobile_app/presentations/enums/processing_type.dart';

/// 独身証明の撮影・遷移用State（State分離）
class SingleCertificatePageState {
  const SingleCertificatePageState({
    this.isProcessing = false,
    this.processingType,
    this.error,
  });

  /// 処理中フラグ
  final bool isProcessing;

  /// 現在の処理タイプ
  final ProcessingType? processingType;

  /// エラーメッセージ
  final String? error;

  /// ローディングメッセージを取得
  String get loadingMessage {
    return processingType?.defaultMessage ?? '処理中...';
  }

  SingleCertificatePageState copyWith({
    bool? isProcessing,
    ProcessingType? processingType,
    String? error,
  }) {
    return SingleCertificatePageState(
      isProcessing: isProcessing ?? this.isProcessing,
      processingType: processingType ?? this.processingType,
      error: error ?? this.error,
    );
  }
}


