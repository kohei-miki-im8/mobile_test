import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/components/photo_frame.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/shared/typography_config.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final double toolbarHeight = 52 * EconaTypographyConfig.scale;

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    required this.titleText,
    super.key,
    this.leading,
    this.actions,
    this.backgroundColor,
  });
  final String titleText;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: backgroundColor,
      child: AppBar(
        backgroundColor: backgroundColor,
        clipBehavior: Clip.none,
        scrolledUnderElevation: 0,
        leading: leading != null
            ? Padding(
          padding: const EdgeInsets.only(left: 10),
          child: leading,
        )
            : null,
        title: InnerShadowText(
          text: titleText,
          textStyle: EconaTextStyle.headlineLargeTitle(
            color: EconaColor.grayGrayPurple400,
            shadows: EconaShadow.headlineShadows,
          ),
          innerShadowTextStyles: [
            EconaTextStyle.headlineLargeTitle(
              foreground: EconaShadow().headlineInnerShadow,
            ),
          ],
        ),
        titleSpacing: 10,
        centerTitle: false,
        actions: actions?.asMap().entries.map((entry) {
          final index = entry.key;
          final action = entry.value;
          final isLast = index == actions!.length - 1;
          return isLast
              ? Padding(
            padding: const EdgeInsets.only(right: 10),
            child: action,
          )
              : action;
        }).toList(),
      ),
    );
  }
}

class LargeTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LargeTitleAppBar({required this.titleText, super.key});
  final String titleText;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      scrolledUnderElevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: InnerShadowText(
          text: titleText,
          textStyle: EconaTextStyle.headlineLarge(
            color: EconaColor.grayGrayPurple400,
            shadows: EconaShadow.headlineShadows,
          ),
          innerShadowTextStyles: [
            EconaTextStyle.headlineLarge(
              foreground: EconaShadow().headlineInnerShadow,
            ),
          ],
        ),
      ),
      titleSpacing: 16,
      centerTitle: false,
    );
  }
}

class AvatarAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AvatarAppBar({
    required this.nameText,
    this.avatarUrl,
    this.avatarOnTap,
    this.actionOnPressed,
    this.actionLayerLink,
    this.backgroundColor,
    this.isAiChatRoom = false,
    this.leaveRoomOnPressed,
    super.key,
  });

  final String nameText;
  final String? avatarUrl;
  final void Function()? avatarOnTap;
  final void Function()? actionOnPressed;
  final LayerLink? actionLayerLink;
  final Color? backgroundColor;
  final bool isAiChatRoom;
  final void Function()? leaveRoomOnPressed;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: backgroundColor,
      child: AppBar(
        backgroundColor: backgroundColor,
        clipBehavior: Clip.none,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Assets.images.icons.leftArrow.image(),
          iconSize: 32,
          padding: EdgeInsets.zero,
          onPressed: () {
            context.pop();
          },
        ),
        leadingWidth: 36,
        toolbarHeight: toolbarHeight,
        title: Row(
          spacing: 16,
          children: [
            InkWell(
              onTap: avatarOnTap,
              child: PhotoFrame(imageUrl: avatarUrl, size: 32),
            ),
            SizedBox(
              width: 123,
              child: Text(
                nameText,
                style: EconaTextStyle.labelMedium2140(
                  color: EconaColor.grayTextTabEnable,
                ),
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToLastDescent: false,
                ),
              ),
            ),
          ],
        ),
        titleSpacing: 10,
        actions: [
          if(isAiChatRoom)...[
            IconButton(
              onPressed: leaveRoomOnPressed,
              icon: const Icon(Icons.logout),
            ),
          ],
          if (actionLayerLink != null)
            CompositedTransformTarget(
              link: actionLayerLink!,
              child: IconButton(
                onPressed: actionOnPressed,
                icon: Assets.images.icons.threeDots.image(width: 32, height: 32),
              ),
            )
          else
            IconButton(
              onPressed: actionOnPressed,
              icon: Assets.images.icons.threeDots.image(width: 32, height: 32),
            ),
        ]
      ),
    );
  }
}

class CenterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CenterAppBar({
    required this.titleText,
    super.key,
    this.leading,
    this.actions,
    this.backgroundColor,
  });
  final String titleText;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      scrolledUnderElevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Padding(
          padding: const EdgeInsets.only(left: 2, right: 2),
          child: leading,
        ),
      ),
      leadingWidth: 45,
      toolbarHeight: toolbarHeight,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: InnerShadowText(
        text: titleText,
        textStyle: EconaTextStyle.labelMedium2140(
          color: EconaColor.gray200,
          shadows: EconaShadow.headlineShadows,
        ),
        innerShadowTextStyles: [
          EconaTextStyle.labelMedium2140(
            foreground: EconaShadow().headlineInnerShadow,
          ),
        ],
      ),
      actions: actions,
    );
  }
}

/// 大見出しを含むクローズ付きのAppBar
/// - Leadingは×（close）
/// - タイトルはLikeと同じ`InnerShadowText`スタイルの大見出し
/// - 任意のサブタイトルを下に配置
class EconaCloseLargeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const EconaCloseLargeAppBar({
    required this.titleText,
    this.subtitleText,
    this.onClose,
    this.horizontalPadding = 10,
    this.toolbarTotalHeight = 140,
    super.key,
  });

  final String titleText;
  final String? subtitleText;
  final VoidCallback? onClose;
  final double horizontalPadding;
  final double toolbarTotalHeight;

  @override
  Size get preferredSize => Size.fromHeight(toolbarTotalHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      toolbarHeight: toolbarTotalHeight,
      automaticallyImplyLeading: false,
      centerTitle: false,
      flexibleSpace: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close
              IconButton(
                icon: Assets.images.icons.close.image(width: 24, height: 24),
                padding: EdgeInsets.zero,
                onPressed: onClose ?? () => context.pop(),
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 4),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InnerShadowText(
                  text: titleText,
                  textStyle: EconaTextStyle.headlineLargeTitle(
                    color: EconaColor.grayGrayPurple400,
                    shadows: EconaShadow.headlineShadows,
                  ),
                  innerShadowTextStyles: [
                    EconaTextStyle.headlineLargeTitle(
                      foreground: EconaShadow().headlineInnerShadow,
                    ),
                  ],
                ),
              ),
              if (subtitleText != null) ...[
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    subtitleText!,
                    style: EconaTextStyle.regularSmall140(
                      color: EconaColor.grayTextTabEnable,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}