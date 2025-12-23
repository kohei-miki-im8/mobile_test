import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/notification_type.pbenum.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/econa_toggle.dart';
import 'package:econa_mobile_app/presentations/components/setting_list_tile.dart';
import 'package:econa_mobile_app/presentations/components/setting_section.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/settings/notification_setting_page_view_model.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:econa_mobile_app/presentations/shared/econa_error_handler.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationSettingPage extends HookConsumerWidget {
  const NotificationSettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationSettingPageViewModelProvider);
    final notifier = ref.read(notificationSettingPageViewModelProvider.notifier);

    ref.listen(notificationSettingPageViewModelProvider, (prev, next) async {
      final error = next.valueOrNull?.error;
      if (error != null) {
        // まずメンテナンスモードかどうかを共通ハンドラで判定
        final handled = await handleEconaError(context, error);
        if (handled) {
          notifier.clearError();
          return;
        }

        if (!context.mounted) return;
        await EconaNotification.showTopToast(
          context,
          message: error.userMessage,
        );
        notifier.clearError();
      }
    });

    return Scaffold(
      appBar: CenterAppBar(
        titleText: '通知設定',
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
      body: state.when(
        data: (data) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 64),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingSection(
                  items: [
                    SettingListTile(
                      title: 'プッシュ通知',
                      trailing: EconaToggle(
                        enable: data.pushNoticeEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType.NOTIFICATION_TYPE_PUSH_NOTICE,
                            !data.pushNoticeEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                  ],
                ),
                const _SupplementText(text: '通知をONにすると、以下の項目をリアルタイムで確認できます'),
                const _SubTitle(text: 'プッシュ通知設定'),
                SettingSection(
                  items: [
                    SettingListTile(
                      title: 'いいねを受け取ったときに通知',
                      trailing: EconaToggle(
                        enable: data.pushNoticeLikeEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_PUSH_NOTICE_LIKE,
                            !data.pushNoticeLikeEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                    SettingListTile(
                      title: 'マッチング時に通知',
                      trailing: EconaToggle(
                        enable: data.pushNoticeMatchEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_PUSH_NOTICE_MATCH,
                            !data.pushNoticeMatchEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                    SettingListTile(
                      title: 'メッセージ受信時に通知',
                      trailing: EconaToggle(
                        enable: data.pushNoticeMessageEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_PUSH_NOTICE_MESSAGE,
                            !data.pushNoticeMessageEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                    SettingListTile(
                      title: 'その他運営からのお知らせ',
                      trailing: EconaToggle(
                        enable: data.pushNoticeAnnouncementEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_PUSH_NOTICE_ANNOUNCEMENT,
                            !data.pushNoticeAnnouncementEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                  ],
                ),
                const _SubTitle(text: 'メール通知設定'),
                SettingSection(
                  items: [
                    SettingListTile(
                      title: 'メールアドレス',
                      trailing: _EmailDisplay(email: data.email),
                      onTap: () async {
                        await context.push(
                          const EmailAddressSettingRouteData().location,
                        );
                      },
                    ),
                  ],
                ),
                const _SupplementText(text: 'メール設定をすると、以下の項目がメールで通知されます'),
                SettingSection(
                  items: [
                    SettingListTile(
                      title: 'いいねを受け取ったときに通知',
                      trailing: EconaToggle(
                        enable: data.emailLikeEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_EMAIL_NOTICE_LIKE,
                            !data.emailLikeEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                    SettingListTile(
                      title: 'マッチング時に通知',
                      trailing: EconaToggle(
                        enable: data.emailMatchEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_EMAIL_NOTICE_MATCH,
                            !data.emailMatchEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                    SettingListTile(
                      title: 'メッセージ受信時に通知',
                      trailing: EconaToggle(
                        enable: data.emailMessageEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_EMAIL_NOTICE_MESSAGE,
                            !data.emailMessageEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                    SettingListTile(
                      title: 'その他運営からのお知らせ',
                      trailing: EconaToggle(
                        enable: data.emailAnnouncementEnabled,
                        onTap: () async {
                          await notifier.updateSetting(
                            NotificationType
                                .NOTIFICATION_TYPE_EMAIL_NOTICE_ANNOUNCEMENT,
                            !data.emailAnnouncementEnabled,
                          );
                        },
                        backgroundColor: EconaColor.toggleEnableBackground,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: EconaLoadingIndicator()),
        error: (e, s) => const Center(child: Text('エラーが発生しました')),
      ),
    );
  }
}

/// SettingsPageのサブタイトル部分
class _SubTitle extends StatelessWidget {
  const _SubTitle({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        text,
        style: EconaTextStyle.labelSmall140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}

/// 補足テキスト
class _SupplementText extends StatelessWidget {
  const _SupplementText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text,
        style: EconaTextStyle.regularSmall140(
          color: EconaColor.grayNormal,
        ),
      ),
    );
  }
}

class _EmailDisplay extends StatelessWidget {
  const _EmailDisplay({required this.email}); 

  final String email;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width * 0.5;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth -5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              email,
              style: EconaTextStyle.regularSmall140(
                color: EconaColor.purpleNormal,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
