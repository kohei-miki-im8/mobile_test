import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_state.g.dart';

/// AIがお相手を探している状態を表示するコンポーネント
///
/// 使用例：
/// ```dart
/// LoadingState(
///   title: 'AIがお相手を探しています',
///   progressText: '100%',
/// )
/// ```
class LoadingState extends StatelessWidget {
  const LoadingState({
    required this.title,
    this.subtitle,
    this.progressText,
    this.imagePath = 'assets/images/icons/base_icon.webp',
    this.imageWidth = 120,
    this.imageHeight = 120,
    super.key,
  });

  /// メインタイトル
  final String title;

  /// サブタイトル
  final String? subtitle;

  /// 進捗テキスト（例：「100%」）
  final String? progressText;

  /// 画像のパス
  final String imagePath;

  /// 画像の幅
  final double imageWidth;

  /// 画像の高さ
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                    style: EconaTextStyle.headlineEmptyState(
                      color: EconaColor.grayDarkActive,
                      opacity: 0.9,
                    ),
                    textAlign: TextAlign.center,
                  ),
                if (progressText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      progressText!,
                      style: EconaTextStyle.headlineEmptyState(
                        color: EconaColor.grayDarkActive,
                        opacity: 0.9,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

@riverpod
class LoadingProgress extends _$LoadingProgress {
  @override
  int build() {
    return 0;
  }

  void updateProgress(int progress) {
    state = progress;
  }

  void reset() {
    state = 0;
  }
}
