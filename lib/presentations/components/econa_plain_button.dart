import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class EconaPlainButton extends StatelessWidget {
  const EconaPlainButton({
    required this.text,
    required this.onPressed,
    this.leading,
    this.expandWidth = false,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final Widget? leading;
  static const double borderRadius = 100;
  final bool expandWidth;

  // TextPainterを使ってテキストの高さを取得するメソッド
  double _getTextHeight() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();
    return textPainter.height;
  }

  // TextPainterを使ってテキストの幅を取得するメソッド
  double _getTextWidth() {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();
    // アイコン分の余白を加味
    final iconWidth = leading == null
        ? 0.0
        : _getLeadingWidth() + 8.0; // アイコン幅 + スペーサー8
    return textPainter.width + iconWidth;
  }

  double _getLeadingWidth() {
    final l = leading;
    if (l == null) return 0;
    if (l is SizedBox && l.width != null) return l.width!;
    if (l is Icon && l.size != null) return l.size!;
    if (l is Image && l.width != null) return l.width!;
    return 20; // フォールバック
  }

  double _getLeadingHeight() {
    final l = leading;
    if (l == null) return 0;
    if (l is SizedBox && l.height != null) return l.height!;
    if (l is Icon && l.size != null) return l.size!;
    if (l is Image && l.height != null) return l.height!;
    return 20; // フォールバック
  }

  @override
  Widget build(BuildContext context) {
    // テキストの高さと幅を取得
    final double textHeight = _getTextHeight();
    final double textWidth = _getTextWidth();
    // ボタンの高さをテキストの高さ + パディングで計算
    final double contentHeight = textHeight > _getLeadingHeight() ? textHeight : _getLeadingHeight();
    final double buttonHeight = contentHeight + 22; // 上下のパディング11pxずつ
    // ボタンの幅をテキストの幅 + 左右のパディングで計算
    final double buttonWidth = textWidth + 24; // 左右のパディング12pxずつ

    return SizedBox(
      width: expandWidth ? double.infinity : buttonWidth,
      height: buttonHeight,
      child: Stack(
        children: [
          // シャドウ
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x4D9A94EE), // #9A94EE 30%
                    offset: Offset(4, 4),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-6, -6),
                    blurRadius: 20,
                  ),
                  BoxShadow(
                    color: Color(0x52B691E2), // #B691E2 32%
                    offset: Offset(2, 2),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),
          ),
          // ボタン本体
          Positioned.fill(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              child: InkWell(
                borderRadius: BorderRadius.circular(borderRadius),
                onTap: onPressed,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: expandWidth ? MainAxisSize.max : MainAxisSize.min,
                    children: [
                      if (leading != null) ...[
                        leading!, const SizedBox(width: 8),
                      ],
                      if (expandWidth)
                        Expanded(
                          child: Text(
                            text,
                            style: EconaTextStyle.labelSmall140(
                              color: EconaColor.grayDarkActive,
                            ),
                            textAlign: TextAlign.center,
                            textHeightBehavior: const TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false,
                            ),
                          ),
                        )
                      else
                        Text(
                          text,
                          style: EconaTextStyle.labelSmall140(
                            color: EconaColor.grayDarkActive,
                          ),
                          textAlign: TextAlign.center,
                          textHeightBehavior: const TextHeightBehavior(
                            applyHeightToFirstAscent: false,
                            applyHeightToLastDescent: false,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


