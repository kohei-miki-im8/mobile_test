import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset_shadow;

class ShadowGradientContainer extends StatelessWidget {
  const ShadowGradientContainer({
    required this.borderRadius,
    this.child,
    this.innerShadows = const [],
    this.dropShadows = const [],
    this.gradient,
    this.backgroundColor = Colors.transparent,
    super.key,
  });
  final Widget? child;
  final List<BoxShadow> innerShadows;
  final List<BoxShadow> dropShadows;
  final Gradient? gradient;
  final BorderRadius borderRadius;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: inset_shadow.BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
        color: backgroundColor,
        boxShadow: [
          ...innerShadows.map(
                (shadow) => inset_shadow.BoxShadow(
              color: shadow.color,
              blurRadius: shadow.blurRadius,
              spreadRadius: shadow.spreadRadius,
              offset: shadow.offset,
              inset: true,
            ),
          ),
          ...dropShadows.map(
                (shadow) => inset_shadow.BoxShadow(
              color: shadow.color,
              blurRadius: shadow.blurRadius,
              spreadRadius: shadow.spreadRadius,
              offset: shadow.offset,
              inset: false,
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
