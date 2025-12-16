import 'package:econa_mobile_app/domains/repositories/gen/econa/enums/newbie_tag.pbenum.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:flutter/material.dart';

/// バッジの種類を表すenum
enum BadgeType {
  newbieTagWithin2Weeks(
    text: 'NEW',
    backgroundColor: Color(0xFF29D79D),
    textColor: Colors.white,
  ),
  newbieTagWithin1Month(
    text: '今月入会',
    backgroundColor: EconaColor.feedbackRed400,
    textColor: Colors.white,
  );

  const BadgeType({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;

  /// NewbieTagからBadgeTypeを取得
  static BadgeType? fromNewbieTag(NewbieTag tag) {
    switch (tag) {
      case NewbieTag.NEWBIE_TAG_2_WEEKS:
        return BadgeType.newbieTagWithin2Weeks;
      case NewbieTag.NEWBIE_TAG_1_MONTH:
        return BadgeType.newbieTagWithin1Month;
      case NewbieTag.NEWBIE_TAG_UNSPECIFIED:
        return null;
    }
    return null;
  }

  static BadgeType? fromString(String tag) {
    switch (tag) {
      case 'NEW':
        return BadgeType.newbieTagWithin2Weeks;
      case '今月入会':
        return BadgeType.newbieTagWithin1Month;
    }
    return null;
  }
}

class EconaBadge extends StatelessWidget {
  const EconaBadge({
    required this.badgeType,
    super.key,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
  });

  final BadgeType badgeType;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor ?? badgeType.backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          badgeType.text,
          style: TextStyle(
            color: textColor ?? badgeType.textColor,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            fontFamily: 'NotoSansJP',
            height: 1,
            letterSpacing: 0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
