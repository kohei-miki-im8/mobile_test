import 'package:econa_mobile_app/presentations/components/dot_indicator.dart';
import 'package:flutter/material.dart';

class DotIndicatorList extends StatelessWidget {
  const DotIndicatorList({
    required this.count,
    required this.currentIndex,
    this.size = 12.0,
    this.spacing = 8.0,
    this.onDotTapped,
    super.key,
  });

  final int count;
  final int currentIndex;
  final double size;
  final double spacing;
  final void Function(int)? onDotTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        return GestureDetector(
          onTap: onDotTapped != null ? () => onDotTapped!(index) : null,
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : spacing / 2,
              right: index == count - 1 ? 0 : spacing / 2,
            ),
            child: DotIndicator(
              isActive: index == currentIndex,
              size: size,
            ),
          ),
        );
      }),
    );
  }
}
