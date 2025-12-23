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

class ProfileBaseTextInput extends HookConsumerWidget { // 新規追加
  const ProfileBaseTextInput({
    required this.title,
    required this.hintText,
    required this.onSave,
    required this.successMessage,
    this.getInitialValue,
    this.actions,
    this.onBackPressed,
    this.isRegistrationFlow = false,
    this.onRegistrationSuccess,
    this.onTextChanged,
    this.maxLength,
    this.keyboardType,
    this.validator,
    this.height,
    this.width,
    this.margin,
    this.borderRadius,
    this.isMultiLine = false, // デフォルトは単行
    super.key,
  });

  final String title;
  final String hintText;
  final Future<void> Function(String) onSave;
  final String successMessage;
  final String Function()? getInitialValue;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool isRegistrationFlow;
  final Future<void> Function()? onRegistrationSuccess;
  final void Function(String, WidgetRef)? onTextChanged;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool Function(String)? validator;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final bool isMultiLine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final hasText = useState(false);
    final isValid = useState(true);

    // 初期値設定
    useEffect(() {
      if (getInitialValue != null) {
        final initialValue = getInitialValue!();
        if (initialValue.isNotEmpty && textController.text.isEmpty) {
          textController.text = initialValue;
          hasText.value = initialValue.trim().isNotEmpty;
        }
      }
      return null;
    }, []);

    // テキスト変更処理
    void handleTextChanged(String text) {
      hasText.value = text.trim().isNotEmpty;
      if (validator != null) {
        isValid.value = validator!(text);
      }
      if (onTextChanged != null) {
        onTextChanged!(text, ref);
      }
    }

    // 保存処理
    Future<void> handleSubmit() async {
      final text = textController.text.trim();
      
      // バリデーション
      if (validator != null && !validator!(text)) {
        if (context.mounted) {
          await EconaNotification.showTopToast(
            context,
            message: '入力内容を確認してください',
            duration: const Duration(seconds: 2),
          );
        }
        return;
      }

      try {
        // 基本の保存処理
        await onSave(text);

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
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: margin ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  width: width,
                  height: height ?? 53,
                  child: isMultiLine
                      ? MultiLineInputFieldContainer(
                          borderRadius: borderRadius ?? BorderRadius.circular(12),
                          borderWidth: 1,
                          hintText: hintText,
                          controller: textController,
                          maxLength: maxLength,
                          onChanged: handleTextChanged,
                        )
                      : OneLineInputFieldContainer(
                          borderRadius: borderRadius ?? BorderRadius.circular(100),
                          borderWidth: 1,
                          hintText: hintText,
                          controller: textController,
                          maxLength: maxLength,
                          inputType: keyboardType,
                          onChanged: handleTextChanged,
                        ),
                ),
                const Spacer(),
              ],
            ),
          ),
          if(isRegistrationFlow)...[
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(40),
                child: CircleNextButton(
                  onTap: handleSubmit,
                  enabled: isRegistrationFlow
                      ? hasText.value && isValid.value
                      : isValid.value,
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
    );
  }
}
