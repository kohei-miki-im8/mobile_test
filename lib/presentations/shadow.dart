// シャドウの定義をします

import 'dart:io';

import 'package:flutter/material.dart';

class EconaShadow {
  static final headlineShadows = [
    Shadow(
      offset: const Offset(-1, -1),
      blurRadius: 3,
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.80),
    ),
  ];


  final headlineInnerShadow = Platform.isIOS
      ? (Paint()
    ..style = PaintingStyle.fill
  // 影の色。alphaにはFigmaの3/2の値を設定
    ..color = const Color(0xFF353E72).withValues(alpha: 0.915))
      : (Paint()
    ..style = PaintingStyle.fill
  // 影の色。alphaにはFigmaの3/2の値を設定
    ..color = const Color(0xFF353E72).withValues(alpha: 0.915)
  // sigmaにはFigmaのBlurの2/3の値を設定
    ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 2));

  final labelMediumInnerShadow = Platform.isIOS
      ? (Paint()
    ..style = PaintingStyle.fill
    ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.9 * 3 / 2))
      : (Paint()
    ..style = PaintingStyle.fill
    ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.9 * 3 / 2)
    ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 3));

  static final tabShadows = [
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: const Offset(-4, -4),
      blurRadius: 9,
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
    ),
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: const Offset(4, 4),
      blurRadius: 14,
      color: const Color(0xFF86A3C8).withValues(alpha: 1),
    ),
    //BoxShadow(
    //  offset: const Offset(-4, -4),
    //  blurRadius: 20,
    //  color: const Color(0xFFFFFFFF).withValues(alpha: 1),
    //),
    //BoxShadow(
    //  offset: const Offset(6, 6),
    //  blurRadius: 22,
    //  color: const Color(0xFF587CA7).withValues(alpha: 0.14),
    //),
  ];

  static final tabItemShadows = [
    BoxShadow(
      offset: const Offset(2, 2),
      blurRadius: 4,
      color: const Color(0xFF7273AB).withValues(alpha: 0.1),
    ),
    BoxShadow(
      offset: const Offset(-4, -4),
      blurRadius: 9,
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
    ),
  ];

  static final modalInnerShadows = [
    const BoxShadow(
      color: Color(0x1A7273AB), // #7273AB 10%
      offset: Offset(-2, -2),
      blurRadius: 4,
    ),
  ];

  static final modalDropShadows = [
    const BoxShadow(
      color: Color(0x3D3E4AB5), // #3E4AB5 24%
      offset: Offset(-4, -4),
      blurRadius: 20,
    ),
    BoxShadow(
      color: Colors.white.withValues(alpha: 1),
      offset: const Offset(-6, -6),
      blurRadius: 20,
    ),
  ];

  static final toggleEnableInnerShadows = [
    BoxShadow(
      color: const Color(0x12154670).withValues(alpha: 0.44),
      blurRadius: 14,
      offset: const Offset(4, 4),
    ),
    const BoxShadow(
      color: Color(0xFFA6AEFF),
      blurRadius: 9,
      offset: Offset(-4, -4),
    ),
  ];

  static final toggleDisableInnerShadows = [
    BoxShadow(
      color: const Color(0xFF587CA7).withValues(alpha: 0.14),
      blurRadius: 14,
      offset: const Offset(4, 4),
    ),
    const BoxShadow(
      color: Color(0xFFFFFFFF),
      blurRadius: 9,
      offset: Offset(-4, -4),
    ),
  ];

  static final toggleEnableDropShadows = [
    BoxShadow(
      color: const Color(0x12154670).withValues(alpha: 0.44),
      blurRadius: 14,
      offset: const Offset(4, 4),
    ),
    const BoxShadow(
      color: Color(0xFFA6AEFF),
      blurRadius: 9,
      offset: Offset(-4, -4),
    ),
  ];

  static final toggleDisableDropShadows = [
    BoxShadow(
      color: const Color(0xFF587CA7).withValues(alpha: 0.14),
      blurRadius: 22,
      offset: const Offset(6, 6),
    ),
    const BoxShadow(
      color: Colors.white,
      blurRadius: 20,
      offset: Offset(-4, -4),
    ),
  ];

  static final toggleThumbInnerShadows = [
    const BoxShadow(
      color: Color(0xFFC1D5EE),
      blurRadius: 14,
      offset: Offset(4, 4),
    ),
    BoxShadow(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
      blurRadius: 9,
      offset: const Offset(-4, -4),
    ),
  ];

  static final toggleThumbDropShadows = [
    BoxShadow(
      color: const Color(0xFF6F75B0).withValues(alpha: 0.24), // alpha: 0.24 * 255
      blurRadius: 20,
      offset: const Offset(4, 4),
    ),
    BoxShadow(
      color: const Color(0xFF7273AB).withValues(alpha: 0.10), // alpha: 0.10 * 255
      blurRadius: 4,
      offset: const Offset(-2, 2),
    ),
    BoxShadow(
      color: const Color(0xFF0A0323).withValues(alpha: 0.25), // alpha: 0.25 * 255
      blurRadius: 4,
      offset: const Offset(0, 4),
    ),
  ];

  static final inputFieldInnerShadows = [
    BoxShadow(
      offset: const Offset(4, 4),
      blurRadius: 14,
      color: const Color(0xFFC1C7EE).withValues(alpha: 0.5),
    ),
    BoxShadow(
      offset: const Offset(-4, -4),
      blurRadius: 9,
      color: Colors.white.withValues(alpha: 0.88),
    ),
    BoxShadow(
      offset: const Offset(0, 2),
      blurRadius: 4,
      color: const Color(0xFFC5C1EE).withValues(alpha: 0.25),
    ),
  ];

  static final inputFieldDropShadows = [
    const BoxShadow(
      offset: Offset(-6, -6),
      blurRadius: 15,
      color: Color(0xFFFFFFFF),
    ),
  ];

  // 凸型パネル用
  static const convexPanelInnerShadows = [
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: Offset(-4, -4),
      blurRadius: 9,
      color: Color(0x0EFFFFFF),
    ),
  ];

  static const convexPanelDropShadows = [
    BoxShadow(
      offset: Offset(4, 4),
      blurRadius: 20,
      color: Color(0x3D3E4AB5),
    ),
    BoxShadow(
      offset: Offset(-6, -6),
      blurRadius: 20,
      color: Color(0x3DFFFFFF),
    ),
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: Offset(2, 2),
      blurRadius: 4,
      color: Color(0x1A7273AB),
    ),
  ];

  static const convexPanelLargeDropShadows = [
    BoxShadow(
      offset: Offset(4, 4),
      blurRadius: 20,
      color: Color(0x3D6F75B0),
    ),
    BoxShadow(
      offset: Offset(-6, -6),
      blurRadius: 20,
      color: Color(0xFFFFFFFF),
    ),
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: Offset(2, 2),
      blurRadius: 4,
      color: Color(0x1A7273AB),
    ),
  ];

  // 凹型パネル用
  static const concavePanelInnerShadows = [
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: Offset(2, 2),
      blurRadius: 3,
      color: Color(0x1A353E72),
    ),
    BoxShadow(
      blurStyle: BlurStyle.inner,
      offset: Offset(2, 2),
      blurRadius: 20,
      color: Color(0x2E353E72),
    ),
  ];

  static const concavePanelDropShadows = [
    BoxShadow(
      offset: Offset(-1, -1),
      blurRadius: 3,
      color: Color(0xCCFFFFFF),
    ),
  ];
}
