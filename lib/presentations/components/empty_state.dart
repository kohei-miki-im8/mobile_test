import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

/// 汎用的な空の状態表示コンポーネント
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    required this.buttonText,
    required this.onButtonTap,
    this.subtitle,
    this.subtitleStyle,
    this.bottomText,
    this.imagePath = 'assets/images/icons/base_icon.webp',
    this.imageWidth = 120,
    this.imageHeight = 120,
    this.showImage = true,
    super.key,
  });

  /// メインタイトル
  final String title;

  /// サブタイトル
  final String? subtitle;

  /// サブタイトルのスタイル
  final TextStyle? subtitleStyle;

  /// ボタンの下に表示する補足文（任意）
  final String? bottomText;

  /// ボタンのテキスト
  final String buttonText;

  /// ボタンタップ時のコールバック
  final VoidCallback onButtonTap;

  /// 画像のパス
  final String imagePath;

  /// 画像の幅
  final double imageWidth;

  /// 画像の高さ
  final double imageHeight;

  /// 画像を表示するかどうか
  final bool showImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showImage)
            SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: Image.asset(imagePath),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: Column(
              children: [
                Text(
                  title,
                  style: EconaTextStyle.headlineEmptyState(
                    color: EconaColor.grayDarkActive,
                    opacity: 0.9,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: subtitleStyle ??
                        EconaTextStyle.headlineEmptyState(
                          color: EconaColor.grayDarkActive,
                          opacity: 0.9,
                        ),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
          InkWell(
            onTap: onButtonTap,
            child: IntrinsicWidth(
              child: Container(
                height: 60,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 11),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(-1, -1.8),
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFD097DB),
                      Color(0xFF8887EE),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xFF9A94EE),
                      blurRadius: 20,
                      offset: Offset(4, 4),
                    ),
                    BoxShadow(
                      color: Color(0xFFFFFFFF),
                      blurRadius: 20,
                      offset: Offset(-6, -6),
                    ),
                  ],
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  buttonText,
                  style: EconaTextStyle.labelMedium1140(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          if (bottomText != null) ...[
            const SizedBox(height: 24),
            Text(
              bottomText!,
              style: EconaTextStyle.labelMedium1160(
                color: EconaColor.grayDarkActive,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
