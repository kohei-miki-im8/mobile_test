import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/domains/entities/certification.dart';
import 'package:econa_mobile_app/domains/entities/profile.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_banner.dart';
import 'package:econa_mobile_app/presentations/components/econa_feature_action_sheet.dart'
    as sheet;
import 'package:econa_mobile_app/presentations/components/econa_modal.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_question_modal.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/gradient_circle_button.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/home/home_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page_state.dart';
import 'package:econa_mobile_app/presentations/pages/home/user_detail/user_detail_page_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 画面下部に表示されるフローティングアクションボタン群
class ActionButtons extends ConsumerWidget {
  const ActionButtons({
    required this.currentDetailPageState,
    required this.onNavigateToCertificates,
    super.key,
  });

  final UserDetailPageState currentDetailPageState;
  final Future<void> Function() onNavigateToCertificates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QuestionButton(
            onTap: () async {
              // 自分の認証状態を取得
              final profileState = ref.read(profilePageViewModelProvider);
              final isVerified = () {
                final userStatus = profileState.userStatus;
                if (userStatus == null) {
                  return false;
                }
                return Certification.fromCode(
                  userStatus.certificateLevelCode,
                ).isIdentityVerified;
              }();

              if(!isVerified) {
                await showDialog<void>(
                  context: context,
                  builder: (ctx) => Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    insetPadding: const EdgeInsets.symmetric(horizontal: 12),
                    child: EconaModal(
                      message: 'まずは本人確認！',
                      subMessage: 'しつもん機能を利用するには\n本人確認が必要です。',
                      buttonText: '本人確認をする',
                      onButtonPressed: () async {
                        if(ctx.mounted) {
                          ctx.pop();
                        }
                        await onNavigateToCertificates();
                      },
                    ),
                  ),
                );
                return;
              }
              await showModalBottomSheet<void>(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                builder: (sheetContext) {
                  return EconaQuestionModal(
                    questions: [],
                    toUserId:
                        currentDetailPageState.userDetail?.profile.userId ?? '',
                  );
                },
              );
            },
          ),
          const SizedBox(width: 24),
          LikeMessageBtnWithPress(
            onTap: () async {
              if (!currentDetailPageState.hasUser) {
                return;
              }

              final userDetail = currentDetailPageState.userDetail!;
              final userProfile = userDetail.profile;

              // 1段目: ポイント使用確認のアクションシート
              final confirmed = await showModalBottomSheet<bool>(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => sheet.EconaFeatureActionSheet(
                  title: 'メッセージ付きいいね',
                  leading: Column(
                    children: [
                      Assets.images.icons.featureMessageWithLike.image(
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
                return;
              }

              // 2段目: メッセージ入力用アクションシート
              await showModalBottomSheet<bool>(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (sheetContext) => HookBuilder(
                  builder: (hookContext) {
                    final messageController = useTextEditingController();

                    return sheet.EconaFeatureActionSheet(
                      title: 'メッセージ付きいいね',
                      leading: Row(
                        spacing: 14,
                        children: [
                          Assets.images.icons.featureMessageWithLike.image(
                            height: 72,
                            width: 72,
                          ),
                          Text(
                            userProfile.name,
                            style: EconaTextStyle.labelMedium2140(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                          Text(
                            userProfile.ageText,
                            style: EconaTextStyle.labelMedium2140(
                              color: EconaColor.grayDarkActive,
                            ),
                          ),
                        ],
                      ),
                      text: 'お相手の写真や自己紹介文に触れたり、素敵だと感じるところを褒めるとマッチング率UP！',
                      detail: Column(
                        spacing: 8,
                        children: [
                          ShadowAndGradientBorderContainer(
                            borderRadius: BorderRadius.circular(16),
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
                                  const Color(0xFFFFFFFF).withValues(alpha: 0),
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
                                color: Colors.white.withValues(alpha: 0.88),
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
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText:
                                    'メッセージを入力しましょう\n\n入力例：\nはじめまして！\nプロフィールを見て素敵な人だなと思いメッセージしてみました。\nお返事もらえたら嬉しいです！',
                                hintMaxLines: 10,
                                hintStyle: EconaTextStyle.messageWithLikeHint(
                                  color: EconaColor.grayNormal,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                              ),
                            ),
                          ),
                          Text(
                            'LINE ID、メールアドレス、電話番号などあなたを特定できる個人情報を送信することはできません。\n\nメッセージは審査後に送信されます。規約に違反する場合、いいねは届きますがメッセージは削除され、使用したポイントは戻りませんので、同意した上で送信してください。',
                            style: EconaTextStyle.regularSmall140(
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
                        final message = messageController.text.trim();

                        // メッセージ付きいいね実行
                        final matching = await ref
                            .read(
                              userDetailPageViewModelProvider.notifier,
                            )
                            .onMessageLike(
                              userDetail,
                              message,
                            );

                        if (!context.mounted) {
                          Navigator.of(
                            sheetContext,
                            rootNavigator: true,
                          ).pop(false);
                          return;
                        }

                        final error =
                            ref.read(userDetailPageViewModelProvider).error;
                        final userId = userDetail.profile.userId;

                        if (matching != null) {
                          // マッチング時は「メッセージ付きいいねを送信しました。」は表示しない
                          await const MatchingRouteData().push<void>(
                            context,
                            extra: matching,
                          );

                          // Homeのカードスタックからこのユーザーを削除
                          ref
                              .read(homePageViewModelProvider.notifier)
                              .removeProfileByUserId(userId);

                          // 詳細ページを閉じてHomeの次カードを表示
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }

                          Navigator.of(
                            sheetContext,
                            rootNavigator: true,
                          ).pop(true);
                          return;
                        }

                        // マッチングしていない通常ケースのみ成功メッセージを表示
                        await _showActionResultForUserDetail(
                          context: context,
                          error: error,
                          successMessage: 'メッセージ付きいいねを送信しました。',
                        );

                        final success = error == null;

                        if (success) {
                          // 成功時はHomeのカードスタックから削除して詳細を閉じる
                          ref
                              .read(homePageViewModelProvider.notifier)
                              .removeProfileByUserId(userId);

                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        }

                        Navigator.of(
                          sheetContext,
                          rootNavigator: true,
                        ).pop(success);
                      },
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(width: 24),
          LikeBtnWithPress(
            onTap: () async {
              if (currentDetailPageState.hasUser) {
                final matching = await ref
                    .read(
                      userDetailPageViewModelProvider.notifier,
                    )
                    .onLike(currentDetailPageState.userDetail!);
                if (matching != null && context.mounted) {
                  await const MatchingRouteData().push<void>(
                    context,
                    extra: matching,
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

/// HomePage と同様のアクション結果表示処理（バナー / トースト / モーダル）
Future<void> _showActionResultForUserDetail({
  required BuildContext context,
  required EconaError? error,
  required String successMessage,
}) async {
  if (!context.mounted) {
    return;
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
            Navigator.of(dialogContext, rootNavigator: true).pop();
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
