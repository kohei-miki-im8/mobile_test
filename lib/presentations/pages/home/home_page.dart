import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/gender_code.pbenum.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/search/v1/get_recommendation_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/components/econa_bottomup_banner.dart';
import 'package:econa_mobile_app/presentations/components/econa_feature_action_sheet.dart'
    as sheet;
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/empty_state.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/notification_count_badge.dart';
import 'package:econa_mobile_app/presentations/components/swipeable_profile_stack.dart';
import 'package:econa_mobile_app/presentations/const.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/home/filter_modal_bottom_sheet.dart';
import 'package:econa_mobile_app/presentations/pages/chat_room/chat_room_page_view_model.dart';
import 'package:econa_mobile_app/infrastructures/services/push_token_service.dart';
import 'package:econa_mobile_app/presentations/pages/home/home_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/home/question_count_provider.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page.dart';
import 'package:econa_mobile_app/presentations/pages/like/like_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/my_page/my_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_helpers.dart';
import 'package:econa_mobile_app/presentations/pages/purchase/purchase_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shared/auth/auth_providers.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    final viewModel = ref.watch(homePageViewModelProvider.notifier);
    final favoriteUserIds = ref.watch(
      likePageViewModelProvider.select((s) => s.favoriteUserIds),
    );

    // プロフィール詳細画面への多重遷移防止フラグ
    final isPushingUserDetail = useState(false);

    Future<void> showActionResult({
      required BuildContext context,
      required EconaError? error,
      required String successMessage,
    }) async {
      if (!context.mounted) return;
      if (error == null) {
        EconaBannerController.show(
          context,
          text: successMessage,
        );
        return;
      }

      if (error.operation == EconaErrorOperation.lackOfLp ||
          error.operation == EconaErrorOperation.lackOfMp) {

        final pointType = error.operation == EconaErrorOperation.lackOfLp
            ? PurchasePageType.lp
            : PurchasePageType.mp;

        final pointUnit = pointType == PurchasePageType.lp
            ? 'LP'
            : 'MP';

        await showDialog<void>(
          context: context,
          builder: (dialogContext) => Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: const EdgeInsets.symmetric(horizontal: 12),
            child: EconaModal(
              message: error.operationMessage,
              buttonText: '$pointUnitを追加する',
              onButtonPressed: () async {
                dialogContext.pop();
                await PurchaseRouteData(type: pointType).push<void>(context);
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

    useEffect(
      () {
        // 初回マウント時に外部ユーザーとRevenueCat IDの紐付けを保証
        Future.microtask(() async {
          try {
            await ensureExternalUserLinked(ref);
          } catch (_) {
            // 失敗してもホーム表示を妨げない
          }
        });
        return null;
      },
      [],
    );

    // ログインユーザーの FCM トークンを Firestore に同期
    useEffect(
      () {
        Future.microtask(() async {
          try {
            final userId = await ref.read(currentUserIdProvider.future);
            await PushTokenService.syncUserFcmToken(userId);
          } catch (_) {
            // トークン同期に失敗してもホーム表示を妨げない
          }
        });
        return null;
      },
      const [],
    );

    // マイページ / ライク / チャットルームのデータをホーム表示中にプリフェッチしておく
    useEffect(
      () {
        Future.microtask(() {
          // プロバイダーを読み出すことで ViewModel が初期化され、initialFetchData/_loadInitial が走る
          ref..read(myPageViewModelProvider)
          ..read(likePageViewModelProvider)
          ..read(chatRoomPageViewModelProvider);
        });
        return null;
      },
      const [],
    );

    // HomePage全体のエラーを監視してメンテナンスモードを検知
    useEffect(
      () {
        final error = state.error;
        if (error == null) {
          return null;
        }

        Future.microtask(() async {
          final handled = await handleEconaError(context, error);
          if (handled) {
            viewModel.clearError();
          }
        });

        return null;
      },
      [state.error],
    );

    // アクションボタンのエラー状態を監視してバナーを表示
    if (state.error != null && isActionButtonError(state.error!)) {
      showErrorBanner(
        context,
        state.error!,
        viewModel.clearError,
      );
    }

    return Scaffold(
      appBar: DefaultAppBar(
        titleText: EconaAppBarText.homeTitle,
        actions: [
          // バッジ付きアイコンボタン
          Consumer(
            builder: (context, ref, child) {
              final asyncCount = ref.watch(questionCountProvider);
              final count = asyncCount.maybeWhen(
                data: (v) => v,
                orElse: () => 0,
              );
              return NotificationCountBadge(
                count: count,
                badgePosition: BadgePosition.topRight,
                badgeOffset: const Offset(-8.5, -2), // 影付きのアイコン画像のため位置を若干補正する
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: IconButton(
                    icon: Assets.images.icons.hatena.image(
                      width: 24,
                      height: 24,
                    ),
                    iconSize: 32,
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      await const QuestionRouteData().push<void>(context);
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              icon: Assets.images.icons.filter.image(
                height: 24,
                width: 24,
              ),
              iconSize: 32,
              padding: EdgeInsets.zero,
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  useRootNavigator: true,
                  scrollControlDisabledMaxHeightRatio: 0.8,
                  builder: (context) => const EconaModalBottomSheet(),
                );
              },
            ),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(
              child: EconaLoadingIndicator(),
            )
          : state.error != null &&
                  state.error!.operation ==
                      EconaErrorOperation.recommendationUsersFetch
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: EmptyState(
                    title: state.error!.operationMessage,
                    subtitle: state.error!.causeMessage,
                    subtitleStyle: EconaTextStyle.labelMedium2140(
                      color: EconaColor.grayNormal,
                    ),
                    buttonText: '再試行',
                    onButtonTap: () {
                      viewModel.getRecommendationUsers(
                        GetRecommendationUsersRequest(
                          cursor: PagerRequestCursor(limit: 20),
                        ),
                      );
                    },
                    showImage: false,
                  ),
                )
              : state.profiles.isEmpty
                  ? EmptyState(
                      title: '条件に合うお相手が\n'
                          '見つかりませんでした',
                      buttonText: '検索条件を変える',
                      onButtonTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          useRootNavigator: true,
                          scrollControlDisabledMaxHeightRatio: 0.8,
                          builder: (context) => const EconaModalBottomSheet(),
                        );
                      },
                      showImage: false,
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                        child: Center(
                          child: SwipeableProfileStack(
                            // プロフィール数と最初のユーザーIDで再構築
                            key: ValueKey('${state.profiles.length}'
                                '_${state.profiles.isNotEmpty ? state.profiles.first.userId : ''}'),
                            profiles: state.profiles,
                            skippedUserIds: state.skippedUserIds,
                            favoriteUserIds: favoriteUserIds,
                            onStarChanged: (userId, isStarred) {
                              ref
                                  .read(likePageViewModelProvider.notifier)
                                  .updateFavorite(
                                    userId: userId,
                                    favorite: isStarred,
                                  );
                            },
                            onReverse: (previousIndex) async {
                              // 1つ前のユーザーがスキップされているかチェック
                              final isSkipped = _isPreviousUserSkipped(
                                previousIndex,
                                state.profiles,
                                state.skippedUserIds,
                              );
                              if (!isSkipped) {
                                // スキップされていない場合はエラーバナーを表示
                                EconaBannerController.show(
                                  context,
                                  text: 'リバースできるのはスキップしたユーザーのみです',
                                  emoji: '⚠️',
                                );
                                return false;
                              }
                              // スキップされている場合はリバースを実行
                              final success =
                                  await viewModel.onReverse(previousIndex);
                              return success;
                            },
                            onLike: (idx) async {
                              final matching = await viewModel.onLike(idx);
                              if (matching != null && context.mounted) {
                                await const MatchingRouteData().push<void>(
                                  context,
                                  extra: matching,
                                );
                              }
                            },
                            onSkip: viewModel.onSkip,
                            onBoost: () async {
                              await showModalBottomSheet<void>(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => sheet.EconaFeatureActionSheet(
                                  title: 'ブースト',
                                  leading: Column(
                                    children: [
                                      Assets.images.icons.featureBoost
                                          .image(height: 72, width: 72),
                                    ],
                                  ),
                                  text:
                                      '30分間あなたのプロフィールが優先的に表示され、お相手から「いいね」をもらいやすくなります',
                                  buttonText: 'ブーストする',
                                  pointType: sheet.PointType.mp,
                                  pointsToUse: 5,
                                  onPressed: () async {
                                    await viewModel.onBoost();
                                    final error = ref
                                        .read(homePageViewModelProvider)
                                        .error;
                                    await showActionResult(
                                      context: context,
                                      error: error,
                                      successMessage: 'ブーストしました',
                                    );
                                  },
                                ),
                              );
                            },
                            onMessageLike: (idx) async {
                              // 1段目: ポイント使用確認のアクションシート
                              final confirmed =
                                  await showModalBottomSheet<bool>(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => sheet.EconaFeatureActionSheet(
                                  title: 'メッセージ付きいいね',
                                  leading: Column(
                                    children: [
                                      Assets.images.icons.featureMessageWithLike
                                          .image(
                                        height: 72,
                                        width: 72,
                                      ),
                                    ],
                                  ),
                                  buttonText: 'メッセージ付きいいねする',
                                  text: 'いいねと一緒にメッセージを送ることができます',
                                  pointType: sheet.PointType.mp,
                                  pointsToUse: 3,
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                      rootNavigator: true,
                                    ).pop(true);
                                  },
                                ),
                              );

                              if (confirmed != true) {
                                return false;
                              }

                              // 2段目: メッセージ入力用アクションシート
                              final sent = await showModalBottomSheet<bool>(
                                context: context,
                                useRootNavigator: true,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (sheetContext) => HookBuilder(
                                  builder: (hookContext) {
                                    final messageController =
                                        useTextEditingController();

                                    return sheet.EconaFeatureActionSheet(
                                      title: 'メッセージ付きいいね',
                                      leading: Row(
                                        spacing: 14,
                                        children: [
                                          Assets.images.icons
                                              .featureMessageWithLike
                                              .image(
                                            height: 72,
                                            width: 72,
                                          ),
                                          Text(
                                            state.profiles[idx].name,
                                            style:
                                                EconaTextStyle.labelMedium2140(
                                              color: EconaColor.grayDarkActive,
                                            ),
                                          ),
                                          Text(
                                            state.profiles[idx].ageText,
                                            style:
                                                EconaTextStyle.labelMedium2140(
                                              color: EconaColor.grayDarkActive,
                                            ),
                                          ),
                                        ],
                                      ),
                                      text:
                                          'お相手の写真や自己紹介文に触れたり、素敵だと感じるところを褒めるとマッチング率UP！',
                                      detail: Column(
                                        spacing: 8,
                                        children: [
                                          ShadowAndGradientBorderContainer(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderWidth: 1,
                                            gradients: [
                                              const LinearGradient(
                                                colors: [
                                                  Color(0xFFD6E3F3),
                                                  Color(0xFFFFFFFF),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              LinearGradient(
                                                colors: [
                                                  const Color(0xFFFFFFFF),
                                                  const Color(0xFFFFFFFF)
                                                      .withValues(alpha: 0),
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                            ],
                                            backgroundColor: Colors.white,
                                            innerShadows: [
                                              BoxShadow(
                                                offset: const Offset(4, 4),
                                                blurRadius: 12,
                                                color: const Color(0xFFC1C7EE)
                                                    .withValues(alpha: 0.7),
                                              ),
                                              BoxShadow(
                                                offset: const Offset(-4, -4),
                                                blurRadius: 9,
                                                color: Colors.white
                                                    .withValues(alpha: 0.88),
                                              ),
                                              BoxShadow(
                                                offset: const Offset(0, 2),
                                                blurRadius: 4,
                                                color: const Color(0xFFC5C1EE)
                                                    .withValues(alpha: 0.25),
                                              ),
                                            ],
                                            dropShadows: [
                                              BoxShadow(
                                                offset: const Offset(-6, -6),
                                                blurRadius: 20,
                                                color: const Color(0xFFC1C7EE)
                                                    .withValues(alpha: 0.5),
                                              ),
                                            ],
                                            child: TextField(
                                              controller: messageController,
                                              textAlign: TextAlign.start,
                                              textAlignVertical:
                                                  TextAlignVertical.top,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.all(16),
                                                hintText:
                                                    'メッセージを入力しましょう\n\n入力例：\nはじめまして！\nプロフィールを見て素敵な人だなと思いメッセージしてみました。\nお返事もらえたら嬉しいです！',
                                                hintMaxLines: 10,
                                                hintStyle: EconaTextStyle
                                                    .messageWithLikeHint(
                                                  color: EconaColor.grayNormal,
                                                ),
                                                border: InputBorder.none,
                                                isDense: true,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'LINE ID、メールアドレス、電話番号などあなたを特定できる個人情報を送信することはできません。\n\nメッセージは審査後に送信されます。規約に違反する場合、いいねは届きますがメッセージは削除され、使用したポイントは戻りませんので、同意した上で送信してください。',
                                            style:
                                                EconaTextStyle.regularSmall140(
                                              color: EconaColor.grayNormal,
                                            ),
                                          ),
                                        ],
                                      ),
                                      buttonText: 'メッセージ付きいいねする',
                                      pointType: sheet.PointType.mp,
                                      pointsToUse: 3,
                                      isSctaVisible: false,
                                      onPressed: () async {
                                        final message =
                                            messageController.text.trim();

                                        final matching =
                                            await viewModel.onMessageLike(
                                          idx,
                                          message,
                                        );
                                        if (!context.mounted) {
                                          Navigator.of(
                                            sheetContext,
                                            rootNavigator: true,
                                          ).pop(false);
                                          return;
                                        }

                                        final error = ref
                                            .read(homePageViewModelProvider)
                                            .error;

                                        if (matching != null) {
                                          // 先にボトムシートを閉じてからマッチング画面へ遷移する
                                          Navigator.of(
                                            sheetContext,
                                            rootNavigator: true,
                                          ).pop(true);

                                          // マッチング時は「メッセージ付きいいねを送信しました。」は表示しない
                                          await const MatchingRouteData()
                                              .push<void>(
                                            context,
                                            extra: matching,
                                          );
                                          return;
                                        }

                                        await showActionResult(
                                          context: context,
                                          error: error,
                                          successMessage: 'メッセージ付きいいねを送信しました。',
                                        );

                                        final success = error == null;
                                        Navigator.of(
                                          sheetContext,
                                          rootNavigator: true,
                                        ).pop(success);
                                      },
                                    );
                                  },
                                ),
                              );

                              return sent ?? false;
                            },
                            onEnd: () {
                              final nextCursorId = state.nextCursorId;
                              if (nextCursorId == null) {
                                // 最終レコードに到達した場合、バナーを表示して最初から取得
                                EconaBottomUpBannerController.show(
                                  context,
                                  text: '検索条件に一致する人がいないため、おすすめのお相手を表示しています',
                                );
                                viewModel.getRecommendationUsers(
                                  GetRecommendationUsersRequest(
                                    cursor: PagerRequestCursor(limit: 20),
                                  ),
                                );
                              } else {
                                // 次のページを取得
                                viewModel.getRecommendationUsers(
                                  GetRecommendationUsersRequest(
                                    cursor: PagerRequestCursor(
                                      cursorId: nextCursorId,
                                      limit: 20,
                                    ),
                                  ),
                                );
                              }
                            },
                            onProfileInfoTap: (userId) async {
                              if (isPushingUserDetail.value) {
                                return;
                              }
                              isPushingUserDetail.value = true;

                              // UserDetailを設定
                              try {
                                await viewModel.setUserDetail(userId: userId);

                                if (!context.mounted) {
                                  return;
                                }
                                await HomeUserDetailRouteData(
                                  userId: userId,
                                  pageType: DetailPageType.home,
                                ).push<void>(context);

                                await viewModel.getRecommendationUsers(
                                  GetRecommendationUsersRequest(
                                    cursor: PagerRequestCursor(limit: 20),
                                  ),
                                );
                              } finally {
                                isPushingUserDetail.value = false;
                              }
                            },
                            parentHorizontalPadding: 20 * 2,
                          ),
                        ),
                      ),
                    ),
    );
  }
}

/// 1つ前のユーザーがスキップされているかチェック
bool _isPreviousUserSkipped(
  int previousIndex,
  List<Profile> profiles,
  Set<String> skippedUserIds,
) {
  if (previousIndex < 0 || previousIndex >= profiles.length) {
    return false;
  }
  final previousProfile = profiles[previousIndex];
  return skippedUserIds.contains(previousProfile.userId);
}
