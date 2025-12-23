import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_checkbox.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WithdrawalCompletePage extends HookConsumerWidget {
  const WithdrawalCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CenterAppBar(
        titleText: '',
        backgroundColor: Color(0xFFF0EFFD),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Column(
        spacing: 16,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Center(
              child: Assets.images.illusts.laviLogo.image(width: 293, height: 240),
            ),
          ),
          Text(
            '退会が完了しました',
            style: EconaTextStyle.headlineHeadline(
              color: EconaColor.grayDarkActive,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '今までLaviをご利用いただきまして、\n誠にありがとうございました。',
            style: EconaTextStyle.regularMedium2160(
              color: EconaColor.grayDarkActive,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}