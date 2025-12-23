import 'package:flutter/material.dart';

class MaintenancePage extends StatelessWidget {
  const MaintenancePage({
    this.message = '',
    super.key,
  });

  final String message;

  // アプリの雰囲気に合わせたカラーパレット
  static const Color backgroundColor = Color(0xFFF0F4FC); // 全体の背景（薄い青）
  static const Color cardColor = Color(0xFFF7F9FC); // カードの背景（ほぼ白）
  static const Color shadowLight = Colors.white; // 光の当たる部分
  static const Color shadowDark = Color(0xFFD1D9E6); // 影の部分
  static const Color textColor = Color(0xFF4A5568); // メインテキスト
  static const Color subTextColor = Color(0xFF718096); // サブテキスト

  // グラデーション（保存ボタン等の色味）
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFD985D7), Color(0xFF8A8EFF)], // ピンク〜紫
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
              // ニューモーフィズム風の影（ドロップシャドウ）
              boxShadow: const [
                BoxShadow(
                  color: shadowDark,
                  offset: Offset(8, 8),
                  blurRadius: 16,
                ),
                BoxShadow(
                  color: shadowLight,
                  offset: Offset(-8, -8),
                  blurRadius: 16,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // アイコン部分（グラデーションのShaderMaskを使用）
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return accentGradient.createShader(bounds);
                  },
                  child: const Icon(
                    Icons.handyman_rounded, // 少し丸みのあるスパナアイコン
                    size: 80,
                    color: Colors.white, // グラデーションの下地として白を指定
                  ),
                ),
                const SizedBox(height: 32),

                // タイトル
                const Text(
                  'ただいまメンテナンス中です',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // 説明文
                const Text(
                  'サービスの品質向上のため、\nシステムメンテナンスを行っております。\n終了まで今しばらくお待ちください。',
                  style: TextStyle(
                    color: subTextColor,
                    fontSize: 14,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}