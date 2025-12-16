import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/ekyc_level.dart';
import 'package:econa_mobile_app/domains/entities/login_status.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_badge.dart';
import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/components/econa_feature_action_sheet.dart'
    as sheet;
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_tab.dart';
import 'package:econa_mobile_app/presentations/components/empty_state.dart';
import 'package:econa_mobile_app/presentations/components/profile_summary_card.dart';
import 'package:econa_mobile_app/presentations/components/swipeable_profile_stack.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/pages/like/like_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// アプリ起動中に一度だけ「あなたから」でフローティングバナーを表示するためのフラグ
// bool _appealBannerShownOnce = false;

Future<void> showActionResult({
  required BuildContext context,
  required EconaError? error,
  required String successMessage,
}) async {
  if (!context.mounted) return;

  if (error != null) {
    final handled = await handleEconaError(context, error);
    if (handled) {
      return;
    }
  }

  if (error == null) {
    EconaBannerController.show(
      context,
      text: successMessage,
    );
    return;
  }

  if (error.operation == EconaErrorOperation.lackOfLp ||
      error.operation == EconaErrorOperation.lackOfMp) {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 12),
        child: EconaModal(
          message: error.operationMessage,
          buttonText: 'OK',
          onButtonPressed: () {
            dialogContext.pop();
          },
        ),
      ),
    );
  } else {
    await EconaNotification.showTopToast(
      context,
      message: error.operationMessage,
    );
  }
}

class LikePage extends HookConsumerWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final econaTabKey = GlobalKey();
    final tabHeight = useState<double?>(null);

    final state = ref.watch(likePageViewModelProvider);
    final notifier = ref.read(likePageViewModelProvider.notifier);

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final box =
              econaTabKey.currentContext?.findRenderObject() as RenderBox?;
          tabHeight.value = box?.size.height;
        });
        return null;
      },
      [],
    );

    return Scaffold(
      backgroundColor: EconaColor.background,
      appBar: DefaultAppBar(
        titleText: EconaAppBarText.likeLabel,
        actions: [
          IconButton(
            icon: Assets.images.icons.footPrint.image(
              height: 32,
              width: 32,
            ),
            padding: EdgeInsets.zero,
            onPressed: () {
              const FootprintRouteData().push<void>(context);
            },
          ),
        ],
      ),
      body: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: EconaTab(
              key: econaTabKey,
              selectedIndex: state.selectedTabIndex,
              onTabSelected: notifier.updateSelectedTabIndex,
              labels: const ['お相手から', 'あなたから', 'スキップ'],
              equalDistribution: true,
            ),
          ),
          Expanded(
            child: switch (state.selectedTabIndex) {
              0 => _ReceivedLikesList(tabHeight: tabHeight),
              1 => _SentLikesList(tabHeight: tabHeight),
              2 => _SkippedList(tabHeight: tabHeight),
              _ => _ReceivedLikesList(tabHeight: tabHeight),
            },
          ),
        ],
      ),
    );
  }
}

class _ReceivedLikesList extends HookConsumerWidget {
  const _ReceivedLikesList({required this.tabHeight});
  final ValueNotifier<double?> tabHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(likePageViewModelProvider);
    final notifier = ref.read(likePageViewModelProvider.notifier);

    // プロフィール詳細画面への多重遷移防止フラグ
    final isPushingUserDetail = useState(false);

    if (state.isLoading && state.receivedLikes.isEmpty) {
      return const Center(child: EconaLoadingIndicator());
    }

    if (state.error != null && state.receivedLikes.isEmpty) {
      return Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('エラー: ${state.error}'),
            ElevatedButton(
              onPressed: notifier.reload,
              child: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    if (state.receivedLikes.isEmpty) {
      final myRate = ref.watch(
        likePageViewModelProvider.select((s) => s.myProfileInputRate ?? 0),
      );
      final bool isProfileCompletionHigh = myRate >= 80;

      if (!isProfileCompletionHigh) {
        // 入力率80%未満
        return EmptyState(
          title: 'もらった「いいね」はありません\nいいねをもらうためには？',
          bottomText: '写真やタグを登録してみましょう',
          buttonText: 'プロフィールを充実させる',
          imageWidth: 120,
          imageHeight: 120,
                  onButtonTap: () async {
                    await const ProfileRouteData().push<void>(context);
                  },
        );
      } else {
        // 入力率80%以上
        return EmptyState(
          title: 'もらった「いいね」はありません\nいいねをもらうためには？',
          bottomText: 'たくさんのいいねをもらいましょう',
          buttonText: 'ブーストを使ってみる',
          imageWidth: 120,
          imageHeight: 120,
          onButtonTap: () async {
            await showModalBottomSheet<void>(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => sheet.EconaFeatureActionSheet(
                  title: 'ブースト',
                  leading: Column(
                    children: [
                      Assets.images.icons.featureBoost.image(height: 72, width: 72),
                    ],
                  ),
                  text: '30分間あなたのプロフィールが優先的に表示され、お相手から「いいね」をもらいやすくなります',
                  buttonText: 'ブーストする',
                  pointType: sheet.PointType.mp,
                  pointsToUse: 5,
                  onPressed: () async {
                    await notifier.onBoost();
                    final error = ref.read(likePageViewModelProvider).error;
                    await showActionResult(
                      context: context,
                      error: error,
                      successMessage: 'ブーストしました',
                    );
                    if (context.mounted) {
                      context.pop();
                    }
                  }
              ),
            );
          },
        );
      }
    }

    // 表示カードフォーカス時: メッセージ付きいいねであればモーダル表示（1ユーザー1回まで）
    final shownMessageLikeIdsRef = useRef<Set<String>>({});
    void onCardFocused(int index) {
      if (index < 0 || index >= state.receivedLikes.length) return;
      final item = state.receivedLikes[index];
      if (!item.hasSuperLikeMessage) return;
      final key = item.userLikeId ?? item.userId;
      final shown = shownMessageLikeIdsRef.value;
      if (shown.contains(key)) return;
      showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('メッセージ付きいいね'),
          content: const Text('メッセージ付きの「いいね」が届いています。'),
          actions: [
            TextButton(
              onPressed: () => ctx.pop(),
              child: const Text('閉じる'),
            ),
          ],
        ),
      );
      shown.add(key);
    }

    // SwipeableProfileStackはボタン以外Homeと同じ仕様
    final profiles = state.receivedLikes.map((e) {
      return Profile(
        name: e.nickname,
        age: e.age,
        location: e.city,
        userId: e.userId,
        images: resolveImagesFromUrls(
          urls: e.imageUrls,
          genderCode: e.genderCode,
          kind: PhotoUrlKind.largeThumbnailWebpUrl,
        ),
        bestImageUrls: e.bestImageUrls,
        badgeType: BadgeType.fromString(
          state.receivedLikesBadgeByUserId[e.userId] ?? '',
        ),
        certificateLevel: CertificateLevel.fromCertificateLevelCode(
          e.certificateLevelCode,
        ),
        loginStatus: LoginStatus.fromUserActivityTag(e.userActivityTag),
      );
    }).toList(growable: false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SwipeableProfileStack(
        profiles: profiles,
        showHistoryButton: false,
        showLikeMessageButton: false,
        showLightningButton: false,
        showSkipButton: true,
        showLikeButton: true,
        numberOfCardsDisplayed: profiles.length >= 2 ? 2 : 1,
        onCardFocused: onCardFocused,
        onLike: (idx) async {
          if (idx >= 0 && idx < state.receivedLikes.length) {
            final receivedLike = state.receivedLikes[idx];
            final matching =
                await notifier.createLike(toUserLike: receivedLike);
            if (!context.mounted) return;
            final currentState = ref.read(likePageViewModelProvider);
            final error = currentState.error;
            if (matching != null) {
              await const MatchingRouteData().push<void>(
                context,
                extra: matching,
              );
            }
          }
        },
        onSkip: (idx) async {
          if (idx >= 0 && idx < state.receivedLikes.length) {
            final userId = state.receivedLikes[idx].userId;
            await notifier.createSkip(toUserId: userId);
          }
        },
        onEnd: () async {
          if ((state.receivedLikesCursorId ?? '').isNotEmpty) {
            await notifier.loadMoreReceivedLikes(state.receivedLikesCursorId);
          }
        },
        onProfileInfoTap: (userId) async {
          if (isPushingUserDetail.value) {
            return;
          }
          isPushingUserDetail.value = true;

          // UserDetailを設定
          try {
            await notifier.setUserDetail(userId: userId);

            if (!context.mounted) {
              return;
            }
            await HomeUserDetailRouteData(
              userId: userId,
              pageType: DetailPageType.like,
            ).push<void>(context);

            await notifier.refreshReceivedLikes();

          } finally {
            isPushingUserDetail.value = false;
          }
        },
        tabHeight: tabHeight.value ?? 0,
        parentHorizontalPadding: 24 * 2,
      ),
    );
  }
}

class _SentLikesList extends HookConsumerWidget {
  const _SentLikesList({required this.tabHeight});
  final ValueNotifier<double?> tabHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(likePageViewModelProvider);
    final favoriteIds = ref.watch(
      likePageViewModelProvider.select((s) => s.favoriteUserIds),
    );
    final notifier = ref.read(likePageViewModelProvider.notifier);
    final pageController = usePageController(viewportFraction: 0.85);
    /// 要検討のためリリース時には出さない
    // useEffect(
    //   () {
    //     if (!_appealBannerShownOnce) {
    //       WidgetsBinding.instance.addPostFrameCallback((_) async {
    //         // 表示までの遅延
    //         await Future<void>.delayed(const Duration(milliseconds: 300));
    //         if (_appealBannerShownOnce) return;
    //         EconaBannerController.show(
    //           context,
    //           text: 'アピールをしてあなたのいいねを目立たせましょう',
    //           textSize: 14,
    //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    //           icon: Assets.images.icons.appeal.image(width: 30, height: 30),
    //           duration: const Duration(seconds: 3),
    //           topOffset: kToolbarHeight + 48 + 66, // AppBar + タブ + バナー高さ
    //         );
    //         _appealBannerShownOnce = true;
    //       });
    //     }
    //     return null;
    //   },
    //   const [],
    // );

    if (state.isLoading && state.sentLikes.isEmpty) {
      return const Center(child: EconaLoadingIndicator());
    }

    if (state.error != null && state.sentLikes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('エラー: ${state.error}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => notifier.loadMoreSentLikes(null),
              child: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    if (state.sentLikes.isEmpty) {
      return EmptyState(
        title: 'まだ「いいね」を送っていません',
        subtitle: '気になるお相手に「いいね」を送りましょう',
        buttonText: 'お相手を探す',
        onButtonTap: () {
          const HomeRouteData().go(context);
        },
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final double viewportFraction = pageController.viewportFraction;
        final double endOffset = constraints.maxHeight * (1 - viewportFraction);

        final itemCount = state.sentLikes.length;
        final totalCount = itemCount + 1; //
        return PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          pageSnapping: true,
          itemCount: state.sentLikes.length + 1,
          onPageChanged: (index) async {
            if (index == totalCount - 1) {
              // ダミーに入った
              WidgetsBinding.instance.addPostFrameCallback((_) {
                pageController.jumpToPage(totalCount - 2);
              });
            }
            if (index >= state.sentLikes.length - 2 &&
                (state.sentLikesCursorId != null &&
                    state.sentLikesCursorId!.isNotEmpty)) {
              await notifier.loadMoreSentLikes(state.sentLikesCursorId);
            }
          },
          itemBuilder: (context, index) {
            if (index >= itemCount) {
              return const SizedBox.expand();
            }
            final item = state.sentLikes[index];
            final userLikeId = item.userLikeId;
            final isAppealed = (userLikeId != null) &&
                state.appealedUserLikeIds.contains(userLikeId);
            final canAppeal = (userLikeId != null) && !isAppealed;
            final buttonText = isAppealed ? 'アピール済み' : 'アピール';
            final isLast = index == state.sentLikes.length - 1 &&
                state.sentLikes.length > 1 &&
                endOffset > 0;

            final card = Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileSummaryCard(
                  key: ValueKey('sent-${item.userId}'),
                  images: resolveImagesFromUrls(
                    urls: item.imageUrls,
                    genderCode: item.genderCode,
                    kind: PhotoUrlKind.mediumThumbnailWebpUrl,
                  ),
                  bestImageUrls: item.bestImageUrls,
                  name: item.nickname,
                  age: item.age,
                  cityText: item.city,
                  verifiedBadges: ref.watch(likePageViewModelProvider)
                      .receivedLikesVerifiedBadgesByUserId[item.userId] ?? const [],
                  userActivityTag: item.userActivityTag,
                  isStarred: favoriteIds.contains(item.userId),
                  onStarChanged: (val) {
                    ref.read(likePageViewModelProvider.notifier)
                        .updateFavorite(userId: item.userId, favorite: val);
                  },
                  onAppealTap: canAppeal
                      ? () async {
                          await showModalBottomSheet<void>(
                            context: context,
                            useRootNavigator: true,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (_) => sheet.EconaFeatureActionSheet(
                              title: 'アピール',
                              leading: Column(
                                children: [
                                  Assets.images.icons.appeal.image(height: 72, width: 72),
                                ],
                              ),
                              text: 'いいねをしたお相手にあなたのプロフィールを目立たせることができます',
                              buttonText: 'アピールをする',
                              pointType: sheet.PointType.mp,
                              pointsToUse: 3,
                              onPressed: () async {
                                await notifier.createAppeal(
                                  userLikeId: userLikeId,
                                );
                                final error =
                                    ref.read(likePageViewModelProvider).error;
                                await showActionResult(
                                  context: context,
                                  error: error,
                                  successMessage: 'アピールしました。',
                                );
                              },
                            ),
                          );
                        }
                      : null,
                  buttonText: buttonText,
                  buttonLeading: Assets.images.icons.whiteAppeal.svg(width: 20, height: 20),
                  buttonEnabled: canAppeal,
                  tabHeight: tabHeight.value ?? 0,
                ),
              ],
            );

            return Container(
              alignment: isLast ? Alignment.topCenter : Alignment.bottomCenter,
              child: card,
            );
          },
          padEnds: false,
        );
      },
    );
  }
}

class _SkippedList extends HookConsumerWidget {
  const _SkippedList({required this.tabHeight});

  final ValueNotifier<double?> tabHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(likePageViewModelProvider);
    final favoriteIds = ref.watch(
      likePageViewModelProvider.select((s) => s.favoriteUserIds),
    );
    final notifier = ref.read(likePageViewModelProvider.notifier);
    final pageController = usePageController();

    if (state.isLoading && state.skippedUsers.isEmpty) {
      return const Center(child: EconaLoadingIndicator());
    }

    if (state.error != null && state.skippedUsers.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('エラー: ${state.error}'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => notifier.loadMoreSkipped(null),
              child: const Text('再試行'),
            ),
          ],
        ),
      );
    }

    if (state.skippedUsers.isEmpty) {
      return Center(
        child: Text(
          'スキップしたお相手はいません',
          style:
              EconaTextStyle.labelMedium2140(color: EconaColor.grayDarkActive),
          textAlign: TextAlign.center,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final double viewportFraction = pageController.viewportFraction;
        final double endOffset = constraints.maxHeight * (1 - viewportFraction);

        return PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          pageSnapping: true,
          itemCount: state.skippedUsers.length,
          onPageChanged: (index) async {
            if (index >= state.skippedUsers.length - 2 &&
                (state.skippedCursorId != null &&
                    state.skippedCursorId!.isNotEmpty)) {
              await notifier.loadMoreSkipped(state.skippedCursorId);
            }
          },
          itemBuilder: (context, index) {
            final item = state.skippedUsers[index];
            final liked = state.likedUserIds.contains(item.userId);
            final isLast = index == state.skippedUsers.length - 1 &&
                state.skippedUsers.length > 1 &&
                endOffset > 0;

            final card = Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProfileSummaryCard(
                  key: ValueKey('skip-${item.userId}'),
                  images: resolveImagesFromUrls(
                    urls: item.imageUrls,
                    genderCode: item.genderCode,
                    kind: PhotoUrlKind.mediumThumbnailWebpUrl,
                  ),
                  bestImageUrls: item.bestImageUrls,
                  name: item.nickname,
                  age: item.age,
                  cityText: item.city,
                  verifiedBadges: ref
                          .watch(likePageViewModelProvider)
                          .receivedLikesVerifiedBadgesByUserId[item.userId] ??
                      const [],
                  userActivityTag: item.userActivityTag,
                  isStarred: favoriteIds.contains(item.userId),
                  onStarChanged: (val) {
                    ref
                        .read(likePageViewModelProvider.notifier)
                        .updateFavorite(userId: item.userId, favorite: val);
                  },
                  buttonText: liked ? 'いいねありがとう済み' : 'いいね ありがとう',
                  onAppealTap: liked
                      ? null
                      : () async {
                          final matching = await ref
                              .read(likePageViewModelProvider.notifier)
                              .createLike(
                                toUserLike: item,
                                fromSkipTab: true,
                              );

                          if (!context.mounted) return;
                          final error =
                              ref.read(likePageViewModelProvider).error;

                          if (matching != null) {
                            await const MatchingRouteData().push<void>(
                              context,
                              extra: matching,
                            );
                          }
                        },
                  buttonEnabled: !liked,
                  tabHeight: tabHeight.value ?? 0,
                ),
              ],
            );

            return isLast
                ? Transform.translate(
                    offset: Offset(0, -endOffset),
                    child: card,
                  )
                : card;
          },
          padEnds: false,
        );
      },
    );
  }
}
