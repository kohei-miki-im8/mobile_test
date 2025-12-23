import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class DateTab extends StatelessWidget {
  const DateTab({
    required this.dates,
    required this.selectedIndex,
    required this.selectedColor,
    required this.unselectedColor,
    required this.selectedOpacity,
    required this.unselectedOpacity,
    required this.onTap,
    super.key,
  });
  final List<String> dates;
  final int selectedIndex;
  final Color selectedColor;
  final Color unselectedColor;
  final double selectedOpacity;
  final double unselectedOpacity;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(dates.length, (i) {
          final isSelected = i == selectedIndex;
          return Padding(
            padding: EdgeInsets.only(left: i == 0 ? 0 : 16),
            child: GestureDetector(
              onTap: () => onTap(i),
              behavior: HitTestBehavior.opaque,
              child: Text(
                dates[i],
                style: EconaTextStyle.labelSmall22(
                  color: isSelected ? selectedColor : unselectedColor,
                  opacity: isSelected ? selectedOpacity : unselectedOpacity,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
