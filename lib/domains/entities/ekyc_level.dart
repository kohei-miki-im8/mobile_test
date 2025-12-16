import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';

/// 本人確認レベルを表すenum
enum CertificateLevel {
  unspecified(
    text: '未指定',
    code: CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNSPECIFIED,
  ),
  unverified(
    text: '未認証',
    code: CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNVERIFIED,
  ),
  verified(
    text: '本人確認済',
    code: CertificateLevelCode.CERTIFICATE_LEVEL_CODE_VERIFIED,
  ),
  singleCertified(
    text: '独身証明済',
    code: CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED,
  );

  const CertificateLevel({
    required this.text,
    required this.code,
  });

  final String text;
  final CertificateLevelCode code;

  /// CertificateLevelCodeからCertificateLevelを取得
  static CertificateLevel fromCertificateLevelCode(CertificateLevelCode code) {
    return switch (code) {
      CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNSPECIFIED =>
        CertificateLevel.unspecified,
      CertificateLevelCode.CERTIFICATE_LEVEL_CODE_UNVERIFIED =>
        CertificateLevel.unverified,
      CertificateLevelCode.CERTIFICATE_LEVEL_CODE_VERIFIED =>
        CertificateLevel.verified,
      CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED =>
        CertificateLevel.singleCertified,
      _ => () {
          return CertificateLevel.unspecified;
        }(),
    };
  }

  /// 本人確認済みかどうかを判定
  bool get isVerified => this == CertificateLevel.verified;

  /// 独身証明済みかどうかを判定
  bool get isSingleVerified => this == CertificateLevel.singleCertified;
}
