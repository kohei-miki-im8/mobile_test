import 'package:econa_mobile_app/presentations/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class SquareToggleButton extends HookConsumerWidget {
  const SquareToggleButton({
    required this.text,
    required this.textStyle,
    this.isSelected = false,
    this.onTap,
    this.icon,
    this.height = 100,
    this.width = 100,
    super.key,
  });

  final String text;
  final TextStyle textStyle;
  final bool isSelected;
  final VoidCallback? onTap;
  final Widget? icon;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<BoxShadow> unselectedInnerShadows = [];
    final selectedInnerShadows = [
      const BoxShadow(
        color: Color(0xFFC1D5EE),
        blurRadius: 14,
        offset: Offset(4, 4),
      ),
      BoxShadow(
        color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
        blurRadius: 9,
        offset: const Offset(-4, -4),
      ),
    ];

    final selectedDropShadows = [
      const BoxShadow(
        color: Color(0xFFFFFFFF),
        blurRadius: 20,
        offset: Offset(-4, -4),
      ),
    ];
    final unselectedDropShadows = [
      BoxShadow(
        color: const Color(0xFF6F75B0).withValues(alpha: 0.2),
        blurRadius: 20,
        offset: const Offset(4, 4),
      ),
      const BoxShadow(
        color: Color(0xFFFFFFFF),
        blurRadius: 20,
        offset: Offset(-6, -6),
      ),
    ];

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: ShadowAndGradientBorderContainer(
          borderRadius: BorderRadius.circular(15),
          borderWidth: 1,
          gradients: const [
            LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFD6E3F3), // #D6E3F3
                Color(0xFFFFFFFF), // #FFFFFF
              ],
            ),
            LinearGradient(
              begin: Alignment.topLeft, // グラデーションの開始位置は適宜調整
              end: Alignment.bottomRight, // グラデーションの終了位置は適宜調整
              colors: [
                Color(0xFFFFFFFF), // #D6E3F3
                Color(0xFFFFFFFF), // #FFFFFF
              ],
            ),
          ],
          backgroundColor: isSelected
              ? EconaColor.squareToggleButtonSelected
              : EconaColor.squareToggleButtonUnselected,
          innerShadows: isSelected ? selectedInnerShadows : unselectedInnerShadows,
          dropShadows: isSelected ? selectedDropShadows : unselectedDropShadows,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              if(icon != null)...[
                icon!,
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  text,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

