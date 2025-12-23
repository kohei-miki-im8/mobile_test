import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pb.dart';
import 'package:econa_mobile_app/domains/entities/email_link_sign_in_outcome.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_link_auth_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/login/login_page.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_link_verify_page_view_model.g.dart';

/// EmailLinkVerify用のシンプルなViewModel
@riverpod
class EmailLinkVerifyViewModel extends _$EmailLinkVerifyViewModel {
  @override
  void build() { }

  /// メールリンクでサインイン処理を実行
  Future<EmailLinkSignInOutcome> signInWithEmailLink(Uri uri) async {
    // 二重起動防止（Outcomeに内蔵した静的ロックを使用）
    final oobCode = uri.queryParameters['oobCode'];
    if (oobCode != null && EmailLinkSignInOutcome.isConsumed(oobCode)) {
      return const EmailLinkSignInOutcome(isSuccess: true, isNewUser: false, isDuplicate: true);
    }
    if (!EmailLinkSignInOutcome.begin()) {
      return const EmailLinkSignInOutcome(isSuccess: true, isNewUser: false, isDuplicate: true);
    }
    final authRepository = ref.read(authRepositoryProvider);
    final emailLinkAuthState = ref.read(emailLinkAuthViewModelProvider);
    
    // 基本的なリンク形式チェック
    if (uri.toString().isEmpty) {
      return const EmailLinkSignInOutcome(isSuccess: false, isNewUser: false);
    }
    
    // Firebase固有のパラメータチェック
    final mode = uri.queryParameters['mode'];
    final apiKey = uri.queryParameters['apiKey'];

    if (mode != 'signIn') {
      return const EmailLinkSignInOutcome(isSuccess: false, isNewUser: false);
    }
    
    if (oobCode == null || oobCode.isEmpty) {
      return const EmailLinkSignInOutcome(isSuccess: false, isNewUser: false);
    }
    
    if (apiKey == null || apiKey.isEmpty) {
      return const EmailLinkSignInOutcome(isSuccess: false, isNewUser: false);
    }
    
    // Firebase AuthのisSignInWithEmailLinkチェック
    if (!authRepository.isSignInWithEmailLink(uri.toString())) {
      return const EmailLinkSignInOutcome(isSuccess: false, isNewUser: false);
    }

    final email = emailLinkAuthState.valueOrNull;

    if (email == null || email.isEmpty) {
      await ref.read(emailLinkAuthViewModelProvider.notifier).loadSavedEmail();
      final retryEmail = ref.read(emailLinkAuthViewModelProvider).valueOrNull;
      if (retryEmail == null || retryEmail.isEmpty) {
        return const EmailLinkSignInOutcome(isSuccess: false, isNewUser: false);
      }
    }

    final finalEmail = email ?? ref.read(emailLinkAuthViewModelProvider).valueOrNull!;

    try {
      // AuthRepositoryのメソッドを使用
      final result = await authRepository.signInWithEmailLink(
        email: finalEmail,
        emailLink: uri.toString(),
      );

      // ログイン成功時の処理
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // authRepositoryにidTokenをキャッシュ
        await authRepository.refreshToken();
      }
      
      // 認証成功時にメールアドレスをクリア
      await ref.read(emailLinkAuthViewModelProvider.notifier).clearEmail();

      final isNewUser = result.additionalUserInfo?.isNewUser ?? false;

      if (isNewUser) {
        AdjustEventTracker.trackSignUp();
        await Future<void>.delayed(const Duration(milliseconds: 2000));
      } else {
        AdjustEventTracker.trackLogin();
      }
      EmailLinkSignInOutcome.markConsumed(oobCode);
      EmailLinkSignInOutcome.completeSuccess();
      return EmailLinkSignInOutcome(isSuccess: true, isNewUser: isNewUser);
      
    } on Exception catch (e) {
      // エラー時もメールアドレスをクリア
      await ref.read(emailLinkAuthViewModelProvider.notifier).clearEmail();
      EmailLinkSignInOutcome.completeFailure();
      return const EmailLinkSignInOutcome(isSuccess: false, isNewUser: false);
    }
  }

  Future<String?> getNextPath(
    EmailLinkSignInOutcome outcome,
    WidgetRef ref,
  ) async {
    if(outcome.isSuccess) {
      await _waitForTokenAvailability(ref);
      try {
        if (outcome.isNewUser) {
          return EconaPath.userAgreement;
        } else {
          // 既存ユーザーはユーザーステータスに応じて遷移
          final nextPath = await ref.read(registrationPageViewModelProvider.notifier)
              .determineUserRouteAfterSignIn();

          return nextPath;
        }
      } on Exception catch(_) {
        rethrow;
      }
    } else {
      return null;
    }
  }

  /// 認証トークンがAPIで利用可能になるまで待機
  Future<void> _waitForTokenAvailability(WidgetRef ref) async {
    const maxRetries = 5;
    const maxDelay = Duration(seconds: 2);

    Duration retryDelay = const Duration(milliseconds: 300);

    for (int i = 0; i < maxRetries; i++) {
      try {
        await ref.read(userRepositoryProvider).getUserStatus(GetUserStatusRequest());
        return;
      } on Exception catch (e) {
        if (i < maxRetries - 1) {
          await Future<void>.delayed(retryDelay);
          try {
            await ref.read(authRepositoryProvider).refreshToken();
          } on Exception catch (ex) {
            // トークン更新に失敗したがリトライを続行
            debugPrint('Token refresh failed: $ex');

            final nextDelay = retryDelay.inMilliseconds * 2;
            retryDelay = Duration(
              milliseconds: nextDelay > maxDelay.inMilliseconds
                ? maxDelay.inMilliseconds
                : nextDelay,
            );
          }
        } else {
          debugPrint('Token refresh retry limit exceeded: $e');
          rethrow;
        }
      }
    }
    throw Exception('トークンの取得に失敗しました。最大リトライ回数に達しました。');
  }
}
