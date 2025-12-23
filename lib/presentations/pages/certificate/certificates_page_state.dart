import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/presentations/enums/processing_type.dart';

/// 認証状態を表すクラス（State分離）
class CertificationStatus {
  const CertificationStatus({
    required this.isIdentityVerified,
    required this.isSingleVerified,
    this.certificateLevelCode,
    this.isLoading = false,
    this.processingType,
    this.error,
  });

  /// 本人確認の認証状態
  final bool isIdentityVerified;

  /// 独身確認の認証状態
  final bool isSingleVerified;

  /// 認証レベルコード
  final CertificateLevelCode? certificateLevelCode;

  /// ローディング状態
  final bool isLoading;

  /// 現在の処理タイプ
  final ProcessingType? processingType;

  /// エラーメッセージ
  final String? error;

  /// ローディングメッセージを取得
  String get loadingMessage {
    return processingType?.defaultMessage ?? '読み込み中...';
  }

  CertificationStatus copyWith({
    bool? isIdentityVerified,
    bool? isSingleVerified,
    CertificateLevelCode? certificateLevelCode,
    bool? isLoading,
    ProcessingType? processingType,
    String? error,
  }) {
    return CertificationStatus(
      isIdentityVerified: isIdentityVerified ?? this.isIdentityVerified,
      isSingleVerified: isSingleVerified ?? this.isSingleVerified,
      certificateLevelCode: certificateLevelCode ?? this.certificateLevelCode,
      isLoading: isLoading ?? this.isLoading,
      processingType: processingType ?? this.processingType,
      error: error ?? this.error,
    );
  }
}


