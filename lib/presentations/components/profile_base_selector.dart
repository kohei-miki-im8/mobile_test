import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_list_tile.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:econa_mobile_app/presentations/pages/registration/next_button.dart';
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileBaseSelector extends HookConsumerWidget {

  const ProfileBaseSelector({
    required this.title,
    required this.items,
    required this.itemBuilder,
    required this.onSave,
    required this.successMessage,
    this.isMultiple = false,
    this.getInitialValue,
    this.getInitialIndices,
    this.actions,
    this.onBackPressed,
    this.isRegistrationFlow = false,
    this.onRegistrationSuccess,
    this.valueConverter,
    this.onSelectionChanged,
    super.key,
  });

  // 必須パラメータ
  final String title;
  final List<dynamic> items;
  final String Function(dynamic) itemBuilder;
  final Future<void> Function(dynamic) onSave;
  final String successMessage;

  // オプショナルパラメータ
  final bool isMultiple;
  final dynamic Function()? getInitialValue;
  final Set<int> Function()? getInitialIndices;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool isRegistrationFlow;
  final Future<void> Function()? onRegistrationSuccess;
  final dynamic Function(int)? valueConverter;
  final void Function(int, WidgetRef)? onSelectionChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int?>(null);
    final selectedIndices = useState<Set<int>>(<int>{});

    // 初期値設定
    useEffect(() {
      if (!isMultiple) {
        if (selectedIndex.value == null && getInitialValue != null) {
          final initialValue = getInitialValue!();
          if (initialValue != null) {
            // dynamicをint?に安全にキャスト
            if (initialValue is int) {
              selectedIndex.value = initialValue;
            } else if (initialValue is String) {
              selectedIndex.value = int.tryParse(initialValue);
            }
          }
        }
      } else {
        if (selectedIndices.value.isEmpty && getInitialIndices != null) {
          final init = getInitialIndices!();
          selectedIndices.value = {...init};
        }
      }
      return null;
    }, []);

    Future<void> handleSubmit() async {
      if (!isMultiple) {
        if (selectedIndex.value == null) return;
        try {
          final effectiveValue = valueConverter != null
              ? valueConverter!(selectedIndex.value!)
              : items[selectedIndex.value!];
          await onSave(effectiveValue);

          if (isRegistrationFlow && onRegistrationSuccess != null) {
            await onRegistrationSuccess!();
          } else {
            if (context.mounted) {
              await EconaNotification.showTopToast(
                context,
                message: successMessage,
                duration: const Duration(seconds: 2),
              );
              if (context.mounted) context.pop();
            }
          }
        } on Exception catch (_) {
          // no-op
        }
      } else {
        if (selectedIndices.value.isEmpty) {
          await onSave(null);
          if (context.mounted) context.pop();
          return;
        }
        try {
          final values = selectedIndices.value
              .map((i) => valueConverter != null ? valueConverter!(i) : items[i])
              .toList();
          await onSave(values);

          if (isRegistrationFlow && onRegistrationSuccess != null) {
            await onRegistrationSuccess!();
          } else {
            if (context.mounted) {
              await EconaNotification.showTopToast(
                context,
                message: successMessage,
                duration: const Duration(seconds: 2),
              );
              if (context.mounted) context.pop();
            }
          }
        } on Exception catch (_) {
          // no-op
        }
      }
    }

    return Scaffold(
      appBar: CenterAppBar(
        titleText: title,
        backgroundColor: const Color(0xFFF0EFFD),
        leading: IconButton(
          onPressed: onBackPressed ?? () => context.pop(),
          icon: Assets.images.icons.back.image(height: 32, width: 36),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        actions: actions,
      ),
      backgroundColor: const Color(0xFFF0EFFD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: isMultiple
                  ? ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedIndices.value.contains(index);
                        final item = items[index];
                        return ListTile(
                          title: Text(
                            itemBuilder(item),
                            style: EconaTextStyle.regularMedium1160(
                              color: EconaColor.grayNormal,
                            ),
                          ),
                          selected: isSelected,
                          selectedTileColor:
                              const Color(0x309090C0).withValues(alpha: 0.2),
                          onTap: () {
                            final next = <int>{...selectedIndices.value};
                            if (isSelected) {
                              next.remove(index);
                            } else {
                              next.add(index);
                            }
                            selectedIndices.value = next;
                          },
                        );
                      },
                    )
                  : SelectionListTile<dynamic>(
                      items: items,
                      selectedIndex: selectedIndex.value,
                      onItemSelected: (index) {
                        selectedIndex.value = index;
                        if (onSelectionChanged != null) {
                          onSelectionChanged!(index, ref);
                        }
                      },
                      itemBuilder: itemBuilder,
                    ),
            ),
            if(isRegistrationFlow)...[
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.all(40),
                  child: CircleNextButton(
                    onTap: handleSubmit,
                    enabled: isMultiple
                        ? selectedIndices.value.isNotEmpty
                        : selectedIndex.value != null,
                  ),
                ),
              ),
            ] else...[
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.all(40),
                  child: EconaGradientButton(
                    text: '保存する',
                    onPressed: handleSubmit,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
