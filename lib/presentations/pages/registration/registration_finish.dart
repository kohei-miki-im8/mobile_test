import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationFinish extends HookConsumerWidget {
  const RegistrationFinish({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registrationPageViewModelProvider.notifier);

    return Scaffold(
      appBar: const CenterAppBar(
        titleText: '',
        backgroundColor: Color(0xFFF0EFFD),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 420,
            padding: const EdgeInsets.only(left: 42, top: 52, right: 42, bottom: 24),
            child: InnerShadowText(
              text: 'プロフィールの入力\nおつかれさまでした…',
              textStyle: EconaTextStyle.headlineLarge(
                color: EconaColor.grayGrayPurple400,
                shadows: EconaShadow.headlineShadows,
              ),
              innerShadowTextStyles: [
                EconaTextStyle.headlineLarge(
                  foreground: EconaShadow().headlineInnerShadow,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: EconaGradientButton(
                text: 'Laviをはじめる',
                onPressed: () async {
                  await notifier.createRegistrationStepLog(
                    CreateRegistrationStepLogRequest(
                      registrationStep: RegistrationStep.REGISTRATION_STEP_5_02,
                    ),
                  );
                  AdjustEventTracker.trackRegistrationComplete();
                  await const HomeRouteData().push<void>(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
