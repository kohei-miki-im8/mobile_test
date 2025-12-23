import 'dart:math' as math;

import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/user/v1/get_user_points.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/user.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_navigation_bar.dart';
import 'package:econa_mobile_app/presentations/components/gradient_circle_button.dart';
import 'package:econa_mobile_app/presentations/components/profile_image_carousel.dart';
import 'package:econa_mobile_app/presentations/pages/home/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SwipeableProfileStack extends HookConsumerWidget {
  const SwipeableProfileStack({
    required this.profiles,
    this.onLike,
    this.onSkip,
    this.onMessageLike,
    this.onReverse,
    this.onBoost,
    this.onEnd,
    this.onCardFocused,
    this.onProfileInfoTap,
    this.width = 333,
    this.height = 539,
    this.maxCards = 3,
    this.enableSwipe = true,
    this.numberOfCardsDisplayed = 2,
    this.showHistoryButton = true,
    this.showSkipButton = true,
    this.showLikeMessageButton = true,
    this.showLikeButton = true,
    this.showLightningButton = true,
    this.tabHeight = 0,
    this.parentHorizontalPadding = 0,
    this.skippedUserIds = const {},
    this.favoriteUserIds = const {},
    this.onStarChanged,
    this.likePointCost = 1,
    super.key,
  });

  final List<Profile> profiles;
  final void Function(int currentIndex)? onLike;
  final void Function(int currentIndex)? onSkip;
  final Future<bool> Function(int currentIndex)? onMessageLike;
  final Future<bool> Function(int currentIndex)? onReverse;
  final VoidCallback? onBoost;
  final VoidCallback? onEnd;
  final void Function(int index)? onCardFocused;
  final void Function(String userId)? onProfileInfoTap;
  final double width;
  final double height;
  final int maxCards;
  final bool enableSwipe;
  final int numberOfCardsDisplayed;
  final bool showHistoryButton;
  final bool showSkipButton;
  final bool showLikeMessageButton;
  final bool showLikeButton;
  final bool showLightningButton;
  final double tabHeight;
  final double parentHorizontalPadding;
  final Set<String> skippedUserIds;
  final Set<String> favoriteUserIds;
  final void Function(String userId, bool isStarred)? onStarChanged;
  final int likePointCost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useMemoized(CardSwiperController.new);

    // currentIndexを状態として管理
    final currentIndex = useState(0);

    // 残いいね数（null は「未取得 or 取得失敗」）
    final remainingLikePoints = useState<int?>(null);

    useEffect(
          () {
        final router = GoRouter.of(context);

        Future<void> refreshLikePoints() async {
          try {
            final userRepo = ref.read(userRepositoryProvider);
            final res = await userRepo.getUserPoints(
              GetUserPointsRequest(),
            );
            remainingLikePoints.value =
                res.freeLikePoint + res.likePoint; // 無料分＋有料分
          } catch (_) {
            // エラー時は 0 とみなしてブロック
            remainingLikePoints.value ??= 0;
          }
        }

        void listener() {
          refreshLikePoints();
        }

        router.routerDelegate.addListener(listener);
        // 初回マウント時も1回取得
        Future.microtask(refreshLikePoints);

        return () {
          router.routerDelegate.removeListener(listener);
        };
      },
      const [],
    );

    Future<void> showLackOfLikeDialog() async {
      await showDialog<void>(
        context: context,
        builder: (dialogContext) => Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 12),
          child: EconaModal(
            message: 'いいねが不足しています',
            buttonText: '閉じる',
            onButtonPressed: () {
              dialogContext.pop();
            },
          ),
        ),
      );
    }

    // 残ポイント < 消費ポイント なら不足
    bool isOutOfLike() {
      final value = remainingLikePoints.value;
      if (value == null) {
        // まだ取得できていない間は一旦許可
        return false;
      }
      return value < likePointCost;
    }

    // いいねポイント消費処理
    void consumeLikePoint() {
      final value = remainingLikePoints.value;
      if (value == null || value < likePointCost) {
        return;
      }
      remainingLikePoints.value = value - likePointCost;
    }

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // ウィジェットがまだマウントされているかチェック
          if (context.mounted && profiles.isNotEmpty) {
            onCardFocused?.call(0);
          }
        });
        return null;
      },
      const [],
    );

    if (profiles.isEmpty) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        // 基準となる比率をFigmaデザインの縦横から計算
        const scale = 333 / 539;

        // デバイスの横幅
        final deviceWidth = MediaQuery.of(context).size.width;
        final maxWidth = deviceWidth - parentHorizontalPadding;

        // デバイスの高さ
        final deviceHeight = MediaQuery.of(context).size.height;

        // タブの高さ
        final tabBarHeight = tabHeight;

        // appbarの高さ
        final appBarHeight = toolbarHeight + MediaQuery.of(context).padding.top;

        // ナビゲーションバー + 下から浮いている分の高さ
        final bottomNavigationBarHeight =
            econaNavigationBarHeight + MediaQuery.of(context).padding.bottom;

        // 写真との間隔 + ボタン群の高さ
        const buttonsHeight = 24 + 52;

        // タブ、AppBar、ナビゲーションバー、ボタン群の高さを合算した値
        final usedTotalHeight = appBarHeight +
            tabBarHeight +
            buttonsHeight +
            bottomNavigationBarHeight;

        // カードの使える高さ
        final availableHeight = deviceHeight - usedTotalHeight;

        // 表示領域がない場合は早期に抜ける（無いとは思うが念のため）
        if (availableHeight <= 0.0) {
          return const SizedBox.shrink();
        }

        // 高さから横幅を算出
        double cardWidth = availableHeight * scale;
        double cardHeight = availableHeight;

        if (cardWidth > maxWidth) {
          cardWidth = maxWidth;
          cardHeight = cardWidth / scale;
        }

        final int cardsCount = profiles.length;
        final int displayedCards = math.max(
          1,
          math.min(numberOfCardsDisplayed, cardsCount),
        );

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // スワイプ可能なカードスタック
            SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: AspectRatio(
                aspectRatio: 1 / 1.619,
                child: CardSwiper(
                  isLoop: false,
                  onEnd: onEnd,
                  controller: controller,
                  cardsCount: cardsCount,
                  padding: EdgeInsets.zero,
                  numberOfCardsDisplayed: displayedCards,
                  backCardOffset: Offset.zero,
                  maxAngle: 45, // 最大回転角度を45度に制限
                  duration: const Duration(milliseconds: 600), // アニメーションを遅くする
                  cardBuilder: (
                    context,
                    index,
                    horizontalThresholdPercentage,
                    verticalThresholdPercentage,
                  ) {
                    final profile = profiles[index];

                    // スワイプ方向に基づいて回転角度を計算
                    double rotationAngle = 0;
                    if (horizontalThresholdPercentage != 0) {
                      // 右スワイプ（正の値）で時計回り、左スワイプ（負の値）で反時計回り
                      // ゆっくりと回転するように係数を小さくし、最大45度（π/4ラジアン）に制限
                      rotationAngle = (horizontalThresholdPercentage * 0.001)
                          .clamp(-0.785, 0.785);
                    }

                    // 右スワイプの進行度を計算（0.0 ~ 1.0）
                    double rightSwipeProgress = 0;
                    if (horizontalThresholdPercentage > 0) {
                      rightSwipeProgress = horizontalThresholdPercentage
                          .toDouble()
                          .clamp(0.0, 1.0);
                    }

                    // 左スワイプの進行度を計算（0.0 ~ 1.0）
                    double leftSwipeProgress = 0;
                    if (horizontalThresholdPercentage < 0) {
                      leftSwipeProgress = (-horizontalThresholdPercentage)
                          .toDouble()
                          .clamp(0.0, 1.0);
                    }

                    return Transform.rotate(
                      angle: rotationAngle,
                      child: ProfileImageCarousel(
                        profile: profile,
                        width: cardWidth,
                        height: cardHeight,
                        onProfileInfoTap: () {
                          onProfileInfoTap?.call(profile.userId);
                        },
                        showStarButton: true,
                        isStarred: favoriteUserIds.contains(profile.userId),
                        onStarTap: onStarChanged == null
                            ? null
                            : () {
                                final isCurrentlyStarred =
                                    favoriteUserIds.contains(profile.userId);
                                onStarChanged!(
                                  profile.userId,
                                  !isCurrentlyStarred,
                                );
                              },
                        rightSwipeProgress: rightSwipeProgress, // スワイプ進行度を渡す
                        leftSwipeProgress: leftSwipeProgress, // 左スワイプ進行度を渡す
                        enableScroll: false,
                      ),
                    );
                  },
                  onSwipe: (previousIndex, newCurrentIndex, direction) {
                    // 次にフォーカスされるインデックスを決定
                    final nextIndex = newCurrentIndex ?? (previousIndex + 1);
                    switch (direction) {
                      case CardSwiperDirection.left:
                        onSkip?.call(currentIndex.value);
                      case CardSwiperDirection.right:
                        // ポイント不足ならモーダルを出してlikeしない
                        if (isOutOfLike()) {
                          showLackOfLikeDialog();
                          controller.undo();
                          break;
                        }
                        consumeLikePoint();
                        onLike?.call(currentIndex.value);
                      case CardSwiperDirection.top:
                        // 必要に応じて追加のアクション
                        break;
                      case CardSwiperDirection.bottom:
                        // 必要に応じて追加のアクション
                        break;
                      case CardSwiperDirection.none:
                        // 何もしない
                        break;
                    }
                    // ビルドが完了した後に状態を更新
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      // ウィジェットがまだマウントされているかチェック
                      if (context.mounted) {
                        currentIndex.value = nextIndex;
                        if (nextIndex >= 0 && nextIndex < profiles.length) {
                          onCardFocused?.call(nextIndex);
                        }
                      }
                    });
                    return true;
                  },
                  allowedSwipeDirection: enableSwipe
                      ? const AllowedSwipeDirection.symmetric(
                          horizontal: true,
                          vertical: false,
                        )
                      : const AllowedSwipeDirection.symmetric(
                          horizontal: false,
                          vertical: false,
                        ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // アクションボタン
            SizedBox(
              width: 352,
              height: 52,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // リバースボタン
                  if (showHistoryButton)
                    Builder(
                      builder: (context) {
                        final previousIndex = currentIndex.value - 1;
                        return HistoryBtnWithPress(
                          onTap: () async {
                            if (previousIndex < 0) {
                              return;
                            }
                            // リバースが許可されているかチェック
                            final canReverse =
                                await onReverse?.call(previousIndex) ?? false;
                            if (!canReverse) {
                              return;
                            }
                            // 許可されている場合のみカードを巻き戻す
                            controller.undo();
                            // ビルドが完了した後に状態を更新
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) {
                                // ウィジェットがまだマウントされているかチェック
                                if (context.mounted) {
                                  currentIndex.value = previousIndex;
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  if (showHistoryButton) const SizedBox(width: 16),
                  // スキップボタン
                  if (showSkipButton)
                    SkipBtnWithPress(
                      onTap: () {
                        if (currentIndex.value < 0 ||
                            currentIndex.value >= profiles.length) {
                          return;
                        }
                        controller.swipe(CardSwiperDirection.left);
                      },
                    ),
                  if (showSkipButton) const SizedBox(width: 16),
                  // メッセージ付きいいねボタン
                  if (showLikeMessageButton)
                    LikeMessageBtnWithPress(
                      onTap: () async {
                        if (currentIndex.value < 0 ||
                            currentIndex.value >= profiles.length) {
                          return;
                        }

                        final handler = onMessageLike;
                        if (handler == null) {
                          return;
                        }
                        final shouldAdvance = await handler(currentIndex.value);

                        if (!shouldAdvance) {
                          return;
                        }

                        // 通常の「いいね」と二重送信にならないよう、
                        // 上方向スワイプだけで次のカードへ進める
                        controller.swipe(CardSwiperDirection.top);
                      },

                    ),
                  if (showLikeMessageButton) const SizedBox(width: 16),
                  // ライクボタン（FREE）
                  if (showLikeButton)
                    LikeBtnWithPress(
                      onTap: () {
                        if (isOutOfLike()) {
                          showLackOfLikeDialog();
                          return;
                        }

                        if (currentIndex.value < 0 ||
                            currentIndex.value >= profiles.length) {
                          return;
                        }
                        consumeLikePoint();
                        controller.swipe(CardSwiperDirection.right);
                      },
                    ),
                  if (showLikeButton) const SizedBox(width: 16),
                  // ブーストボタン
                  if (showLightningButton)
                    LightningBtnWithPress(
                      onTap: () {
                        onBoost?.call();
                      },
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
