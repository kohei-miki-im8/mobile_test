import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_container.dart';
import 'package:econa_mobile_app/presentations/components/shadow_container.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'econa_tab.g.dart';

@riverpod
class TabIndex extends _$TabIndex {
  @override
  int build(String pageKey) {
    return 0;
  }

  void updateIndex(int index) {
    state = index;
  }
}

@riverpod
class IsOverlayVisible extends _$IsOverlayVisible {
  @override
  bool build(String pageKey) {
    return false;
  }

  void updateVisibility({required bool isOverlayVisible}) {
    state = isOverlayVisible;
  }
}

class EconaTab extends StatelessWidget {
  const EconaTab({
    required this.selectedIndex,
    required this.onTabSelected,
    required this.labels,
    this.equalDistribution = false,
    super.key,
  });
  final int selectedIndex;
  final void Function(int) onTabSelected;
  final List<String> labels;
  final bool equalDistribution;

  @override
  Widget build(BuildContext context) {
    final tabBorderRadius = BorderRadius.circular(100);

    // 均等配分／比率配分を切り替え
    late final List<int> flexValues;
    if (equalDistribution) {
      flexValues = List<int>.filled(labels.length, 1);
    } else {
      // 各ラベルのテキスト幅を計算
      final textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        textScaler: MediaQuery.of(context).textScaler,
      );

      final textWidths = <double>[];
      double totalWidth = 0;
      for (final label in labels) {
        textPainter
          ..text = TextSpan(
            text: label,
            style:
                EconaTextStyle.labelSmall140(color: EconaColor.grayDarkActive),
          )
          ..layout();
        final width = textPainter.width;
        textWidths.add(width);
        totalWidth += width;
      }

      // 幅の比でflexを計算（最小値1を保証）
      flexValues = textWidths
          .map((width) => (width / totalWidth * 10).round().clamp(1, 10))
          .toList();
    }

    return GradientBorderContainer(
      borderRadius: tabBorderRadius,
      padding: const EdgeInsets.all(1),
      gradients: [
        LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFFFFFFF).withValues(alpha: 1),
            const Color(0xFFFFFFFF).withValues(alpha: 0),
          ],
        ),
        LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFD6E3F3).withValues(alpha: 0.66),
            const Color(0xFFFFFFFF).withValues(alpha: 0.66),
          ],
        ),
      ],
      child: ShadowContainer(
        borderRadius: tabBorderRadius,
        backgroundColor: EconaColor.tabBackground,
        innerShadows: [
          BoxShadow(
            color: const Color(0xFFFFFFFF).withValues(alpha: 0.88),
            blurRadius: 9,
            offset: const Offset(-4, -4),
          ),
          BoxShadow(
            color: const Color(0xFF86A3C8)
                .withValues(alpha: 0.6), // 見た目をより再現するためFigmaの値の0.6倍で設定
            blurRadius: 7, // 見た目をより再現するためFigmaの値の1/2で設定
            offset: const Offset(4, 4),
          ),
        ],
        dropShadows: [
          BoxShadow(
            color: const Color(0xFFFFFFFF).withValues(alpha: 1),
            blurRadius: 20,
            offset: const Offset(-4, -4),
          ),
          BoxShadow(
            color: const Color(0xFF587CA7).withValues(alpha: 0.14),
            blurRadius: 22,
            offset: const Offset(6, 6),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: equalDistribution
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(labels.length, (index) {
                    final tab = _TabItem(
                      label: labels[index],
                      selected: selectedIndex == index,
                      onTap: () => onTabSelected(index),
                    );
                    return Expanded(child: tab);
                  }),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(labels.length, (index) {
                    final tab = _TabItem(
                      label: labels[index],
                      selected: selectedIndex == index,
                      onTap: () => onTabSelected(index),
                    );
                    return Flexible(flex: flexValues[index], child: tab);
                  }),
                ),
        ),
      ),
    );
  }
}

/// プロバイダーを内部で管理するEconaTab
/// タブの選択状態とスクロール位置を管理する
class EconaTabWithProvider extends ConsumerWidget {
  const EconaTabWithProvider({
    required this.labels,
    required this.pageKey,
    this.equalDistribution = false,
    this.onTabChanged,
    this.scrollController,
    this.scrollToPosition,
    super.key,
  });

  final List<String> labels;
  final String pageKey;
  final bool equalDistribution;
  final void Function(int)? onTabChanged;
  final ScrollController? scrollController;
  final double? scrollToPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(tabIndexProvider(pageKey));

    return EconaTab(
      selectedIndex: selectedIndex,
      onTabSelected: (index) {
        if (scrollController != null && scrollToPosition != null) {
          scrollController!
              .animateTo(
            scrollToPosition!,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
              .then((_) {
            ref.read(tabIndexProvider(pageKey).notifier).updateIndex(index);
            onTabChanged?.call(index);
          });
        } else {
          ref.read(tabIndexProvider(pageKey).notifier).updateIndex(index);
          onTabChanged?.call(index);
        }
      },
      labels: labels,
      equalDistribution: equalDistribution,
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? EconaColor.tabBackgroundActive : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          boxShadow: selected ? EconaShadow.tabItemShadows : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: selected
                ? EconaTextStyle.labelSmall140(color: EconaColor.grayDarkActive)
                : EconaTextStyle.labelSmall140(
                    color: EconaColor.grayNormalHover,
                  ),
          ),
        ),
      ),
    );
  }
}
