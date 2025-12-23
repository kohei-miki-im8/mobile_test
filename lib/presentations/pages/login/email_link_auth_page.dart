import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/gradient_circle_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/input_field.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_link_auth_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailLinkAuthPage extends HookConsumerWidget {
  const EmailLinkAuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isEmailValid = useState<bool>(false);
    final showPasswordField = useState<bool>(false);
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.leftArrow.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InnerShadowText(
              text: 'メールアドレスを入力してください',
              textStyle: EconaTextStyle.headlineLarge(
                color: EconaColor.grayNormal,
                shadows: EconaShadow.headlineShadows,
              ),
              innerShadowTextStyles: [
                EconaTextStyle.headlineLarge(
                  foreground: EconaShadow().headlineInnerShadow,
                ),
              ],
            ),
            _EmailInputForm(controller: controller, isEmailValid: isEmailValid),
            if (showPasswordField.value) ...[
              const SizedBox(height: 24),
              _PasswordInputForm(controller: passwordController),
            ],
            const Spacer(),
            _SendButton(
              controller: controller,
              isEmailValid: isEmailValid,
              showPasswordField: showPasswordField,
              passwordController: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInputForm extends HookConsumerWidget {
  const _EmailInputForm({
    required this.controller,
    required this.isEmailValid,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isEmailValid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(emailLinkAuthViewModelProvider.notifier);

    return Container(
      margin: const EdgeInsets.only(top: 48),
      height: 66,
      width: 353,
      child: OneLineInputFieldContainer(
        borderRadius: BorderRadius.circular(100),
        borderWidth: 1,
        hintText: 'sample@example.com',
        controller: controller,
        onChanged: (value) {
          final trimmedValue = value.trim();
          isEmailValid.value = trimmedValue.isNotEmpty
              && notifier.isValidEmail(trimmedValue);
        },
      ),
    );
  }
}

class _SendButton extends HookConsumerWidget {
  const _SendButton({
    required this.controller,
    required this.isEmailValid,
    required this.showPasswordField,
    required this.passwordController,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isEmailValid;
  final ValueNotifier<bool> showPasswordField;
  final TextEditingController passwordController;

  /// 特定のメールアドレスかどうかをチェック
  bool _isReviewEmail(String email) {
    const specialEmails = [
      'test.user.male@example.com',
      'test.user.female@example.com',
    ];
    return specialEmails.contains(email.toLowerCase());
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(emailLinkAuthViewModelProvider.notifier);
    final isLoading = useState<bool>(false);

    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 24),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: Colors.black,
          onTap: () async {
            if(isEmailValid.value && !isLoading.value) {
              isLoading.value = true;
              try {
                final emailAddress = controller.text.trim();

                if (_isReviewEmail(emailAddress)) {
                  // パスワード入力欄が表示されていない場合は表示
                  if (!showPasswordField.value) {
                    showPasswordField.value = true;
                    isLoading.value = false;
                    return;
                  }

                  // パスワード入力欄が表示されている場合はログイン
                  final password = passwordController.text.trim();
                  if (password.isEmpty) {
                    if (context.mounted) {
                      await EconaNotification.showTopToast(
                        context,
                        message: 'パスワードを入力してください',
                      );
                    }
                    isLoading.value = false;
                    return;
                  }

                  // メールアドレスとパスワードでログイン
                  await signInWithTestUser(
                    ref,
                    context: context,
                    email: emailAddress,
                    password: password,
                    navigateTo: '/home',
                  );

                  if (context.mounted) {
                    await EconaNotification.showTopToast(
                      context,
                      message: 'ログインしました',
                    );
                  }
                } else {
                  await notifier.sendSignInLinkToEmail(emailAddress);
                  if (context.mounted) {
                    await EconaNotification.showTopToast(
                      context,
                      message: '$emailAddress宛にメール送信しました',
                    );
                  }
                }
              } on Exception catch (e) {
                // 事前にmountedチェック済み
                // ignore: use_build_context_synchronously
                if (context.mounted) {
                  await EconaNotification.showTopToast(
                    context,
                    message: 'メールの送信に失敗しました',
                  );
                }
              } finally {
                isLoading.value = false;
              }
            }
          },
          child: Container(
            height: 56,
            width: 56,
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(-1, -1.8),
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFD097DB),
                  Color(0xFF8887EE),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0xFFB691E2).withValues(alpha: 0.32),
                  blurRadius: 12,
                  offset: const Offset(2, 2),
                ),
                const BoxShadow(
                  color: Color(0xFFFFFFFF),
                  blurRadius: 20,
                  offset: Offset(-6, -6),
                ),
                const BoxShadow(
                  color: Color(0xFF9A94EE),
                  blurRadius: 20,
                  offset: Offset(4, 4),
                ),
              ],
            ),
            child: Center(
              child: Assets.images.icons.rightArrow.svg(height: 15, width: 12),
            ),
          ),
        ),
      ),
    );
  }
}


class _PasswordInputForm extends StatelessWidget {
  const _PasswordInputForm({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      width: 353,
      child: OneLineInputFieldContainer(
        borderRadius: BorderRadius.circular(100),
        borderWidth: 1,
        hintText: 'パスワード',
        controller: controller,
      ),
    );
  }
}
