import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset_shadow;

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = true,
    this.size = 12.0,
    super.key,
  });

  final bool isActive;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: inset_shadow.BoxDecoration(
        shape: BoxShape.circle,
        gradient: isActive
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFD097DB), // #D097DB (薄い紫)
                  Color(0xFF8887EE), // #8887EE (薄い青)
                ],
              )
            : null,
        color: isActive ? null : const Color(0xFF7A95BA).withValues(alpha: 0.4),
        boxShadow: isActive
            ? [
                // アクティブ状態の内側シャドウ (Inner shadow)
                inset_shadow.BoxShadow(
                  color: const Color(0xFFFF1FF4)
                      .withValues(alpha: 0.2), // Figmaの見た目に合わせて調整済み
                  offset: const Offset(1, 1),
                  blurRadius: 3,
                  spreadRadius: 0,
                  inset: true,
                ),
                // アクティブ状態のドロップシャドウ (Drop shadow)
                inset_shadow.BoxShadow(
                  color: const Color(0xFF946EF9)
                      .withValues(alpha: 0.55), // #946EF9 with 55% opacity
                  offset: const Offset(1, 1),
                  blurRadius: 4,
                  spreadRadius: 0,
                  inset: false,
                ),
              ]
            : [
                // 非アクティブ状態の内側シャドウ (Inner shadow)
                inset_shadow.BoxShadow(
                  color: const Color(0xFF6F78A4)
                      .withValues(alpha: 0.5), // #6F78A4 with 50% opacity
                  offset: const Offset(2, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                  inset: true,
                ),
                // 非アクティブ状態のドロップシャドウ (Drop shadow)
                inset_shadow.BoxShadow(
                  color: const Color(0xFFFFFFFF)
                      .withValues(alpha: 0.98), // #FFFFFF with 98% opacity
                  offset: const Offset(1, 1),
                  blurRadius: 6,
                  spreadRadius: 0,
                  inset: false,
                ),
              ],
      ),
    );
  }
}
