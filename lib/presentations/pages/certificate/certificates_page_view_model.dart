import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/certificate_level_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/certificates_page_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'certificates_page_view_model.g.dart';

/// 認証状態管理のViewModel
@riverpod
class CertificationStatusViewModel extends _$CertificationStatusViewModel {
  @override
  Future<CertificationStatus> build() async {
    try {
      final userRepository = ref.read(userRepositoryProvider);
      final request = GetUserStatusRequest();
      final response = await userRepository.getUserStatus(request);

      // UserStatusから認証状態を判定
      final userStatus = response.userStatus;
      final certificateLevelCode =
          userStatus.hasCertificateLevelCode() ? userStatus.certificateLevelCode : null;

      return CertificationStatus(
        isIdentityVerified: _isIdentityVerified(certificateLevelCode),
        isSingleVerified: _isSingleVerified(certificateLevelCode),
        certificateLevelCode: certificateLevelCode,
        isLoading: false,
      );
    } catch (e) {
      return CertificationStatus(
        isIdentityVerified: false,
        isSingleVerified: false,
        isLoading: false,
        error: 'ユーザー状態の取得中にエラーが発生しました: $e',
      );
    }
  }

  /// 認証状態を手動で更新
  Future<void> refreshStatus() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final userRepository = ref.read(userRepositoryProvider);
      final request = GetUserStatusRequest();
      final response = await userRepository.getUserStatus(request);

      final userStatus = response.userStatus;
      final certificateLevelCode =
          userStatus.hasCertificateLevelCode() ? userStatus.certificateLevelCode : null;

      return CertificationStatus(
        isIdentityVerified: _isIdentityVerified(certificateLevelCode),
        isSingleVerified: _isSingleVerified(certificateLevelCode),
        certificateLevelCode: certificateLevelCode,
        isLoading: false,
      );
    });
  }

  /// 本人確認の認証状態を判定
  bool _isIdentityVerified(CertificateLevelCode? code) {
    if (code == null) return false;

    // VERIFIED以上のレベルで本人確認完了とする
    return code == CertificateLevelCode.CERTIFICATE_LEVEL_CODE_VERIFIED ||
        code == CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED;
  }

  /// 独身確認の認証状態を判定
  bool _isSingleVerified(CertificateLevelCode? code) {
    if (code == null) return false;

    // SINGLE_CERTIFIEDレベルで独身確認完了とする
    return code == CertificateLevelCode.CERTIFICATE_LEVEL_CODE_SINGLE_CERTIFIED;
  }
}

/// 認証バッジ表示用のプロバイダー
@riverpod
Widget identityVerificationBadge(Ref ref) {
  final certificationStatus = ref.watch(certificationStatusViewModelProvider);

  return certificationStatus.when(
    data: (status) {
      if (status.isIdentityVerified || status.isSingleVerified) {
        return Assets.images.icons.checkCircleOn.image(height: 32, width: 32);
      } else {
        return Assets.images.icons.checkCircleOff.image(height: 32, width: 32);
      }
    },
    loading: () => Assets.images.icons.checkCircleOff.image(height: 32, width: 32),
    error: (_, __) => Assets.images.icons.checkCircleOff.image(height: 32, width: 32),
  );
}

/// 独身確認バッジ表示用のプロバイダー
@riverpod
Widget singleVerificationBadge(Ref ref) {
  final certificationStatus = ref.watch(certificationStatusViewModelProvider);

  return certificationStatus.when(
    data: (status) {
      if (status.isSingleVerified) {
        return Assets.images.icons.checkCircleOn.image(height: 32, width: 32);
      } else {
        return Assets.images.icons.checkCircleOff.image(height: 32, width: 32);
      }
    },
    loading: () => Assets.images.icons.checkCircleOff.image(height: 32, width: 32),
    error: (_, __) => Assets.images.icons.checkCircleOff.image(height: 32, width: 32),
  );
}

/// 本人確認セクションの有効判定
@riverpod
bool isIdentityVerified(Ref ref) {
  final certificationStatus = ref.watch(certificationStatusViewModelProvider);
  return certificationStatus.when(
    data: (status) => !status.isIdentityVerified,
    loading: () => true,
    error: (_, __) => true,
  );
}

/// 独身確認セクションの有効判定
@riverpod
bool isSingleVerified(Ref ref) {
  final certificationStatus = ref.watch(certificationStatusViewModelProvider);
  return certificationStatus.when(
    data: (status) => !status.isSingleVerified,
    loading: () => true,
    error: (_, __) => true,
  );
}
