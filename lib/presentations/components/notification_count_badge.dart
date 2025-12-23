import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class NotificationCountBadge extends StatelessWidget {
  const NotificationCountBadge({
    required this.count,
    super.key,
    this.backgroundColor,
    this.textColor,
    this.showZero = false,
    this.child,
    this.badgePosition = BadgePosition.topRight,
    this.badgeOffset = const Offset(8, -8),
  });

  final int count;
  final Color? backgroundColor;
  final Color? textColor;
  final bool showZero;
  final Widget? child;
  final BadgePosition badgePosition;
  final Offset badgeOffset;

  @override
  Widget build(BuildContext context) {
    // childが指定されている場合は、Stackで重ねて表示
    if (child != null) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          child!,
          if (count > 0 || showZero)
            Positioned(
              left: badgePosition == BadgePosition.topLeft ||
                      badgePosition == BadgePosition.bottomLeft
                  ? badgeOffset.dx
                  : null,
              right: badgePosition == BadgePosition.topRight ||
                      badgePosition == BadgePosition.bottomRight
                  ? badgeOffset.dx
                  : null,
              top: badgePosition == BadgePosition.topLeft ||
                      badgePosition == BadgePosition.topRight
                  ? badgeOffset.dy
                  : null,
              bottom: badgePosition == BadgePosition.bottomLeft ||
                      badgePosition == BadgePosition.bottomRight
                  ? badgeOffset.dy
                  : null,
              child: _BadgeWidget(
                count: count,
                backgroundColor: backgroundColor,
                textColor: textColor,
                showZero: showZero,
              ),
            ),
        ],
      );
    }

    // childが指定されていない場合は、バッジのみを表示
    return _BadgeWidget(
      count: count,
      backgroundColor: backgroundColor,
      textColor: textColor,
      showZero: showZero,
    );
  }
}

class _BadgeWidget extends StatelessWidget {
  const _BadgeWidget({
    required this.count,
    required this.backgroundColor,
    required this.textColor,
    required this.showZero,
  });

  final int count;
  final Color? backgroundColor;
  final Color? textColor;
  final bool showZero;

  @override
  Widget build(BuildContext context) {
    // カウントが0で、showZeroがfalseの場合は表示しない
    if (count == 0 && !showZero) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(
        8,
        4,
        8,
        4,
      ), // Top: 4px, Right: 8px, Bottom: 4px, Left: 8px
      decoration: BoxDecoration(
        color: backgroundColor ?? EconaColor.purpleNormal, // 青紫色
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          // 1つ目のドロップシャドウ: X: 6, Y: 6, Blur: 12, Spread: 0,
          //Color: #656DF0 with 28% opacity
          BoxShadow(
            color: const Color(0xFF656DF0).withValues(alpha: 0.28),
            offset: const Offset(6, 6),
            blurRadius: 12,
            spreadRadius: 0,
          ),
          // 2つ目のドロップシャドウ: X: -4, Y: -4, Blur: 12, Spread: 0,
          //Color: #FFFFFF with 50% opacity
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.5),
            offset: const Offset(-4, -4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          count > 99 ? '99+' : count.toString(),
          style: EconaTextStyle.labelXSmall(color: textColor ?? Colors.white)
              .copyWith(letterSpacing: 0.1),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

enum BadgePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}
