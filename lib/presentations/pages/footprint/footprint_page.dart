import 'package:econa_mobile_app/domains/entities/like.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/empty_state.dart';
import 'package:econa_mobile_app/presentations/components/profile_summary_card.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/footprint/footprint_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/like/like_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 足あとページ
class FootprintPage extends HookConsumerWidget {
  const FootprintPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(footprintPageViewModelProvider);
    final notifier = ref.read(footprintPageViewModelProvider.notifier);
    final pageController = usePageController();

    return Scaffold(
      appBar: const EconaCloseLargeAppBar(
        titleText: '足あと',
        subtitleText: 'あなたのプロフィールを見てくれたお相手です',
        horizontalPadding: 10,
        toolbarTotalHeight: 132,
      ),
      body: Column(
        children: [
          if (state.isLoading && state.items.isEmpty)
            const Expanded(child: Center(child: EconaLoadingIndicator()))
          else if (state.items.isEmpty)
            Expanded(
              child: EmptyState(
                title: '足あとがまだありません\n足あとをもらうためには？',
                buttonText: 'プロフィールを充実させる',
                onButtonTap: () {
                  /// to-do: 要確認：プロフィールに遷移するかどうか
                },
              ),
            )
          else
            Expanded(
              child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                pageSnapping: true,
                itemCount: state.items.length,
                onPageChanged: (index) async {
                  if (index >= state.items.length - 2 &&
                      (state.cursorId != null && state.cursorId!.isNotEmpty)) {
                    await notifier.loadMore(state.cursorId);
                  }
                },
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4, bottom: 8),
                          child: Text(
                            (index < state.displayDates.length)
                                ? state.displayDates[index]
                                : '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7E89B7),
                            ),
                          ),
                        ),
                        ProfileSummaryCard(
                          images: resolveImagesFromUrls(
                            urls: item.imageUrls,
                            genderCode: item.genderCode,
                            kind: PhotoUrlKind.mediumThumbnailWebpUrl,
                          ),
                          bestImageUrls: item.bestImageUrls,
                          name: item.nickname,
                          age: item.age,
                          cityText: item.city,
                          verifiedBadges: const [],
                          userActivityTag: item.userActivityTag,
                          buttonText: 'いいね',
                          onStarChanged: (val) {
                            ref.read(likePageViewModelProvider.notifier)
                                .updateFavorite(userId: item.userId, favorite: val);
                          },
                          onAppealTap: () async {
                            final toUserLike = Like(
                              userId: item.userId,
                              nickname: item.nickname,
                              age: item.age,
                              city: item.city,
                              imageUrls: item.imageUrls,
                              bestImageUrls: item.bestImageUrls,
                              userActivityTag: item.userActivityTag,
                              certificateLevelCode: item.certificateLevelCode,
                              genderCode: item.genderCode,
                            );
                            final matching = await ref
                                .read(likePageViewModelProvider.notifier)
                                .createLike(toUserLike: toUserLike);
                            if (matching != null && context.mounted) {
                              await const MatchingRouteData().push<void>(
                                context,
                                extra: matching,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
