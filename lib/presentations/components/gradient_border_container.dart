import 'package:flutter/material.dart';

class GradientBorderContainer extends StatelessWidget {
  const GradientBorderContainer({
    required this.borderRadius,
    required this.gradients,
    required this.padding,
    this.child,
    super.key,
  });

  final Widget? child;
  final BorderRadius borderRadius;
  final List<Gradient> gradients;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    Widget container = Padding(
      padding: padding,
      child: child,
    );

    // リストの順序通りにグラデーションを適用
    for (final gradient in gradients) {
      container = Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: gradient,
        ),
        child: container,
      );
    }

    return container;
  }
}
