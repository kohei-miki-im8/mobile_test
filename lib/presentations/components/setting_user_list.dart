import 'package:econa_mobile_app/domains/repositories/gen/econa/shared/thumbnail_user.pb.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/photo_frame.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/util/age.dart';
import 'package:econa_mobile_app/presentations/shared/photos/photo_url_resolver.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 非表示・ブロック設定用の共通リストコンポーネント
class SettingUserList extends HookConsumerWidget {
  const SettingUserList({
    required this.items,
    this.trailingBuilder,
    super.key,
  });

  final List<ThumbnailUser> items;
  final Widget Function(BuildContext context, ThumbnailUser user)? trailingBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return SettingUserTile(
          key: ValueKey(item.userId),
          user: item,
          trailingBuilder: trailingBuilder,
        );
      },
    );
  }
}

class SettingUserTile extends HookConsumerWidget {
  const SettingUserTile({
    required this.user,
    this.trailingBuilder,
    super.key,
  });

  final ThumbnailUser user;
  final Widget Function(BuildContext context, ThumbnailUser user)? trailingBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = resolvePhotoUrl(
      profile: user.profile,
      kind: PhotoUrlKind.mediumThumbnailWebpUrl,
    );

    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(24, 10, 24, 0),
      leading: PhotoFrame(imageUrl: imageUrl, size: 56),
      title: _UserInfo(item: user),
      trailing: trailingBuilder?.call(context, user),
    );
  }
}

/// ユーザー情報
class _UserInfo extends HookConsumerWidget {
  const _UserInfo({required this.item});
  final ThumbnailUser item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatableProfile = item.profile.updatableProfile;
    return Row(
      children: [
        Flexible(
          child: Text(
            updatableProfile.requiringReviewNickname.currentNickname,
            style: EconaTextStyle.labelMedium2140(
              color: EconaColor.grayDarkActive,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          calculateAgeJp(updatableProfile.birthday),
          style: EconaTextStyle.labelMedium2140(
            color: EconaColor.grayDarkActive,
          ),
        ),
      ],
    );
  }
}

/// アクション完了通知モーダルを表示するヘルパー関数
Future<void> showActionCompletionModal({
  required BuildContext context,
  required ThumbnailUser user,
  required String completionText,
}) async {
  if (!context.mounted) return;
  await showDialog<void>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      content: _ActionCompletionModal(
        user: user,
        completionText: completionText,
      ),
    ),
  );
}

/// アクション完了通知モーダル
class _ActionCompletionModal extends StatelessWidget {
  const _ActionCompletionModal({
    required this.user,
    required this.completionText,
  });
  final ThumbnailUser user;
  final String completionText;

  @override
  Widget build(BuildContext context) {
    final updatableProfile = user.profile.updatableProfile;
    final imageUrl = resolvePhotoUrl(
      profile: user.profile,
      kind: PhotoUrlKind.mediumThumbnailWebpUrl,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Assets.images.icons.close.image(height: 24, width: 24),
          ),
        ),
        PhotoFrame(imageUrl: imageUrl, size: 60),
        const SizedBox(height: 4),
        Text(
          updatableProfile.requiringReviewNickname.currentNickname,
          style: EconaTextStyle.labelMedium2140(
            color: EconaColor.grayDarkActive,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              calculateAgeJp(updatableProfile.birthday),
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayDark,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              updatableProfile.residenceRegion.name,
              style: EconaTextStyle.labelSmall140(
                color: EconaColor.grayDark,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            completionText,
            style: EconaTextStyle.headlineHeadline2(
              color: EconaColor.grayDarkActive,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
