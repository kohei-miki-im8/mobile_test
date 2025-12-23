import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/gradient.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:flutter/material.dart';

class ConvexPanel extends StatelessWidget {
  const ConvexPanel({
    required this.child,
    this.gradients = EconaGradient.convexPanelLinerGradients,
    this.backgroundColor = EconaColor.convexPanelBackground,
    this.innerShadows = const [],
    this.dropShadows = const [],
    this.borderWidth = 0,
    this.borderRadius = 16,
    this.padding,
    this.onTap,
    super.key,
  });

  final Widget child;
  final List<LinearGradient> gradients;
  final Color backgroundColor;
  final List<BoxShadow> innerShadows;
  final List<BoxShadow> dropShadows;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets? padding;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ShadowAndGradientBorderContainer(
          borderRadius: BorderRadius.circular(borderRadius),
          borderWidth: borderWidth,
          gradients: gradients,
          backgroundColor: backgroundColor,
          innerShadows: innerShadows.isEmpty
              ? EconaShadow.convexPanelInnerShadows
              : innerShadows,
          dropShadows: dropShadows.isEmpty
              ? EconaShadow.convexPanelDropShadows
              : dropShadows,
          child: Container(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}

class ConcavePanel extends StatelessWidget {
  const ConcavePanel({
    required this.child,
    this.gradients = EconaGradient.concavePanelLinerGradients,
    this.backgroundColor = EconaColor.concavePanelBackground,
    this.innerShadows = const [],
    this.dropShadows = const [],
    this.borderWidth = 1,
    this.onTap,
    super.key,
  });

  final Widget child;
  final List<LinearGradient> gradients;
  final Color backgroundColor;
  final List<BoxShadow> innerShadows;
  final List<BoxShadow> dropShadows;
  final double borderWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: ShadowAndGradientBorderContainer(
          borderRadius: BorderRadius.circular(16),
          borderWidth: borderWidth,
          gradients: gradients,
          backgroundColor: backgroundColor,
          innerShadows: innerShadows.isEmpty
              ? EconaShadow.concavePanelInnerShadows
              : innerShadows,
          dropShadows: dropShadows.isEmpty
              ? EconaShadow.concavePanelDropShadows
              : dropShadows,
          child: child,
        ),
      ),
    );
  }
}

