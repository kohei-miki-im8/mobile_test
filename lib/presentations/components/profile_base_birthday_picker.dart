import 'package:econa_mobile_app/presentations/components/bottom_picker.dart';
import 'package:econa_mobile_app/presentations/components/econa_app_bar.dart';
import 'package:econa_mobile_app/presentations/components/econa_gradient_button.dart';
import 'package:econa_mobile_app/presentations/components/econa_notification.dart';
import 'package:econa_mobile_app/presentations/components/input_field.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/pages/registration/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileBaseBirthdayPicker extends HookConsumerWidget {
  // 必須パラメータ
  final String title;
  final Future<void> Function(int year, int month, int day)? onSave;
  final String successMessage;
  
  // オプショナルパラメータ
  final DateTime? Function()? getInitialValue;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool isRegistrationFlow;
  final Future<void> Function()? onRegistrationSuccess;
  
  // UI設定
  final EdgeInsets margin;
  final double inputHeight;
  final double yearWidth;
  final double monthWidth;
  final double dayWidth;

  const ProfileBaseBirthdayPicker({
    super.key,
    required this.title,
    required this.successMessage,
    this.onSave,
    this.getInitialValue,
    this.actions,
    this.onBackPressed,
    this.isRegistrationFlow = false,
    this.onRegistrationSuccess,
    this.margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
    this.inputHeight = 50,
    this.yearWidth = 130,
    this.monthWidth = 90,
    this.dayWidth = 90,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yearController = useTextEditingController();
    final monthController = useTextEditingController();
    final dayController = useTextEditingController();
    final selectedYear = useState<int?>(null);
    final selectedMonth = useState<int?>(null);
    final selectedDay = useState<int?>(null);
    final isFormValid = useState(false);

    // バリデーション関数（useEffectより前に宣言）
    void updateValidation() {
      final year = selectedYear.value;
      final month = selectedMonth.value;
      final day = selectedDay.value;

      if (year != null && month != null && day != null) {
        final currentYear = DateTime.now().year;
        // 18歳以上49歳以下の年齢制限
        final minYear = currentYear - 49; // 49歳以下
        final maxYear = currentYear - 18; // 18歳以上
        
        // 基本的なバリデーション
        if (year >= minYear && year <= maxYear &&
            month >= 1 && month <= 12 &&
            day >= 1 && day <= 31) {
          try {
            final date = DateTime(year, month, day);
            isFormValid.value = date.year == year && date.month == month && date.day == day;
          } catch (e) {
            isFormValid.value = false;
          }
        } else {
          isFormValid.value = false;
        }
      } else {
        isFormValid.value = false;
      }
    }

    // 初期値設定
    useEffect(() {
      if (getInitialValue != null) {
        final birthday = getInitialValue!();
        if (birthday != null) {
          selectedYear.value = birthday.year;
          selectedMonth.value = birthday.month;
          selectedDay.value = birthday.day;
          // テキストフィールドにも初期値を設定
          yearController.text = birthday.year.toString();
          monthController.text = birthday.month.toString();
          dayController.text = birthday.day.toString();
          updateValidation();
        }
      }
      return null;
    }, []);

    // 年ピッカーを表示
    Future<void> showYearPicker() async {
      final currentYear = DateTime.now().year;
      // 18歳以上49歳以下の年齢制限
      final minYear = currentYear - 49; // 49歳以下（49歳になる年）
      final maxYear = currentYear - 18; // 18歳以上（18歳になる年）
      
      final yearItems = EconaBottomPicker.fromNumberRange(
        minYear,
        maxYear,
        includeUnset: false,
      );

      final result = await EconaBottomPicker.show<int?>(
        context: context,
        title: '生年を選択',
        items: yearItems,
        selectedValue: selectedYear.value,
      );

      if (result != null) {
        selectedYear.value = result;
        yearController.text = result.toString(); // 即座にテキストフィールドを更新
        updateValidation();
      }
    }

    // 月ピッカーを表示
    Future<void> showMonthPicker() async {
      final monthItems = EconaBottomPicker.fromNumberRange(
        1,
        12,
        includeUnset: false,
      );

      final result = await EconaBottomPicker.show<int?>(
        context: context,
        title: '月を選択',
        items: monthItems,
        selectedValue: selectedMonth.value,
      );

      if (result != null) {
        selectedMonth.value = result;
        monthController.text = result.toString(); // 即座にテキストフィールドを更新
        updateValidation();
      }
    }

    // 日ピッカーを表示
    Future<void> showDayPicker() async {
      // 選択された年月に応じて日数を調整
      int maxDay = 31;
      if (selectedYear.value != null && selectedMonth.value != null) {
        final year = selectedYear.value!;
        final month = selectedMonth.value!;
        maxDay = DateTime(year, month + 1, 0).day; // その月の最後の日
      }

      final dayItems = EconaBottomPicker.fromNumberRange(
        1,
        maxDay,
        includeUnset: false,
      );

      final result = await EconaBottomPicker.show<int?>(
        context: context,
        title: '日を選択',
        items: dayItems,
        selectedValue: selectedDay.value,
      );

      if (result != null) {
        selectedDay.value = result;
        dayController.text = result.toString(); // 即座にテキストフィールドを更新
        updateValidation();
      }
    }

    Future<void> handleSubmit() async {
      if (!isFormValid.value) return;

      try {
        final year = selectedYear.value!;
        final month = selectedMonth.value!;
        final day = selectedDay.value!;

        // 基本の保存処理
        if(onSave != null){
          await onSave!(year, month, day);
        }

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
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 12,
              children: [
                // 年ピッカー
                SizedBox(
                  height: inputHeight,
                  width: yearWidth,
                  child: GestureDetector(
                    onTap: showYearPicker,
                    child: AbsorbPointer(
                      child: OneLineInputFieldContainer(
                        borderRadius: BorderRadius.circular(100),
                        borderWidth: 1,
                        hintText: '年',
                        controller: yearController,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                // 月ピッカー
                SizedBox(
                  height: inputHeight,
                  width: monthWidth,
                  child: GestureDetector(
                    onTap: showMonthPicker,
                    child: AbsorbPointer(
                      child: OneLineInputFieldContainer(
                        borderRadius: BorderRadius.circular(100),
                        borderWidth: 1,
                        hintText: '月',
                        controller: monthController,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                // 日ピッカー
                SizedBox(
                  height: inputHeight,
                  width: dayWidth,
                  child: GestureDetector(
                    onTap: showDayPicker,
                    child: AbsorbPointer(
                      child: OneLineInputFieldContainer(
                        borderRadius: BorderRadius.circular(100),
                        borderWidth: 1,
                        hintText: '日',
                        controller: dayController,
                        inputType: TextInputType.number,
                      ),
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
                  enabled: isFormValid.value,
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