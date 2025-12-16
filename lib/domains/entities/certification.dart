import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'certification.freezed.dart';

/// ユーザーの認証状態ドメイン
@freezed
abstract class Certification with _$Certification {
  const factory Certification({
    required CertificateLevel level,
  }) = _Certification;

  /// CertificateLevelCode から生成
  factory Certification.fromCode(CertificateLevelCode code) {
    return Certification(level: CertificateLevel.fromCertificateLevelCode(code));
  }
}

/// 便宜アクセサ
extension CertificationExt on Certification {
  bool get isIdentityVerified =>
      level == CertificateLevel.verified || level == CertificateLevel.singleCertified;

  bool get isSingleVerifiedFlag => level == CertificateLevel.singleCertified;
}


