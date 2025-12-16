import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EconaToggle extends HookConsumerWidget {
  const EconaToggle({
    required this.enable,
    required this.onTap,
    this.backgroundColor = EconaColor.toggleEnableBackground,
    this.height = 28,
    this.width = 56,
    this.isReadOnly = false,
  });

  final bool enable;
  final void Function() onTap;
  final Color backgroundColor;
  final double height;
  final double width;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final innerColor = enable
        ? backgroundColor
        : EconaColor.toggleDisabledBackground;

    // 読み取り専用時のシェイク用アニメーション
    final shakeController = useAnimationController(
      duration: const Duration(milliseconds: 240),
    );
    final shakeAnimation = useMemoized(
          () => TweenSequence<double>([
        TweenSequenceItem(tween: Tween(begin: 0, end: -1), weight: 1),
        TweenSequenceItem(tween: Tween(begin: -1, end: 1), weight: 2),
        TweenSequenceItem(tween: Tween(begin: 1, end: -1), weight: 2),
        TweenSequenceItem(tween: Tween(begin: -1, end: 1), weight: 2),
        TweenSequenceItem(tween: Tween(begin: 1, end: 0), weight: 1),
      ]).animate(
        CurvedAnimation(
          parent: shakeController,
          curve: Curves.easeOut,
        ),
      ),
      [shakeController],
    );

    const shakeAmplitude = 3.0; // 揺れ幅(px)

    return GestureDetector(
      onTap: () {
        if (isReadOnly) {
          shakeController.forward(from: 0);
          return;
        }
        // トグル切り替え時の単発ハプティック
        HapticFeedback.selectionClick();
        onTap();
      },
      child: Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: ShadowAndGradientBorderContainer(
              borderRadius: BorderRadius.circular(16),
              borderWidth: 1,
              gradients: const [
                LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFD6E3F3),
                    Color(0xFFFFFFFF),
                  ],
                ),
                LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.white24,
                  ],
                ),
              ],
              backgroundColor: innerColor,
              innerShadows: enable
                  ? EconaShadow.toggleEnableInnerShadows : EconaShadow.toggleDisableInnerShadows,
              dropShadows: EconaShadow.toggleDisableDropShadows,
              child: Container(),
            ),
          ),
          Container(
            width: width,
            height: height,
            alignment: Alignment.centerRight,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              alignment: enable ? Alignment.centerRight : Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimatedBuilder(
                  animation: shakeController,
                  builder: (context, child) {
                    final dx = shakeAnimation.value * shakeAmplitude;
                    return Transform.translate(
                      offset: Offset(dx, 0),
                      child: child,
                    );
                  },
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: ShadowAndGradientBorderContainer(
                      borderRadius: BorderRadius.circular(100),
                      borderWidth: 1,
                      gradients: const [
                        LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            EconaColor.toggleThumbBorder,
                            Colors.white,
                          ],
                        ),
                        LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white24,
                            Colors.white,
                          ],
                        ),
                      ],
                      backgroundColor: EconaColor.toggleThumbBackground,
                      innerShadows: EconaShadow.toggleThumbInnerShadows,
                      dropShadows: EconaShadow.toggleThumbDropShadows,
                      child: Container(),
                    ),
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
