import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_private_mode.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/auth.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/infrastructures/services/revenuecat_service.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.leftArrow.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 64),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Title(),
              _SettingSection(items: _SettingItems.generalSettingsItems),
              const _SubTitle(text: '非表示・ブロック'),
              _SettingSection(items: _SettingItems.hiddenAndBlockSettingsItems),
              const _SubTitle(text: 'お問い合わせ'),
              _SettingSection(items: _SettingItems.accountSettingsItems),
              const _SubTitle(text: 'サービスについて'),
              _SettingSection(items: _SettingItems.otherSettingsItems),
            ],
          ),
        ),
      ),
    );
  }
}

/// SettingsPageのタイトル部分
class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: InnerShadowText(
        text: '設定',
        textStyle: EconaTextStyle.headlineLarge(
          color: EconaColor.grayNormal,
        ),
        innerShadowTextStyles: [
          EconaTextStyle.headlineLarge(
            foreground: EconaShadow().headlineInnerShadow,
          ),
        ],
      ),
    );
  }
}

/// SettingsPageのサブタイトル部分
class _SubTitle extends StatelessWidget {
  const _SubTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        text,
        style: EconaTextStyle.labelSmall140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}

/// 各種設定のセクション
class _SettingSection extends ConsumerWidget {
  const _SettingSection({
    required this.items,
  });

  final List<SettingItem> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isLogout = item.title == 'ログアウト';

          return ListTile(
            title: _SettingItemName(text: item.title),
            trailing: isLogout
                ? null
                : const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
            onTap: () async {
              // ログアウト
              if (isLogout) {
                final authRepository = ref.read(authRepositoryProvider);
                await showDialog<void>(
                  context: context,
                  builder: (dialogContext) => Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                    child: EconaModal(
                      message: 'ログアウトしますか？',
                      buttonText: 'ログアウト',
                      cancelText: 'キャンセル',
                      onButtonPressed: () async {
                        Navigator.of(dialogContext).pop();
                        await authRepository.signOut();
                        if (!context.mounted) {
                          return;
                        }
                        const LoginRouteData().go(context);
                        // 画面遷移後に invalidate する
                        ref
                          ..invalidate(myPageViewModelProvider)
                          ..invalidate(currentUserIdProvider)
                          ..invalidate(profilePageViewModelProvider);
                      },
                    ),
                  ),
                );
                return;
              }

              // プライベートモード設定：プレミアム / プライベートモード状態を判定して分岐
              if (item.title == 'プライベートモード設定') {
                final isPremium =
                    await RevenueCatService.hasEntitlement('premium_access');

                // プライベートモード状態を取得（失敗しても既存挙動は維持）
                bool hasPrivateMode = false;
                try {
                  final userRepository = ref.read(userRepositoryProvider);
                  final response = await userRepository.getUserPrivateMode(
                    GetUserPrivateModeRequest(),
                  );
                  hasPrivateMode = response.enabled;
                } catch (_) {}

                if (isPremium || hasPrivateMode) {
                  // プレミアム加入 または プライベートモード有効 → 既存の設定画面へ
                  item.transition?.call();
                } else if (context.mounted) {
                  // それ以外 → プライベートモード購入画面へ
                  await const PrivateModeRouteData().push<void>(context);
                }
                return;
              }

              // それ以外の項目は従来どおり
              item.transition?.call();
            },
          );
        },
      ),
    );
  }
}

/// 設定項目名
class _SettingItemName extends StatelessWidget {
  const _SettingItemName({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InnerShadowText(
      text: text,
      textStyle: EconaTextStyle.labelMedium1140(
        color: EconaColor.grayNormal,
      ),
      innerShadowTextStyles: [
        EconaTextStyle.labelMedium1140(
          color: EconaColor.grayNormal,
          shadows: EconaShadow.headlineShadows,
        ),
        EconaTextStyle.labelMedium1140(
          foreground: EconaShadow().labelMediumInnerShadow,
        ),
      ],
    );
  }
}

/// 設定項目
class _SettingItems {
  static final generalSettingsItems = [
    // SettingItem(
    //   title: '通知設定',
    //   transition: () async {
    //     // await const NotificationSettingRouteData().push<void>(ctx);
    //     await EconaRouter.router.push(const NotificationSettingRouteData().location);
    //   },
    // ),
    SettingItem(
      title: 'いいね受信設定',
      transition: () async {
        await EconaRouter.router.push(const LikeReceiveSettingRouteData().location);
      },
    ),
    SettingItem(
      title: '足あと設定',
      transition: () async {
        await EconaRouter.router.push(const FootprintSettingRouteData().location);
      },
    ),
    SettingItem(
      title: '初回メッセージ設定',
      transition: () async {
        await EconaRouter.router.push(const FirstMessageSettingRouteData().location);
      },
    ),
    SettingItem(
      title: 'オフライン設定',
      transition: () async {
        await EconaRouter.router.push(const OfflineSettingRouteData().location);
      },
    ),
    SettingItem(
      title: 'プライベートモード設定',
      transition: () async {
        await EconaRouter.router.push(const PrivateModeSettingRouteData().location);
      },
    ),
    // SettingItem(
    //   title: '自動マッチング機能',
    //   transition: () async {
    //     await EconaRouter.router.push(const AutoMatchingSettingRouteData().location);
    //   },
    // ),
  ];

  static final hiddenAndBlockSettingsItems = [
    SettingItem(
      title: '非表示にしたお相手',
      transition: () async {
        await EconaRouter.router.push(const HideUserSettingRouteData().location);
      },
    ),
    SettingItem(
      title: '非表示にしたやりとり',
      transition: () async {
        await EconaRouter.router.push(const HideChatRoomsSettingRouteData().location);
      },
    ),
    SettingItem(
      title: 'ブロックしたお相手',
      transition: () async {
        await EconaRouter.router.push(const BlockUserSettingRouteData().location);
      },
    ),
  ];

  static final accountSettingsItems = [
    const SettingItem(
      title: 'ログアウト',
      transition: null,
    ),
    SettingItem(
      title: '退会',
      transition: () async {
        await EconaRouter.router.push(const WithdrawalRouteData().location);
      },
    ),
  ];

  static final otherSettingsItems = [
    SettingItem(
      title: '会社概要',
      transition: () async {
        await EconaRouter.router.push(const WebViewRouteData(
          url: EconaWebUrl.company,
          title: '会社概要',
        ).location);
      },
    ),
    SettingItem(
      title: '利用規約',
      transition: () async {
        await EconaRouter.router.push(const WebViewRouteData(
          url: EconaWebUrl.terms,
          title: '利用規約',
        ).location);
      },
    ),
    SettingItem(
      title: 'プライバシーポリシー',
      transition: () async {
        await EconaRouter.router.push(const WebViewRouteData(
          url: EconaWebUrl.privacy,
          title: 'プライバシーポリシー',
        ).location);
      },
    ),
    // SettingItem(
    //   title: 'クッキーポリシー',
    //   transition: () async {
    //     await EconaRouter.router.push(const HomeRouteData().location);
    //   },
    // ),
    // SettingItem(
    //   title: 'ライセンス',
    //   transition: () async {
    //     await EconaRouter.router.push(const HomeRouteData().location);
    //   },
    // ),
    SettingItem(
      title: '特定商取引法に基づく表示',
      transition: () async {
        await EconaRouter.router.push(const WebViewRouteData(
          url: EconaWebUrl.law,
          title: '特定商取引法に基づく表示',
        ).location);
      },
    ),
    // SettingItem(
    //   title: '資金決済法に基づく表示',
    //   transition: () async {
    //     await EconaRouter.router.push(const HomeRouteData().location);
    //   },
    // ),
    // SettingItem(
    //   title: 'コミュニティガイドライン',
    //   transition: () async {
    //     await EconaRouter.router.push(const HomeRouteData().location);
    //   },
    // ),
  ];
}

/// 設定項目の構造
class SettingItem {
  const SettingItem({
    required this.title,
    required this.transition,
  });

  final String title;
  final VoidCallback? transition;
}
