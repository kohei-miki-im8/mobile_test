import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/ekyc/v1/get_service_auth.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/ekyc.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/certificates_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class CertificatesPage extends HookConsumerWidget {
  const CertificatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(certificationStatusViewModelProvider);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: state.when(
        data: (certificationStatus) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (certificationStatus.error != null)...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: Colors.red),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            certificationStatus.error!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(certificationStatusViewModelProvider.notifier).refreshStatus();
                          },
                          child: const Text('再試行'),
                        ),
                      ],
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: InnerShadowText(
                    text: '認証状態',
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
                ),
                const IdentityStatus(),
                const SingleStatus(),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: InnerShadowText(
                    text: '認証詳細',
                    textStyle: EconaTextStyle.labelMedium2140(
                      color: EconaColor.grayNormal,
                      shadows: EconaShadow.headlineShadows,
                    ),
                    innerShadowTextStyles: [
                      EconaTextStyle.labelMedium2140(
                        foreground: EconaShadow().headlineInnerShadow,
                      ),
                    ],
                  ),
                ),
                IdentityVerification(isVerified: certificationStatus.isIdentityVerified),
                SingleVerification(isVerified: certificationStatus.isSingleVerified),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: EconaLoadingIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('エラーが発生しました: $error'),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(certificationStatusViewModelProvider);
                },
                child: const Text('再試行'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IdentityStatus extends HookConsumerWidget {
  const IdentityStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badge = ref.watch(identityVerificationBadgeProvider);

    return ConvexPanel(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Text(
              '本人確認',
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayDarkActive,
              ),
            ),
            const Spacer(),
            badge,
          ],
        ),
      ),
    );
  }
}

class SingleStatus extends HookConsumerWidget {
  const SingleStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badge = ref.watch(singleVerificationBadgeProvider);

    return ConvexPanel(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            Text(
              '独身証明',
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayDarkActive,
              ),
            ),
            const Spacer(),
            badge,
          ],
        ),
      ),
    );
  }
}

class IdentityVerification extends HookConsumerWidget {
  const IdentityVerification({
    required this.isVerified,
    super.key,
  });

  final bool isVerified;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadowAndGradientBorderContainer(
      borderRadius: BorderRadius.circular(16),
      borderWidth: 2,
      gradients: const [
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFD097DB),
            Color(0xFF8887EE),
          ],
          stops: [0, 1],
        )
      ],
      backgroundColor: Colors.white,
      innerShadows: [
        BoxShadow(
          offset: const Offset(-4, -4),
          blurRadius: 12,
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.5),
        ),
        BoxShadow(
          offset: const Offset(6, 6),
          blurRadius: 12,
          color: const Color(0xFF587CA7).withValues(alpha: 0.14),
        ),
      ],
      dropShadows: [
        BoxShadow(
          offset: const Offset(-4, -4),
          blurRadius: 12,
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.5),
        ),
        BoxShadow(
          offset: const Offset(4, 4),
          blurRadius: 12,
          color: const Color(0xFFC1D5EE).withValues(alpha: 0.5),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          spacing: 18,
          children: [
            Text(
              '本人確認',
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayDarkActive,
              ),
            ),
            Text(
              'あなたが実在する人物であることを審査します\n''運転免許証等の公的書類が必要です\n''審査完了で本人確認のバッジが付与されます',
              style: EconaTextStyle.labelMedium1180(
                color: EconaColor.grayDarkActive,
              ),
              textAlign: TextAlign.left,
            ),
            EconaGradientButton(
              enabled: !isVerified,
              text: isVerified ? '認証済み' : '認証へ進む',
              expandWidth: true,
              onPressed: () async {
                // 権限の状態を確認
                final permissionStatus = await Permission.camera.status;
                PermissionStatus permission;

                if (permissionStatus.isDenied) {
                  // 未決定の場合はリクエスト
                  permission = await Permission.camera.request();
                } else if (permissionStatus.isPermanentlyDenied) {
                  // 永続的に拒否されている場合は設定アプリに誘導
                  if (context.mounted) {
                    await showCupertinoDialog<void>(
                      context: context,
                      builder: (_) => CupertinoAlertDialog(
                        title: const Text('カメラの権限が必要です'),
                        content: const Text('設定アプリから「カメラ」を許可してください。'),
                        actions: [
                          CupertinoDialogAction(
                            child: const Text('閉じる'),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            child: const Text('設定を開く'),
                            onPressed: () async {
                              Navigator.pop(context);
                              await openAppSettings();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  return;
                }

                try {
                  final response = await ref.read(ekycRepositoryProvider)
                      .getServiceAuth(GetServiceAuthRequest());

                  if (response.errorCode.isNotEmpty) {
                    if (context.mounted) {
                      await EconaNotification.showTopToast(
                        context,
                        message: '本人確認の開始に失敗しました。時間をおいて再度お試しください。',
                      );
                    }
                    return;
                  }

                  final url = 'https://app.gmo-ekyc.com/entry/${response.accessToken}';

                  if (context.mounted) {
                    await EkycWebViewRouteData(url: url).push<void>(context);
                  }
                } catch (e) {
                  if (context.mounted) {
                    await EconaNotification.showTopToast(
                      context,
                      message: '通信エラーが発生しました。ネットワーク接続を確認してください。',
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SingleVerification extends HookConsumerWidget {
  const SingleVerification({
    required this.isVerified,
    super.key,
  });

  final bool isVerified;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadowAndGradientBorderContainer(
      borderRadius: BorderRadius.circular(16),
      borderWidth: 2,
      gradients: const [
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFD097DB),
            Color(0xFF8887EE),
          ],
          stops: [0, 1],
        ),
      ],
      backgroundColor: Colors.white,
      innerShadows: [
        BoxShadow(
          offset: const Offset(-4, -4),
          blurRadius: 12,
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.5),
        ),
        BoxShadow(
          offset: const Offset(6, 6),
          blurRadius: 12,
          color: const Color(0xFF587CA7).withValues(alpha: 0.14),
        ),
      ],
      dropShadows: [
        BoxShadow(
          offset: const Offset(-4, -4),
          blurRadius: 12,
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.5),
        ),
        BoxShadow(
          offset: const Offset(4, 4),
          blurRadius: 12,
          color: const Color(0xFFC1D5EE).withValues(alpha: 0.5),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          spacing: 18,
          children: [
            Text(
              '独身確認',
              style: EconaTextStyle.labelMedium2140(
                color: EconaColor.grayDarkActive,
              ),
            ),
            Text(
              'あなたが独身であることを審査します\n独身証明書の公的書類が必要です\n審査完了で独身確認のバッジが付与されます\n※有料プランが割引されます',
              style: EconaTextStyle.labelMedium1180(
                color: EconaColor.grayDarkActive,
              ),
            ),
            EconaGradientButton(
              enabled: !isVerified,
              text: isVerified ? '認証済み' : '認証へ進む',
              expandWidth: true,
              onPressed: () async {
                await const SingleCertificateRouteData().push<Object>(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
