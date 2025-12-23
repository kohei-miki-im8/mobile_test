import 'package:flutter/material.dart';

class TypingDots extends StatefulWidget {
  const TypingDots({super.key});

  @override
  State<TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        final dot1Opacity = _getDotOpacity(value, 0);
        final dot2Opacity = _getDotOpacity(value, 0.33);
        final dot3Opacity = _getDotOpacity(value, 0.66);

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Dot(opacity: dot1Opacity),
            const SizedBox(width: 4),
            _Dot(opacity: dot2Opacity),
            const SizedBox(width: 4),
            _Dot(opacity: dot3Opacity),
          ],
        );
      },
    );
  }

  double _getDotOpacity(double value, double offset) {
    final adjustedValue = (value + offset) % 1.0;
    if (adjustedValue < 0.33) {
      return 0.3 + (adjustedValue / 0.33) * 0.7;
    } else if (adjustedValue < 0.66) {
      return 1.0 - ((adjustedValue - 0.33) / 0.33) * 0.7;
    } else {
      return 0.3;
    }
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.opacity});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}