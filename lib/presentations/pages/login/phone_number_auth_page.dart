import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/gradient_circle_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/input_field.dart';
import 'package:econa_mobile_app/presentations/components/loading_overlay.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/login/phone_number_auth_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhoneNumberAuthPage extends HookConsumerWidget {
  const PhoneNumberAuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isPhoneNumberValid = useState<bool>(false);
    final isLoading = useState<bool>(false);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: isLoading.value ? null : () {
            context.pop();
          },
          icon: Assets.images.icons.leftArrow.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: LoadingOverlay(
        isLoading: isLoading.value,
        message: 'SMSを送信中...',
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InnerShadowText(
                text: '電話番号を入力してください',
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
              const SizedBox(height: 16),
              Text(
                'ハイフン無しで入力してください',
                style: EconaTextStyle.labelSmall100(
                  color: EconaColor.grayNormal,
                ),
              ),
              _PhoneNumberInputField(
                controller: controller,
                isPhoneNumberValid: isPhoneNumberValid,
              ),
              const Spacer(),
              _SendButton(
                controller: controller,
                isPhoneNumberValid: isPhoneNumberValid,
                isLoading: isLoading
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberInputField extends HookConsumerWidget {
  const _PhoneNumberInputField({
    required this.controller,
    required this.isPhoneNumberValid,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isPhoneNumberValid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(phoneNumberAuthViewModelProvider.notifier);
    return Container(
      margin: const EdgeInsets.only(top: 48),
      height: 66,
      child: OneLineInputFieldContainer(
        borderRadius: BorderRadius.circular(100),
        borderWidth: 1,
        controller: controller,
        inputType: TextInputType.number,
        onChanged: (value) {
          final trimmedValue = value.trim();
          isPhoneNumberValid.value = trimmedValue.isNotEmpty &&
              notifier.isValidPhoneNumber(trimmedValue);
        },
      ),
    );
  }
}

class _SendButton extends HookConsumerWidget {
  const _SendButton({
    required this.controller,
    required this.isPhoneNumberValid,
    required this.isLoading,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> isPhoneNumberValid;
  final ValueNotifier<bool> isLoading;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(phoneNumberAuthViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 24),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          splashColor: Colors.black,
          onTap: () async {
            if (context.mounted && !isLoading.value && isPhoneNumberValid.value) {
              final phoneNumber = controller.text.trim();

              final event = await notifier.startPhoneVerification(
                phoneNumber: phoneNumber,
                setLoading: (bool loading) => isLoading.value = loading,
              );

              if (!context.mounted) return;

              switch (event) {
                case PhoneVerificationEvent.codeSent:
                  await context.push(EconaPath.phoneNumberVerify);
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