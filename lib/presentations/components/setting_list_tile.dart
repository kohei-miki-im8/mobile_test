import 'dart:io';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    super.key,
    required this.title,
    this.trailing,
    this.onTap,
  });

  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: SettingItemName(
        text: title,
        softWrap: false,
        maxLines: 1,
        overflow: TextOverflow.clip,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class SettingItemName extends StatelessWidget {
  const SettingItemName({
    super.key,
    required this.text,
    this.softWrap,
    this.maxLines,
    this.overflow,
  });

  final String text;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return InnerShadowText(
      text: text,
      textStyle: EconaTextStyle.labelMedium1140(
        color: EconaColor.grayNormal,
      ),
      softWrap: softWrap,
      maxLines: maxLines,
      overflow: overflow,
      innerShadowTextStyles: [
        EconaTextStyle.labelMedium1140(
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..color = const Color(0xFF353E72).withValues(alpha: 0.61 * 3 / 2)
            ..maskFilter = Platform.isIOS
                ? const MaskFilter.blur(BlurStyle.normal, 0)
                : const MaskFilter.blur(BlurStyle.inner, 14 / 20),
        ),
        EconaTextStyle.labelMedium1140(
          foreground: Paint()
            ..style = PaintingStyle.fill
            ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.8 * 3 / 2)
            ..maskFilter = Platform.isIOS
                ? const MaskFilter.blur(BlurStyle.normal, 0)
                : const MaskFilter.blur(BlurStyle.inner, 14 / 20),
        ),
      ],
    );
  }
}
