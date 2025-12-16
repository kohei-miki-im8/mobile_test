import 'dart:io';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/inner_shadow_text.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

/// ラベルと値を表示するTextウィジェット
/// 例：プロフィールで身長、体型、年齢などの基本情報表示に使用
class HeadlineDefault extends StatelessWidget {
  const HeadlineDefault({
    required this.label,
    required this.value,
    super.key,
  });

  /// 表示するラベル（例：「身長」「年齢」）
  final String label;

  /// 表示する値（例：「155cm」「25歳」）
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: EconaTextStyle.labelSmall140(
              color: EconaColor.grayNormal,
            ),
          ),
          const SizedBox(width: 32),
          Flexible(
            child: Text(
              value,
              style: EconaTextStyle.regularMedium160(
                color:
                    value == '未設定' ? EconaColor.gray200 : EconaColor.grayNormal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// セクションの見出しを表示するウィジェット
/// 内側シャドウ効果付きの大きなテキストで表示
class HeadlineLarge extends StatelessWidget {
  const HeadlineLarge({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InnerShadowText(
        text: text,
        textStyle: EconaTextStyle.labelMedium2140(
          color: EconaColor.grayNormal,
        ),
        innerShadowTextStyles: [
          EconaTextStyle.labelMedium2140(
            foreground: Paint()
              ..style = PaintingStyle.fill
              ..color = const Color(0xFF353E72).withValues(alpha: 0.61 * 3 / 2)
              ..maskFilter = Platform.isIOS
                  ? const MaskFilter.blur(BlurStyle.normal, 0)
                  : const MaskFilter.blur(BlurStyle.inner, 3 * 2 / 3),
          ),
          EconaTextStyle.labelMedium2140(
            foreground: Paint()
              ..style = PaintingStyle.fill
              ..color = const Color(0xFFFFFFFF).withValues(alpha: 0.8 * 3 / 2)
              ..maskFilter = Platform.isIOS
                  ? const MaskFilter.blur(BlurStyle.normal, 0)
                  : const MaskFilter.blur(BlurStyle.inner, 3 * 2 / 3),
          ),
        ],
      ),
    );
  }
}
