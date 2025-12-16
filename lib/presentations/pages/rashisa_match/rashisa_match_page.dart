import 'package:econa_mobile_app/domains/entities/profile_label_keys.dart';
import 'package:econa_mobile_app/domains/entities/user_detail.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_tab.dart';
import 'package:econa_mobile_app/presentations/components/econa_tag.dart';
import 'package:econa_mobile_app/presentations/components/empty_state.dart';
import 'package:econa_mobile_app/presentations/components/floating_tab_scroll_view.dart';
import 'package:econa_mobile_app/presentations/components/headline_text.dart';
import 'package:econa_mobile_app/presentations/components/loading_state.dart';
import 'package:econa_mobile_app/presentations/components/profile_image_carousel.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/helpers/label_localizer.dart';
import 'package:econa_mobile_app/presentations/layout.dart';
import 'package:econa_mobile_app/presentations/pages/rashisa_match/rashisa_match_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/rashisa_match/rashisa_match_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/rashisa_match/rashisa_match_tutorial_page.dart';
import 'package:econa_mobile_app/presentations/pages/rashisa_match/rashisa_match_tutorial_provider.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RashisaMatchPage extends ConsumerWidget {
  const RashisaMatchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rashisaMatchPageViewModelProvider);
    final viewModel = ref.read(rashisaMatchPageViewModelProvider.notifier);
    final tutorialState = ref.watch(tutorialFirstVisitProvider);

    // らしさマッチページ読み込み時のエラーでメンテナンスモードを検知
    ref.listen<RashisaMatchPageState>(rashisaMatchPageViewModelProvider, (previous, next) async {
      final error = next.error;
      if (error == null) {
        return;
      }

      await handleEconaError(context, error);
    });

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: tutorialState.when(
          loading: () => const RashisaMatchAppBar(),
          error: (_, __) => const RashisaMatchAppBar(),
          data: (value) => value ? null : const RashisaMatchAppBar(),
        ),
        // TODO: AIカウンセリング未実施時のモーダル表示
        body: tutorialState.when(
          data: (value) => value
              ? RashisaMatchTutorialPage(
                  onTutorialCompleted: () => ref
                      .read(tutorialFirstVisitProvider.notifier)
                      .markTutorialAsShown(),
                )
              : RashisaMatchContent(
                  state: state,
                  viewModel: viewModel,
                ),
          loading: () => const Center(child: EconaLoadingIndicator()),
          // エラーの場合はそのままらしさマッチ画面を表示
          error: (_, __) => RashisaMatchContent(
            state: state,
            viewModel: viewModel,
          ),
        ),
      ),
    );
  }
}

class RashisaMatchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const RashisaMatchAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(rashisaMatchPageViewModelProvider.notifier);

    return CenterAppBar(
      titleText: EconaAppBarText.rashisaMatchTitle,
      leading: IconButton(
        icon: Assets.images.icons.close.image(
          height: 32,
          width: 32,
        ),
        iconSize: 32,
        padding: EdgeInsets.zero,
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: Assets.images.icons.refresh.image(
            height: 32,
            width: 32,
          ),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: () => viewModel.getRashisaMatchUsers(regenerate: true),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class RashisaMatchContent extends StatelessWidget {
  const RashisaMatchContent({
    required this.state,
    required this.viewModel,
    super.key,
  });

  final RashisaMatchPageState state;
  final RashisaMatchPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const RashisaMatchLoadingState();
    }

    if (state.error != null) {
      return EmptyState(
        title: 'おすすめユーザの取得に失敗しました。',
        buttonText: '再試行',
        onButtonTap: viewModel.getRashisaMatchUsers,
      );
    }

    if (state.rashisaMatchUsers.isEmpty) {
      return EmptyState(
        title: 'あなた専属のAIが\nカウンセリング結果を分析し\n'
            'ぴったりのお相手を提案します',
        buttonText: 'カウンセリングを受ける',
        onButtonTap: () {
          const CounselingRouteData().push<void>(context);
        },
      );
    }

    return PageView.builder(
      itemCount: state.rashisaMatchUsers.length,
      controller: PageController(viewportFraction: 0.91),
      itemBuilder: (context, index) {
        final rashisaMatchUser = state.rashisaMatchUsers[index];
        return RashisaMatchScrollView(
          child: UserProfile(
            rashisaMatchUser: rashisaMatchUser,
            onStarChanged: (bool starred) async {
              await viewModel.updateUserFavorite(
                toUserId: rashisaMatchUser.profile.userId,
                favorite: starred,
              );
              // NotifierProviderで自動反映されるので明示的な再ビルド不要
            },
          ),
        );
      },
    );
  }
}

class RashisaMatchLoadingState extends ConsumerWidget {
  const RashisaMatchLoadingState({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(loadingProgressProvider);

    return LoadingState(
      title: 'AIがお相手を探しています',
      progressText: '$progress%',
    );
  }
}

class RashisaMatchScrollView extends StatelessWidget {
  const RashisaMatchScrollView({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    const config = FloatingTabScrollConfig(
      tabPosition: 554,
      tabLabels: ['Laviからのおすすめ', 'プロフィール'],
      pageKey: 'rashisa_match',
    );

    return FloatingTabScrollView(
      config: config,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: EconaPagePadding.vertical,
        ),
        child: Center(child: child),
      ),
    );
  }
}

class UserProfile extends HookConsumerWidget {
  const UserProfile({
    required this.rashisaMatchUser,
    required this.onStarChanged,
    super.key,
  });

  final UserDetail rashisaMatchUser;
  final ValueChanged<bool> onStarChanged;

  static const double profileImageCarouselPosition = -388;
  static const double spaceForProfileImageCarousel = 404;
  static const double dragThreshold = 50;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dragDelta = useState<double>(0);
    // プロフィール詳細画面への多重遷移防止フラグ
    final isPushingUserDetail = useState(false);

    return RashisaMatchBackgroundCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            rashisaMatchUser.matchingReason?.mainTitle ?? '',
            style: EconaTextStyle.headlineHeadline(
              color: EconaColor.grayTextInvert,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: spaceForProfileImageCarousel),
          Stack(
            clipBehavior: Clip.none,
            children: [
              TabSection(rashisaMatchUser: rashisaMatchUser),
              Positioned(
                top: profileImageCarouselPosition,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onVerticalDragStart: (_) {
                    // ドラッグ開始時に累積値をリセット
                    dragDelta.value = 0.0;
                  },
                  onVerticalDragUpdate: (details) {
                    // ドラッグ中にdyを累積
                    dragDelta.value += details.delta.dy;
                  },
                  onVerticalDragEnd: (_) {
                    // 上方向（負のdy）でしきい値を超えた場合のみナビゲーション
                    if (dragDelta.value < -dragThreshold) {
                      if (!isPushingUserDetail.value) {
                        isPushingUserDetail.value = true;
                        RashisaMatchDetailRouteData(
                          userId: rashisaMatchUser.profile.userId,
                        )
                            .push<void>(context)
                            .whenComplete(() => isPushingUserDetail.value = false);
                      }
                    }
                    // 終了時に累積値をリセット
                    dragDelta.value = 0.0;
                  },
                  onVerticalDragCancel: () {
                    // キャンセル時にも累積値をリセット
                    dragDelta.value = 0.0;
                  },
                  child: ProfileImageCarousel(
                    profile: rashisaMatchUser.profile,
                    showBadge: false,
                    onProfileInfoTap: () async {
                      if (isPushingUserDetail.value) {
                        return;
                      }
                      isPushingUserDetail.value = true;

                      try {
                        // ユーザー詳細ページに遷移
                        await RashisaMatchDetailRouteData(
                          userId: rashisaMatchUser.profile.userId,
                        ).push<void>(context);
                      } finally {
                        isPushingUserDetail.value = false;
                      }
                    },
                    isStarred: rashisaMatchUser.profile.isFavorite,
                    onStarTap: () => onStarChanged(
                      !rashisaMatchUser.profile.isFavorite,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RashisaMatchBackgroundCard extends StatelessWidget {
  const RashisaMatchBackgroundCard({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      // 高さはchildに合わせて可変
      padding: const EdgeInsets.only(
        top: 24,
        right: 12,
        bottom: 12,
        left: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFFB416C).withValues(alpha: 0.6),
            const Color(0xFFF5DE2F).withValues(alpha: 0.2),
            const Color(0xFFFB416C).withValues(alpha: 0.6),
          ],
          stops: const [0.0, 0.39, 0.86],
        ),
      ),
      child: child,
    );
  }
}

class TabSection extends HookConsumerWidget {
  const TabSection({required this.rashisaMatchUser, super.key});

  final UserDetail rashisaMatchUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileDetail = rashisaMatchUser.profileDetail;
    final tags = profileDetail?.tags;
    final List<Widget> tabContents = [
      SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              rashisaMatchUser.matchingReason?.reasonTitle ?? '',
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayNormal,
              ),
            ),
            const SizedBox(height: 17.5),
            Text(
              rashisaMatchUser.matchingReason?.reasonContent ?? '',
              style: EconaTextStyle.regularMedium2200(
                color: EconaColor.grayDarkActive,
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineLarge(text: '基本情報'),
          const SizedBox(height: 28),
          HeadlineDefault(
            label: 'ニックネーム',
            value: profileDetail?.nickname ?? '-',
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '年齢',
            value: profileDetail?.ageText ?? '-',
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '居住地',
            value: profileDetail?.residence ?? '-',
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '血液型',
            value: localizeLabel(
              profileDetail?.bloodType ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '出身地',
            value: profileDetail?.birthplace ?? '-',
          ),
          const SizedBox(height: 48),
          const HeadlineLarge(text: '容姿'),
          const SizedBox(height: 28),
          HeadlineDefault(
            label: '身長',
            value: profileDetail?.heightText ?? '-',
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '体型',
            value: localizeLabel(
              profileDetail?.bodyType ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 48),
          const HeadlineLarge(text: '性格'),
          const SizedBox(height: 28),
          HeadlineDefault(
            label: '社交性',
            value: localizeLabel(
              profileDetail?.sociability ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: 'よく言われる性格タイプ',
            value: localizeLabel(
              profileDetail?.commonlySaidPersonality ??
                  const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '16タイプ診断',
            value: localizeLabel(
              profileDetail?.sixteenPersonality ??
                  const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 48),
          const HeadlineLarge(text: '仕事・学歴'),
          const SizedBox(height: 28),
          HeadlineDefault(
            label: '職種',
            value: localizeLabel(
              profileDetail?.occupation ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '勤務地',
            value: profileDetail?.workplace ?? '-',
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '年収',
            value: localizeLabel(
              profileDetail?.salaryRange ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '学歴',
            value: localizeLabel(
              profileDetail?.educationalBackground ??
                  const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 48),
          const HeadlineLarge(text: '生活・その他'),
          const SizedBox(height: 28),
          HeadlineDefault(
            label: '兄弟姉妹',
            value: localizeLabel(
              profileDetail?.sibling ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '同居人',
            value: localizeLabel(
              profileDetail?.roommate ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '結婚歴',
            value: localizeLabel(
              profileDetail?.maritalHistory ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '子供の有無',
            value: localizeLabel(
              profileDetail?.childSituation ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '休日',
            value: localizeLabel(
              profileDetail?.holidayType ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '話せる言語',
            value: profileDetail?.languages ?? '-',
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: 'お酒',
            value: localizeLabel(
              profileDetail?.drinkingAlcohol ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: 'タバコ',
            value: localizeLabel(
              profileDetail?.smoking ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 48),
          const HeadlineLarge(text: '将来'),
          const SizedBox(height: 28),
          HeadlineDefault(
            label: '結婚への意思',
            value: localizeLabel(
              profileDetail?.marriageAspiration ??
                  const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '子供がほしいか',
            value: localizeLabel(
              profileDetail?.childDesire ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '家事育児',
            value: localizeLabel(
              profileDetail?.houseWork ?? const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 48),
          const HeadlineLarge(text: '初回デート'),
          const SizedBox(height: 28),
          HeadlineDefault(
            label: '出会うまでの希望',
            value: localizeLabel(
              profileDetail?.datingPreference ??
                  const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '初回のデート費用',
            value: localizeLabel(
              profileDetail?.firstDateCostPreference ??
                  const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 36),
          HeadlineDefault(
            label: '初回デートするなら',
            value: localizeLabel(
              profileDetail?.firstDateLocationPreference ??
                  const LabelKey('common.hyphen'),
            ),
          ),
          const SizedBox(height: 48),
          const HeadlineLarge(text: 'タグ'),
          const SizedBox(height: 11),
          if (tags != null && tags.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 12,
                children: [
                  for (final tag in tags) EconaTag(tag: tag.tagName),
                ],
              ),
            ),
          const SizedBox(height: 72),
        ],
      ),
    ];

    return Container(
      width: 337,
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 56,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: ref.watch(isOverlayVisibleProvider('rashisa_match'))
                ? 0.0
                : 1.0,
            duration: const Duration(milliseconds: 200),
            child: const EconaTabWithProvider(
              labels: ['Laviからのおすすめ', 'プロフィール'],
              pageKey: 'rashisa_match',
            ),
          ),
          const SizedBox(height: 33.5),
          tabContents[ref.watch(tabIndexProvider('rashisa_match'))],
        ],
      ),
    );
  }
}
