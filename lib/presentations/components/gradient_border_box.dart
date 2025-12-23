import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:flutter/cupertino.dart';

class GradientBorderBox extends StatelessWidget {
  const GradientBorderBox({
    required this.child,
    this.borderWidth = 2,
    super.key,
  });

  final Widget child;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return ShadowAndGradientBorderContainer(
      borderRadius: BorderRadius.circular(12),
      borderWidth: borderWidth,
      gradients: [
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD097DB).withValues(alpha: 0),
            const Color(0xFF8887EE).withValues(alpha: 1),
          ],
        ),
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD097DB).withValues(alpha: 1),
            const Color(0xFF8887EE).withValues(alpha: 0),
          ],
        ),
      ],
      backgroundColor: const Color(0xFFF0EFFD),
      innerShadows: const [],
      dropShadows: const [],
      child: child,
    );
  }
}