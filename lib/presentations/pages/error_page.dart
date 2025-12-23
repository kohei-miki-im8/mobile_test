import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


/// 汎用エラーページ
/// 予期せぬエラーやUIが構築できないようなエラーの場合に使う想定です。
class ErrorPage extends ConsumerWidget {
  const ErrorPage({
    required this.title,
    required this.message,
    required this.onRetry,
    this.retryButtonText = '再試行',
    super.key,
  });

  final String title;
  final String message;
  final void Function()? onRetry;
  final String retryButtonText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        leading: IconButton(
          icon: Assets.images.icons.back.image(height: 32, width: 32),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: EconaTextStyle.headlineHeadline(
                color: EconaColor.grayDarkActive,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayNormal,
              ),
            ),
            const SizedBox(height: 24),
            EconaGradientButton(
              text: retryButtonText,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}