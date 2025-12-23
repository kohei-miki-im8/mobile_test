import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/profile_base_tag_category.dart';
import 'package:econa_mobile_app/presentations/pages/registration/registration_skip_modal.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationTagCategoryPage extends HookConsumerWidget {
  const RegistrationTagCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProfileBaseTagCategory(
      title: 'Likeタグの登録',
      description: '好きなもの、興味のあるものを1つ以上選んでください',
      buttonText: '1つ以上選んでください',
      buttonTextWithCount: '次へ',
      onNext: () async {
        await const RegistrationTagRouteData().push<void>(context);
      },
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
 