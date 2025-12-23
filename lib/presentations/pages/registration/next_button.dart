import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CircleNextButton extends StatefulWidget {
  const CircleNextButton({
    required this.onTap,
    this.height = 52,
    this.width = 52,
    this.enabled = true,
    super.key,
  });

  final Future<void> Function() onTap;
  final double? height;
  final double? width;
  final bool enabled;

  @override
  State<CircleNextButton> createState() => _CircleNextButtonState();
}

class _CircleNextButtonState extends State<CircleNextButton> {
  bool _busy = false;

  Future<void> _handleTap() async {
    if (!widget.enabled || _busy) return;
    setState(() => _busy = true);
    try {
      await widget.onTap();
    } finally {
      if (mounted) {
        setState(() => _busy = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final gradient = (widget.enabled && !_busy)
        ? const LinearGradient(
      begin: Alignment(-1, -1.8),
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFD097DB),
        Color(0xFF8887EE),
      ],
    )
        : const LinearGradient(
      colors: [
        Color(0xFFDADDF0),
        Color(0xFFDADDF0),
      ],
    );

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.black,
      onTap: (widget.enabled && !_busy) ? _handleTap : null,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: ShapeDecoration(
          gradient: gradient,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0xFFB691E2).withValues(alpha: 0.32),
              blurRadius: 12,
              offset: const Offset(2, 2),
            ),
            const BoxShadow(
              color: Color(0xFFFFFFFF),
              blurRadius: 20,
              offset: Offset(-6, -6),
            ),
            const BoxShadow(
              color: Color(0xFF9A94EE),
              blurRadius: 20,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Center(
          child: Assets.images.icons.rightArrow.svg(height: 15, width: 12),
        ),
      ),
    );
  }
}