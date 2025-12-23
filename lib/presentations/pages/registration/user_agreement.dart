import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_agreement_type.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/create_user_agreement_log.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_checkbox.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/users/user_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserAgreement extends HookConsumerWidget {
  const UserAgreement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAgeEligible = useState(false);
    final isAgreeTerms = useState(false);

    final canRegistration = isAgreeTerms.value && isAgeEligible.value;

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFF0EFFD)),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 73, left: 34, right: 34),
              child: Assets.images.illusts.onboardingConsent.image(),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              child: EconaCheckbox(
                value: isAgeEligible.value,
                onChanged: (value) async {
                  isAgeEligible.value = value;
                },
                text: '私は18歳以上かつ49歳以下で独身です',
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 28),
              child: EconaCheckbox(
                value: isAgreeTerms.value,
                onChanged: (value) async {
                  isAgreeTerms.value = value;
                },
                text: 'すべての規約に同意します',
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 6),
              child: RichText(
                text: TextSpan(
                  text: '利用規約・プライバシーポリシー',
                  style: EconaTextStyle.labelSmall140(
                    color: EconaColor.purpleNormal,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      const WebViewRouteData(
                        url: EconaWebUrl.privacy,
                        title: '利用規約・プライバシーポリシー',
                      ).push<void>(context);
                    },
                  children: <TextSpan>[
                    TextSpan(
                      text: 'への同意が必要です',
                      style: EconaTextStyle.labelSmall140(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(left: 37, top: 25, right: 36, bottom: 97),
              child: EconaGradientButton(
                text: '登録する',
                enabled: canRegistration,
                onPressed: () async {
                  if(isAgeEligible.value) {
                    await ref.read(userViewModelProvider.notifier).createUserAgreementLog(
                      CreateUserAgreementLogRequest(
                        agreementType: UserAgreementType.USER_AGREEMENT_TYPE_OVER_18_TO_49_SINGLE,
                      ),
                    );
                  }

                  if(isAgreeTerms.value) {
                    await ref.read(userViewModelProvider.notifier).createUserAgreementLog(
                      CreateUserAgreementLogRequest(
                        agreementType: UserAgreementType
                            .USER_AGREEMENT_TYPE_TERMS_OF_SERVICE,
                      ),
                    );
                    await ref.read(userViewModelProvider.notifier).createUserAgreementLog(
                      CreateUserAgreementLogRequest(
                        agreementType: UserAgreementType
                            .USER_AGREEMENT_TYPE_PRIVACY_POLICY,
                      ),
                    );
                  }

                  if(context.mounted) {
                    await context.push(EconaPath.mainProfileOnboarding);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}