import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/input_field.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/email_address_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailAddressSettingPage extends HookConsumerWidget {
  const EmailAddressSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(emailAddressSettingPageViewModelProvider);
    final notifier = ref.watch(emailAddressSettingPageViewModelProvider.notifier);
    final emailAddressController = useTextEditingController();

    useEffect(() {
      state.whenData((data) {
        emailAddressController.text = data.eMailAddress;
      });
      return null;
    }, [state.asData]);

    ref.listen(emailAddressSettingPageViewModelProvider, (prev, next) async {
      final error = next.valueOrNull?.error;
      if (error != null) {
        if (!context.mounted) return;
        final handled = await handleEconaError(context, error);
        if (handled) {
          notifier.clearError();
          return;
        }
        await EconaNotification.showTopToast(
          context,
          message: error.userMessage,
        );
        notifier.clearError();
      }
    });

    return Scaffold(
      appBar: CenterAppBar(
        titleText: 'メールアドレスの変更',
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _InputField(
              controller: emailAddressController,
            ),
            EconaGradientButton(
              text: '保存',
              onPressed: () async {
                try {
                  await notifier.updateEmail(emailAddressController.text);
                  if (context.mounted) {
                    context.pop();
                  }
                } on Exception catch (_) {
                  if (!context.mounted) return;
                  await EconaNotification.showTopToast(
                    context,
                    message: 'メールアドレスの更新に失敗しました',
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: OneLineInputFieldContainer(
          borderRadius: BorderRadius.circular(100),
          borderWidth: 1,
          hintText: 'sample@example.com',
          controller: controller,
        ),
      ),
    );
  }
}
