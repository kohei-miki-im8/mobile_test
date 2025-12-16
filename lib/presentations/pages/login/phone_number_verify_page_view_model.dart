import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/pages/login/phone_number_auth_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_number_verify_page_view_model.g.dart';

/// PhoneNumberVerify用のシンプルなViewModel
@riverpod
class PhoneNumberVerifyViewModel extends _$PhoneNumberVerifyViewModel {
  @override
  void build() {
    // 状態管理なし、メソッドのみ提供
  }

  /// SMSコードで認証
  Future<void> verifyWithSMSCode({
    required String smsCode,
    required BuildContext context,
    required void Function(bool) setLoading,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    final phoneNumberAuthNotifier = ref.read(phoneNumberAuthViewModelProvider.notifier);
    
    setLoading(true);
    
    try {
      final verificationId = authRepository.verificationId;

      if (verificationId == null) {
        setLoading(false);
        if (context.mounted) {
          await EconaNotification.showTopToast(
            context,
            message: '認証情報が見つかりませんでした。',
          );
        }
        return;
      }

      final result = await authRepository.signInWithSMSCode(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // 認証成功時に電話番号をクリア
      phoneNumberAuthNotifier.clearPhoneNumber();

      if (context.mounted) {
        final isNewUser = result.additionalUserInfo?.isNewUser ?? false;
        if (isNewUser) {
          AdjustEventTracker.trackSignUp();
          context.pushReplacement(EconaPath.userAgreement);
        } else {
          AdjustEventTracker.trackLogin();
          // アカウントステータスに基づいて遷移先を決定
          final registrationNotifier =
              ref.read(registrationPageViewModelProvider.notifier);
          final nextRoute =
              await registrationNotifier.determineUserRouteAfterSignIn();

          if (!context.mounted) {
            return;
          }
          context.pushReplacement(nextRoute);
        }
      }
    } on Exception catch (e) {
      // エラー時も電話番号をクリア
      phoneNumberAuthNotifier.clearPhoneNumber();

      if (context.mounted) {
        await EconaNotification.showTopToast(
          context,
          message: '電話番号認証に失敗しました。',
        );
      }
    } finally {
      setLoading(false);
    }
  }
}
