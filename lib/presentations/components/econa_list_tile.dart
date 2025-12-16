import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectionListTile<T> extends ConsumerWidget {
  const SelectionListTile({
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.itemBuilder,
    super.key,
  });

  final List<T> items;
  final int? selectedIndex;
  final ValueChanged<int> onItemSelected;
  final String Function(T item) itemBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final isSelected = selectedIndex == index;
        final item = items[index];

        return ListTile(
          title: Text(
            itemBuilder(item),
            style: EconaTextStyle.regularMedium1160(
              color: EconaColor.grayNormal,
            ),
          ),
          selected: isSelected,
          selectedTileColor: const Color(0x309090C0).withValues(alpha: 0.2),
          onTap: () => onItemSelected(index),
        );
      },
    );
  }
}
