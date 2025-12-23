import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/favorite_user.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/empty_state.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/components/profile_image_carousel.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/favorite/favorite_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoritePage extends HookConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        final route = GoRouter.of(context);
        void listener() {
          // pop直後など、戻ってきたとみなせるタイミングで軽量再検証
          ref.read(favoritePageViewModelProvider.notifier).revalidate();
        }

        route.routerDelegate.addListener(listener);
        return () {
          route.routerDelegate.removeListener(listener);
        };
      },
      const [],
    );

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '',
        backgroundColor: EconaColor.background,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      backgroundColor: EconaColor.background,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(),
          _BuildBody(),
        ],
      ),
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritePageViewModelProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        spacing: 14,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InnerShadowText(
            text: 'お気に入り',
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
          if (state.favoriteUsers.isNotEmpty || state.error != null) ...[
            Text(
              'あなたがお気に入りしたお相手です',
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayNormal,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BuildBody extends ConsumerWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritePageViewModelProvider);

    if (state.isLoading) {
      return const Expanded(child: EconaLoadingIndicator());
    }

    if (state.error != null) {
      return Expanded(
        child: EmptyState(
          title: state.error!.operationMessage,
          buttonText: '再試行',
          onButtonTap: () {
            ref.invalidate(favoritePageViewModelProvider);
          },
        ),
      );
    }

    if (state.favoriteUsers.isEmpty) {
      return Expanded(
        child: EmptyState(
          title: 'お気に入りに設定している人がいません',
          subtitle: 'お気に入りはお相手のプロフィール画面から登録できます',
          subtitleStyle: EconaTextStyle.regularSmall140(
            color: EconaColor.grayDarkActive,
          ),
          buttonText: 'お相手を探す',
          onButtonTap: () async {
            const HomeRouteData().go(context);
          },
        ),
      );
    }

    return const _FavoriteList();
  }
}

class _FavoriteList extends ConsumerWidget {
  const _FavoriteList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritePageViewModelProvider);
    final notifier = ref.watch(favoritePageViewModelProvider.notifier);

    if (state.isLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    if (state.error != null) {
      return EmptyState(
        title: '',
        buttonText: '再試行',
        onButtonTap: () {
          ref.invalidate(favoritePageViewModelProvider);
        },
      );
    }

    return Expanded(
      child: InfiniteScrollList(
        initialItems: state.favoriteUsers,
        nextCursorId: state.nextCursorId,
        scrollDirection: Axis.vertical,
        enablePullToRefresh: true,
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        fetchMoreData: notifier.loadMoreFavoriteUsers,
        loadingBuilder: (context) =>
            const Center(child: EconaLoadingIndicator()),
        errorBuilder: (context, error, onRetry) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: onRetry,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: EconaColor.gray200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '読み込みに失敗しました。タップして再試行',
                style: EconaTextStyle.regularSmall140(
                  color: EconaColor.grayDarkActive,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        itemBuilder:
            (BuildContext context, FavoriteUser favoriteUser, int index) {
          final images = resolveImagesFromUrls(
            urls: favoriteUser.images,
            genderCode: favoriteUser.genderCode,
            kind: PhotoUrlKind.mediumThumbnailWebpUrl,
          );

          final isLast = index == state.favoriteUsers.length - 1;
          final isLiked = favoriteUser.isLiked;

          return Column(
            spacing: 16,
            children: [
              AspectRatio(
                aspectRatio: 337 / 421,
                child: ProfileImageCarousel(
                  profile: Profile(
                    images: images,
                    bestImageUrls: favoriteUser.bestImageUrls,
                    name: favoriteUser.name,
                    age: favoriteUser.age,
                    location: favoriteUser.city,
                    userId: favoriteUser.id,
                  ),
                  isStarred: favoriteUser.isFavorite,
                  onStarTap: () async {
                    final newFavoriteStatus = !favoriteUser.isFavorite;
                    await notifier.updateFavoriteStatus(
                      userId: favoriteUser.id,
                      isFavorite: newFavoriteStatus,
                    );
                  },
                ),
              ),
              EconaGradientButton(
                text: isLiked ? 'いいね済み' : 'いいね',
                expandWidth: true,
                enabled: !isLiked,
                onPressed: () async {
                  try {
                    final matching =
                        await notifier.sendLike(toUser: favoriteUser);
                    if (!context.mounted) return;
                    if (matching != null) {
                      await const MatchingRouteData().push<void>(
                        context,
                        extra: matching,
                      );
                    }
                  } on Exception catch (e) {
                    if (!context.mounted) return;
                    if (e.toString().contains('insufficient points')) {
                      final econaError = EconaError.fromException(
                        e,
                        operation: EconaErrorOperation.lackOfLike,
                      );
                      final handled = await handleEconaError(context, econaError);
                      if (handled) {
                        return;
                      }
                      await showDialog<void>(
                        context: context,
                        builder: (dialogContext) => Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          insetPadding:
                              const EdgeInsets.symmetric(horizontal: 12),
                          child: EconaModal(
                            message: econaError.operationMessage,
                            buttonText: '',
                            onButtonPressed: () {
                              dialogContext.pop();
                            },
                          ),
                        ),
                      );
                    } else {
                      final econaError = EconaError.fromException(
                        e,
                        operation: EconaErrorOperation.like,
                      );
                      final handled = await handleEconaError(context, econaError);
                      if (handled) {
                        return;
                      }
                      await EconaNotification.showTopToast(
                        context,
                        message: econaError.operationMessage,
                      );
                    }
                  }
                },
              ),
              if (isLast) ...[
                const SizedBox(height: 50),
              ],
            ],
          );
        },
      ),
    );
  }
}
