import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/profile.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_checkbox.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/components/shadow_gradient_container.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/gradient.dart';
import 'package:econa_mobile_app/presentations/pages/certificate/certificates_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/error_page.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_path.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyPage extends HookConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // MyPage の状態（プロフィール含む）を取得
    final myPageState = ref.watch(myPageViewModelProvider);
    final myPageData = myPageState.myPageData;

    // マイページに来たときに 1 回だけポップアップを表示（期限付き, 男性のみ）
    useEffect(
          () {
        Future.microtask(() async {
          // 既に表示済みなら何もしない
          const homePopupShownKey = 'has_shown_home_popup_2025_12_31';
          final prefs = await SharedPreferences.getInstance();
          final hasShown = prefs.getBool(homePopupShownKey) ?? false;
          if (hasShown) {
            return;
          }

          // データ未取得 or エラー中なら何もしない
          if (myPageData == null || myPageState.error != null) {
            return;
          }

          // 性別判定（男性のみ）
          final profile = myPageData.profile;
          final isMale =
              profile.genderCode == GenderCode.GENDER_CODE_MALE;
          if (!isMale) {
            return;
          }

          // 期限チェック
          final now = DateTime.now();
          final deadline = DateTime(2025, 12, 31, 23, 59, 59);
          if (now.isAfter(deadline)) {
            return;
          }

          if (!context.mounted) {
            return;
          }

          await showDialog<void>(
            context: context,
            builder: (dialogContext) => Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              insetPadding: const EdgeInsets.symmetric(horizontal: 12),
              child: EconaModal(
                message: '【リリース記念キャンペーン】\n無料でメッセージが送り放題！',
                messageStyle: EconaTextStyle.labelMedium1180(
                  color: EconaColor.grayDarkActive,
                ),
                subMessage:
                '12月31日までにベーシックプランをご購入いただいた方を対象に、購入日から1か月間の無料期間をプレゼント！\n\n※自動更新の停止をご希望の場合は、有効期間の2日前までに停止手続きを行ってください',
                subMessageStyle: EconaTextStyle.labelSmall140(
                  color: EconaColor.grayDarkActive,
                ),
                buttonText: '使ってみる',
                onButtonPressed: () async {
                  dialogContext.pop();
                  await const SubscriptionRouteData(
                    type: SubscriptionPageType.basic,
                  ).push<void>(context);
                },
              ),
            ),
          );

          // 表示済みフラグを保存（端末共通で1回）
          await prefs.setBool(homePopupShownKey, true);
        });

        return null;
      },
      [myPageData], // プロフィール情報が取れたタイミングで1回だけ実行
    );

    // 詳細画面から戻ってきたタイミングでもSWR再検証（差分があれば静かに更新）
    useEffect(() {
      final route = GoRouter.of(context);
      void listener() {
        // pop直後など、戻ってきたとみなせるタイミングで軽量再検証
        ref.read(myPageViewModelProvider.notifier).revalidate();
      }
      route.routerDelegate.addListener(listener);
      return () {
        route.routerDelegate.removeListener(listener);
      };
    }, const []);

    // マイページ読み込み時のエラーでメンテナンスモードを検知
    ref.listen<MyPageState>(myPageViewModelProvider, (previous, next) async {
      final error = next.error;
      if (error == null) {
        return;
      }

      await handleEconaError(context, error);
    });

    return Scaffold(
      backgroundColor: EconaColor.background,
      appBar: DefaultAppBar(
        titleText: '',
        actions: [
          IconButton(
            icon: Assets.images.icons.settings.image(),
            iconSize: 32,
            onPressed: () async {
              await const SettingsRouteData().push<Object>(context);
            },
          ),
          // IconButton(
          //   icon: Assets.images.icons.notificationsOutlined.image(),
          //   iconSize: 32,
          //   onPressed: () {
          //     // 通知画面への遷移
          //   },
          // ),
        ],
      ),
      body: const _BuildBody(),
    );
  }
}

class _BuildBody extends ConsumerWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPageState = ref.watch(myPageViewModelProvider);

    if (myPageState.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    if(myPageState.error != null) {
      return ErrorPage(
        title: '読み込みに失敗しました',
        message: myPageState.error!.operationMessage,
        onRetry: () async {
          await ref.read(myPageViewModelProvider.notifier).initialFetchData();
        },
      );
    }

    if (myPageState.myPageData == null) {
      return const Center(child: EconaLoadingIndicator());
    }

    final myPageData = myPageState.myPageData;
    final profile = myPageData!.profile;

    final avatarIconUrl = resolvePhotoUrl(
      profile: profile,
      kind: PhotoUrlKind.originUrl,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // プロフィール写真と進捗
            _ProfilePhotoSection(
              avatarImageUrl: avatarIconUrl,
              profileInputRate: myPageData.profile.profileInputRate,
            ),
            // 名前、居住地、年齢
            _ProfileInfoSection(profile: profile),
            const SizedBox(height: 24),
            // 残いいね数
            _NumberOfLikes(hasLikePoint: myPageData.hasLikePoint ?? 0),
            const SizedBox(height: 16),
            // プランと認証状況
            _PlanAndVerificationSection(tier: myPageData.subscriptionTier),
            const SizedBox(height: 16),
            // 所持ポイント
            _PointsSection(hasMp: myPageData.matchingPoint, hasLp: myPageData.lavigationPoint),
            const SizedBox(height: 24),
            // フッターメニュー
            const _FooterMenuSection(),
            const SizedBox(height: 100), // ボトムナビゲーション分の余白

          ],
        ),
      ),
    );
  }
}

class _ProfilePhotoSection extends StatelessWidget {
  const _ProfilePhotoSection({
    required this.avatarImageUrl,
    required this.profileInputRate,
    super.key,
  });

  final String avatarImageUrl;
  final int? profileInputRate;

  @override
  Widget build(BuildContext context) {
    final ImageProvider<Object> avatarImageProvider;
    if (avatarImageUrl.startsWith('http')) {
      avatarImageProvider = NetworkImage(avatarImageUrl);
    } else {
      avatarImageProvider = AssetImage(avatarImageUrl);
    }

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // プロフィール写真
          Container(
            width: 104,
            height: 104,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Color(0xFF97E1D4),
                  Color(0xFF97E1D4),
                  Color(0xFF6284FF),
                  Color(0xFF6284FF),
                  Color(0xFFA27DE1),
                  Color(0xFFFF72B6),
                  Color(0xFFFF72B6),
                  Color(0xFFF9E5E8),
                  Color(0xFFF9E5E8),
                  Color(0xFF97E1D4),
                ],
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF3F4FA),
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: avatarImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // 編集ボタン
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: Assets.images.icons.pen.image(height: 24, width: 24),
                onPressed: () async {
                  await const ProfileRouteData().push<void>(context);
                },
              ),
            ),
          ),
          // 進捗表示
          Positioned(
            bottom: -4,
            left: 14,
            right: 14,
            child: SizedBox(
              height: 24,
              child: ShadowGradientContainer(
                borderRadius: BorderRadius.circular(100),
                gradient: EconaGradient.defaultButtonGradient,
                backgroundColor: const Color(0xFFD097DB),
                innerShadows: const [],
                dropShadows: [
                  BoxShadow(
                    offset: const Offset(2, 2),
                    blurRadius: 12,
                    color: const Color(0xFFB691E2).withValues(alpha: 0.32),
                  ),
                  const BoxShadow(
                    offset: Offset(-6, -6),
                    blurRadius: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                  const BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 20,
                    color: Color(0xFF9A94EE),
                  ),
                ],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${profileInputRate ?? 0}%完了',
                    style: EconaTextStyle.labelXSmall(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileInfoSection extends StatelessWidget {
  const _ProfileInfoSection({
    required this.profile,
    super.key,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          profile.updatableProfile.requiringReviewNickname.currentNickname,
          style: EconaTextStyle.labelMedium1140(
            color: EconaColor.grayDarkActive,
          ),
        ),
        Text(
          profile.updatableProfile.residenceRegion.name,
          style: EconaTextStyle.labelXSmall(
            color: EconaColor.grayNormal,
          ),
        ),
        Text(
          '/',
          style: EconaTextStyle.labelXSmall(
            color: EconaColor.grayNormal,
          ),
        ),
        Text(
          calculateAgeJp(profile.updatableProfile.birthday),
          style: EconaTextStyle.labelXSmall(
            color: EconaColor.grayNormal,
          ),
        ),
      ],
    );
  }
}

class _NumberOfLikes extends StatelessWidget {
  const _NumberOfLikes({
    required this.hasLikePoint,
    super.key,
  });

  final int hasLikePoint;

  @override
  Widget build(BuildContext context) {
    return ConvexPanel(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '残いいね',
              style: EconaTextStyle.labelMedium1140(
                color: EconaColor.grayDarkActive,
              ),
            ),
            const Spacer(),
            Assets.images.icons.likeHeart.image(height: 24, width: 24),
            Text(
              '×${hasLikePoint}',
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayNormal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanAndVerificationSection extends HookConsumerWidget {
  const _PlanAndVerificationSection({
    required this.tier,
  });

  final SubscriptionTier tier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (displayPlanName, planEncourageText) = switch (tier) {
      SubscriptionTier.SUBSCRIPTION_TIER_BASIC
      => ('ベーシックプラン', 'あなたの理想を最短ルートで！'),
      SubscriptionTier.SUBSCRIPTION_TIER_PREMIUM
      => ('プレミアムプラン', null),
      SubscriptionTier.SUBSCRIPTION_TIER_FREE ||
      SubscriptionTier.SUBSCRIPTION_TIER_UNSPECIFIED ||
      SubscriptionTier()
      => ('フリープラン', '有料プランでメッセージし放題！'),
    };

    final state = ref.read(myPageViewModelProvider);

    final isSingleVerified = state.myPageData?.isSingleVerified ?? false;
    final isIdentityVerified = state.myPageData?.isIdentityVerified ?? false;

    final String? certificateEncourageText;
    if(isSingleVerified) {
      certificateEncourageText = null;
    } else if (isIdentityVerified) {
      certificateEncourageText = '独身証明で利用料が安くなる！';
    } else {
      certificateEncourageText = 'ご利用には本人確認が必要です！';
    }

    return ConcavePanel(
      backgroundColor: const Color(0xFFE4E7FB),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ご利用中のプラン',
                  style: EconaTextStyle.labelSmall140(
                    color: EconaColor.grayNormal,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await const CurrentPlanRouteData().push<void>(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        displayPlanName,
                        style: EconaTextStyle.regularSmall140(
                          color: EconaColor.grayNormal,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Assets.images.icons.chevronRight.svg(height: 18, width: 18),
                    ],
                  ),
                ),
              ],
            ),
            if(planEncourageText != null)...[
              SizedBox(
                width: double.infinity,
                child: ConvexPanel(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Text(
                      planEncourageText,
                      style: EconaTextStyle.labelMedium1140(
                        color: EconaColor.grayDarkActive,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '認証状況',
                  style: EconaTextStyle.labelSmall140(
                    color: EconaColor.grayNormal,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    await const CertificatesRouteData().push<Object>(context);
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Row(
                    children: [
                      EconaCheckbox(
                        value: isIdentityVerified,
                        onChanged: (value) {},
                        text: '本人確認',
                        textStyle: EconaTextStyle.regularSmall140(
                          color: EconaColor.grayNormal,
                        ),
                        readOnly: true,
                      ),
                      EconaCheckbox(
                        value: isSingleVerified,
                        onChanged: (value) {},
                        text: '独身証明',
                        textStyle: EconaTextStyle.regularSmall140(
                          color: EconaColor.grayNormal,
                        ),
                        readOnly: true,
                      ),
                      Assets.images.icons.chevronRight.svg(height: 18, width: 18),
                    ],
                  ),
                ),
              ],
            ),
            if(certificateEncourageText != null)...[
              SizedBox(
                width: double.infinity,
                child: ConvexPanel(
                  backgroundColor: const Color(0xFFF5FAFE),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Text(
                      certificateEncourageText,
                      style: EconaTextStyle.labelMedium1140(
                        color: EconaColor.grayDarkActive,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _PointsSection extends StatelessWidget {
  const _PointsSection({
    required this.hasMp,
    required this.hasLp,
    super.key,
  });

  final int hasMp;
  final int hasLp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '所持ポイント',
          style: EconaTextStyle.labelSmall140(
            color: EconaColor.grayNormal,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            _HasPointPanelButton(point: hasMp, pageType: PurchasePageType.mp),
            _HasPointPanelButton(point: hasLp, pageType: PurchasePageType.lp),
          ],
        ),
      ],
    );
  }
}

class _FooterMenuSection extends StatelessWidget {
  const _FooterMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Assets.images.icons.footPrint.image(height: 24, width: 24),
          title: InnerShadowText(
            text: '足あと',
            textStyle: EconaTextStyle.labelSmall140(
              color: EconaColor.gray200,
              shadows: EconaShadow.headlineShadows,
            ),
            innerShadowTextStyles: [
              EconaTextStyle.labelSmall140(
                foreground: EconaShadow().headlineInnerShadow,
              ),
            ],
          ),
          trailing: Assets.images.icons.chevronRight.svg(height: 16, width: 16),
          onTap: () async {
            await const FootprintRouteData().push<void>(context);
          },
        ),
        ListTile(
          leading: Assets.images.icons.favorite.image(height: 24, width: 24),
          title: InnerShadowText(
            text: 'お気に入り',
            textStyle: EconaTextStyle.labelSmall140(
              color: EconaColor.gray200,
              shadows: EconaShadow.headlineShadows,
            ),
            innerShadowTextStyles: [
              EconaTextStyle.labelSmall140(
                foreground: EconaShadow().headlineInnerShadow,
              ),
            ],
          ),
          trailing: Assets.images.icons.chevronRight.svg(height: 16, width: 16),
          onTap: () async {
            await const FavoriteRouteData().push<void>(context);
          },
        ),
        /// ToDo；セーフティーセンターが用意できていないため一旦コメントアウト
        // ListTile(
        //   leading: Assets.images.icons.safetyCenter.image(height: 24, width: 24),
        //   title: InnerShadowText(
        //     text: 'セーフティーセンター',
        //     textStyle: EconaTextStyle.labelSmall140(
        //       color: EconaColor.gray200,
        //       shadows: EconaShadow.headlineShadows,
        //     ),
        //     innerShadowTextStyles: [
        //       EconaTextStyle.labelSmall140(
        //         foreground: EconaShadow().headlineInnerShadow,
        //       ),
        //     ],
        //   ),
        //   trailing: Assets.images.icons.chevronRight.svg(height: 16, width: 16),
        //   onTap: () async {
        //     await const WebViewRouteData(
        //       url: 'https://lavigation.com/',
        //       title: 'セーフティーセンター',
        //     ).push<void>(context);
        //   },
        // ),
        ListTile(
          leading: Assets.images.icons.help.image(height: 24, width: 24),
          title: InnerShadowText(
            text: 'ヘルプ・お問い合わせ',
            textStyle: EconaTextStyle.labelSmall140(
              color: EconaColor.gray200,
              shadows: EconaShadow.headlineShadows,
            ),
            innerShadowTextStyles: [
              EconaTextStyle.labelSmall140(
                foreground: EconaShadow().headlineInnerShadow,
              ),
            ],
          ),
          trailing: Assets.images.icons.chevronRight.svg(height: 16, width: 16),
          onTap: () async {
            await const WebViewRouteData(
              url: 'https://lavigation.com/contact',
              title: 'ヘルプ・お問い合わせ',
            ).push<void>(context);
          },
        ),
      ],
    );
  }
}

class _HasPointPanelButton extends ConsumerWidget {
  const _HasPointPanelButton({
    required this.point,
    required this.pageType,
    super.key,
  });

  final int point;
  final PurchasePageType pageType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String unit;
    final Image image;

    switch(pageType) {
      case PurchasePageType.lp:
        unit = 'LP';
        image = Assets.images.icons.pointLp.image(height: 32, width: 32);
      case PurchasePageType.mp:
        unit = 'MP';
        image = Assets.images.icons.pointMp.image(height: 32, width: 32);
    }

    return Flexible(
      child: ConvexPanel(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        backgroundColor: const Color(0xFFE4E7FB),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              image,
              Text(
                '$point$unit',
                style: EconaTextStyle.headlineHeadlineBold(
                  color: EconaColor.grayDarkActive,
                ),
              ),
            ],
          ),
        ),
        onTap: () async {
          await PurchaseRouteData(type: pageType).push<void>(context);
        },
      ),
    );
  }
}
