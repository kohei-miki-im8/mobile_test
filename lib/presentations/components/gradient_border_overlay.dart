import 'package:flutter/material.dart';

class GradientBorderOverlay extends StatelessWidget {
  const GradientBorderOverlay({
    required this.child,
    required this.borderRadius,
    required this.strokeWidth,
    required this.gradients,
    this.padding,
    super.key,
  });

  final Widget child;
  final BorderRadius borderRadius;
  final double strokeWidth;
  final List<LinearGradient> gradients;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
      Positioned.fill(
        child:
        Container(
          padding: padding,
          child: IgnorePointer(
            child: CustomPaint(
              painter: _GradientBorderPainter(
                borderRadius: borderRadius,
                strokeWidth: strokeWidth,
                gradients: gradients,
              ),
            ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GradientBorderPainter extends CustomPainter {
  const _GradientBorderPainter({
    required this.borderRadius,
    required this.strokeWidth,
    required this.gradients,
  });

  final BorderRadius borderRadius;
  final double strokeWidth;
  final List<LinearGradient> gradients;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = RRect.fromRectAndCorners(
      rect.deflate(strokeWidth / 2),
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    for (final gradient in gradients) {
      final paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..shader = gradient.createShader(rect);
      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GradientBorderPainter oldDelegate) {
    return oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.gradients != gradients;
  }
}


