import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_number_auth_page_view_model.g.dart';
enum PhoneVerificationEvent {
  codeSent,
  verificationCompletedNewUser,
  verificationCompletedExistingUser,
  failed,
  timeout,
}


/// PhoneNumberAuth用のViewModel（状態管理とロジックを統合）
@Riverpod(keepAlive: true)
class PhoneNumberAuthViewModel extends _$PhoneNumberAuthViewModel {
  @override
  AsyncValue<String?> build() {
    // 初期状態は電話番号なし
    return const AsyncValue.data(null);
  }

  /// 電話番号の形式をチェック
  bool isValidPhoneNumber(String phoneNumber) {
    final cleanedNumber = phoneNumber.replaceAll(RegExp(r'[-\s]'), '');
    final phoneRegex = RegExp(r'^0[789]0\d{8}$');
    return phoneRegex.hasMatch(cleanedNumber);
  }

  /// 電話番号を保存
  void savePhoneNumber(String phoneNumber) {
    state = AsyncValue.data(phoneNumber);
  }

  /// 電話番号をクリア
  void clearPhoneNumber() {
    state = const AsyncValue.data(null);
  }

  /// 電話番号を取得
  String? getPhoneNumber() {
    return state.valueOrNull;
  }

  /// 電話番号認証を開始
  Future<PhoneVerificationEvent> startPhoneVerification({
    required String phoneNumber,
    required void Function(bool) setLoading,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    
    setLoading(true);
    final completer = Completer<PhoneVerificationEvent>();

    try {
      String formattedPhoneNumber = phoneNumber;
      if (phoneNumber.startsWith('0')) {
        formattedPhoneNumber = '+81${phoneNumber.substring(1)}';
      }

      await authRepository.verifyPhoneNumber(
        phoneNumber: formattedPhoneNumber,
        onCodeSent: (verificationId, resendToken) async {
          authRepository.setVerificationId(verificationId);

          // 電話番号を保存
          state = AsyncValue.data(phoneNumber);

          setLoading(false);
          if (!completer.isCompleted) completer.complete(PhoneVerificationEvent.codeSent);
        },
        onVerificationCompleted: (credential) async {
          setLoading(false);
          final result = await authRepository.signInWithSMSAutoVerify(
            credential: credential,
          );

          final isNewUser = result.additionalUserInfo?.isNewUser ?? false;
          final event = isNewUser
              ? PhoneVerificationEvent.verificationCompletedNewUser
              : PhoneVerificationEvent.verificationCompletedExistingUser;
          if (!completer.isCompleted) completer.complete(event);
        },
        onVerificationFailed: (e) {
          setLoading(false);
          if (!completer.isCompleted) completer.complete(PhoneVerificationEvent.failed);
        },
        onCodeAutoRetrievalTimeout: (verificationId) {
          setLoading(false);
          if (!completer.isCompleted) completer.complete(PhoneVerificationEvent.timeout);
        },
      );
    } catch (e) {
      setLoading(false);
      if (!completer.isCompleted) completer.complete(PhoneVerificationEvent.failed);
    }

    return completer.future;
  }
} 