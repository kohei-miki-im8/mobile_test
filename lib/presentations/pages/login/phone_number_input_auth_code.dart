import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/gradient.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplitCodeInput extends StatefulWidget {
  const SplitCodeInput({
    required this.onChanged,
    super.key,
  });

  final void Function(String code) onChanged;

  @override
  State<SplitCodeInput> createState() => _SplitCodeInputState();
}

class _SplitCodeInputState extends State<SplitCodeInput> {
  static const int _codeLength = 6;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(_codeLength, (_) => TextEditingController());
    _focusNodes = List.generate(_codeLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index, BuildContext context) {
    // ペーストされた複数文字の処理
    if (value.length > 1) {
      _onPaste(value, index, context);
      return;
    }

    if (value.length == 1) {
      // 1文字入力された場合、次のフィールドに移動
      if (index < _codeLength - 1) {
        _focusNodes[index + 1].requestFocus();
      }
    } else if (value.isEmpty) {
      // 削除された場合、前のフィールドに移動
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }

    // 完全なコードを構築してコールバックを呼び出し
    final code = _controllers.map((controller) => controller.text).join();
    widget.onChanged(code);
  }

  void _onPaste(String pastedText, int startIndex, BuildContext context) {
    // 数字のみを抽出
    final cleanedText = pastedText.replaceAll(RegExp('[^0-9]'), '');
    final truncatedText = cleanedText.length > _codeLength
        ? cleanedText.substring(0, _codeLength)
        : cleanedText;

    // 各フィールドに文字を配置
    for (int i = 0; i < _codeLength; i++) {
      if (i < truncatedText.length) {
        _controllers[i].text = truncatedText[i];
      } else {
        _controllers[i].text = '';
      }
    }

    // 最後の入力フィールドまたは最後の文字の次のフィールドにフォーカス
    final focusIndex = truncatedText.length < _codeLength
        ? truncatedText.length
        : _codeLength - 1;
    if (focusIndex < _codeLength) {
      _focusNodes[focusIndex].requestFocus();
    }

    // テキストボックスのフォーカスを解除する
    FocusScope.of(context).unfocus();

    // コールバックを呼び出し
    widget.onChanged(truncatedText);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(_codeLength, (index) {
        return Container(
          margin: EdgeInsets.only(
            right: index < _codeLength - 1 ? 12.0 : 0,
          ),
          child: SizedBox(
            width: 40,
            height: 70,
            child: ShadowAndGradientBorderContainer(
              borderRadius: BorderRadius.circular(8),
              borderWidth: 1,
              gradients: EconaGradient.inputFieldBorderGradient,
              backgroundColor: EconaColor.tabBackgroundActive,
              innerShadows: EconaShadow.inputFieldInnerShadows,
              dropShadows: EconaShadow.inputFieldDropShadows,
              child: Center(
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  style: EconaTextStyle.headlineHeadline(
                    color: EconaColor.grayDarkActive,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      // ペーストされた複数文字の場合は_onChangedで処理
                      if (newValue.text.length > 1) {
                        return newValue;
                      }
                      // 1文字以下の場合は通常通り
                      return newValue.text.length <= 1 ? newValue : oldValue;
                    }),
                  ],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) => _onChanged(value, index, context),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
} 