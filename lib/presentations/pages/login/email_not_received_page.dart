import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/login/email_link_auth_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailNotReceivedPage extends HookConsumerWidget {
  const EmailNotReceivedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailState = ref.watch(emailLinkAuthViewModelProvider);
    final isResending = useState<bool>(false);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: 'メールが届かない場合',
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
      body: emailState.when(
        data: (String? email) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InnerShadowText(
                text: '入力したメールアドレスに間違いがないかご確認ください。',
                textStyle: EconaTextStyle.labelMedium1140(
                  color: EconaColor.grayNormal,
                  shadows: EconaShadow.headlineShadows,
                ),
                innerShadowTextStyles: [
                  EconaTextStyle.labelMedium1140(
                    foreground: EconaShadow().headlineInnerShadow,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              if (email != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: InnerShadowText(
                    text: email,
                    textStyle: EconaTextStyle.labelMedium1140(
                      color: EconaColor.grayNormal,
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
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: EconaGradientButton(
                  text: 'メールアドレスを修正する',
                  onPressed: () {
                    context.push(EconaPath.emailLinkAuth);
                  },
                ),
              ),
              const SizedBox(height: 48),
              InnerShadowText(
                text: 'メールの受信設定をご確認ください。',
                textStyle: EconaTextStyle.labelMedium1140(
                  color: EconaColor.grayNormal,
                  shadows: EconaShadow.headlineShadows,
                ),
                innerShadowTextStyles: [
                  EconaTextStyle.labelMedium1140(
                    foreground: EconaShadow().headlineInnerShadow,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'お客様が迷惑メール対策等で、ドメイン指定受信を設定されている場合、メールが正しく届かないことがあります。\n「support@lavigation.com」からのメールを受信できるように設定をお願いいたします。詳しくはヘルプをご参照ください。以上を設定完了した後、【確認メールを再送信する]ボタンからメールをお受け取りください。',
                style: EconaTextStyle.labelMedium1140(
                  color: EconaColor.grayNormal,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: EconaGradientButton(
                  text: '確認メールを再送信する',
                  onPressed: () async {
                    if(email == null) {
                      if (context.mounted) {
                        await EconaNotification.showTopToast(
                          context,
                          message: 'メールアドレスが設定されていません',
                        );
                      }
                      return;
                    }
                    final notifier = ref.read(emailLinkAuthViewModelProvider.notifier);

                    final isEmailValid = email.isNotEmpty && notifier.isValidEmail(email);
                    // メールアドレスが妥当かつローディング中ではない場合
                    if(isEmailValid && !isResending.value) {
                      isResending.value = true;
                      try {
                        await notifier.sendSignInLinkToEmail(email);
                        if (context.mounted) {
                          await EconaNotification.showTopToast(
                            context,
                            message: '$email宛にメール送信しました',
                          );
                        }
                      } on Exception catch (_) {
                        if (context.mounted) {
                          await EconaNotification.showTopToast(
                            context,
                            message: 'メールの送信に失敗しました',
                          );
                        }
                      } finally {
                        isResending.value = false;
                      }
                    } else {
                      if (isResending.value) {
                        return;
                      }
                      if (!isEmailValid) {
                        if (context.mounted) {
                          await EconaNotification.showTopToast(
                            context,
                            message: 'メールアドレスの形式を確認してください',
                          );
                        }
                        return;
                      }
                    }
                  },
                ),
              ),
              const SizedBox(height: 48),
              InnerShadowText(
                text: '上記の方法で解決しない場合',
                textStyle: EconaTextStyle.labelMedium1140(
                  color: EconaColor.grayNormal,
                  shadows: EconaShadow.headlineShadows,
                ),
                innerShadowTextStyles: [
                  EconaTextStyle.labelMedium1140(
                    foreground: EconaShadow().headlineInnerShadow,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.center,
                child: EconaGradientButton(
                  text: 'お問い合わせ',
                  onPressed: () async {
                    /// Todo: WebViewでお問い合わせを開く
                    await const WebViewRouteData(
                      url: 'https://google.com',
                      title: 'お問い合わせ',
                    ).push<void>(context);
                  },
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
    );
  }
} 