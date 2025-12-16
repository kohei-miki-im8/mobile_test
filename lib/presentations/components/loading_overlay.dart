import 'package:econa_mobile_app/presentations/components/econa_loading_indicator.dart';
import 'package:flutter/material.dart';

/// ローディングオーバーレイコンポーネント
/// 
/// 子ウィジェットの上にローディング画面を表示するコンポーネント
/// 
/// 使用例:
/// ```dart
/// LoadingOverlay(
///   isLoading: isLoading.value,
///   message: 'データを読み込み中...',
///   child: MyWidget(),
/// )
/// ```
class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.message,
    required this.child,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.indicatorColor = Colors.white,
    this.textStyle,
  });

  /// ローディング状態を制御するフラグ
  final bool isLoading;

  /// ローディング中に表示するメッセージ
  final String message;

  /// オーバーレイの下に表示されるメインコンテンツ
  final Widget child;
  
  /// オーバーレイの背景色（デフォルト: 黒の半透明）
  final Color? backgroundColor;
  
  /// メッセージのテキスト色
  final Color textColor;
  
  /// インジケーターの色
  final Color indicatorColor;
  
  /// メッセージのテキストスタイル
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          AnimatedOpacity(
            opacity: 1,
            duration: const Duration(milliseconds: 200),
            child: ColoredBox(
              color: backgroundColor ?? Colors.black.withValues(alpha: 0.3),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const EconaLoadingIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      style: textStyle ?? TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// メッセージなしでインジケーターのみを表示
class SimpleLoadingOverlay extends StatelessWidget {
  const SimpleLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.backgroundColor,
    this.indicatorColor = Colors.white,
    this.size = 40.0,
  });

  /// ローディング状態を制御するフラグ
  final bool isLoading;
  
  /// オーバーレイの下に表示されるメインコンテンツ
  final Widget child;
  
  /// オーバーレイの背景色（デフォルト: 黒の半透明）
  final Color? backgroundColor;
  
  /// インジケーターの色
  final Color indicatorColor;
  
  /// インジケーターのサイズ
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        AnimatedOpacity(
          opacity: isLoading ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: isLoading ? Container(
            color: backgroundColor ?? Colors.black.withValues(alpha: 0.3),
            child: Center(
              child: SizedBox(
                width: size,
                height: size,
                child: const EconaLoadingIndicator(),
              ),
            ),
          ) : const SizedBox.shrink(),
        ),
      ],
    );
  }
} 