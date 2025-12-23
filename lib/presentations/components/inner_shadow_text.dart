import 'dart:io';

import 'package:flutter/material.dart';


Paint? _clonePaintWithColor(Paint? src, Color color) {
  if (src == null) return null;
  return Paint()
    ..blendMode = src.blendMode
    ..style = src.style
    ..strokeWidth = src.strokeWidth
    ..strokeMiterLimit = src.strokeMiterLimit
    ..strokeCap = src.strokeCap
    ..strokeJoin = src.strokeJoin
    ..isAntiAlias = src.isAntiAlias
    ..shader = src.shader
    ..colorFilter = src.colorFilter
    ..imageFilter = src.imageFilter
    ..maskFilter = src.maskFilter
    ..filterQuality = src.filterQuality
    ..color = color; // ★ここで色だけ差し替え
}

/*
  Flutterではテキストのインナーシャドウはサポートされていないため
  同じサイズの透明なテキストを本来のテキストの真上に重ねて
  それにぼかしを加えることでインナーシャドウを再現しています
  (透明なテキストを重ねているのは、TextStyleクラスの仕様上
  同一テキストにカラーとぼかしを同時にあてることができないためです)

  ただし色については、インナーシャドウとぼかしのエフェクトのあたり方の違いから
  Figmaで設定されているテキストとインナーシャドウ(ぼかし)の色を入れ替えて適用しています
*/
class InnerShadowText extends StatelessWidget {
  InnerShadowText({
    required this.text,
    required this.innerShadowTextStyles,
    this.textStyle,
    this.softWrap,
    this.maxLines,
    this.overflow,
    super.key,
  })  :
  // テキストとインナーシャドウ(ぼかし)の色の入れ替え
        colorSwappedTextStyle = textStyle?.copyWith(
          color: innerShadowTextStyles.first.foreground?.color,
        ),
        colorSwappedInnerShadowTextStyle = innerShadowTextStyles.first.copyWith(
          foreground:  _clonePaintWithColor(
            innerShadowTextStyles.first.foreground,
            textStyle?.color ?? Colors.transparent,
          ),
        );

  final String text;
  final TextStyle? textStyle;
  final List<TextStyle> innerShadowTextStyles;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;

  final TextStyle? colorSwappedTextStyle;
  final TextStyle colorSwappedInnerShadowTextStyle;

  @override
  Widget build(BuildContext context) {
    // iOSは通常のテキストを返す
    if (Platform.isIOS) {
      return Text(
        text,
        style: textStyle,
        softWrap: softWrap,
        maxLines: maxLines,
        overflow: overflow,
        textHeightBehavior: const TextHeightBehavior(
          applyHeightToLastDescent: false,
        ),
      );
    }

    return Stack(
      children: [
        Text(
          text,
          style: colorSwappedTextStyle,
          softWrap: softWrap,
          maxLines: maxLines,
          overflow: overflow,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToLastDescent: false,
          ),
        ),
        Text(
          text,
          style: colorSwappedInnerShadowTextStyle,
          softWrap: softWrap,
          maxLines: maxLines,
          overflow: overflow,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToLastDescent: false,
          ),
        ),
        for (var i = 1; i < innerShadowTextStyles.length; i++)
          Positioned(
            left: 0,
            top: 0,
            child: Text(
              text,
              style: innerShadowTextStyles[i],
              softWrap: softWrap,
              maxLines: maxLines,
              overflow: overflow,
              textHeightBehavior: const TextHeightBehavior(
                applyHeightToLastDescent: false,
              ),
            ),
          ),
      ],
    );
  }
}