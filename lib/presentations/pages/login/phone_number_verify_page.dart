import 'dart:async';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/loading_overlay.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/gradient.dart';
import 'package:econa_mobile_app/presentations/pages/login/phone_number_auth_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/login/phone_number_input_auth_code.dart';
import 'package:econa_mobile_app/presentations/pages/login/phone_number_verify_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhoneNumberVerifyPage extends HookConsumerWidget {
  const PhoneNumberVerifyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verificationCode = useState<String>('');
    final countdown = useState<int>(60);
    final isCodeComplete = useState<bool>(false);
    final isLoading = useState<bool>(false);
    final phoneNumberState = ref.watch(phoneNumberAuthViewModelProvider);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (countdown.value > 0) {
          countdown.value--;
        } else {
          timer.cancel();
        }
      });

      return timer.cancel;
    }, []);

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
      body: LoadingOverlay(
        isLoading: isLoading.value,
        message: '認証中...',
        child: phoneNumberState.when(
          data: (phoneNumber) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InnerShadowText(
                  text: '電話番号の認証',
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
                const SizedBox(height: 20),
                if (phoneNumber != null) ...[
                  Text(
                    '$phoneNumberへお送りした6桁のコードを入力してください',
                    style: EconaTextStyle.labelSmall100(
                      color: EconaColor.grayNormal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    if (context.mounted) {
                      context.push(EconaPath.emailNotReceived);
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: InnerShadowText(
                    text: 'コードが届かない場合',
                    textStyle: EconaTextStyle.labelMedium1140(
                      color: EconaColor.grayNormal,
                      shadows: EconaShadow.headlineShadows,
                      decoration: TextDecoration.underline,
                    ),
                    innerShadowTextStyles: [
                      EconaTextStyle.labelMedium1140(
                        foreground: EconaShadow().headlineInnerShadow,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SplitCodeInput(
                  onChanged: (code) {
                    verificationCode.value = code;
                    isCodeComplete.value = code.length == 6;
                  },
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      if(countdown.value > 0)...[
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text(
                            '${countdown.value}秒後にコードを再送信します',
                            style: EconaTextStyle.labelSmall100(
                              color: EconaColor.grayNormal,
                            ),
                          ),
                        ),
                      ] else...[
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: TextButton(
                            onPressed: () async {
                              if (context.mounted && !isLoading.value && phoneNumber != null) {
                                final notifier = ref.read(phoneNumberAuthViewModelProvider.notifier);

                                final event = await notifier.startPhoneVerification(
                                  phoneNumber: phoneNumber,
                                  setLoading: (bool loading) => isLoading.value = loading,
                                );

                                if (!context.mounted) return;

                                switch (event) {
                                  case PhoneVerificationEvent.codeSent:
                                    await EconaNotification.showTopToast(
                                      context,
                                      message: 'コードを再送信しました。',
                                    );
                                    countdown.value = 60;
                                  case PhoneVerificationEvent.verificationCompletedNewUser:
                                    context.go(EconaPath.userAgreement);
                                  case PhoneVerificationEvent.verificationCompletedExistingUser:
                                    context.go(EconaPath.home);
                                  case PhoneVerificationEvent.failed:
                                    await EconaNotification.showTopToast(
                                      context,
                                      message: '電話番号認証に失敗しました。',
                                    );
                                  case PhoneVerificationEvent.timeout:
                                    await EconaNotification.showTopToast(
                                      context,
                                      message: 'タイムアウトしました。再度送信して下さい。',
                                    );
                                }
                              }
                            },
                            child: Text(
                              '再送信',
                              style: EconaTextStyle.labelSmall100(
                                color: EconaColor.grayNormal,
                              ),
                            ),
                          ),
                        ),
                      ],
                      const Spacer(),
                      _SendButton(
                        code: verificationCode,
                        isCodeComplete: isCodeComplete,
                        isLoading: isLoading,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          loading: () => const Center(
            child: EconaLoadingIndicator(),
          ),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('エラーが発生しました: $error'),
                ElevatedButton(
                  onPressed: () => context.pop(),
                  child: const Text('戻る'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SendButton extends ConsumerWidget {
  const _SendButton({
    required this.code,
    required this.isCodeComplete,
    required this.isLoading,
});

  final ValueNotifier<String> code;
  final ValueNotifier<bool> isCodeComplete;
  final ValueNotifier<bool> isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 24),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: Colors.black,
          onTap: () async {
            final notifier = ref.read(phoneNumberVerifyViewModelProvider.notifier);

            try {
              if(isCodeComplete.value && !isLoading.value) {
                await notifier.verifyWithSMSCode(
                  smsCode: code.value,
                  context: context,
                  setLoading: (loading) => isLoading.value = loading,
                );
              }
            } on Exception catch (_) {
              if(context.mounted) {
                await EconaNotification.showTopToast(
                  context,
                  message: '電話番号認証に失敗しました。',
                );
              }
            } finally {
              isLoading.value = false;
            }
          },
          child: Container(
            height: 56,
            width: 56,
            decoration: ShapeDecoration(
              gradient: isLoading.value || !isCodeComplete.value
                  ? EconaGradient.buttonDisabledGradient
                  : EconaGradient.defaultButtonGradient,
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