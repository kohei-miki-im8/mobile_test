import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/registration_step.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/registration/v1/create_registration_step_log.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_tag.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/tags/view_models/tag_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationTagPage extends HookConsumerWidget {
  const RegistrationTagPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileBaseTag(
      title: 'Likeタグの登録',
      description: 'プロフィールに記載するあなたの興味や好きなものを選びましょう。1つ以上選んでください。',
      buttonText: '1つ以上選んでください',
      buttonTextWithCount: '次へ',
      noSelectionText: 'まずタグカテゴリを選択してください',
      isRegistrationFlow: true,
      onSave: () async {
        // 選択されたタグを保存
        await ref.read(tagViewModelProvider.notifier).updateSelectedTags();

        // 登録ステップを更新
        await ref.read(registrationPageViewModelProvider.notifier).createRegistrationStepLog(
          CreateRegistrationStepLogRequest(
            registrationStep: RegistrationStep.REGISTRATION_STEP_4_01,
          ),
        );

        // 保存成功後に次のページに遷移
        // context.go(EconaPath.counselingOnboarding);
        context.go(EconaPath.registrationFinish);
      },
      popCount: 0, // go()を使用するためpopしない
      actions: [
        TextButton(
          onPressed: () async {
            await TagSkipModal.show(context);
          },
          child: InnerShadowText(
            text: 'スキップ',
            textStyle: EconaTextStyle.labelMedium1140(
              color: EconaColor.gray200,
              shadows: EconaShadow.headlineShadows,
            ),
            innerShadowTextStyles: [
              EconaTextStyle.labelMedium1140(
                foreground: EconaShadow().headlineInnerShadow,
              ),
            ],
          ),
        ),
      ],
    );
  }
}