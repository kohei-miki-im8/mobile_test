import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/entities/question.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/user_activity_tag.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/domains/entities/chat_input_config.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_state.dart';
import 'package:econa_mobile_app/presentations/components/econa_chat_input_view_model.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_plain_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_tab.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/infinite_scroll.dart';
import 'package:econa_mobile_app/presentations/components/profile_summary_card.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/home/question_page_view_model.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPage extends HookConsumerWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionPageViewModelProvider);
    final notifier = ref.read(questionPageViewModelProvider.notifier);

    useEffect(() {
      Future.microtask(() async {
        await notifier.fetchApprovedAnswered();
      });
      return null;
    }, const []);

    return Scaffold(
      appBar: CenterAppBar(
        titleText: EconaAppBarText.questionTitle,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Assets.images.icons.close.image(
            height: 32,
            width: 32,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: EconaTab(
                    selectedIndex: state.selectedTabIndex,
                    onTabSelected: notifier.updateSelectedTabIndex,
                    labels: const ['回答されたしつもん', '届いたしつもん'],
                    equalDistribution: true,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: switch (state.selectedTabIndex) {
              0 => const _AnsweredQuestionsList(),
              1 => const _ReceivedQuestionsList(),
              _ => const _AnsweredQuestionsList(),
            },
          ),
        ],
      ),
    );
  }
}

class _AnsweredQuestionsList extends HookConsumerWidget {
  const _AnsweredQuestionsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionPageViewModelProvider);
    final notifier = ref.read(questionPageViewModelProvider.notifier);
    final items = state.answeredItems;
    final pageController = usePageController();

    if (state.isAnsweredLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    if (items.isEmpty) {
      return const Center(child: Text('しつもんはまだありません'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final double viewportFraction = pageController.viewportFraction;
        final double endOffset = constraints.maxHeight * (1 - viewportFraction);

        return InfiniteScrollList<AnsweredQuestion>(
          initialItems: state.answeredItems,
          nextCursorId: state.answeredCursorId,
          scrollDirection: Axis.vertical,
          fetchMoreData: (cursorId) async {
            await notifier.fetchApprovedAnswered(
              cursorId: cursorId,
              isTransferOperation: true,
            );
          },
          itemBuilder: (context, item, index) {
            final isFavorite = state.favoriteUserIds.contains(item.profile.userId);

            final isLast = index == items.length - 1 &&
                items.length > 1 &&
                endOffset > 0;

            final card = Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ProfileSummaryCard(
                    images: item.profile.images,
                    name: item.profile.name,
                    age: item.profile.age,
                    cityText: item.profile.location,
                    verifiedBadges: item.profile.verifiedBadges,
                    userActivityTag: item.profile.loginStatus.userActivityTag,
                    bestImageUrls: item.profile.bestImageUrls,
                    profileInfoPlacement: ProfileInfoPlacement.overlay,
                    isStarred: isFavorite,
                    aspectRatio: 1,
                    onStarChanged: (star) {
                      notifier.toggleFavorite(
                        toUserId: item.profile.userId,
                        favorite: star,
                      );
                    },
                    contentBelowImage: Container(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _QAIconTextRow(
                            icon: Assets.images.icons.question.svg(
                                height: 22, width: 22),
                            text: item.question.text,
                            textStyle: EconaTextStyle.labelMedium1140(
                              color: EconaColor.questionText,
                            ),
                          ),
                          _QAIconTextRow(
                            icon: Assets.images.icons.answer.svg(
                                height: 20, width: 20),
                            text: item.question.answer ?? '',
                            textStyle: EconaTextStyle.regularMedium1160(
                              color: EconaColor.questionText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            );

            return Container(
              alignment: isLast ? Alignment.topCenter : Alignment.bottomCenter,
              child: card,
            );
          },
          loadingBuilder: (context) => const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: EconaLoadingIndicator(),
            ),
          ),
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
        );
      },
    );
  }
}

class _ReceivedQuestionsList extends HookConsumerWidget {
  const _ReceivedQuestionsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(questionPageViewModelProvider);
    final items = state.receivedItems;
    final notifier = ref.read(questionPageViewModelProvider.notifier);

    if (state.isReceivedLoading) {
      return const Center(child: EconaLoadingIndicator());
    }

    if (items.isEmpty) {
      return const Center(child: Text('しつもんはまだありません'));
    }

    return InfiniteScrollList<ReceivedQuestion>(
      initialItems: items,
      nextCursorId: state.receivedCursorId,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      fetchMoreData: (cursorId) async {
        await notifier.fetchApprovedReceived(
          cursorId: cursorId,
          isTransferOperation: true,
        );
      },
      itemBuilder: (context, item, index) {
        final hasAnswer = item.question.answer != null && item.question.answer!.isNotEmpty;
        return ShadowAndGradientBorderContainer(
          borderRadius: BorderRadius.circular(20),
          borderWidth: 1.5,
          gradients: const [
            LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFEFF0FE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ],
          backgroundColor: const Color(0xFFF8FAFF),
          innerShadows: [
            const BoxShadow(
              color: Color(0xFFFFFFFF),
              offset: Offset(-4, -4),
              blurRadius: 8,
            ),
            BoxShadow(
              color: const Color(0xFF86A3C8).withValues(alpha: 0.2),
              offset: const Offset(4, 4),
              blurRadius: 12,
            ),
          ],
          dropShadows: [
            BoxShadow(
              color: const Color(0xFF000000).withValues(alpha: 0.1),
              offset: const Offset(0, 8),
              blurRadius: 16,
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _QAIconTextRow(
                  icon: Assets.images.icons.question.svg(height: 22, width: 22),
                  text: item.question.text,
                  textStyle: EconaTextStyle.labelMedium1140(
                    color: EconaColor.questionText,
                  ),
                ),
                if (hasAnswer) ...[
                  _QAIconTextRow(
                    icon: Assets.images.icons.answer.svg(height: 20, width: 20),
                    text: item.question.answer!,
                    textStyle: EconaTextStyle.regularMedium1160(
                      color: EconaColor.questionText,
                    ),
                  ),
                ] else ...[
                  Align(
                    alignment: Alignment.center,
                    child: EconaPlainButton(
                      text: '回答する',
                      onPressed: () async {
                        await showModalBottomSheet<void>(
                          context: context,
                          useRootNavigator: true,
                          isScrollControlled: true,
                          backgroundColor: const Color(0xFFF6FBFE),
                          builder: (_) => EconaChatInput(
                            key: UniqueKey(),
                            config: ChatInputConfig.question(
                              questionId: item.question.questionId,
                              initialPhase: QuestionPhase.answer,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
      loadingBuilder: (context) => const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: EconaLoadingIndicator(),
        ),
      ),
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
    );
  }
}

class _QAIconTextRow extends StatelessWidget {
  const _QAIconTextRow({
    required this.icon,
    required this.text,
    required this.textStyle,
  });

  final Widget icon;
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: icon,
      ),
      title: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

class _AppLifecycleObserver extends WidgetsBindingObserver {
  _AppLifecycleObserver({required this.onResume});

  final VoidCallback onResume;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    }
  }
}