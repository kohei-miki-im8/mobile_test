import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:econa_mobile_app/presentations/gradient.dart';
import 'package:econa_mobile_app/presentations/shadow.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

// 1. 単行入力用コンテナ
class OneLineInputFieldContainer extends StatelessWidget {
  const OneLineInputFieldContainer({
    required this.borderRadius,
    required this.borderWidth,
    this.text,
    this.hintText,
    this.width,
    this.padding,
    this.controller,
    this.onChanged,
    this.inputType,
    this.maxLength,
    super.key,
  });

  final BorderRadius borderRadius;
  final double borderWidth;
  final String? text;
  final String? hintText;
  final double? width;
  final EdgeInsets? padding;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? inputType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: width,
      padding: padding,
      child: ShadowAndGradientBorderContainer(
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        gradients: EconaGradient.inputFieldBorderGradient,
        backgroundColor: EconaColor.tabBackgroundActive,
        innerShadows: EconaShadow.inputFieldInnerShadows,
        dropShadows: EconaShadow.inputFieldDropShadows,
        child: Center(
          child: TextField(
            maxLines: 1,
            maxLength: maxLength,
            controller: controller,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              hintText: hintText,
              hintStyle: EconaTextStyle.labelHintText(
                color: EconaColor.chatInputHintText,
              ),
              border: InputBorder.none,
              counterText: '',
              isDense: true,
            ),
            onChanged: onChanged,
            keyboardType: inputType ?? TextInputType.text,
          ),
        ),
      ),
    );
  }
}

// 2. 複数行入力用コンテナ
class MultiLineInputFieldContainer extends StatelessWidget {
  const MultiLineInputFieldContainer({
    required this.borderRadius,
    required this.borderWidth,
    this.height,
    this.hintText,
    this.hintTextStyle,
    this.controller,
    this.onChanged,
    this.maxLength,
    this.minLines,
    super.key,
  });

  final BorderRadius borderRadius;
  final double borderWidth;
  final double? height;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int? maxLength;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ShadowAndGradientBorderContainer(
        borderRadius: borderRadius,
        borderWidth: borderWidth,
        gradients: EconaGradient.inputFieldBorderGradient,
        backgroundColor: EconaColor.tabBackgroundActive,
        innerShadows: EconaShadow.inputFieldInnerShadows,
        dropShadows: EconaShadow.inputFieldDropShadows,
        child: Align(
          alignment: Alignment.topLeft,
          child: TextField(
            maxLines: null,
            maxLength: maxLength,
            minLines: minLines,
            controller: controller,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(16),
              hintText: hintText,
              hintStyle: EconaTextStyle.labelHintText(
                color: EconaColor.chatInputHintText,
              ),
              border: InputBorder.none,
              counterText: '',
              isDense: true,
            ),
            onChanged: onChanged,
            keyboardType: TextInputType.multiline,
          ),
        ),
      ),
    );
  }
}
