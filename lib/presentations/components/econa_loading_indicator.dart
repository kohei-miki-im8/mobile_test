import 'dart:math' as math;
import 'package:flutter/material.dart';

class EconaLoadingIndicator extends StatelessWidget {
  const EconaLoadingIndicator({
    this.size = 24.0,
    this.strokeWidth = 3,
    super.key,
  });

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const SweepGradient(
              center: Alignment.center,
              startAngle: 0,
              endAngle: math.pi * 2,
              colors: <Color>[
                Color(0xFFD097DB),
                Color(0xFF8887EE),
                Color(0xFFD097DB),
              ],
              tileMode: TileMode.repeated,
            ).createShader(bounds);
          },
          child: Padding(
            padding: EdgeInsets.all(strokeWidth / 2),
            child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
