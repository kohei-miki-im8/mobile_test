// 共通のスタイルを定義します
import 'package:econa_mobile_app/presentations/gen/fonts.gen.dart';
import 'package:econa_mobile_app/presentations/shared/typography_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

// TextStyle
class EconaTextStyle {
  static double _scaled(double baseSize) =>
      baseSize * EconaTypographyConfig.scale;

  static TextStyle headline2({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(18),
        letterSpacing: 0,
        height: 1,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle headlineHeadline({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(20),
        letterSpacing: 0.25,
        height: 1.4, // 140%
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle headlineLarge({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(27),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.30,
        height: 1,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle headlineLargeTitle({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(24),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.30,
        height: 1,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle headlineHeadlineBold({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700, // SemiBold
        fontSize: _scaled(20),
        letterSpacing: 0.25,
        height: 1.4, // 140%
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelMedium1180({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        color: color,
        fontSize: _scaled(14),
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400,
        height: 1.8,
        letterSpacing: 14 * 0.0025,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelMedium2140({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(16),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
        decoration: decoration,
      );

  static TextStyle labelMedium2160({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(16),
        fontWeight: FontWeight.w400,
        letterSpacing: 16 * 0.0025,
        height: 1.6,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle regularMedium2160({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(16),
        fontWeight: FontWeight.w400, // Regular
        letterSpacing: 16 * 0.0025, // 0.25%
        height: 1.6, // 160%
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelSmall100({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600,
        fontSize: _scaled(12),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 1,
      );

  static TextStyle labelSmall140({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(12),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
        decoration: decoration,
      );

  static TextStyle labelSmall22({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(12),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 22 / 12, // lineHeight ÷ fontSize
      );

  static TextStyle labelXSmall({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(10),
        letterSpacing: 0.1,
        height: 1, // FigmaのAutoはFlutterでは1.0が推奨
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelMedium1140({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(14),
        letterSpacing: 0.1,
        height: 1.4, // 140%
        color: color,
        shadows: shadows,
        foreground: foreground,
        decoration: decoration,
      );

  static TextStyle regularMedium1160({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400,
        fontSize: _scaled(14),
        letterSpacing: 0.25,
        height: 1.6,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelMedium1160({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(14),
        letterSpacing: 0.25,
        height: 1.6, // 160%
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle regularSmall140({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400, // Regular
        fontSize: _scaled(12),
        letterSpacing: 0.25,
        height: 1.4, // 140%
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle regularSmall160({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400, // Regular
        fontSize: _scaled(12),
        letterSpacing: 0.25,
        height: 1.6, // 140%
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle regularXSmall({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400, // Regular
        fontSize: _scaled(10),
        letterSpacing: 0,
        height: 1,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle regularMedium2200({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400, // Regular
        fontSize: _scaled(16),
        letterSpacing: 0.25,
        height: 2, // 200%
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle headlineHeadline2({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(19),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.25,
        height: 1.6,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle lavigationIconListText({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // Regular
        fontSize: _scaled(12),
        letterSpacing: 0.25,
        height: 18 / 12,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle lavigationMainIconText({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // Regular
        fontSize: _scaled(14),
        letterSpacing: 0.25,
        height: 18 / 12,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle headlineEmptyState({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(18),
        height: 1.6,
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle point({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(32),
        height: 1.6,
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle pointUnit({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w900, // SemiBold
        fontSize: _scaled(15),
        height: 1,
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.1,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle messageWithLikeHint({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        color: color,
        fontSize: _scaled(16),
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600,
        height: 1.4,
        letterSpacing: 16 * 0.0025,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelHintText({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        color: color,
        fontSize: _scaled(14),
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400,
        height: 1.40,
        letterSpacing: 14 * 0.0025,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelHintTextBold({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        color: color,
        fontSize: _scaled(16),
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600,
        height: 1.40,
        letterSpacing: 16 * 0.0025,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle regularMedium160({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        color: color,
        fontSize: _scaled(14),
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400,
        height: 32 / 14, // lineHeight ÷ fontSize,
        letterSpacing: 14 * 0.0025,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle simulationSystemMessages({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        color: color?.withValues(alpha: opacity),
        fontSize: _scaled(12),
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400,
        height: 1,
        letterSpacing: 12 * 0.0025,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle simulationTitle({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700, // SemiBold
        fontSize: _scaled(22),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 1.6,
      );

  static TextStyle simulationContent({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(16),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 2, // lineHeight ÷ fontSize
      );

  static TextStyle simulationCardProfile({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700,
        fontSize: _scaled(20),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 2,
      );

  static TextStyle simulationCardFeatures({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400,
        fontSize: _scaled(14),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 2,
      );

  static TextStyle simulationTutorial({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w500,
        fontSize: _scaled(16),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 12 * 0.0025,
        height: 2,
      );

  static TextStyle bottomPickerItem({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700,
        fontSize: _scaled(18),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 1,
      );

  static TextStyle grayTextInvert({
    Color? color,
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700,
        fontSize: _scaled(22),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 1.6, // lineHeight ÷ fontSize
      );

  static TextStyle grayLightHover({
    Color? color = const Color(0xFFEDEFF8),
    double? opacity = 1.0,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w500,
        fontSize: _scaled(16),
        color: color?.withValues(alpha: opacity),
        letterSpacing: 0.25,
        height: 2, // lineHeight ÷ fontSize
      );

  static TextStyle priceTitle({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700,
        fontSize: _scaled(28),
        letterSpacing: 28 * 0.0025,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle priceUnit({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700,
        fontSize: _scaled(24),
        letterSpacing: 28 * 0.0025,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle pointTitle({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700,
        fontSize: _scaled(14),
        letterSpacing: 28 * 0.0025,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle pointUnitSmall({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700,
        fontSize: _scaled(20),
        letterSpacing: 28 * 0.0025,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle labelSmall120({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
    TextDecoration? textDecoration,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontSize: _scaled(12),
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
        height: 1,
        color: color,
        shadows: shadows,
        foreground: foreground,
        decoration: textDecoration,
      );

  // プラン日数表示用
  static TextStyle planDays({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700, // Bold
        fontSize: _scaled(28),
        letterSpacing: 0.25,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  // 次回いいね付与日テキスト用
  static TextStyle nextLikeDateText({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w600, // SemiBold
        fontSize: _scaled(12),
        letterSpacing: 0.25,
        height: 22 / 12,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  // planテキスト用
  static TextStyle planCardText({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
    double? fontSize = 27,
  }) =>
      TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700, // Bold
        fontSize: fontSize == null ? null : _scaled(fontSize),
        letterSpacing: 16 * 0.11,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  // planサブテキスト用
  static TextStyle planCardSubText({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
    double? fontSize = 10,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w700, // Bold
        fontSize: fontSize == null ? null : _scaled(fontSize),
        letterSpacing: 10 * 0.0025,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle questionWhoProposed({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400, // Bold
        fontSize: _scaled(10),
        letterSpacing: 10 * 0.0025,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );

  static TextStyle questionProposed({
    Color? color,
    List<Shadow>? shadows,
    Paint? foreground,
  }) =>
      TextStyle(
        fontFamily: FontFamily.notoSansJP,
        fontWeight: FontWeight.w400, // Bold
        fontSize: _scaled(14),
        letterSpacing: 14 * 0.0025,
        height: 1.4,
        color: color,
        shadows: shadows,
        foreground: foreground,
      );
}
