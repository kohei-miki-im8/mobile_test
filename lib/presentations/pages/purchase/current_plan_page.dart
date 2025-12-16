import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/feature_card.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/panel.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/error_page.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/current_plan_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/current_plan_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/subscription_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:econa_mobile_app/infrastructures/repositories/profile.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/profile/v1/get_profile.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/subscription_tier.pbenum.dart';
import 'package:intl/intl.dart';

class CurrentPlanPage extends HookConsumerWidget {
  const CurrentPlanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ルート変更時に最新情報を取得
    useEffect(() {
      final route = GoRouter.of(context);
      void listener() {
        // pop直後など、戻ってきたとみなせるタイミングで軽量再検証
        ref.read(currentPlanPageViewModelProvider.notifier).revalidate();
      }

      route.routerDelegate.addListener(listener);
      return () {
        route.routerDelegate.removeListener(listener);
      };
    }, const []);

    final state = ref.watch(currentPlanPageViewModelProvider);
    final subscriptionStatus = state.subscriptionStatus;

    // 現在のプランページのエラーでメンテナンスモードを検知
    ref.listen<CurrentPlanPageState>(currentPlanPageViewModelProvider, (previous, next) async {
      final error = next.error;
      if (error == null) {
        return;
      }

      await handleEconaError(context, error);
    });

    if(state.isLoading) {
      return const EconaLoadingIndicator();
    }

    // subscriptionStatusがnullの場合はデフォルト表示
    if (subscriptionStatus == null) {
      return ErrorPage(
        title: 'ご利用中のプラン',
        message: 'ご利用中のプランの取得に失敗しました',
        onRetry: () => ref.refresh(currentPlanPageViewModelProvider),
      );
    }

    final title = subscriptionStatus.isSubscribed
        ? '利用中のプラン'
        : '有料プラン';

    return Scaffold(
      backgroundColor: EconaColor.background,
      appBar: CenterAppBar(
        titleText: title,
        leading: IconButton(
          icon: Assets.images.icons.close.image(
            height: 32,
            width: 32,
          ),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _CurrentPlanContent(),
        ),
      ),
    );
  }
}

class _CurrentPlanContent extends HookConsumerWidget {
  const _CurrentPlanContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentPlanPageViewModelProvider);
    return state.subscriptionStatus!.isSubscribed
        ? const _SubscribedView()
        : const _FreeTierView();
  }
}

/// フリープラン時のビュー
class _FreeTierView extends HookConsumerWidget {
  const _FreeTierView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: 0, viewportFraction: 1);
    final currentIndex = useState(0);
    final genderCode = useState<GenderCode?>(null);

    void onSelect(int index) {
      currentIndex.value = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    }

    useEffect(() {
      Future(() async {
        try {
          final profileRepo = ref.watch(profileRepositoryProvider);
          final profile = (await profileRepo.getProfile(GetProfileRequest())).profile;
          genderCode.value = profile.genderCode;
        } catch (_) {
          // 取得失敗時はデフォルトで男性として両タブ表示
          genderCode.value = GenderCode.GENDER_CODE_MALE;
        }
      });
      return null;
    }, const []);

    final showBasicTab = genderCode.value != GenderCode.GENDER_CODE_FEMALE;

    if (genderCode.value == null) {
      return const Center(child: EconaLoadingIndicator());
    }

    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(height: 12),
            _PlanSegmentedTabs(
              selectedIndex: currentIndex.value,
              onChanged: onSelect,
              showBasic: showBasicTab,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (i) => currentIndex.value = i,
                children: showBasicTab
                    ? const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: _PlanFeaturesList(isPremium: false),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: _PlanFeaturesList(isPremium: true),
                        ),
                      ]
                    : const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: _PlanFeaturesList(isPremium: true),
                        ),
                      ],
              ),
            ),
          ],
        ),
        // フローティングボタン
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            color: Colors.transparent,
            child: EconaGradientButton(
              text: 'プラン情報を確認する',
              onPressed: () async {
                final type = showBasicTab
                    ? (currentIndex.value == 0
                    ? SubscriptionPageType.basic
                    : SubscriptionPageType.premium)
                    : SubscriptionPageType.premium;
                await SubscriptionRouteData(type: type).push<void>(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// プリ―プラン時のタブ
class _PlanSegmentedTabs extends StatelessWidget {
  const _PlanSegmentedTabs({
    required this.selectedIndex,
    required this.onChanged,
    this.showBasic = true,
  });

  final int selectedIndex;
  final void Function(int index) onChanged;
  final bool showBasic;

  @override
  Widget build(BuildContext context) {
    if (!showBasic) {
      // 女性: プレミアムのみ表示
      return Row(
        children: [
          Expanded(
            child: _SelectableCard(
              selected: true,
              onTap: () => onChanged(0),
              builder: (child) => ConcavePanel(child: child),
              child: PremiumTab(
                textStyle: EconaTextStyle.planCardText(
                  color: Colors.white,
                  fontSize: 22,
                ),
                subTextStyle: EconaTextStyle.planCardSubText(
                  color: EconaColor.grayNormal,
                  fontSize: 8,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          child: _SelectableCard(
            selected: selectedIndex == 0,
            onTap: () => onChanged(0),
            builder: (child) => selectedIndex == 0
                ? ConcavePanel(child: child)
                : ConvexPanel(
                    dropShadows: const [],
                    child: child,
                  ),
            child: BasicTab(
              textStyle: EconaTextStyle.planCardText(
                color: EconaColor.purpleNormal,
                fontSize: 22,
              ),
              subTextStyle: EconaTextStyle.planCardSubText(
                color: EconaColor.grayNormal,
                fontSize: 8,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _SelectableCard(
            selected: selectedIndex == 1,
            onTap: () => onChanged(1),
            builder: (child) => selectedIndex == 1
                ? ConcavePanel(child: child)
                : ConvexPanel(
                    dropShadows: const [],
                    child: child,
                  ),
            child: PremiumTab(
              textStyle: EconaTextStyle.planCardText(
                color: Colors.white,
                fontSize: 22,
              ),
              subTextStyle: EconaTextStyle.planCardSubText(
                color: EconaColor.grayNormal,
                fontSize: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// ベーシックプランのタブアイテム
class BasicTab extends StatelessWidget {
  const BasicTab({
    required this.textStyle,
    required this.subTextStyle,
    super.key,
  });

  final TextStyle textStyle;
  final TextStyle subTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
      child: Column(
        children: [
          Assets.images.icons.basicTitle.image(height: 30),
          Text(
            'ベーシック',
            style: subTextStyle,
          ),
        ],
      ),
    );
  }
}

/// プレミアムプランのタブアイテム
class PremiumTab extends StatelessWidget {
  const PremiumTab({
    required this.textStyle,
    required this.subTextStyle,
    super.key,
  });

  final TextStyle textStyle;
  final TextStyle subTextStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
      child: Column(
        children: [
          Assets.images.icons.premiumTitle.image(height: 30),
          Text(
            'プレミアム',
            style: subTextStyle,
          ),
        ],
      ),
    );
  }
}

/// 選択しているタブ
class _SelectableCard extends StatelessWidget {
  const _SelectableCard({
    required this.selected,
    required this.onTap,
    required this.child,
    required this.builder,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;
  final Widget Function(Widget child) builder;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(16);
    final panel = builder(child);

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: panel,
    );
  }
}

/// プランの機能リスト
class _PlanFeaturesList extends StatelessWidget {
  const _PlanFeaturesList({
    required this.isPremium,
  });

  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    final features = isPremium ? premiumFeatureData : basicFeatureData;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top:8, bottom: 90),
      child: Column(
        children: [
          FeaturesCard(features: features),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

/// プラン加入時のビュー
class _SubscribedView extends HookConsumerWidget {
  const _SubscribedView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentPlanPageViewModelProvider);

    final tier = state.subscriptionStatus!.plan.tier;
    final isBasic = tier == SubscriptionTier.SUBSCRIPTION_TIER_BASIC;

    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        children: [
          const UsagePlan(),
          const NextLikeDate(),
          if (isBasic) const UpgradeCard(),
          FeaturesCard(features: premiumFeatureData),
          const SizedBox(height: 8),
          EconaGradientButton(
            text: 'プラン情報を確認する',
            expandWidth: true,
            onPressed: () async {
              await const SubscriptionRouteData(
                type: SubscriptionPageType.premium,
              ).push<void>(context);
            },
          ),
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}

/// 現在利用中のプラン
class UsagePlan extends HookConsumerWidget {
  const UsagePlan({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentPlanPageViewModelProvider);

    final planName = state.subscriptionStatus!.plan.text;
    final remainingDays = state.subscriptionStatus!.remainingDays;

    return SizedBox(
      width: double.infinity,
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(16),
        borderWidth: 0,
        gradients: const [],
        backgroundColor: const Color(0xFFF5F5FE),
        innerShadows: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 3,
            color: const Color(0xFF353E72).withValues(alpha: 0.18),
          ),
          BoxShadow(
            offset: const Offset(-1, -1),
            blurRadius: 3,
            color: const Color(0xFFFFFFFF).withValues(alpha: 0.8),
          ),
        ],
        dropShadows: [
          BoxShadow(
            offset: const Offset(2, 2),
            blurRadius: 20,
            color: const Color(0xFF353E72).withValues(alpha: 0.1),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // プラン名
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  planName,
                  style: EconaTextStyle.labelXSmall(
                    color: const Color(0xFF656DF0),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // 日数
              Text(
                '$remainingDays',
                style: EconaTextStyle.planDays(
                  color: const Color(0xFF35407D),
                ),
              ),
              const SizedBox(height: 12),
              // プラン更新までの日数
              Text(
                'プラン更新までの日数',
                style: EconaTextStyle.labelSmall140(
                  color: const Color(0xFF35407D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 次回のいいね付与日
class NextLikeDate extends HookConsumerWidget {
  const NextLikeDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentPlanPageViewModelProvider);

    // 次回いいね付与日を計算
    String? nextLikeDateText;
    if (state.subscriptionStatus != null && state.subscriptionStatus!.remainingDays > 0) {
      final now = DateTime.now().toUtc();

      // 次回のいいね付与日を計算
      /// Todo: いいね付与日はバックエンドからもらう（未実装のため一旦計算処理を入れる）
      final nextLikeDate = _calculateNextLikeDate(now, 1);

      // 日付をフォーマット（M月d日）
      nextLikeDateText = DateFormat('M月d日', 'ja').format(nextLikeDate);
    }

    return Row(
      children: [
        Assets.images.icons.heart.image(width: 24, height: 24),
        const SizedBox(width: 12),
        Text(
          '次回いいね付与日',
          style: EconaTextStyle.nextLikeDateText(
            color: EconaColor.grayNormal,
          ),
        ),
        const Spacer(),
        Text(
          nextLikeDateText ?? '—',
          style: EconaTextStyle.regularSmall140(
            color: EconaColor.purpleNormal,
          ),
        ),
      ],
    );
  }
}

/// Premiumプランへの誘導カード
class UpgradeCard  extends HookConsumerWidget {
  const UpgradeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InnerShadowText(
            text: 'アップグレード',
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
          // Premiumプラン
          ShadowAndGradientBorderContainer(
            borderRadius: BorderRadius.circular(16),
            borderWidth: 0,
            gradients: const [],
            backgroundColor: Colors.transparent,
            innerShadows: const [],
            dropShadows: [
              BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 4,
                color: const Color(0xFF7273AB).withValues(alpha: 0.1),
              ),
              const BoxShadow(
                offset: Offset(-6, -6),
                blurRadius: 20,
                color: Color(0xFFFFFFFF),
              ),
              BoxShadow(
                offset: const Offset(4, 4),
                blurRadius: 20,
                color: const Color(0xFF6F75B0).withValues(alpha: 0.2),
              ),
            ],
            child: InkWell(
              onTap: () async {
                await const SubscriptionRouteData(
                  type: SubscriptionPageType.premium,
                ).push<void>(context);
              },
              borderRadius: BorderRadius.circular(16),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xFFF3F1FC),
                      Color(0xFFE9EFFE),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Assets.images.icons.premiumTitle.image(height: 30),
                    Text(
                      'プレミアム',
                      style: EconaTextStyle.planCardSubText(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 機能一覧のカード
class FeaturesCard extends HookConsumerWidget{
  const FeaturesCard({
    required this.features,
    super.key,
  });

  final List<FeatureData> features;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 8,
      children: features.map((feature) {
        return FeatureCard(
          icon: feature.icon,
          title: feature.title,
          description: feature.body,
          cost: feature.cost,
        );
      }).toList(),
    );
  }
}

/// ベーシックプランの機能
final basicFeatureData = [
  FeatureData(
    icon: Assets.images.icons.chat.image(height: 24, width: 24),
    title: 'メッセージし放題',
    body: 'マッチングしたお相手とメッセージのやりとりを無制限に行えます',
  ),
  FeatureData(
    icon: Assets.images.icons.like.image(height: 24, width: 24),
    title: '毎月30いいね付与',
    body: 'プラン加入時に加え毎月30いいねがもらえます',
  ),
  FeatureData(
    icon: Assets.images.icons.pointLp.image(height: 24, width: 24),
    title: '毎月50LP付与',
    body: 'プラン加入時に加え毎月50LPがもらえます',
  ),
  FeatureData(
    icon: Assets.images.icons.featureReverse.image(width: 24, height: 24),
    title: 'リバース',
    body: 'ホーム画面で一度スキップしたお相手を再び確認することができます',
  ),
];

/// プレミアムプランの機能
final premiumFeatureData = [
  FeatureData(
    icon: Assets.images.icons.featureMessageWithLike.image(height: 40, width: 40),
    title: 'メッセージし放題',
    body: 'マッチングしたお相手とメッセージのやりとりを無制限に行えます',
  ),
  FeatureData(
    icon: Assets.images.icons.featureGrantLike.image(height: 40, width: 40),
    title: '毎月50いいね付与',
    body: 'プラン加入時に加え毎月50いいねがもらえます',
  ),
  FeatureData(
    icon: Assets.images.icons.featureGrantLp.image(height: 40, width: 40),
    title: '毎月200LP付与',
    body: 'プラン加入時に加え毎月200LPがもらえます',
  ),
  FeatureData(
    icon: Assets.images.icons.featureFootprint.image(height: 40, width: 40),
    title: '足あと見放題',
    body: 'あなたのプロフィールを訪問したお相手を制限なく閲覧できます',
  ),
  FeatureData(
    icon: Assets.images.icons.featureMessageRead.image(height: 40, width: 40),
    title: 'メッセージの既読',
    body: 'あなたの送ったメッセージをお相手が読んだか確認できます\n'
        '※お相手が退会するまで有効です',
  ),
  FeatureData(
    icon: Assets.images.icons.featurePrioritizeDisplayProfile.image(height: 40, width: 40),
    title: 'プロフィールの優先表示',
    body: 'お相手のホーム画面にあなたのプロフィールが表示されやすくなります',
  ),
  FeatureData(
    icon: Assets.images.icons.featureHiddenOnline.image(height: 40, width: 40),
    title: 'オンライン状況の非表示',
    body: 'オンライン表示を隠すことができます',
  ),
  FeatureData(
    icon: Assets.images.icons.featurePrivateMode.image(height: 40, width: 40),
    title: 'プライベートモード',
    body: 'いいねをしたお相手にのみあなたのプロフィールが表示されるようになります',
  ),
  FeatureData(
    icon: Assets.images.icons.featureReverse.image(height: 40, width: 40),
    title: 'リバース',
    body: 'ホーム画面で一度スキップしたお相手を再び確認することができます',
  ),
  FeatureData(
    icon: Assets.images.icons.featurePrioritizeReview.image(height: 40, width: 40),
    title: '優先審査',
    body: '初回メッセージや写真の審査が優先されます',
  ),
];

/// 次回のいいね付与日を計算
DateTime _calculateNextLikeDate(DateTime currentDate, int likeGrantDay) {
  final now = currentDate;

  // 今月のいいね付与日
  DateTime thisMonthLikeDate;
  try {
    thisMonthLikeDate = DateTime(now.year, now.month, likeGrantDay);
  } catch (e) {
    // 月末日を超える場合（例：2月30日）は、月末日を使用
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
    thisMonthLikeDate = DateTime(now.year, now.month, lastDayOfMonth);
  }

  // 今月のいいね付与日がまだ来ていない場合
  if (now.isBefore(thisMonthLikeDate) || now.isAtSameMomentAs(thisMonthLikeDate)) {
    return thisMonthLikeDate;
  }

  // 今月のいいね付与日が過ぎている場合、来月のいいね付与日を返す
  try {
    return DateTime(now.year, now.month + 1, likeGrantDay);
  } catch (e) {
    // 月末日を超える場合（例：2月30日）は、月末日を使用
    final lastDayOfNextMonth = DateTime(now.year, now.month + 2, 0).day;
    return DateTime(now.year, now.month + 1, lastDayOfNextMonth);
  }
}