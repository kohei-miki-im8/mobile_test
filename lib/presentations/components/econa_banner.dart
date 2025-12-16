import 'dart:async';

import 'package:econa_mobile_app/core/errors/econa_error.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/routes/econa_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EconaBanner extends StatelessWidget {
  const EconaBanner({
    required this.text,
    super.key,
    this.emoji,
    this.icon,
    this.width = 353,
    this.padding = const EdgeInsets.fromLTRB(20, 16, 20, 20),
    this.borderRadius = 16,
    this.emojiSize = 30,
    this.textSize = 16,
    this.backgroundColor = const Color(0xFFF5FAFE),
    this.textColor = const Color(0xFF35407D),
    this.boxShadow,
  });
  final String text;
  final String? emoji;
  final Widget? icon;
  final double width;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double emojiSize;
  final double textSize;
  final Color backgroundColor;
  final Color textColor;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final Widget? leading = (icon != null || emoji != null)
        ? SizedBox(
            width: emojiSize,
            height: emojiSize,
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, 3),
                child: icon ??
                    Text(
                      emoji!,
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        fontWeight: FontWeight.w600,
                        fontSize: emojiSize,
                        height: 1,
                        letterSpacing: 0.25,
                        color: textColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
              ),
            ),
          )
        : null;

    return Center(
      child: SizedBox(
        width: width,
        child: ShadowAndGradientBorderContainer(
          borderRadius: BorderRadius.circular(borderRadius),
          borderWidth: 1,
          gradients: const [
            LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFD6E3F3), Color(0xFFFFFFFF)],
            ),
          ],
          backgroundColor: backgroundColor,
          innerShadows: const [
            // Figma: Inner shadow (例)
            BoxShadow(
              color: Color(0xE0FFFFFF), // #FFFFFF 88%
              offset: Offset(-4, -4),
              blurRadius: 9,
              spreadRadius: 0,
            ),
          ],
          dropShadows: const [
            // Figma: Drop shadow 1
            BoxShadow(
              color: Color(0x3D3E4AB5), // #3E4AB5 24%
              offset: Offset(-4, -4),
              blurRadius: 20,
              spreadRadius: 0,
            ),
            // Figma: Drop shadow 2
            BoxShadow(
              color: Color(0xFFFFFFFF), // #FFFFFF
              offset: Offset(-6, -6),
              blurRadius: 20,
              spreadRadius: 0,
            ),
            // Figma: Drop shadow 3
            BoxShadow(
              color: Color(0x1A7273AB), // #7273AB 10%
              offset: Offset(-2, -2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
          child: Padding(
            padding: padding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if(leading != null)...[
                  leading,
                  const SizedBox(width: 16),
                ],
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'NotoSansJP',
                        fontWeight: FontWeight.w600,
                        fontSize: textSize,
                        height: 1.6,
                        letterSpacing: 0.25,
                        color: textColor,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 共通バナー表示用メソッド
class EconaBannerController {
  static void show(
    BuildContext context, {
    required String text,
    String? emoji,
    Duration duration = const Duration(seconds: 2),
    double textSize = 16,
    Widget? icon,
    double? topOffset,
    EdgeInsetsGeometry? padding,
  }) {
    late OverlayEntry overlay;
    overlay = OverlayEntry(
      builder: (context) => _EconaBannerAnimatedOverlay(
        text: text,
        emoji: emoji,
        duration: duration,
        textSize: textSize,
        icon: icon,
        topOffset: topOffset,
        padding: padding,
        onDismissed: () {
          // OverlayEntryがまだ有効な場合のみ削除
          if (overlay.mounted) {
            overlay.remove();
          }
        },
      ),
    );

    final navigatorState =
        EconaRouter.router.routerDelegate.navigatorKey.currentState;
    final overlayState = navigatorState?.overlay;
    print('navigatorState: $navigatorState, overlayState: $overlayState');

    if (overlayState == null) {
      // Router / Navigator がまだ立ち上がっていない場合は何もしない
      return;
    }

    // 実際に Overlay に追加する
    overlayState.insert(overlay);
  }
}

class _EconaBannerAnimatedOverlay extends StatefulWidget {
  const _EconaBannerAnimatedOverlay({
    required this.text,
    required this.emoji,
    required this.textSize,
    required this.duration,
    required this.onDismissed,
    this.icon,
    this.topOffset,
    this.padding,
  });
  final String text;
  final String? emoji;
  final double textSize;
  final Duration duration;
  final VoidCallback onDismissed;
  final Widget? icon;
  final double? topOffset;
  final EdgeInsetsGeometry? padding;

  @override
  State<_EconaBannerAnimatedOverlay> createState() =>
      _EconaBannerAnimatedOverlayState();
}

class _EconaBannerAnimatedOverlayState
    extends State<_EconaBannerAnimatedOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  Timer? _dismissTimer;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _controller.forward();
    _dismissTimer = Timer(widget.duration, () {
      if (mounted && !_isDisposed) {
        _controller.reverse();
      }
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed && !_isDisposed) {
        widget.onDismissed();
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true;
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topOffset ?? (MediaQuery.of(context).padding.top + 12),
      left: 0,
      right: 0,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
        child: EconaBanner(
          text: widget.text,
          textSize: widget.textSize,
          emoji: widget.emoji,
          icon: widget.icon,
          padding: widget.padding ?? const EdgeInsets.fromLTRB(20, 16, 20, 20),
        ),
      ),
    );
  }
}

/// エラー時にバナーを表示する
void showErrorBanner(
  BuildContext context,
  EconaError error,
  VoidCallback cleanupFunction,
) {
  final errorMessage = error.operationMessage;

  // ビルド後にバナーを表示
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // ウィジェットがマウントされているかチェック
    if (!context.mounted) return;

    EconaBannerController.show(
      context,
      text: errorMessage,
      emoji: '⚠️',
    );

    // エラー状態をクリア
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        // ウィジェットがマウントされているかチェック
        if (!context.mounted) return;
        cleanupFunction();
      },
    );
  });
}
