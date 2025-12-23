import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/bottom_picker.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/input_field.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/registration/next_button.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileBasePicker<T> extends HookConsumerWidget {

  const ProfileBasePicker({
    required this.title,
    required this.onSave,
    required this.successMessage,
    this.pickerItems,
    this.min,
    this.max,
    this.includeUnset = false,
    this.unsetLabel = '未設定',
    this.getInitialValue,
    this.displayFormatter,
    this.suffix,
    this.actions,
    this.onBackPressed,
    this.isRegistrationFlow = false,
    this.onRegistrationSuccess,
    this.inputWidth = 150,
    this.inputHeight = 52,
    this.margin = const EdgeInsets.symmetric(vertical: 24),
    super.key,
  }) : assert(pickerItems != null || (min != null && max != null),
         'pickerItemsまたはmin/maxを指定してください');

  // 必須パラメータ
  final String title;
  final Future<void> Function(T?) onSave;
  final String successMessage;
  
  // ピッカー設定（どちらか一方を指定）
  final List<PickerItem<T>>? pickerItems;
  final int? min; // fromNumberRange用
  final int? max; // fromNumberRange用
  final bool includeUnset; // fromNumberRange用
  final String unsetLabel; // fromNumberRange用
  
  // オプショナルパラメータ
  final T? Function()? getInitialValue;
  final String Function(T?)? displayFormatter;
  final String? suffix; // 単位表示（"cm"など）
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool isRegistrationFlow;
  final Future<void> Function()? onRegistrationSuccess;
  
  // UI設定
  final double inputWidth;
  final double inputHeight;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final selectedValue = useState<T?>(null);

    // 初期値設定
    useEffect(() {
      if (getInitialValue != null) {
        final initialValue = getInitialValue!();
        if (initialValue != null) {
          selectedValue.value = initialValue;
          final displayText = displayFormatter?.call(initialValue) ?? initialValue.toString();
          controller.text = displayText;
        }
      }
      return null;
    }, []);

    // ピッカーアイテムを取得
    List<PickerItem<T?>> getPickerItems() {
      if (pickerItems != null) {
        // カスタムピッカーアイテムを使用
        return pickerItems!.map((item) => PickerItem<T?>(
          value: item.value,
          displayText: item.displayText,
        )).toList();
      } else {
        // 数値範囲から生成（min/max が指定されていれば型に関わらず生成しキャスト）
        if (min != null && max != null) {
          final items = EconaBottomPicker.fromNumberRange(
            min!,
            max!,
            includeUnset: includeUnset,
            unsetLabel: unsetLabel,
          );
          return items as List<PickerItem<T?>>;
        }
        throw ArgumentError('pickerItemsまたはmin/maxを指定してください');
      }
    }

    Future<void> showPicker() async {
      final items = getPickerItems();
      
      // EconaBottomPicker.showを使用
      final result = await EconaBottomPicker.show<T?>(
        context: context,
        title: '$titleを選択',
        items: items,
        selectedValue: selectedValue.value,
      );

      // 結果の処理（キャンセル時はnullが返される）
      if (result != null || selectedValue.value != null) {
        selectedValue.value = result;
        if (result == null) {
          controller.text = '';
        } else {
          final displayText = displayFormatter?.call(result) ?? result.toString();
          controller.text = displayText;
        }
      }
    }

    Future<void> handleSubmit() async {
      try {
        // 基本の保存処理
        await onSave(selectedValue.value);

        if (context.mounted) {
          // 登録フロー
          if (isRegistrationFlow && onRegistrationSuccess != null) {
            await onRegistrationSuccess!();
          } else {
            // 編集フロー：成功メッセージ表示と画面戻り
            await EconaNotification.showTopToast(
              context,
              message: successMessage,
              duration: const Duration(seconds: 2),
            );

            if(context.mounted) context.pop();
          }
        }
      } on Exception catch (_) {
        if (context.mounted) {
          await EconaNotification.showTopToast(
            context,
            message: '保存に失敗しました',
            duration: const Duration(seconds: 2),
          );
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: margin,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 12,
              children: [
                SizedBox(
                  height: inputHeight,
                  width: inputWidth,
                  child: GestureDetector(
                    onTap: showPicker,
                    child: AbsorbPointer(
                      child: OneLineInputFieldContainer(
                        borderRadius: BorderRadius.circular(100),
                        borderWidth: 1,
                        controller: controller,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                if (suffix != null)
                  Align(
                    child: Text(
                      suffix!,
                      style: EconaTextStyle.labelMedium1140(
                        color: EconaColor.grayNormal,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Spacer(),
          if(isRegistrationFlow)...[
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(40),
                child: CircleNextButton(
                  onTap: handleSubmit,
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
          ]
        ],
      ),
    );
  }
} 