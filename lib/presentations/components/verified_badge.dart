import 'dart:ui';

import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class VerifiedBadge extends StatelessWidget {
  VerifiedBadge({
    required this.text,
    this.textColor = Colors.white,
    Color? backgroundColor,
    super.key,
  }) : backgroundColor = backgroundColor ?? Colors.white.withValues(alpha: 0.2);

  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18.52),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(18.52),
          ),
          child: Text(
            text,
            textHeightBehavior: const TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
            style: EconaTextStyle.regularSmall140(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
