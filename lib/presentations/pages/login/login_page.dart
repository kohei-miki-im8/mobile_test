import 'dart:io';

import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_status.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/pages/login/login_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:econa_mobile_app/presentations/shared/users/user_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 認証後にユーザーIDをキャッシュする共通処理
Future<void> cacheUserIdAfterSignIn(WidgetRef ref) async {
  try {
    final authRepository = ref.read(authRepositoryProvider);
    final userViewModelNotifier = ref.read(userViewModelProvider.notifier);

    // getUserStatusを呼び出してUserStatusを直接取得
    final userStatus = await userViewModelNotifier.getUserStatus(GetUserStatusRequest());
    final userId = userStatus?.userId;

    if (userId != null) {
      authRepository.cacheUserId(userId);
    }
  } catch (e) {
    throw Exception('ユーザーIDを取得できませんでした');
  }
}

Future<void> _handleExistingUserLogin({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  try {
    final registrationNotifier = ref.read(registrationPageViewModelProvider.notifier);
    final nextPath = await registrationNotifier.determineUserRouteAfterSignIn();

    if (nextPath == EconaPath.home) {
      await ref.read(myPageViewModelProvider.notifier).initialFetchData();
    }

    if (!context.mounted) return;

    context.go(nextPath);
  } catch (error) {
    if (!context.mounted) return;

    await EconaNotification.showTopToast(
      context,
      message: 'ログインに失敗しました。',
    );
  }
}

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final integrity = GoRouterState.of(context).uri.queryParameters['integrity'];
        if (integrity == '1') {
          showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (ctx) => AlertDialog(
              title: const Text('ご利用できません'),
              content: const Text('端末の整合性チェックに失敗しました。Root化またはJailbreakされた端末は利用できません。'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('閉じる'),
                ),
              ],
            ),
          );
        }
      });
      return null;
    }, const []);
    final authRepository = ref.watch(authRepositoryProvider);
    final hasExecutedUserStatus = useRef(false); // 実行済みフラグ

    final userAsyncValue = useStream(useMemoized(() => FirebaseAuth.instance.authStateChanges()));

    final loginStateAsync = ref.watch(loginPageViewModelProvider);
    final isSocialLoginLoading = loginStateAsync.maybeWhen(
      data: (state) => state.isLoading,
      orElse: () => false,
    );

    ref.listen(loginPageViewModelProvider, (previous, next) {
      next.whenOrNull(data: (state) {
        final errorMessage = state.error;
        if (errorMessage != null && context.mounted) {
          EconaNotification.showTopToast(
            context,
            message: errorMessage
          );
        }
      });
    });

    // 既にFirebase認証が済んでいる場合にGetUserStatusを実行し、そのまま次の画面へ遷移
    useEffect(() {
      // 初回ロード時のみ実行し、既に認証済みの場合にGetUserStatusを実行
      if (!hasExecutedUserStatus.value &&
          userAsyncValue.connectionState != ConnectionState.waiting &&
          userAsyncValue.hasData &&
          userAsyncValue.data != null) {

        hasExecutedUserStatus.value = true; // 重複実行を防ぐ

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          // 既に認証済みの場合もユーザーIDをキャッシュし、
          // 通常の既存ユーザーと同様に遷移先を判定して画面遷移する
          await cacheUserIdAfterSignIn(ref);
          if (!context.mounted) {
            return;
          }
          await _handleExistingUserLogin(context: context, ref: ref);
        });
      }
      return null;
    }, [userAsyncValue.connectionState, userAsyncValue.hasData, userAsyncValue.data?.uid]);

    if (userAsyncValue.connectionState == ConnectionState.waiting) {
      return const Scaffold(body: Center(child: EconaLoadingIndicator()));
    }
    if (userAsyncValue.hasError) {
      return Scaffold(
        body: Center(
          child: Text('エラーが発生しました: ${userAsyncValue.error}'),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                    child: Assets.images.illusts.laviLogo.image(width: 293, height: 240),
                  ),
                ),
                const SizedBox(height: 63),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                  child: Center(
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LineLoginButton(authRepository: authRepository, ref: ref),
                        GoogleLoginButton(authRepository: authRepository, ref: ref),
                        if(Platform.isIOS)...[
                          AppleLoginButton(authRepository: authRepository, ref: ref),
                        ],
                        const EmailLinkLoginButton(),
                        const PhoneLoginButton(),
                        TextButton(
                          onPressed: () async {
                            await const WebViewRouteData(
                              url: EconaWebUrl.contact, 
                              title: 'ヘルプ',
                            ).push<void>(context);
                          },
                          child: Text(
                            'サインイン・新規登録でお困りの方',
                            style: EconaTextStyle.regularSmall140(
                              color: EconaColor.purpleNormal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isSocialLoginLoading)
            const Positioned.fill(
              child: ColoredBox(
                color: Colors.black45,
                child: Center(
                  child: EconaLoadingIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// LINE認証ボタン
class LineLoginButton extends HookConsumerWidget {
  const LineLoginButton({
    required this.authRepository,
    required this.ref,
    super.key,
  });

  final AuthRepository authRepository;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loginPageViewModelProvider).maybeWhen(
      data: (state) => state.isLoading,
      orElse: () => false,
    );

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
          final outcome = await ref.read(loginPageViewModelProvider.notifier).signInWithLine();
          if (!context.mounted || outcome == null) return;
          if (outcome.isNewUser) {
            AdjustEventTracker.trackSignUp();
            context.go(EconaPath.userAgreement);
          } else {
            AdjustEventTracker.trackLogin();
            await _handleExistingUserLogin(context: context, ref: ref);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4CC764),
          foregroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.images.icons.lineLogo.svg(width: 24, height: 24),
            const SizedBox(width: 47),
            Text(
              'LINEではじめる/ログイン',
              style: EconaTextStyle.labelMedium1140(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Google認証ボタン
class GoogleLoginButton extends HookConsumerWidget {
  const GoogleLoginButton({
    required this.authRepository,
    required this.ref,
    super.key,
  });

  final AuthRepository authRepository;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loginPageViewModelProvider).maybeWhen(
      data: (state) => state.isLoading,
      orElse: () => false,
    );

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
          final outcome = await ref.read(loginPageViewModelProvider.notifier).signInWithGoogle();
          if (!context.mounted || outcome == null) return;
          if (outcome.isNewUser) {
            AdjustEventTracker.trackSignUp();
            context.go(EconaPath.userAgreement);
          } else {
            AdjustEventTracker.trackLogin();
            await _handleExistingUserLogin(context: context, ref: ref);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: EconaColor.grayDarkActive,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.images.icons.googleLogo.svg(width: 24, height: 24),
            const SizedBox(width: 38),
            const Text('Googleではじめる/ログイン'),
          ],
        ),
      ),
    );
  }
}

// Apple認証ボタン
class AppleLoginButton extends HookConsumerWidget {
  const AppleLoginButton({
    required this.authRepository,
    required this.ref,
    super.key,
  });

  final AuthRepository authRepository;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loginPageViewModelProvider).maybeWhen(
      data: (state) => state.isLoading,
      orElse: () => false,
    );

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
          final outcome = await ref.read(loginPageViewModelProvider.notifier).signInWithApple();
          if (!context.mounted || outcome == null) return;
          if (outcome.isNewUser) {
            AdjustEventTracker.trackSignUp();
            context.go(EconaPath.userAgreement);
          } else {
            AdjustEventTracker.trackLogin();
            await _handleExistingUserLogin(context: context, ref: ref);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF06182B),
          foregroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.images.icons.appleLogo.svg(width: 24, height: 24),
            const SizedBox(width: 43),
            const Text('Appleではじめる/ログイン'),
          ],
        ),
      ),
    );
  }
}

// メールリンク認証ボタン
class EmailLinkLoginButton extends HookConsumerWidget {
  const EmailLinkLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 48,
      child: EconaGradientButton(
        text: 'メールアドレスでログイン',
        onPressed: () => context.push(EconaPath.emailLinkAuth),
      ),
    );
  }
}

// 電話番号認証ボタン
class PhoneLoginButton extends HookConsumerWidget {
  const PhoneLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () => context.push(EconaPath.phoneNumberAuth),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.images.icons.phone.svg(width: 24, height: 24),
            const SizedBox(width: 75),
            const Text('電話番号でログイン', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}