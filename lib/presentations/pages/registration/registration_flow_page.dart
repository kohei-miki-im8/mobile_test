import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationFlowPage extends HookConsumerWidget {
  const RegistrationFlowPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // メンテナンスモードのチェック（登録フロー開始前に一度だけ）
      const probeError = EconaError(
        cause: EconaErrorCause.unknown,
        operation: EconaErrorOperation.unknown,
        message: '',
      );
      final handled = await handleEconaError(context, probeError);
      if (handled) {
        return;
      }

      final notifier = ref.read(registrationPageViewModelProvider.notifier);
      final step = await notifier.getLatestRegistrationStep();
      final next = await notifier.getNextRegistrationStepPathAsync(step);
      if (context.mounted) {
        context.go(next);
      }
    });

    return const Scaffold(
      backgroundColor: Color(0xFFF0EFFD),
      body: Center(child: EconaLoadingIndicator()),
    );
  }
}