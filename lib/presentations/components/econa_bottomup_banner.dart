import 'dart:async';

import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

/// 下から上がってくるバナー

/// バナー表示用メソッド
class EconaBottomUpBannerController {
  static void show(
    BuildContext context, {
    required String text,
    Duration duration = const Duration(seconds: 3),
    double? bottomOffset,
    VoidCallback? onDismissed,
  }) {
    final overlayState = Overlay.maybeOf(context, rootOverlay: true) ??
        Overlay.maybeOf(context);
    if (overlayState == null) {
      return;
    }

    late final OverlayEntry overlay;
    overlay = OverlayEntry(
      builder: (context) => EconaBottomUpBannerAnimatedOverlay(
        text: text,
        duration: duration,
        bottomOffset: bottomOffset,
        onDismissed: () {
          overlay.remove();
          onDismissed?.call();
        },
      ),
    );
    overlayState.insert(overlay);
  }
}

/// バナーコンポーネント
class EconaBottomUpBanner extends StatelessWidget {
  const EconaBottomUpBanner({
    required this.text,
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 24),
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
    this.borderRadius = 16,
    this.backgroundColor = EconaColor.grayDarkActive,
    this.textColor = EconaColor.gray50,
    this.fontSize = 18,
  });

  final String text;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: padding,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: EconaTextStyle.headlineEmptyState(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// アニメーション付きオーバーレイ
class EconaBottomUpBannerAnimatedOverlay extends StatelessWidget {
  const EconaBottomUpBannerAnimatedOverlay({
    required this.text,
    required this.duration,
    required this.onDismissed,
    this.bottomOffset,
    super.key,
  });

  final String text;
  final Duration duration;
  final VoidCallback onDismissed;
  final double? bottomOffset;

  @override
  Widget build(BuildContext context) {
    return _AnimatedBannerOverlay(
      text: text,
      duration: duration,
      bottomOffset: bottomOffset,
      onDismissed: onDismissed,
    );
  }
}

// 内部的なアニメーション制御部分のみStatefulWidgetを用いる
class _AnimatedBannerOverlay extends StatefulWidget {
  const _AnimatedBannerOverlay({
    required this.text,
    required this.duration,
    required this.onDismissed,
    this.bottomOffset,
  });

  final String text;
  final Duration duration;
  final VoidCallback onDismissed;
  final double? bottomOffset;

  @override
  State<_AnimatedBannerOverlay> createState() => _AnimatedBannerOverlayState();
}

class _AnimatedBannerOverlayState extends State<_AnimatedBannerOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // 下から
      end: Offset.zero, // 中央に
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // アニメーション開始
    _controller.forward();

    // 指定時間後にアニメーション終了
    _dismissTimer = Timer(widget.duration, () {
      if (mounted) {
        _controller.reverse();
      }
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        widget.onDismissed();
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.bottomOffset ?? 20,
      left: 0,
      right: 0,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: EconaBottomUpBanner(
            text: widget.text,
          ),
        ),
      ),
    );
  }
}

/*
使用例:

// 基本的な使用方法
EconaBottomUpBannerController.show(
  context,
  text: '検索条件に一致する人がいないため、おすすめのお相手を表示しています',
);

// カスタマイズした使用方法
EconaBottomUpBannerController.show(
  context,
  text: '検索条件に一致する人がいないため、おすすめのお相手を表示しています',
  duration: const Duration(seconds: 5),
  bottomOffset: 150,
  onDismissed: () {
    print('バナーが閉じられました');
  },
);

// 静的なバナーとして使用
EconaBottomUpBanner(
  text: '検索条件に一致する人がいないため、おすすめのお相手を表示しています',
)
*/
