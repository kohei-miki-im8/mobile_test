import 'package:econa_mobile_app/presentations/components/gradient_border_container.dart';
import 'package:econa_mobile_app/presentations/components/shadow_container.dart';
import 'package:flutter/material.dart';

class ShadowAndGradientBorderContainer extends StatelessWidget {
  const ShadowAndGradientBorderContainer({
    required this.borderRadius,
    required this.borderWidth,
    required this.gradients,
    required this.backgroundColor,
    required this.innerShadows,
    required this.dropShadows,
    required this.child,
    super.key,
  });

  final BorderRadius borderRadius;
  final double borderWidth;
  final List<LinearGradient> gradients;
  final Color backgroundColor;
  final List<BoxShadow> innerShadows;
  final List<BoxShadow> dropShadows;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GradientBorderContainer(
      borderRadius: borderRadius,
      padding: EdgeInsets.all(borderWidth),
      gradients: gradients,
      child: ShadowContainer(
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        innerShadows: innerShadows,
        dropShadows: dropShadows,
        child: child,
      ),
    );
  }
}

