import 'package:econa_mobile_app/domains/entities/certification.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/get_blocked_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/block/v1/update_user_block.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/get_hidden_users.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/services/site/hide/v1/update_user_hide.pb.dart';
import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/pager_cursor.pb.dart';
import 'package:econa_mobile_app/infrastructures/repositories/block.dart';
import 'package:econa_mobile_app/infrastructures/repositories/hide.dart';
import 'package:econa_mobile_app/infrastructures/services/adjust_event_tracker.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/components/options_modal_view_model.dart';
import 'package:econa_mobile_app/presentations/pages/profile/profile_page_view_model.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

/// 違反報告などのオプションモーダルウィジェット
class OptionsModal extends HookConsumerWidget {
  const OptionsModal({
    required this.userId,
    required this.toUserNickname,
    required this.myUserId,
    required this.isVerified,
    super.key,
  });

  final String userId;
  final String toUserNickname;
  final String myUserId;
  final bool isVerified;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBlockedState = useState<bool?>(null);
    final isHiddenState = useState<bool?>(null);

    // ブロック状態を取得
    useEffect(() {
      () async {
        try {
          final blocked = await ref.read(blockRepositoryProvider).getBlockedUsers(
            GetBlockedUsersRequest(
              toUserId: userId,
              cursor: PagerRequestCursor(
                limit: 1,
              ),
            ),
          );
          isBlockedState.value = blocked.thumbnailUsers.any(
                (u) => u.userId == userId,
          );
        } catch (_) {
          // エラー時は変更しない
        }
      }();
      return null;
    }, [userId]);

    // 非表示状態を取得
    useEffect(() {
      () async {
        try {
          final hidden = await ref.read(hideRepositoryProvider).getHiddenUsers(
            GetHiddenUsersRequest(
              toUserId: userId,
              cursor: PagerRequestCursor(limit: 1),
            ),
          );
          isHiddenState.value = hidden.thumbnailUsers.any((u) => u.userId == userId);
        } catch (_) {}
      }();
      return null;
    }, [userId]);

    return Center(
      child: ShadowAndGradientBorderContainer(
        borderRadius: BorderRadius.circular(4),
        borderWidth: 1,
        gradients: const [
          LinearGradient(
            colors: [Color(0xFFD6E3F3), Color(0xFFFFFFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ],
        backgroundColor: Colors.white,
        innerShadows: EconaShadow.modalInnerShadows,
        dropShadows: EconaShadow.modalDropShadows,
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _OptionItem(
                text: '違反報告する',
                onTap: () async {
                  if (context.canPop()) {
                    context.pop();
                  }

                  if (!isVerified) {
                    if (!context.mounted) {
                      return;
                    }
                    await EconaNotification.showTopToast(
                      context,
                      message: '本人確認完了後にご利用いただけます',
                    );
                    return;
                  }

                  String reporterNickname = '';
                  try {
                    final profileState = ref.read(profilePageViewModelProvider);
                    if (profileState.profile == null) {
                      await ref
                          .read(profilePageViewModelProvider.notifier)
                          .getProfileNoLoading();
                      final updated = ref.read(profilePageViewModelProvider).profile;
                      reporterNickname = updated
                          ?.updatableProfile
                          .requiringReviewNickname
                          .currentNickname ??
                          '';
                    } else {
                      reporterNickname = profileState
                          .profile!
                          .updatableProfile
                          .requiringReviewNickname
                          .currentNickname;
                    }
                  } catch (_) {
                    reporterNickname = '';
                  }

                  await _launchViolationReportEmail(
                    context: context,
                    toUserNickname: toUserNickname,
                    reporterNickname: reporterNickname,
                    reporterUserId: myUserId,
                  );

                  AdjustEventTracker.trackReport();
                },
              ),
              const SizedBox(height: 20),
              _OptionItem(
                text: isHiddenState.value == true ? '非表示を解除' : '非表示にする',
                onTap: () async {
                  try {
                    final hidden = await ref.read(hideRepositoryProvider).getHiddenUsers(
                      GetHiddenUsersRequest(
                        toUserId: userId,
                        cursor: PagerRequestCursor(
                          limit: 1,
                        ),
                      ),
                    );

                    final isAlreadyHidden = hidden.thumbnailUsers.any((u) => u.userId == userId);

                    // updateUserHideを直接呼び出し
                    await ref.read(hideRepositoryProvider).updateUserHide(
                      UpdateUserHideRequest(
                        toUserId: userId,
                        hide: !isAlreadyHidden,  // トグル
                      ),
                    );

                    isHiddenState.value = !isAlreadyHidden;

                    if (context.mounted) {
                      if (!isAlreadyHidden) {
                        AdjustEventTracker.trackHide();
                      }
                      await EconaNotification.showTopToast(
                        context,
                        message: isAlreadyHidden
                            ? '非表示を解除しました'
                            : '非表示にしました',
                      );
                    }
                    if (context.mounted && context.canPop()) {
                      context.pop();
                    }
                  } catch (e) {
                    if (!context.mounted) return;
                    await EconaNotification.showTopToast(
                      context,
                      message: '非表示の更新に失敗しました',
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              _OptionItem(
                text: isBlockedState.value == true ? 'ブロックを解除' : 'ブロックする',
                onTap: () async {
                  try {
                    final blocked = await ref.read(blockRepositoryProvider).getBlockedUsers(
                      GetBlockedUsersRequest(
                        toUserId: userId,
                        cursor: PagerRequestCursor(
                          limit: 1,
                        ),
                      ),
                    );
                    final isAlreadyBlocked = blocked.thumbnailUsers.any(
                          (u) => u.userId == userId,
                    );
                    await ref.read(blockRepositoryProvider).updateUserBlock(
                      UpdateUserBlockRequest(
                        toUserId: userId,
                        block: !isAlreadyBlocked,
                      ),
                    );
                    if (!isAlreadyBlocked) {
                      AdjustEventTracker.trackBlock();
                    }
                    isBlockedState.value = !isAlreadyBlocked;
                    if (context.mounted) {
                      await EconaNotification.showTopToast(
                        context,
                        message: isAlreadyBlocked
                            ? 'ブロックを解除しました'
                            : 'ブロックしました',
                      );
                    }
                    if (context.mounted && context.canPop()) {
                      context.pop();
                    }
                  } catch (e) {
                    if (!context.mounted) return;
                    await EconaNotification.showTopToast(
                      context,
                      message: 'ブロックの更新に失敗しました',
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// オプションアイテムウィジェット
class _OptionItem extends StatelessWidget {
  const _OptionItem({
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: EconaTextStyle.regularMedium2200(
          color: EconaColor.grayDarkActive,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// オプションモーダルを表示する関数
Future<void> showOptionsModal({
  required BuildContext context,
  required String userId,
  required String toUserNickname,
  required String myUserId,
  required bool isVerified,
  double right = 20,
  double top = 40,
}) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    builder: (context) => GestureDetector(
      onTap: () {
        // モーダル以外をタップしたらモーダルを閉じる
        if (context.canPop()) {
          context.pop();
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            // AppBarの3点リーダボタンの位置にモーダルを配置
            Positioned(
              right: right,
              top: MediaQuery.of(context).padding.top + top,
              child: GestureDetector(
                onTap: () {
                  // モーダル内をタップしてもモーダルは閉じない
                },
                child: OptionsModal(
                  userId: userId,
                  toUserNickname: toUserNickname,
                  myUserId: myUserId,
                  isVerified: isVerified,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Future<void> _launchViolationReportEmail({
  required BuildContext context,
  required String toUserNickname,
  required String reporterNickname,
  required String reporterUserId,
}) async {
  final buffer = StringBuffer()
    ..writeln('内容を確認後、送信してください。')
    ..writeln()
    ..writeln('[違反者]')
    ..writeln(toUserNickname)
    ..writeln()
    ..writeln('[違反の内容を一言で]')
    ..writeln()
    ..writeln('[違反の具体的な内容をできるだけ詳しく]')
    ..writeln()
    ..writeln('[報告者]')
    ..writeln(reporterNickname)
    ..writeln()
    ..writeln('[運営確認欄]')
    ..writeln(reporterUserId);

  final uri = Uri(
    scheme: 'mailto',
    path: 'support@lavigation.com',
    queryParameters: <String, String>{
      'subject': 'Lavi ユーザー違反報告',
      'body': buffer.toString(),
    },
  );

  try {
    final ok = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // メールアプリを明示的に外部起動
    );
    if (!ok && context.mounted) {
      await EconaNotification.showTopToast(
        context,
        message: 'メールアプリを起動できませんでした',
      );
    }
  } catch (_) {
    if (!context.mounted) return;
    await EconaNotification.showTopToast(
      context,
      message: 'メールアプリを起動できませんでした',
    );
  }
}