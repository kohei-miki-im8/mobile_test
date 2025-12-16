import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/gradient.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// ピッカーアイテムのデータクラス
class PickerItem<T> {
  const PickerItem({
    required this.value,
    required this.displayText,
  });

  final T value;
  final String displayText;
}

class EconaBottomPicker {
  /// 汎用ボトムピッカーを表示する
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required List<PickerItem<T>> items,
    T? selectedValue,
    String confirmText = '決定',
    String cancelText = 'キャンセル',
    double height = 300,
    bool dismissible = true,
  }) async {
    // 初期選択インデックスを決定
    int initialIndex = 0;
    if (selectedValue != null) {
      final index = items.indexWhere((item) => item.value == selectedValue);
      if (index >= 0) {
        initialIndex = index;
      }
    }

    int tempSelectedIndex = initialIndex;

    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      isDismissible: dismissible,
      enableDrag: dismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: height,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // タイトル
              Container(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  title,
                  style: EconaTextStyle.headlineHeadline(
                    color: EconaColor.grayNormal,
                  ),
                ),
              ),
              // ピッカー
              Expanded(
                child: CupertinoPicker(
                  backgroundColor: Colors.transparent,
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(
                    initialItem: initialIndex,
                  ),
                  onSelectedItemChanged: (index) {
                    tempSelectedIndex = index;
                  },
                  children: items.map((item) {
                    return Center(
                      child: Text(
                        item.displayText,
                        style: EconaTextStyle.bottomPickerItem(
                          color: EconaColor.grayNormal,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // ボタン
              Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        cancelText,
                        style: EconaTextStyle.labelMedium1140(
                          color: EconaColor.gray200,
                        ),
                      ),
                    ),
                    EconaGradientButton(
                      text: '決定',
                      onPressed: () {
                        final selectedItem = items[tempSelectedIndex];
                        Navigator.of(context).pop(selectedItem.value);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  /// ヘルパー: 文字列リストから簡単にピッカーアイテムを作成
  static List<PickerItem<String>> fromStringList(
      List<String> strings, {
        bool includeUnset = false,
        String unsetLabel = '未設定',
      }) {
    final items = <PickerItem<String>>[];

    if (includeUnset) {
      items.add(PickerItem<String>(
        value: '',
        displayText: unsetLabel,
      ));
    }

    items.addAll(strings.map((str) => PickerItem<String>(
      value: str,
      displayText: str,
    )));

    return items;
  }

  /// ヘルパー: 数値範囲からピッカーアイテムを作成
  static List<PickerItem<int?>> fromNumberRange(
      int min,
      int max, {
        bool includeUnset = false,
        String unsetLabel = '未設定',
        String Function(int)? formatter,
      }) {
    final items = <PickerItem<int?>>[];

    if (includeUnset) {
      items.add(PickerItem<int?>(
        value: null,
        displayText: unsetLabel,
      ));
    }

    for (int i = min; i <= max; i++) {
      items.add(PickerItem<int?>(
        value: i,
        displayText: formatter?.call(i) ?? i.toString(),
      ));
    }

    return items;
  }

  /// ヘルパー: オブジェクトリストからピッカーアイテムを作成
  static List<PickerItem<T?>> fromObjectList<T>(
      List<T> objects, {
        required String Function(T) displayTextBuilder,
        bool includeUnset = false,
        String unsetLabel = '未設定',
      }) {
    final items = <PickerItem<T?>>[];

    if (includeUnset) {
      items.add(PickerItem<T?>(
        value: null,
        displayText: unsetLabel,
      ));
    }

    items.addAll(objects.map((obj) => PickerItem<T?>(
      value: obj,
      displayText: displayTextBuilder(obj),
    )));

    return items;
  }

  /// ヘルパー: Enumからピッカーアイテムを作成
  static List<PickerItem<T?>> fromEnum<T extends Enum>(
      List<T> enumValues, {
        String Function(T)? displayTextBuilder,
        bool includeUnset = false,
        String unsetLabel = '未設定',
      }) {
    return fromObjectList<T>(
      enumValues,
      displayTextBuilder: displayTextBuilder ?? (e) => e.name,
      includeUnset: includeUnset,
      unsetLabel: unsetLabel,
    );
  }
}